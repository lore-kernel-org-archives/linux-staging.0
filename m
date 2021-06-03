Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075BD6D2D
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M5wc7-1lj1v940Pj-007Vvn; Thu, 03 Jun 2021 17:50:49 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 03/16] staging: vchiq_core: move internals to C source
Date: Thu,  3 Jun 2021 17:49:52 +0200
Message-Id: <1622735405-9980-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:7rPJtqvvrwLSSK+9HMg4Lvtn+qcs8wVUsKBg13VyVqK4yuVUuMk
 kdkO2OJLJVpW0OdjKuC1rvjYhPp8pwTfdCbthBO2DSCpnvRvP5xZzCeUrvCoSeapooIqxHt
 7ao3+S7TapBBkMYvJULsao1GUIwKFbLy8HesPB1xBp3nUMaL71DeENOa+ITh0Czo0M9Saoe
 B7XJ3F/CfDsA99tDtN7zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oz9M3fPjjko=:J6YeXchjd0t0R35o1YyLcN
 Zjp7SyfzLE5OSYToXerdHQaqDmmWcg0zXHfmElyW9AwVTwDj4Mq1cA9AXYWFslwlZ70v3QzRR
 hV0QhB4iomxSdvB06qunxvKYn+s82f32VOcODwMVBr1AZJ0Xjc8plfLopdEFyhwkAlFZR3Xnx
 PpvXSb7QsR+TiYVIlznggfxQl0UhBcPbpzoieg5Wm8RlZWe6v9V2wJ2tNzDn1h8/7oarx4kOu
 a6ppO3BiU/QBGm5zvR/wuK9FHxE5oCB/T/SN233h5O7ppOGHfgMIBfHyZ80/xoa8cZTeV7MMg
 d2gKsYqQ4zZbl5re0QEwifPnXvu9CNMGA+mbsQg7l7mPJoS9U+5WiACfhl7Vh4px2/6gUJbN0
 wwpVIGj8bHlyCrRTVsvnO5t51fzVTbxnUutYWIXmo233qCSLxICagPCahAn1QBKuyhlFk27Z4
 7CMS9x9fowzGPw5Oy/wGGe51HOMrysecieFZJ4gLp9zTl13f8Dm//2wERnULeaJ5qTTlRPAkS
 r4mi/vZ05nlBJBpZPuVA6A=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no need to export those definitions, so keep them in the
source file.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 61 ++++++++++++++++++++++
 .../vc04_services/interface/vchiq_arm/vchiq_core.h | 61 ----------------------
 2 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index bc6e123..b808f91 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -17,6 +17,59 @@
 
 #define VCHIQ_SLOT_HANDLER_STACK 8192
 
+#define VCHIQ_MSG_PADDING            0  /* -                                 */
+#define VCHIQ_MSG_CONNECT            1  /* -                                 */
+#define VCHIQ_MSG_OPEN               2  /* + (srcport, -), fourcc, client_id */
+#define VCHIQ_MSG_OPENACK            3  /* + (srcport, dstport)              */
+#define VCHIQ_MSG_CLOSE              4  /* + (srcport, dstport)              */
+#define VCHIQ_MSG_DATA               5  /* + (srcport, dstport)              */
+#define VCHIQ_MSG_BULK_RX            6  /* + (srcport, dstport), data, size  */
+#define VCHIQ_MSG_BULK_TX            7  /* + (srcport, dstport), data, size  */
+#define VCHIQ_MSG_BULK_RX_DONE       8  /* + (srcport, dstport), actual      */
+#define VCHIQ_MSG_BULK_TX_DONE       9  /* + (srcport, dstport), actual      */
+#define VCHIQ_MSG_PAUSE             10  /* -                                 */
+#define VCHIQ_MSG_RESUME            11  /* -                                 */
+#define VCHIQ_MSG_REMOTE_USE        12  /* -                                 */
+#define VCHIQ_MSG_REMOTE_RELEASE    13  /* -                                 */
+#define VCHIQ_MSG_REMOTE_USE_ACTIVE 14  /* -                                 */
+
+#define VCHIQ_PORT_MAX                 (VCHIQ_MAX_SERVICES - 1)
+#define VCHIQ_PORT_FREE                0x1000
+#define VCHIQ_PORT_IS_VALID(port)      (port < VCHIQ_PORT_FREE)
+#define VCHIQ_MAKE_MSG(type, srcport, dstport) \
+	((type<<24) | (srcport<<12) | (dstport<<0))
+#define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)msgid >> 24)
+#define VCHIQ_MSG_SRCPORT(msgid) \
+	(unsigned short)(((unsigned int)msgid >> 12) & 0xfff)
+#define VCHIQ_MSG_DSTPORT(msgid) \
+	((unsigned short)msgid & 0xfff)
+
+/* Ensure the fields are wide enough */
+vchiq_static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
+	== 0);
+vchiq_static_assert(VCHIQ_MSG_TYPE(VCHIQ_MAKE_MSG(0, VCHIQ_PORT_MAX, 0)) == 0);
+vchiq_static_assert((unsigned int)VCHIQ_PORT_MAX <
+	(unsigned int)VCHIQ_PORT_FREE);
+
+#define VCHIQ_MSGID_PADDING            VCHIQ_MAKE_MSG(VCHIQ_MSG_PADDING, 0, 0)
+#define VCHIQ_MSGID_CLAIMED            0x40000000
+
+#define VCHIQ_FOURCC_INVALID           0x00000000
+#define VCHIQ_FOURCC_IS_LEGAL(fourcc)  (fourcc != VCHIQ_FOURCC_INVALID)
+
+#define VCHIQ_BULK_ACTUAL_ABORTED -1
+
+#if VCHIQ_ENABLE_STATS
+#define VCHIQ_STATS_INC(state, stat) (state->stats. stat++)
+#define VCHIQ_SERVICE_STATS_INC(service, stat) (service->stats. stat++)
+#define VCHIQ_SERVICE_STATS_ADD(service, stat, addend) \
+	(service->stats. stat += addend)
+#else
+#define VCHIQ_STATS_INC(state, stat) ((void)0)
+#define VCHIQ_SERVICE_STATS_INC(service, stat) ((void)0)
+#define VCHIQ_SERVICE_STATS_ADD(service, stat, addend) ((void)0)
+#endif
+
 #define HANDLE_STATE_SHIFT 12
 
 #define SLOT_INFO_FROM_INDEX(state, index) (state->slot_info + (index))
@@ -61,6 +114,14 @@ enum {
 	QMFLAGS_NO_MUTEX_UNLOCK = BIT(2)
 };
 
+enum {
+	VCHIQ_POLL_TERMINATE,
+	VCHIQ_POLL_REMOVE,
+	VCHIQ_POLL_TXNOTIFY,
+	VCHIQ_POLL_RXNOTIFY,
+	VCHIQ_POLL_COUNT
+};
+
 /* we require this for consistency between endpoints */
 vchiq_static_assert(sizeof(struct vchiq_header) == 8);
 vchiq_static_assert(IS_POW2(sizeof(struct vchiq_header)));
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 5264677..db93495 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -81,54 +81,12 @@ vchiq_static_assert(IS_POW2(VCHIQ_MAX_SLOTS_PER_SIDE));
 #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zero), \
 					    VCHIQ_SLOT_SIZE)
 
-#define VCHIQ_MSG_PADDING            0  /* -                                 */
-#define VCHIQ_MSG_CONNECT            1  /* -                                 */
-#define VCHIQ_MSG_OPEN               2  /* + (srcport, -), fourcc, client_id */
-#define VCHIQ_MSG_OPENACK            3  /* + (srcport, dstport)              */
-#define VCHIQ_MSG_CLOSE              4  /* + (srcport, dstport)              */
-#define VCHIQ_MSG_DATA               5  /* + (srcport, dstport)              */
-#define VCHIQ_MSG_BULK_RX            6  /* + (srcport, dstport), data, size  */
-#define VCHIQ_MSG_BULK_TX            7  /* + (srcport, dstport), data, size  */
-#define VCHIQ_MSG_BULK_RX_DONE       8  /* + (srcport, dstport), actual      */
-#define VCHIQ_MSG_BULK_TX_DONE       9  /* + (srcport, dstport), actual      */
-#define VCHIQ_MSG_PAUSE             10  /* -                                 */
-#define VCHIQ_MSG_RESUME            11  /* -                                 */
-#define VCHIQ_MSG_REMOTE_USE        12  /* -                                 */
-#define VCHIQ_MSG_REMOTE_RELEASE    13  /* -                                 */
-#define VCHIQ_MSG_REMOTE_USE_ACTIVE 14  /* -                                 */
-
-#define VCHIQ_PORT_MAX                 (VCHIQ_MAX_SERVICES - 1)
-#define VCHIQ_PORT_FREE                0x1000
-#define VCHIQ_PORT_IS_VALID(port)      (port < VCHIQ_PORT_FREE)
-#define VCHIQ_MAKE_MSG(type, srcport, dstport) \
-	((type<<24) | (srcport<<12) | (dstport<<0))
-#define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)msgid >> 24)
-#define VCHIQ_MSG_SRCPORT(msgid) \
-	(unsigned short)(((unsigned int)msgid >> 12) & 0xfff)
-#define VCHIQ_MSG_DSTPORT(msgid) \
-	((unsigned short)msgid & 0xfff)
-
 #define VCHIQ_FOURCC_AS_4CHARS(fourcc)	\
 	((fourcc) >> 24) & 0xff, \
 	((fourcc) >> 16) & 0xff, \
 	((fourcc) >>  8) & 0xff, \
 	(fourcc) & 0xff
 
-/* Ensure the fields are wide enough */
-vchiq_static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
-	== 0);
-vchiq_static_assert(VCHIQ_MSG_TYPE(VCHIQ_MAKE_MSG(0, VCHIQ_PORT_MAX, 0)) == 0);
-vchiq_static_assert((unsigned int)VCHIQ_PORT_MAX <
-	(unsigned int)VCHIQ_PORT_FREE);
-
-#define VCHIQ_MSGID_PADDING            VCHIQ_MAKE_MSG(VCHIQ_MSG_PADDING, 0, 0)
-#define VCHIQ_MSGID_CLAIMED            0x40000000
-
-#define VCHIQ_FOURCC_INVALID           0x00000000
-#define VCHIQ_FOURCC_IS_LEGAL(fourcc)  (fourcc != VCHIQ_FOURCC_INVALID)
-
-#define VCHIQ_BULK_ACTUAL_ABORTED -1
-
 typedef uint32_t BITSET_T;
 
 vchiq_static_assert((sizeof(BITSET_T) * 8) == 32);
@@ -140,17 +98,6 @@ vchiq_static_assert((sizeof(BITSET_T) * 8) == 32);
 #define BITSET_SET(bs, b)     (bs[BITSET_WORD(b)] |= BITSET_BIT(b))
 #define BITSET_CLR(bs, b)     (bs[BITSET_WORD(b)] &= ~BITSET_BIT(b))
 
-#if VCHIQ_ENABLE_STATS
-#define VCHIQ_STATS_INC(state, stat) (state->stats. stat++)
-#define VCHIQ_SERVICE_STATS_INC(service, stat) (service->stats. stat++)
-#define VCHIQ_SERVICE_STATS_ADD(service, stat, addend) \
-	(service->stats. stat += addend)
-#else
-#define VCHIQ_STATS_INC(state, stat) ((void)0)
-#define VCHIQ_SERVICE_STATS_INC(service, stat) ((void)0)
-#define VCHIQ_SERVICE_STATS_ADD(service, stat, addend) ((void)0)
-#endif
-
 enum {
 	DEBUG_ENTRIES,
 #if VCHIQ_ENABLE_DEBUG
@@ -212,14 +159,6 @@ enum {
 	VCHIQ_SRVSTATE_CLOSED
 };
 
-enum {
-	VCHIQ_POLL_TERMINATE,
-	VCHIQ_POLL_REMOVE,
-	VCHIQ_POLL_TXNOTIFY,
-	VCHIQ_POLL_RXNOTIFY,
-	VCHIQ_POLL_COUNT
-};
-
 enum vchiq_bulk_dir {
 	VCHIQ_BULK_TRANSMIT,
 	VCHIQ_BULK_RECEIVE
-- 
2.7.4

