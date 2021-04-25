Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366922FA4
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:40 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MaIGB-1m41jQ1M0b-00WHHx; Sun, 25 Apr 2021 12:51:29 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 05/11] staging: vchiq_core: Drop unnecessary check in notify_bulks
Date: Sun, 25 Apr 2021 12:50:57 +0200
Message-Id: <1619347863-16080-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:6SV0u2ixjtjKktvK9mk67shAm48vRnHznN9GMk4Po/86qxHDOhj
 19OZzgKxuzwX0Ex3alUAcmrZIKIzuGNz6EimmyGQjWtn8wi2cfNJCvM5g5lCs5IaHuvykLq
 SxqFYeO3rD3lzD153pBQNcTckAO4oWZS5/nk7S694meRrpNhY6pFGl1mbF2gFYds9bC2k0l
 6psx6T2BLUwxdYK5QSxLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DLP97JBSZMI=:Wc5vzCcFEnoFpjs9vy3yKU
 6p7f5vDyX2oSStuKN+T4VTk/8Al+oTjF/KsdQVGpewqJ5nUG/AhK4ZDuUrIgwywZ7jjf4Ye2U
 BqSkYm8NiV+YAKe6+FmNITFZqPhgkznp63/L/Q/Tcai2CQHaPyJxiGLubXUWf3D/kjClnTVVR
 6Dp133eb2a/8MTXkRJTXp6Z6eLP9ykfsPvTMGqKXuw58MT8s0MuoSOfZQ8JKcuWwk/1mRWo+M
 b6iuqw7czC/i2EBvndEIC/WWl6U3pu7i+K6q4K+8zt93PHPlr2YtX4iIFZW77AdZ3s6JLECGF
 WB295REK2bGIDk1HLV0YPTdJT2+/ClvpqyCSut9F4l2eNvUXzhpOljd5fMyujHMJ7VkjQPy63
 K5WjKZRRmwfXBNcKNguaEKXstoIBknuSDUozbLXoLmo1lNyNUPjH138waDXqw0px0MDIEhMle
 bZVW4sZKuhMgTa7uT9SKH2GZ1jvTNRlBaEjUz035YbYZJR6e8DYgKxZp6FH4e8e6W+vEozjD7
 y/Wm3m8D7/2/H1jsUrXLZk=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no modification to the vchiq_status before the first if, so drop
this unnecessary check.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
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

