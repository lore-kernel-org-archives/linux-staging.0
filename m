Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB692F83
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:43 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mate1-1l2oaD3nK7-00cMY8; Thu, 22 Apr 2021 22:08:39 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 04/10] staging: vchiq_core: Drop unnecessary check in notify_bulks
Date: Thu, 22 Apr 2021 22:07:50 +0200
Message-Id: <1619122076-31785-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Rf+DMhJ/ci47OjGJL9efSNZB3BfI/TILmu5Hb1dhRGXyHSP5wZW
 NOaBJH+Yj5jWD+r8RgJFM5uPX8YQum7QYXSJPqaentqaM7uWduSVb99sP7mdbDN53JSnUN2
 zsBdpAHdwzFU7fPNItxcITzwLQVV2eH9m4am52aNX4jwJ/8pXcao2yRFUZ8OfQ/7Pr/ad4a
 VmS7hJM7LoVo86YnyHr+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dIOSUIpmsTQ=:OJ0Y43JnNXkUkrTZ/MY66t
 OIkKd4xCwWC0Jznt8xIos9KzbseIGPAMqPPMLqgtvq+W7PQ6tUjK7jLjk3BKuI8S+aGxoA/q7
 kPw6CiGu0HyT0sYsPffY0apwQjL0NHvJ3wg1vFuufKL4rgqmcCrDEPnG825dE3QOBoxVRhk6h
 yvgwKXqAE4e5hyuOpP/9YumQDaXUyPQa7oOtFgpypB6N6jndb8q/oR7ZhehcHEZwyHri0Q/Rg
 lsIHg5twptUid36TrE8WihWNT/zL8L1ZCAZbYSjNtZzbxa2D3Mscfz3IKmg3CH7Jj58U8W7AV
 vMk8OHFPH3f65dPWa7W/n9Aw3ku9M+8hYCWnifFozl6MVprcgLuqQleoYNIhHDsENAULpeaV5
 Jcm+ymdmQKqcOIGGyxnWENlXEFJxTO/RUmZIXfFLq1O/S/SeVwcKoOcCIU2W/pMCNJKCFMuoD
 A41hO72jTrspOK/2GVHYPEZSDcbbobiZWO8cXjhjnWsEDNrFRDyfDs6edoXawSUnZTPT5ogQs
 M9JEQtH3eWYiCXnkkOSYfI=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no modification to the vchiq_status before the first if, so drop
this unnecessary check.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 92 +++++++++++-----------
 1 file changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3a72c36..9dc9a6a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1257,61 +1257,59 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 
 	queue->remote_notify = queue->process;
 
-	if (status == VCHIQ_SUCCESS) {
-		while (queue->remove != queue->remote_notify) {
-			struct vchiq_bulk *bulk =
-				&queue->bulks[BULK_INDEX(queue->remove)];
+	while (queue->remove != queue->remote_notify) {
+		struct vchiq_bulk *bulk =
+			&queue->bulks[BULK_INDEX(queue->remove)];
 
-			/*
-			 * Only generate callbacks for non-dummy bulk
-			 * requests, and non-terminated services
-			 */
-			if (bulk->data && service->instance) {
-				if (bulk->actual != VCHIQ_BULK_ACTUAL_ABORTED) {
-					if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
-						VCHIQ_SERVICE_STATS_INC(service,
-							bulk_tx_count);
-						VCHIQ_SERVICE_STATS_ADD(service,
-							bulk_tx_bytes,
-							bulk->actual);
-					} else {
-						VCHIQ_SERVICE_STATS_INC(service,
-							bulk_rx_count);
-						VCHIQ_SERVICE_STATS_ADD(service,
-							bulk_rx_bytes,
-							bulk->actual);
-					}
+		/*
+		 * Only generate callbacks for non-dummy bulk
+		 * requests, and non-terminated services
+		 */
+		if (bulk->data && service->instance) {
+			if (bulk->actual != VCHIQ_BULK_ACTUAL_ABORTED) {
+				if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
+					VCHIQ_SERVICE_STATS_INC(service,
+						bulk_tx_count);
+					VCHIQ_SERVICE_STATS_ADD(service,
+						bulk_tx_bytes,
+						bulk->actual);
 				} else {
 					VCHIQ_SERVICE_STATS_INC(service,
-						bulk_aborted_count);
+						bulk_rx_count);
+					VCHIQ_SERVICE_STATS_ADD(service,
+						bulk_rx_bytes,
+						bulk->actual);
 				}
-				if (bulk->mode == VCHIQ_BULK_MODE_BLOCKING) {
-					struct bulk_waiter *waiter;
-
-					spin_lock(&bulk_waiter_spinlock);
-					waiter = bulk->userdata;
-					if (waiter) {
-						waiter->actual = bulk->actual;
-						complete(&waiter->event);
-					}
-					spin_unlock(&bulk_waiter_spinlock);
-				} else if (bulk->mode ==
-					VCHIQ_BULK_MODE_CALLBACK) {
-					enum vchiq_reason reason =
-							get_bulk_reason(bulk);
-					status = make_service_callback(service,
-						reason,	NULL, bulk->userdata);
-					if (status == VCHIQ_RETRY)
-						break;
+			} else {
+				VCHIQ_SERVICE_STATS_INC(service,
+					bulk_aborted_count);
+			}
+			if (bulk->mode == VCHIQ_BULK_MODE_BLOCKING) {
+				struct bulk_waiter *waiter;
+
+				spin_lock(&bulk_waiter_spinlock);
+				waiter = bulk->userdata;
+				if (waiter) {
+					waiter->actual = bulk->actual;
+					complete(&waiter->event);
 				}
+				spin_unlock(&bulk_waiter_spinlock);
+			} else if (bulk->mode ==
+				VCHIQ_BULK_MODE_CALLBACK) {
+				enum vchiq_reason reason =
+						get_bulk_reason(bulk);
+				status = make_service_callback(service,
+					reason,	NULL, bulk->userdata);
+				if (status == VCHIQ_RETRY)
+					break;
 			}
-
-			queue->remove++;
-			complete(&service->bulk_remove_event);
 		}
-		if (!retry_poll)
-			status = VCHIQ_SUCCESS;
+
+		queue->remove++;
+		complete(&service->bulk_remove_event);
 	}
+	if (!retry_poll)
+		status = VCHIQ_SUCCESS;
 
 	if (status == VCHIQ_RETRY)
 		request_poll(service->state, service,
-- 
2.7.4

