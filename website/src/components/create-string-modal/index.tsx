import * as React from "react"
import { ModalContext } from "../../common/modal-context";
import "./index.scss"

export function CreateStringModal(props: {text: string, onSubmit: (val: string)=>void}) {
  const openModal = React.useContext(ModalContext);
  const [prop_name, setPropName] = React.useState<string>("");
  const onChange = React.useCallback((e: React.ChangeEvent<HTMLInputElement>)=>{
    setPropName(e.currentTarget.value);
  }, [prop_name])
  return <div className="create-string" tabIndex={0} >
    <div className="title">{props.text}</div>
    <input defaultValue={prop_name} onChange={onChange} autoFocus
      onKeyDown={e => {
        if (e.code === "Escape") {
          e.stopPropagation();
          openModal(null as any)
          return;
        }
        if (e.code === "Enter") {
          props.onSubmit(prop_name); openModal(null as any)
        }
      }}/>
    <div className="ok" onClick={() => {props.onSubmit(prop_name); openModal(null as any)}}>Create</div>
  </div>
}