Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2072
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:38 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mduym-1lAa5M1ivG-00b1IG; Sat, 15 May 2021 21:11:22 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 18/20] staging: vchiq_core: introduce parse_message
Date: Sat, 15 May 2021 21:10:57 +0200
Message-Id: <1621105859-30215-19-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:51zzwAUwNO9gxTfMB02sSsY5YbdPah0XM+81a93A+0f4vXMYRKX
 P5jEgqeT0ivU6bO6fWHYUI5kcz2z5fOWAE8H6kSQtjmffxZ0iubfM/DdXHpDKh+RLfUAon3
 nXjWP5y32NdkPwaT2cMQuTtgESiTQU3H4tLP9CfI8jU40Gb2YQRG3G1SklUG+ZZKhielrki
 F7r9HKdndrcaWiJosgR8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gUgpdz+AtAA=:ZXgDDlk58jh6L/MHyhqT69
 159Z5SkjmgGhLTL+skXrvInFhdE6NwQD6YEI//+2TfcbSNH6OdQrpa40l+qNX6jnGBzJnWL7t
 LO+zUZVHmtBDXVs0KkSFVdTXtG58dNu7lVtta7LZTN2wcYd6Yn0XLRXPBKskf//389cWbzCJI
 CrWysPls+ZKCwg4KeDU060HFuC5fdwf48AfNN0E6e9PqVc/5aLXVmCIeLp/N5IXI5NLYI+VAD
 0kgEnWdcveT5OX1oDNtCQvaQ2C2twABfQlM/d5k7PUVPgN+0PPybXZA5hI/O7EKmY6ieDVUiB
 Mv8aI52v40vz/xGjpme77Hw4fTBKDFy19nvAFRZ4RskfQcbJ6/szomGaWrB9cmGMAWAhPNCJy
 1ieUhs6sgQROC/KzpejzEb6aNutWz9H/eRBr2NE4dE7sehHAOCthSGOy/vqg2denGquDWMovm
 hbWFNKUgojGNa7S+QZ76O5i2rossi88ea028RalxYMcCyJNYeAClZkC0IMYpXOMhdG8AAOe8s
 7/SSqwOvevodJylOUmXahQ=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function parse_rx_slots is very longer. So move at least the message
parsing into a separate function to improve readability. In good case
the function returns the message payload length which is necessary to
move to the next message.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 605 +++++++++++----------
 1 file changed, 313 insertions(+), 292 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e3b93ed..985e1c6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1545,335 +1545,360 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 	return 0;
 }
 
-/* Called by the slot handler thread */
-static void
-parse_rx_slots(struct vchiq_state *state)
+/**
+ * parse_message() - parses a single message from the rx slot
+ * @state:  vchiq state struct
+ * @header: message header
+ *
+ * Context: Process context
+ *
+ * Return:
+ * * >= 0     - size of the parsed message payload (without header)
+ * * -EINVAL  - fatal error occurred, bail out is required
+ */
+static int
+parse_message(struct vchiq_state *state, struct vchiq_header *header)
 {
-	struct vchiq_shared_state *remote = state->remote;
 	struct vchiq_service *service = NULL;
-	int tx_pos;
+	unsigned int localport, remoteport;
+	int msgid, size, type, ret = -EINVAL;
 
 	DEBUG_INITIALISE(state->local)
 
-	tx_pos = remote->tx_pos;
-
-	while (state->rx_pos != tx_pos) {
-		struct vchiq_header *header;
-		int msgid, size;
-		int type;
-		unsigned int localport, remoteport;
-
-		DEBUG_TRACE(PARSE_LINE);
-		if (!state->rx_data) {
-			int rx_index;
-
-			WARN_ON(!((state->rx_pos & VCHIQ_SLOT_MASK) == 0));
-			rx_index = remote->slot_queue[
-				SLOT_QUEUE_INDEX_FROM_POS_MASKED(state->rx_pos)];
-			state->rx_data = (char *)SLOT_DATA_FROM_INDEX(state,
-				rx_index);
-			state->rx_info = SLOT_INFO_FROM_INDEX(state, rx_index);
+	DEBUG_VALUE(PARSE_HEADER, (int)(long)header);
+	msgid = header->msgid;
+	DEBUG_VALUE(PARSE_MSGID, msgid);
+	size = header->size;
+	type = VCHIQ_MSG_TYPE(msgid);
+	localport = VCHIQ_MSG_DSTPORT(msgid);
+	remoteport = VCHIQ_MSG_SRCPORT(msgid);
 
+	if (type != VCHIQ_MSG_DATA)
+		VCHIQ_STATS_INC(state, ctrl_rx_count);
+
+	switch (type) {
+	case VCHIQ_MSG_OPENACK:
+	case VCHIQ_MSG_CLOSE:
+	case VCHIQ_MSG_DATA:
+	case VCHIQ_MSG_BULK_RX:
+	case VCHIQ_MSG_BULK_TX:
+	case VCHIQ_MSG_BULK_RX_DONE:
+	case VCHIQ_MSG_BULK_TX_DONE:
+		service = find_service_by_port(state, localport);
+		if ((!service ||
+		     ((service->remoteport != remoteport) &&
+		      (service->remoteport != VCHIQ_PORT_FREE))) &&
+		    (localport == 0) &&
+		    (type == VCHIQ_MSG_CLOSE)) {
 			/*
-			 * Initialise use_count to one, and increment
-			 * release_count at the end of the slot to avoid
-			 * releasing the slot prematurely.
+			 * This could be a CLOSE from a client which
+			 * hadn't yet received the OPENACK - look for
+			 * the connected service
 			 */
-			state->rx_info->use_count = 1;
-			state->rx_info->release_count = 0;
+			if (service)
+				unlock_service(service);
+			service = get_connected_service(state,
+				remoteport);
+			if (service)
+				vchiq_log_warning(vchiq_core_log_level,
+					"%d: prs %s@%pK (%d->%d) - found connected service %d",
+					state->id, msg_type_str(type),
+					header, remoteport, localport,
+					service->localport);
 		}
 
-		header = (struct vchiq_header *)(state->rx_data +
-			(state->rx_pos & VCHIQ_SLOT_MASK));
-		DEBUG_VALUE(PARSE_HEADER, (int)(long)header);
-		msgid = header->msgid;
-		DEBUG_VALUE(PARSE_MSGID, msgid);
-		size = header->size;
-		type = VCHIQ_MSG_TYPE(msgid);
-		localport = VCHIQ_MSG_DSTPORT(msgid);
-		remoteport = VCHIQ_MSG_SRCPORT(msgid);
-
-		if (type != VCHIQ_MSG_DATA)
-			VCHIQ_STATS_INC(state, ctrl_rx_count);
+		if (!service) {
+			vchiq_log_error(vchiq_core_log_level,
+				"%d: prs %s@%pK (%d->%d) - invalid/closed service %d",
+				state->id, msg_type_str(type),
+				header, remoteport, localport,
+				localport);
+			goto skip_message;
+		}
+		break;
+	default:
+		break;
+	}
 
-		switch (type) {
-		case VCHIQ_MSG_OPENACK:
-		case VCHIQ_MSG_CLOSE:
-		case VCHIQ_MSG_DATA:
-		case VCHIQ_MSG_BULK_RX:
-		case VCHIQ_MSG_BULK_TX:
-		case VCHIQ_MSG_BULK_RX_DONE:
-		case VCHIQ_MSG_BULK_TX_DONE:
-			service = find_service_by_port(state, localport);
-			if ((!service ||
-			     ((service->remoteport != remoteport) &&
-			      (service->remoteport != VCHIQ_PORT_FREE))) &&
-			    (localport == 0) &&
-			    (type == VCHIQ_MSG_CLOSE)) {
-				/*
-				 * This could be a CLOSE from a client which
-				 * hadn't yet received the OPENACK - look for
-				 * the connected service
-				 */
-				if (service)
-					unlock_service(service);
-				service = get_connected_service(state,
-					remoteport);
-				if (service)
-					vchiq_log_warning(vchiq_core_log_level,
-						"%d: prs %s@%pK (%d->%d) - found connected service %d",
-						state->id, msg_type_str(type),
-						header, remoteport, localport,
-						service->localport);
-			}
+	if (SRVTRACE_ENABLED(service, VCHIQ_LOG_INFO)) {
+		int svc_fourcc;
 
-			if (!service) {
-				vchiq_log_error(vchiq_core_log_level,
-					"%d: prs %s@%pK (%d->%d) - invalid/closed service %d",
-					state->id, msg_type_str(type),
-					header, remoteport, localport,
-					localport);
-				goto skip_message;
-			}
-			break;
-		default:
-			break;
-		}
+		svc_fourcc = service
+			? service->base.fourcc
+			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
+		vchiq_log_info(SRVTRACE_LEVEL(service),
+			"Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
+			msg_type_str(type), type,
+			VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
+			remoteport, localport, size);
+		if (size > 0)
+			vchiq_log_dump_mem("Rcvd", 0, header->data,
+				min(16, size));
+	}
 
-		if (SRVTRACE_ENABLED(service, VCHIQ_LOG_INFO)) {
-			int svc_fourcc;
+	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
+	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
+		vchiq_log_error(vchiq_core_log_level,
+			"header %pK (msgid %x) - size %x too big for slot",
+			header, (unsigned int)msgid,
+			(unsigned int)size);
+		WARN(1, "oversized for slot\n");
+	}
 
-			svc_fourcc = service
-				? service->base.fourcc
-				: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
-			vchiq_log_info(SRVTRACE_LEVEL(service),
-				"Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
-				msg_type_str(type), type,
-				VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
-				remoteport, localport, size);
-			if (size > 0)
-				vchiq_log_dump_mem("Rcvd", 0, header->data,
-					min(16, size));
+	switch (type) {
+	case VCHIQ_MSG_OPEN:
+		WARN_ON(!(VCHIQ_MSG_DSTPORT(msgid) == 0));
+		if (!parse_open(state, header))
+			goto bail_not_ready;
+		break;
+	case VCHIQ_MSG_OPENACK:
+		if (size >= sizeof(struct vchiq_openack_payload)) {
+			const struct vchiq_openack_payload *payload =
+				(struct vchiq_openack_payload *)
+				header->data;
+			service->peer_version = payload->version;
 		}
-
-		if (((unsigned long)header & VCHIQ_SLOT_MASK) +
-		    calc_stride(size) > VCHIQ_SLOT_SIZE) {
+		vchiq_log_info(vchiq_core_log_level,
+			"%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
+			state->id, header, size, remoteport, localport,
+			service->peer_version);
+		if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
+			service->remoteport = remoteport;
+			vchiq_set_service_state(service,
+				VCHIQ_SRVSTATE_OPEN);
+			complete(&service->remove_event);
+		} else {
 			vchiq_log_error(vchiq_core_log_level,
-				"header %pK (msgid %x) - size %x too big for slot",
-				header, (unsigned int)msgid,
-				(unsigned int)size);
-			WARN(1, "oversized for slot\n");
+				"OPENACK received in state %s",
+				srvstate_names[service->srvstate]);
 		}
+		break;
+	case VCHIQ_MSG_CLOSE:
+		WARN_ON(size != 0); /* There should be no data */
 
-		switch (type) {
-		case VCHIQ_MSG_OPEN:
-			WARN_ON(!(VCHIQ_MSG_DSTPORT(msgid) == 0));
-			if (!parse_open(state, header))
-				goto bail_not_ready;
-			break;
-		case VCHIQ_MSG_OPENACK:
-			if (size >= sizeof(struct vchiq_openack_payload)) {
-				const struct vchiq_openack_payload *payload =
-					(struct vchiq_openack_payload *)
-					header->data;
-				service->peer_version = payload->version;
-			}
-			vchiq_log_info(vchiq_core_log_level,
-				"%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
-				state->id, header, size, remoteport, localport,
-				service->peer_version);
-			if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
-				service->remoteport = remoteport;
-				vchiq_set_service_state(service,
-					VCHIQ_SRVSTATE_OPEN);
-				complete(&service->remove_event);
-			} else {
-				vchiq_log_error(vchiq_core_log_level,
-					"OPENACK received in state %s",
-					srvstate_names[service->srvstate]);
-			}
-			break;
-		case VCHIQ_MSG_CLOSE:
-			WARN_ON(size != 0); /* There should be no data */
-
-			vchiq_log_info(vchiq_core_log_level,
-				"%d: prs CLOSE@%pK (%d->%d)",
-				state->id, header, remoteport, localport);
-
-			mark_service_closing_internal(service, 1);
+		vchiq_log_info(vchiq_core_log_level,
+			"%d: prs CLOSE@%pK (%d->%d)",
+			state->id, header, remoteport, localport);
 
-			if (vchiq_close_service_internal(service,
-				1/*close_recvd*/) == VCHIQ_RETRY)
-				goto bail_not_ready;
+		mark_service_closing_internal(service, 1);
 
-			vchiq_log_info(vchiq_core_log_level,
-				"Close Service %c%c%c%c s:%u d:%d",
-				VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
-				service->localport,
-				service->remoteport);
-			break;
-		case VCHIQ_MSG_DATA:
-			vchiq_log_info(vchiq_core_log_level,
-				"%d: prs DATA@%pK,%x (%d->%d)",
-				state->id, header, size, remoteport, localport);
+		if (vchiq_close_service_internal(service,
+			1/*close_recvd*/) == VCHIQ_RETRY)
+			goto bail_not_ready;
 
-			if ((service->remoteport == remoteport) &&
-			    (service->srvstate == VCHIQ_SRVSTATE_OPEN)) {
-				header->msgid = msgid | VCHIQ_MSGID_CLAIMED;
-				claim_slot(state->rx_info);
+		vchiq_log_info(vchiq_core_log_level,
+			"Close Service %c%c%c%c s:%u d:%d",
+			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+			service->localport,
+			service->remoteport);
+		break;
+	case VCHIQ_MSG_DATA:
+		vchiq_log_info(vchiq_core_log_level,
+			"%d: prs DATA@%pK,%x (%d->%d)",
+			state->id, header, size, remoteport, localport);
+
+		if ((service->remoteport == remoteport) &&
+		    (service->srvstate == VCHIQ_SRVSTATE_OPEN)) {
+			header->msgid = msgid | VCHIQ_MSGID_CLAIMED;
+			claim_slot(state->rx_info);
+			DEBUG_TRACE(PARSE_LINE);
+			if (make_service_callback(service,
+				VCHIQ_MESSAGE_AVAILABLE, header,
+				NULL) == VCHIQ_RETRY) {
 				DEBUG_TRACE(PARSE_LINE);
-				if (make_service_callback(service,
-					VCHIQ_MESSAGE_AVAILABLE, header,
-					NULL) == VCHIQ_RETRY) {
-					DEBUG_TRACE(PARSE_LINE);
-					goto bail_not_ready;
-				}
-				VCHIQ_SERVICE_STATS_INC(service, ctrl_rx_count);
-				VCHIQ_SERVICE_STATS_ADD(service, ctrl_rx_bytes,
-					size);
-			} else {
-				VCHIQ_STATS_INC(state, error_count);
+				goto bail_not_ready;
 			}
-			break;
-		case VCHIQ_MSG_CONNECT:
-			vchiq_log_info(vchiq_core_log_level,
-				"%d: prs CONNECT@%pK", state->id, header);
-			state->version_common =	((struct vchiq_slot_zero *)
-						 state->slot_data)->version;
-			complete(&state->connect);
-			break;
-		case VCHIQ_MSG_BULK_RX:
-		case VCHIQ_MSG_BULK_TX:
-			/*
-			 * We should never receive a bulk request from the
-			 * other side since we're not setup to perform as the
-			 * master.
-			 */
-			WARN_ON(1);
-			break;
-		case VCHIQ_MSG_BULK_RX_DONE:
-		case VCHIQ_MSG_BULK_TX_DONE:
-			if ((service->remoteport == remoteport) &&
-			    (service->srvstate != VCHIQ_SRVSTATE_FREE)) {
-				struct vchiq_bulk_queue *queue;
-				struct vchiq_bulk *bulk;
+			VCHIQ_SERVICE_STATS_INC(service, ctrl_rx_count);
+			VCHIQ_SERVICE_STATS_ADD(service, ctrl_rx_bytes,
+				size);
+		} else {
+			VCHIQ_STATS_INC(state, error_count);
+		}
+		break;
+	case VCHIQ_MSG_CONNECT:
+		vchiq_log_info(vchiq_core_log_level,
+			"%d: prs CONNECT@%pK", state->id, header);
+		state->version_common =	((struct vchiq_slot_zero *)
+					 state->slot_data)->version;
+		complete(&state->connect);
+		break;
+	case VCHIQ_MSG_BULK_RX:
+	case VCHIQ_MSG_BULK_TX:
+		/*
+		 * We should never receive a bulk request from the
+		 * other side since we're not setup to perform as the
+		 * master.
+		 */
+		WARN_ON(1);
+		break;
+	case VCHIQ_MSG_BULK_RX_DONE:
+	case VCHIQ_MSG_BULK_TX_DONE:
+		if ((service->remoteport == remoteport) &&
+		    (service->srvstate != VCHIQ_SRVSTATE_FREE)) {
+			struct vchiq_bulk_queue *queue;
+			struct vchiq_bulk *bulk;
 
-				queue = (type == VCHIQ_MSG_BULK_RX_DONE) ?
-					&service->bulk_rx : &service->bulk_tx;
+			queue = (type == VCHIQ_MSG_BULK_RX_DONE) ?
+				&service->bulk_rx : &service->bulk_tx;
 
+			DEBUG_TRACE(PARSE_LINE);
+			if (mutex_lock_killable(&service->bulk_mutex)) {
 				DEBUG_TRACE(PARSE_LINE);
-				if (mutex_lock_killable(&service->bulk_mutex)) {
-					DEBUG_TRACE(PARSE_LINE);
-					goto bail_not_ready;
-				}
-				if ((int)(queue->remote_insert -
-					queue->local_insert) >= 0) {
-					vchiq_log_error(vchiq_core_log_level,
-						"%d: prs %s@%pK (%d->%d) unexpected (ri=%d,li=%d)",
-						state->id, msg_type_str(type),
-						header, remoteport, localport,
-						queue->remote_insert,
-						queue->local_insert);
-					mutex_unlock(&service->bulk_mutex);
-					break;
-				}
-				if (queue->process != queue->remote_insert) {
-					pr_err("%s: p %x != ri %x\n",
-					       __func__,
-					       queue->process,
-					       queue->remote_insert);
-					mutex_unlock(&service->bulk_mutex);
-					goto bail_not_ready;
-				}
-
-				bulk = &queue->bulks[
-					BULK_INDEX(queue->remote_insert)];
-				bulk->actual = *(int *)header->data;
-				queue->remote_insert++;
-
-				vchiq_log_info(vchiq_core_log_level,
-					"%d: prs %s@%pK (%d->%d) %x@%pad",
+				goto bail_not_ready;
+			}
+			if ((int)(queue->remote_insert -
+				queue->local_insert) >= 0) {
+				vchiq_log_error(vchiq_core_log_level,
+					"%d: prs %s@%pK (%d->%d) unexpected (ri=%d,li=%d)",
 					state->id, msg_type_str(type),
 					header, remoteport, localport,
-					bulk->actual, &bulk->data);
-
-				vchiq_log_trace(vchiq_core_log_level,
-					"%d: prs:%d %cx li=%x ri=%x p=%x",
-					state->id, localport,
-					(type == VCHIQ_MSG_BULK_RX_DONE) ?
-						'r' : 't',
-					queue->local_insert,
-					queue->remote_insert, queue->process);
-
-				DEBUG_TRACE(PARSE_LINE);
-				WARN_ON(queue->process == queue->local_insert);
-				vchiq_complete_bulk(bulk);
-				queue->process++;
+					queue->remote_insert,
+					queue->local_insert);
 				mutex_unlock(&service->bulk_mutex);
-				DEBUG_TRACE(PARSE_LINE);
-				notify_bulks(service, queue, 1/*retry_poll*/);
-				DEBUG_TRACE(PARSE_LINE);
-			}
-			break;
-		case VCHIQ_MSG_PADDING:
-			vchiq_log_trace(vchiq_core_log_level,
-				"%d: prs PADDING@%pK,%x",
-				state->id, header, size);
-			break;
-		case VCHIQ_MSG_PAUSE:
-			/* If initiated, signal the application thread */
-			vchiq_log_trace(vchiq_core_log_level,
-				"%d: prs PAUSE@%pK,%x",
-				state->id, header, size);
-			if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
-				vchiq_log_error(vchiq_core_log_level,
-					"%d: PAUSE received in state PAUSED",
-					state->id);
 				break;
 			}
-			if (state->conn_state != VCHIQ_CONNSTATE_PAUSE_SENT) {
-				/* Send a PAUSE in response */
-				if (queue_message(state, NULL,
-					VCHIQ_MAKE_MSG(VCHIQ_MSG_PAUSE, 0, 0),
-					NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK)
-				    == VCHIQ_RETRY)
-					goto bail_not_ready;
+			if (queue->process != queue->remote_insert) {
+				pr_err("%s: p %x != ri %x\n",
+				       __func__,
+				       queue->process,
+				       queue->remote_insert);
+				mutex_unlock(&service->bulk_mutex);
+				goto bail_not_ready;
 			}
-			/* At this point slot_mutex is held */
-			vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
-			break;
-		case VCHIQ_MSG_RESUME:
-			vchiq_log_trace(vchiq_core_log_level,
-				"%d: prs RESUME@%pK,%x",
-				state->id, header, size);
-			/* Release the slot mutex */
-			mutex_unlock(&state->slot_mutex);
-			vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
-			break;
 
-		case VCHIQ_MSG_REMOTE_USE:
-			vchiq_on_remote_use(state);
-			break;
-		case VCHIQ_MSG_REMOTE_RELEASE:
-			vchiq_on_remote_release(state);
-			break;
-		case VCHIQ_MSG_REMOTE_USE_ACTIVE:
-			break;
+			bulk = &queue->bulks[
+				BULK_INDEX(queue->remote_insert)];
+			bulk->actual = *(int *)header->data;
+			queue->remote_insert++;
 
-		default:
+			vchiq_log_info(vchiq_core_log_level,
+				"%d: prs %s@%pK (%d->%d) %x@%pad",
+				state->id, msg_type_str(type),
+				header, remoteport, localport,
+				bulk->actual, &bulk->data);
+
+			vchiq_log_trace(vchiq_core_log_level,
+				"%d: prs:%d %cx li=%x ri=%x p=%x",
+				state->id, localport,
+				(type == VCHIQ_MSG_BULK_RX_DONE) ?
+					'r' : 't',
+				queue->local_insert,
+				queue->remote_insert, queue->process);
+
+			DEBUG_TRACE(PARSE_LINE);
+			WARN_ON(queue->process == queue->local_insert);
+			vchiq_complete_bulk(bulk);
+			queue->process++;
+			mutex_unlock(&service->bulk_mutex);
+			DEBUG_TRACE(PARSE_LINE);
+			notify_bulks(service, queue, 1/*retry_poll*/);
+			DEBUG_TRACE(PARSE_LINE);
+		}
+		break;
+	case VCHIQ_MSG_PADDING:
+		vchiq_log_trace(vchiq_core_log_level,
+			"%d: prs PADDING@%pK,%x",
+			state->id, header, size);
+		break;
+	case VCHIQ_MSG_PAUSE:
+		/* If initiated, signal the application thread */
+		vchiq_log_trace(vchiq_core_log_level,
+			"%d: prs PAUSE@%pK,%x",
+			state->id, header, size);
+		if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
 			vchiq_log_error(vchiq_core_log_level,
-				"%d: prs invalid msgid %x@%pK,%x",
-				state->id, msgid, header, size);
-			WARN(1, "invalid message\n");
+				"%d: PAUSE received in state PAUSED",
+				state->id);
 			break;
 		}
+		if (state->conn_state != VCHIQ_CONNSTATE_PAUSE_SENT) {
+			/* Send a PAUSE in response */
+			if (queue_message(state, NULL,
+				VCHIQ_MAKE_MSG(VCHIQ_MSG_PAUSE, 0, 0),
+				NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK)
+			    == VCHIQ_RETRY)
+				goto bail_not_ready;
+		}
+		/* At this point slot_mutex is held */
+		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
+		break;
+	case VCHIQ_MSG_RESUME:
+		vchiq_log_trace(vchiq_core_log_level,
+			"%d: prs RESUME@%pK,%x",
+			state->id, header, size);
+		/* Release the slot mutex */
+		mutex_unlock(&state->slot_mutex);
+		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
+		break;
+
+	case VCHIQ_MSG_REMOTE_USE:
+		vchiq_on_remote_use(state);
+		break;
+	case VCHIQ_MSG_REMOTE_RELEASE:
+		vchiq_on_remote_release(state);
+		break;
+	case VCHIQ_MSG_REMOTE_USE_ACTIVE:
+		break;
+
+	default:
+		vchiq_log_error(vchiq_core_log_level,
+			"%d: prs invalid msgid %x@%pK,%x",
+			state->id, msgid, header, size);
+		WARN(1, "invalid message\n");
+		break;
+	}
 
 skip_message:
-		if (service) {
-			unlock_service(service);
-			service = NULL;
+	ret = size;
+
+bail_not_ready:
+	if (service)
+		unlock_service(service);
+
+	return ret;
+}
+
+/* Called by the slot handler thread */
+static void
+parse_rx_slots(struct vchiq_state *state)
+{
+	struct vchiq_shared_state *remote = state->remote;
+	int tx_pos;
+
+	DEBUG_INITIALISE(state->local)
+
+	tx_pos = remote->tx_pos;
+
+	while (state->rx_pos != tx_pos) {
+		struct vchiq_header *header;
+		int size;
+
+		DEBUG_TRACE(PARSE_LINE);
+		if (!state->rx_data) {
+			int rx_index;
+
+			WARN_ON(!((state->rx_pos & VCHIQ_SLOT_MASK) == 0));
+			rx_index = remote->slot_queue[
+				SLOT_QUEUE_INDEX_FROM_POS_MASKED(state->rx_pos)];
+			state->rx_data = (char *)SLOT_DATA_FROM_INDEX(state,
+				rx_index);
+			state->rx_info = SLOT_INFO_FROM_INDEX(state, rx_index);
+
+			/*
+			 * Initialise use_count to one, and increment
+			 * release_count at the end of the slot to avoid
+			 * releasing the slot prematurely.
+			 */
+			state->rx_info->use_count = 1;
+			state->rx_info->release_count = 0;
 		}
 
+		header = (struct vchiq_header *)(state->rx_data +
+			(state->rx_pos & VCHIQ_SLOT_MASK));
+		size = parse_message(state, header);
+		if (size < 0)
+			return;
+
 		state->rx_pos += calc_stride(size);
 
 		DEBUG_TRACE(PARSE_LINE);
@@ -1887,10 +1912,6 @@ parse_rx_slots(struct vchiq_state *state)
 			state->rx_data = NULL;
 		}
 	}
-
-bail_not_ready:
-	if (service)
-		unlock_service(service);
 }
 
 /* Called by the slot handler thread */
-- 
2.7.4

