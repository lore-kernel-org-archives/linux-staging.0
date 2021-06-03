Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FBF6D34
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:54 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGQSj-1lakjP3sMf-00GtbJ; Thu, 03 Jun 2021 17:50:51 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 12/16] staging: vchiq_core: introduce process_free_data_message
Date: Thu,  3 Jun 2021 17:50:01 +0200
Message-Id: <1622735405-9980-13-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:x0Aok2NzNU1PEBk61cKI4nWNYYIFgm30wQybKhbaCP39MSwYoc3
 Upi3tK/VB/8ecByF1mg3gJxw0OJCVO4NXW2zZAS5A4dmJ0TJKBV9MIPD376mtv6mAn+Srlj
 anPZ36JLvhjeHBa+9CwJogRvZGQIuZzS1TkvGaFLZzHYSp/Ef6KTHAn23/gFuWaWGVYczL3
 Vq+0kgabsdN19WLrhFhCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mIqyKfGoIlQ=:oRE6Iq5UpDIiDIdjYDJ7Q9
 122dtGIaK+lULCWnMmZzZFQVMv/0HufP1nF7u5MS3jheLuFdljyGy14gHe3kst8ZB1z2V2mF3
 fS9Zpht343I6oOD2N2hO+DY1BuaeC8uDAen/BNpPEA2uOYqJpgR+xxLsEOVAKKmAj4ARVY8KN
 6SsnTpSooqB/co/yTiAMwq5f9omgb1ULcwwlgBJiDCdpH8PsHya1P9fZ3M1CVKVmOUghPrd2I
 /X490gcZ0X8affep9acm2fwe3VhooQ+Jaxqtcev5HjFwzZTIdhRHDkgjLP2DDvCa2FgXNjiwD
 WS8dTyk0zHHnhDaOCZ55VXezRwD4yKrQUkIoMhqlkltYdnbMTmYvDJjxv/2tpARAeL/qwWfbu
 XZ9Fbt/1JJyoYIEaVB00QXRQBgp/7g1h3oThJr+HE6kI5H0zeEgg1OJulLlxrLx5VDBceCZC/
 DdNqVfTnVM1qDZKF2o+eQUxmcwI0OPSy011FXbJurToOmLY9myTGlGKkVkBI/qfyPDHF7KN6w
 ieR3pqfmpB9bIrGOoEv2/8=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This moves the special handling for data messages from process_free_queue()
into a new function. After this process_free_queue() has less extreme
indentation and should be easier to read.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 124 +++++++++++----------
 1 file changed, 64 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index af2effa..84dcbc2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -717,6 +717,68 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
 						(tx_pos & VCHIQ_SLOT_MASK));
 }
 
+static void
+process_free_data_message(struct vchiq_state *state, BITSET_T *service_found,
+			  struct vchiq_header *header)
+{
+	int msgid = header->msgid;
+	int port = VCHIQ_MSG_SRCPORT(msgid);
+	struct vchiq_service_quota *quota = &state->service_quotas[port];
+	int count;
+
+	spin_lock(&quota_spinlock);
+	count = quota->message_use_count;
+	if (count > 0)
+		quota->message_use_count = count - 1;
+	spin_unlock(&quota_spinlock);
+
+	if (count == quota->message_quota) {
+		/*
+		 * Signal the service that it
+		 * has dropped below its quota
+		 */
+		complete(&quota->quota_event);
+	} else if (count == 0) {
+		vchiq_log_error(vchiq_core_log_level,
+			"service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
+			port,
+			quota->message_use_count,
+			header, msgid, header->msgid,
+			header->size);
+		WARN(1, "invalid message use count\n");
+	}
+	if (!BITSET_IS_SET(service_found, port)) {
+		/* Set the found bit for this service */
+		BITSET_SET(service_found, port);
+
+		spin_lock(&quota_spinlock);
+		count = quota->slot_use_count;
+		if (count > 0)
+			quota->slot_use_count = count - 1;
+		spin_unlock(&quota_spinlock);
+
+		if (count > 0) {
+			/*
+			 * Signal the service in case
+			 * it has dropped below its quota
+			 */
+			complete(&quota->quota_event);
+			vchiq_log_trace(vchiq_core_log_level,
+				"%d: pfq:%d %x@%pK - slot_use->%d",
+				state->id, port,
+				header->size, header,
+				count - 1);
+		} else {
+			vchiq_log_error(vchiq_core_log_level,
+					"service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
+				port, count, header,
+				msgid, header->msgid,
+				header->size);
+			WARN(1, "bad slot use count\n");
+		}
+	}
+}
+
 /* Called by the recycle thread. */
 static void
 process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
@@ -767,66 +829,8 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 			int msgid = header->msgid;
 
 			if (VCHIQ_MSG_TYPE(msgid) == VCHIQ_MSG_DATA) {
-				int port = VCHIQ_MSG_SRCPORT(msgid);
-				struct vchiq_service_quota *quota =
-					&state->service_quotas[port];
-				int count;
-
-				spin_lock(&quota_spinlock);
-				count = quota->message_use_count;
-				if (count > 0)
-					quota->message_use_count = count - 1;
-				spin_unlock(&quota_spinlock);
-
-				if (count == quota->message_quota) {
-					/*
-					 * Signal the service that it
-					 * has dropped below its quota
-					 */
-					complete(&quota->quota_event);
-				} else if (count == 0) {
-					vchiq_log_error(vchiq_core_log_level,
-						"service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
-						port,
-						quota->message_use_count,
-						header, msgid, header->msgid,
-						header->size);
-					WARN(1, "invalid message use count\n");
-				}
-				if (!BITSET_IS_SET(service_found, port)) {
-					/* Set the found bit for this service */
-					BITSET_SET(service_found, port);
-
-					spin_lock(&quota_spinlock);
-					count = quota->slot_use_count;
-					if (count > 0)
-						quota->slot_use_count =
-							count - 1;
-					spin_unlock(&quota_spinlock);
-
-					if (count > 0) {
-						/*
-						 * Signal the service in case
-						 * it has dropped below its quota
-						 */
-						complete(&quota->quota_event);
-						vchiq_log_trace(
-							vchiq_core_log_level,
-							"%d: pfq:%d %x@%pK - slot_use->%d",
-							state->id, port,
-							header->size, header,
-							count - 1);
-					} else {
-						vchiq_log_error(
-							vchiq_core_log_level,
-								"service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
-							port, count, header,
-							msgid, header->msgid,
-							header->size);
-						WARN(1, "bad slot use count\n");
-					}
-				}
-
+				process_free_data_message(state, service_found,
+							  header);
 				data_found = 1;
 			}
 
-- 
2.7.4

