Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C12F83
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:39 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mt7st-1lL0Dh2Qh7-00tVcf; Sun, 25 Apr 2021 12:51:28 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 02/11] staging: vchiq_core: break early in vchiq_close_service_internal
Date: Sun, 25 Apr 2021 12:50:54 +0200
Message-Id: <1619347863-16080-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:NBj2LuuuvMdrU36qVXTvDwAyfO1ur3/8xgm9DMN+YRwCQpIBSu+
 eLZBif5oLiqB0gzziWct1ilEWBCTT2XTBxmgAJINH108x8+2j/RyNl0cEH8rU4vE0Mf1luQ
 M/Irf7o/kF0u7GxMJEuX2S4KDLEne7EiJTS40FIvCy3VrlNr6R0iwVFvXJMQLoSkC2U2F5s
 Cw4m3pVq/tFR0QHeGRQlw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nn2iHyXWaoc=:a7XXo2q/M+V5vUsEtzWziz
 hCaXf3uBZFwGBlXtpd3ysxpiPcacKs37OQdJ8kR3EGCXUb2eg4l1fZZlIRYrgYwq2WUe1j0Wj
 +9hdvZfczL2a7b/RtvgsEWwL/zS+zdTX63JvvrwGv1dr1Z0FLObrw59jYn562WN72Dq2k6yYW
 O/VVVpPKT/Sfz4B5t4b5jkklo87PN2hExiU2wc+ndnX7Nh96S3+6hROMc692ld715nsSMX1EC
 Nij0qGZGvLxiZ3R5BHJCpKRcIbyYsHh9pe0QC1qTDzIfMpFhGmbWLua1rKsLO8sb7OcPuq2OO
 IMRgaI1BmKFUaAk5feYv3kSvBxpYRetLK4jewNZlBHYt1t/D9H+aRgnfsJXSxM6NEvP49iCUQ
 MdoUVqTC9veaxC4P8FIFw8VdptjWs/T8tuHpuVB01jG85mVLDnLGFjt4KnSq/BBBDk84Gj3iW
 050O/N5rQRcceD7uOzqpjDpowRUKvfs5CP2MzvtOn9Lp0hu2aEsK4u4MTJNQmfXz2ROy70bTw
 +a7rUggK8/g1wVT3or0O64=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The logic in VCHIQ_SRVSTATE_OPEN* is unnecessary complex. Handle the error
case of queue_message() first makes it easier to read.

Btw we get the rid of the checkpatch warning:
WARNING: else is not generally useful after a break or return

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 517a8c9..8a1e6f5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2763,21 +2763,21 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 				VCHIQ_MSG_DSTPORT(service->remoteport)),
 				NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK);
 
-		if (status == VCHIQ_SUCCESS) {
-			if (!close_recvd) {
-				/* Change the state while the mutex is still held */
-				vchiq_set_service_state(service,
-							VCHIQ_SRVSTATE_CLOSESENT);
-				mutex_unlock(&state->slot_mutex);
-				if (service->sync)
-					mutex_unlock(&state->sync_mutex);
-				break;
-			}
-		} else if (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC) {
-			mutex_unlock(&state->sync_mutex);
+		if (status != VCHIQ_SUCCESS) {
+			if (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)
+				mutex_unlock(&state->sync_mutex);
 			break;
-		} else
+		}
+
+		if (!close_recvd) {
+			/* Change the state while the mutex is still held */
+			vchiq_set_service_state(service,
+						VCHIQ_SRVSTATE_CLOSESENT);
+			mutex_unlock(&state->slot_mutex);
+			if (service->sync)
+				mutex_unlock(&state->sync_mutex);
 			break;
+		}
 
 		/* Change the state while the mutex is still held */
 		vchiq_set_service_state(service, VCHIQ_SRVSTATE_CLOSERECVD);
-- 
2.7.4

