Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400996D36
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:55 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5VXu-1lI7DV17zW-016wK2; Thu, 03 Jun 2021 17:50:51 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 13/16] staging: vchiq_core: reduce indentation in parse_open
Date: Thu,  3 Jun 2021 17:50:02 +0200
Message-Id: <1622735405-9980-14-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Vwh0ehVGMlylFMZNJuowO1IaUi1MsIaQhbnOqo9hnFf5USJZoJh
 kGBIyT0RRSdb9gO6+tCWEyjh2sFLY8rM/TlqTX1eMcO3kcmwGEzuxpIzTLVqctw/he7Vm0M
 k3ozHTlTDAmZ2nqoPA1aPZ4dXJuYJWNmGqjFJp1cT3Px19ycv/yzHNwrwRBVXhI8qqmgWpU
 6Pp/HPACq/wYJG2WCx5DQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s1PqCJG3LBw=:/y377AtgPCCKfL/yZGlz87
 nIiNM5vNAzV2xHOvMUv3DuodUvcGDSgWuGpgPPCWIgXue8mk0Ll18nIZMk+grs4s5JVDwOzWT
 S4jIJ3UWGrDcAb9byuslImc1PFcvpzQ/hjw29ldWBKOx/FaXrYJrRaDSzKBQYlQwOixMJd9eI
 KJubxF1PA3FYoB0p2AsDUcUG767EtJSjnhq1/kwqmLuYkGsEloJGiuBotoNUeqA8B5NhheBv0
 cPB030fDGqH23Qf/EJWve9tut/Xrb5hMpt2vbJLj8efZIzLOfS6psGp8xva+gLKyH/03R8IQ4
 mwOxv7AnjzddEfCTCDSOzNEs9JbgSLE8jdT+zwo4AB47H/1CFLf7hRXxRIzx5GGb/P70tevUm
 DEWE/TmBk78xf/+JoMPjQx+4Z+mxxXwYA97R7RCX2ieLG5IaGd44K5fgFGfY4Y1g+llSIqYLG
 2kOIUVik9vspHEvuhGPWJ6A/w+PPSmYvw4bG8K0Susd7Tk+YyltQKDp8tj6bAJOzOKnoSXlut
 gG5ueEJkFYjXsKn805vp3o=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function parse_open() already has bail out sections like fail_open.
So use a goto for the other error cases like payload size is too small
and listening service cannot be found. This avoids two indentation levels.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 146 ++++++++++-----------
 1 file changed, 70 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 84dcbc2..3d543c5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1526,96 +1526,90 @@ abort_outstanding_bulks(struct vchiq_service *service,
 static int
 parse_open(struct vchiq_state *state, struct vchiq_header *header)
 {
+	const struct vchiq_open_payload *payload;
 	struct vchiq_service *service = NULL;
 	int msgid, size;
-	unsigned int localport, remoteport;
+	unsigned int localport, remoteport, fourcc;
+	short version, version_min;
 
 	msgid = header->msgid;
 	size = header->size;
 	localport = VCHIQ_MSG_DSTPORT(msgid);
 	remoteport = VCHIQ_MSG_SRCPORT(msgid);
-	if (size >= sizeof(struct vchiq_open_payload)) {
-		const struct vchiq_open_payload *payload =
-			(struct vchiq_open_payload *)header->data;
-		unsigned int fourcc;
-
-		fourcc = payload->fourcc;
-		vchiq_log_info(vchiq_core_log_level,
-			"%d: prs OPEN@%pK (%d->'%c%c%c%c')",
-			state->id, header, localport,
-			VCHIQ_FOURCC_AS_4CHARS(fourcc));
-
-		service = get_listening_service(state, fourcc);
+	if (size < sizeof(struct vchiq_open_payload))
+		goto fail_open;
 
-		if (service) {
-			/* A matching service exists */
-			short version = payload->version;
-			short version_min = payload->version_min;
-
-			if ((service->version < version_min) ||
-				(version < service->version_min)) {
-				/* Version mismatch */
-				vchiq_loud_error_header();
-				vchiq_loud_error("%d: service %d (%c%c%c%c) "
-					"version mismatch - local (%d, min %d)"
-					" vs. remote (%d, min %d)",
-					state->id, service->localport,
-					VCHIQ_FOURCC_AS_4CHARS(fourcc),
-					service->version, service->version_min,
-					version, version_min);
-				vchiq_loud_error_footer();
-				vchiq_service_put(service);
-				service = NULL;
-				goto fail_open;
-			}
-			service->peer_version = version;
+	payload = (struct vchiq_open_payload *)header->data;
+	fourcc = payload->fourcc;
+	vchiq_log_info(vchiq_core_log_level,
+		"%d: prs OPEN@%pK (%d->'%c%c%c%c')",
+		state->id, header, localport,
+		VCHIQ_FOURCC_AS_4CHARS(fourcc));
 
-			if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
-				struct vchiq_openack_payload ack_payload = {
-					service->version
-				};
-
-				if (state->version_common <
-				    VCHIQ_VERSION_SYNCHRONOUS_MODE)
-					service->sync = 0;
-
-				/* Acknowledge the OPEN */
-				if (service->sync) {
-					if (queue_message_sync(
-						state,
-						NULL,
-						MAKE_OPENACK(service->localport,
-							     remoteport),
-						memcpy_copy_callback,
-						&ack_payload,
-						sizeof(ack_payload),
-						0) == VCHIQ_RETRY)
-						goto bail_not_ready;
-				} else {
-					if (queue_message(state,
-							NULL,
-							MAKE_OPENACK(
-							service->localport,
-							remoteport),
-						memcpy_copy_callback,
-						&ack_payload,
-						sizeof(ack_payload),
-						0) == VCHIQ_RETRY)
-						goto bail_not_ready;
-				}
+	service = get_listening_service(state, fourcc);
+	if (!service)
+		goto fail_open;
 
-				/* The service is now open */
-				vchiq_set_service_state(service,
-					service->sync ? VCHIQ_SRVSTATE_OPENSYNC
-					: VCHIQ_SRVSTATE_OPEN);
-			}
+	/* A matching service exists */
+	version = payload->version;
+	version_min = payload->version_min;
 
-			/* Success - the message has been dealt with */
-			vchiq_service_put(service);
-			return 1;
+	if ((service->version < version_min) ||
+		(version < service->version_min)) {
+		/* Version mismatch */
+		vchiq_loud_error_header();
+		vchiq_loud_error("%d: service %d (%c%c%c%c) "
+			"version mismatch - local (%d, min %d)"
+			" vs. remote (%d, min %d)",
+			state->id, service->localport,
+			VCHIQ_FOURCC_AS_4CHARS(fourcc),
+			service->version, service->version_min,
+			version, version_min);
+		vchiq_loud_error_footer();
+		vchiq_service_put(service);
+		service = NULL;
+		goto fail_open;
+	}
+	service->peer_version = version;
+
+	if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
+		struct vchiq_openack_payload ack_payload = {
+			service->version
+		};
+
+		if (state->version_common <
+		    VCHIQ_VERSION_SYNCHRONOUS_MODE)
+			service->sync = 0;
+
+		/* Acknowledge the OPEN */
+		if (service->sync) {
+			if (queue_message_sync(state, NULL,
+				MAKE_OPENACK(service->localport, remoteport),
+				memcpy_copy_callback,
+				&ack_payload,
+				sizeof(ack_payload),
+				0) == VCHIQ_RETRY)
+				goto bail_not_ready;
+		} else {
+			if (queue_message(state, NULL,
+				MAKE_OPENACK(service->localport, remoteport),
+				memcpy_copy_callback,
+				&ack_payload,
+				sizeof(ack_payload),
+				0) == VCHIQ_RETRY)
+				goto bail_not_ready;
 		}
+
+		/* The service is now open */
+		vchiq_set_service_state(service,
+			service->sync ? VCHIQ_SRVSTATE_OPENSYNC
+			: VCHIQ_SRVSTATE_OPEN);
 	}
 
+	/* Success - the message has been dealt with */
+	vchiq_service_put(service);
+	return 1;
+
 fail_open:
 	/* No available service, or an invalid request - send a CLOSE */
 	if (queue_message(state, NULL, MAKE_CLOSE(0, VCHIQ_MSG_SRCPORT(msgid)),
-- 
2.7.4

