Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D946D17
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:29 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MVe1U-1l6Nxd00MG-00Rd2c; Sun, 11 Apr 2021 20:12:25 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 08/10] staging: vchiq_core: introduce SLOT_QUEUE_INDEX_FROM_POS_MASKED
Date: Sun, 11 Apr 2021 20:11:38 +0200
Message-Id: <1618164700-21150-9-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Urnl96yFPDfMUt34Jf6diE1g+I79gvIcRdSUxsis1LkGz+gGTxA
 Slwd/aBi3vjVfgVgm+WDqM/CJ/1vJZh8QV9HUo/XCbCtWgH/vXpGGwSiujWaOATbh01ZSuv
 AhxjUckKhMmFkEaE+01DdHdQPYPCIVN9PC3A+DoOG7m4gw3SUqMfzXRJsxw2htr6MWIEmL6
 6/mtEtcAUF5ooGNwemf9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MQ0xvp8eiiQ=:B78Udn2w1JxQ/JjTOfBX2M
 qlT2f4/FFUWfgkCYS3KkZK/S1O79R30VFiMEFEr1zqvyRLAZ/dO/+c5/LlvoEzkwCpU2iWCKs
 APFzE6w7/FiiscwoOVRcxpAlf0W9T/UlkrCiFzFhg+DaLGUhiBZudjA5Kv8Klbi5VPMSlXJBH
 wnqRzGzywSZMQmEuDPCATQP5EAYA8QPRYuM3ToRp75cShAoldVzvRlyT/CYTjfgRPPqI22+AL
 WgWYfxxaws+nOHbgNgSe1lmau7UpxQsba1Ed00UgyaTQvHKBNeIV2ZizZoYSjKIYON066rx0x
 is7V5+GTZshq12F13zvpOMx6vLLVBjfUatNpb6kynkOBveZvmn1AS611TRFrAptMB4JOI+qnq
 Ckj9ndBoJXCXM5nUDhXSFN/nYLV1XEP+PV1+ZmjxLXDm2c1WmPFQhnv+H0GKhZjBO1sgCV6am
 Iqs7oIEI0fYrZ6I1jMwwgIrrTB3rgJ6KkgZHdzrsou4cVQ86WuSV
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Define a macro which already masked the result of SLOT_QUEUE_INDEX_FROM_POS.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2db2332..5eab351 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -28,6 +28,8 @@
 	((unsigned int)(info - state->slot_info))
 #define SLOT_QUEUE_INDEX_FROM_POS(pos) \
 	((int)((unsigned int)(pos) / VCHIQ_SLOT_SIZE))
+#define SLOT_QUEUE_INDEX_FROM_POS_MASKED(pos) \
+	(SLOT_QUEUE_INDEX_FROM_POS(pos) & VCHIQ_SLOT_QUEUE_MASK)
 
 #define BULK_INDEX(x) (x & (VCHIQ_NUM_SERVICE_BULKS - 1))
 
@@ -613,8 +615,7 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
 		}
 
 		slot_index = local->slot_queue[
-			SLOT_QUEUE_INDEX_FROM_POS(tx_pos) &
-			VCHIQ_SLOT_QUEUE_MASK];
+			SLOT_QUEUE_INDEX_FROM_POS_MASKED(tx_pos)];
 		state->tx_data =
 			(char *)SLOT_DATA_FROM_INDEX(state, slot_index);
 	}
@@ -1567,8 +1568,7 @@ parse_rx_slots(struct vchiq_state *state)
 
 			WARN_ON(!((state->rx_pos & VCHIQ_SLOT_MASK) == 0));
 			rx_index = remote->slot_queue[
-				SLOT_QUEUE_INDEX_FROM_POS(state->rx_pos) &
-				VCHIQ_SLOT_QUEUE_MASK];
+				SLOT_QUEUE_INDEX_FROM_POS_MASKED(state->rx_pos)];
 			state->rx_data = (char *)SLOT_DATA_FROM_INDEX(state,
 				rx_index);
 			state->rx_info = SLOT_INFO_FROM_INDEX(state, rx_index);
-- 
2.7.4

