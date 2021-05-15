Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895D2FB4
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:26 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWjQU-1lxTDG2nW4-00X6F4; Sat, 15 May 2021 21:11:22 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 19/20] staging: vchiq_core: introduce defines for close_recvd
Date: Sat, 15 May 2021 21:10:58 +0200
Message-Id: <1621105859-30215-20-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:cKEYqlJmuDCGZwuvIx8aMmdaLHuZvczDI2o1n/QGu1rL1TESZzh
 4ddwhFEJRrWRVVvNTCKZpqbA3h8EYRG94BbFkwy7lEuVWLzjH53GxjXPh6/mx5H+fdCdls4
 aX3dVz4ugJszBbsMSdOG2UQQ2C9jQFrGETaQV8QxX35EVbTxL0aHqEm0h/tKU5pudJQ8umz
 U7pSrrenN06H7DrpIPHnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t9Oh/JdBchs=:bYpt8u+brFgva+5C8SZjub
 AbnNCyITq2U+xC3m1TtEfUVoqb+482/D/TK4e+QcZbGsv3GBzfLBgl/4c/1pmHL/RmWR1HpAG
 GwEUUNX29VkmWr2kQOyYHN7/pXUqqdhcY+k5ELY4N0JS8HWsgoHJU0TIJAe6Yrfxdc5Zgx32L
 dvUxNR/2S00R1F1qva6eL1cu1owldxrffHvdUNzgEOEDOk9LID9OU1IFv64oQAO/k70uH6FV+
 vPGYQOFKBLfVlMbsCS0XBHkRvYD3pJ0e7mzyq47y9OnBVucV7/HS6aXPqlEefeT9LMf1IeAje
 yweuYJEgz+c3lPW9c4nuZiYutvcjIHxcV/QDa+D2mwiHv2qrLzswY87m0dIxxQ8JDPjk715XP
 CXkWtxMigg8EP6YDnaV0HP2hqFnooU91hHjE0F/tI2665sZgz+rlDyQrzjyg8JvOvO0B+qqEy
 zX6TIP6g+FmQRSqzUkmXxrrahhjlEwY/Mo+eWojcXIPLYWK037w1zJ0UEdAYaLwqrEDEodiat
 cGtlHtDR/aC5MOjmncLWuM=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Use descriptive defines instead of a number with a comment.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 985e1c6..c22eefc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -38,6 +38,9 @@
 #define SRVTRACE_ENABLED(srv, lev) \
 	(((srv) && (srv)->trace) || (vchiq_core_msg_log_level >= (lev)))
 
+#define NO_CLOSE_RECVD	0
+#define CLOSE_RECVD	1
+
 struct vchiq_open_payload {
 	int fourcc;
 	int client_id;
@@ -1348,7 +1351,7 @@ poll_services_of_group(struct vchiq_state *state, int group)
 		 */
 		service->public_fourcc = VCHIQ_FOURCC_INVALID;
 
-		if (vchiq_close_service_internal(service, 0/*!close_recvd*/) !=
+		if (vchiq_close_service_internal(service, NO_CLOSE_RECVD) !=
 						 VCHIQ_SUCCESS) {
 			request_poll(state, service, VCHIQ_POLL_REMOVE);
 		} else if (service_flags & BIT(VCHIQ_POLL_TERMINATE)) {
@@ -1357,7 +1360,7 @@ poll_services_of_group(struct vchiq_state *state, int group)
 				state->id, service->localport,
 				service->remoteport);
 			if (vchiq_close_service_internal(
-				service, 0/*!close_recvd*/) !=
+				service, NO_CLOSE_RECVD) !=
 				VCHIQ_SUCCESS)
 				request_poll(state, service,
 					     VCHIQ_POLL_TERMINATE);
@@ -1683,7 +1686,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		mark_service_closing_internal(service, 1);
 
 		if (vchiq_close_service_internal(service,
-			1/*close_recvd*/) == VCHIQ_RETRY)
+			CLOSE_RECVD) == VCHIQ_RETRY)
 			goto bail_not_ready;
 
 		vchiq_log_info(vchiq_core_log_level,
@@ -2976,8 +2979,7 @@ vchiq_close_service(unsigned int handle)
 	mark_service_closing(service);
 
 	if (current == service->state->slot_handler_thread) {
-		status = vchiq_close_service_internal(service,
-			0/*!close_recvd*/);
+		status = vchiq_close_service_internal(service, NO_CLOSE_RECVD);
 		WARN_ON(status == VCHIQ_RETRY);
 	} else {
 	/* Mark the service for termination by the slot handler */
@@ -3041,8 +3043,7 @@ vchiq_remove_service(unsigned int handle)
 		 */
 		service->public_fourcc = VCHIQ_FOURCC_INVALID;
 
-		status = vchiq_close_service_internal(service,
-			0/*!close_recvd*/);
+		status = vchiq_close_service_internal(service, NO_CLOSE_RECVD);
 		WARN_ON(status == VCHIQ_RETRY);
 	} else {
 		/* Mark the service for removal by the slot handler */
-- 
2.7.4

