#! /bin/bash
show_usage() {
    echo "使用法: $0 選項 參數"
}
file=
while :; do
  case $1 in
    -h|--help)
      show_usage
      exit
      ;;
    -f|--file)      
      if [[ -n "$2" ]]; then
        file=$2 && shift
      else
        printf '錯誤: "選項 --file" 需要一個非空的參數.\n' >&2
        exit 1
      fi
      ;;
    --file=?*)
      file=${1#*=}
      ;;
    --file=)
      printf '錯誤: "選項 --file" 需要一個非空的參數.\n' >&2
      exit 1
      ;;
    --)   
      shift
      break
      ;;
    -v|--verbose)
      echo "這是詳細的說明...."
      ;;
    -?*)
      printf '未知的選項: %s\n' "$1" >&2
      exit 1
      ;;
    *)
      break
  esac
  shift
done
 
if [ -n "$file" ]; then
  exec 10> "$file"
  echo "開啟 $file 可寫入。"
fi
