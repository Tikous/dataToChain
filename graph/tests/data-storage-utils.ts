import { newMockEvent } from "matchstick-as"
import { ethereum, Address, BigInt } from "@graphprotocol/graph-ts"
import { DataStored } from "../generated/DataStorage/DataStorage"

export function createDataStoredEvent(
  sender: Address,
  data: string,
  timestamp: BigInt
): DataStored {
  let dataStoredEvent = changetype<DataStored>(newMockEvent())

  dataStoredEvent.parameters = new Array()

  dataStoredEvent.parameters.push(
    new ethereum.EventParam("sender", ethereum.Value.fromAddress(sender))
  )
  dataStoredEvent.parameters.push(
    new ethereum.EventParam("data", ethereum.Value.fromString(data))
  )
  dataStoredEvent.parameters.push(
    new ethereum.EventParam(
      "timestamp",
      ethereum.Value.fromUnsignedBigInt(timestamp)
    )
  )

  return dataStoredEvent
}
