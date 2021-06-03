Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C06D31
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:54 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQNAv-1m2DjU3HTV-00MIxd; Thu, 03 Jun 2021 17:50:49 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 07/16] staging: vchiq_core: avoid precedence issues
Date: Thu,  3 Jun 2021 17:49:56 +0200
Message-Id: <1622735405-9980-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:9BWV3kUPQfvQU+vOyjwkAdy8IAhn1nVpSSlsPmzdQ37QiYPSgqJ
 uaCHiwwaVe/8Rkrhk7FlLVYe1A6Vt7shN9wWfGegLGJSZa4TI4bpOpz7ahW1R5wHl7D/uAw
 Uemvkk9tjE6SPsRnV3b5NzYMuQ6SQl1iHkL7a+0eUE8m8k/uDNCdilEEM/EE1kLnLcHgPdi
 wgkQgXnMxq3GPuABUmg4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8kbem8DL/AA=:E1A7CcoxpeiXh7vlxYR7nD
 FBo/KQyp2gdCNikNxvR+5FLfmJfCXy3dPseWkyIv/8niAtabifY1So6u214esnHGFMcpV6iTB
 nSyyqvmq2HOEsz2l/qMpvy2+2db/y8XjkeDipVcHu+YViV15oLtauxAOpqG0fcWSz/hNdrSqX
 68m5DEd12XDXxW33+j9Mr6XVX8XErQ0N0IFQcSevt0s2dkt6f1brHHSLgdKAAEARNjgUg+o3r
 zd74G8+3owO+mi0EWoAt6AjfeSBCRIGKCfpYuDZ0rRmmJ1lsA3YF+oy5wz3lzS8j4hDkR+6/C
 a3qzCvMa0zF1wOYWdkmi5vs/oRHrkhJDAsrchwzPSXReyIbbS3WZE0wXPS9a+wJLwqrrCKVZW
 iF2zPdSskhFFnjKi4X60iiAAC32Ve2ZkMSO9HcemnCDs6fpdBAgA9pKIWKk6+Sw+cxdBodXDG
 bATz65g2GdnGMBA2xChC1L3CFkC/bLqQx5ZH6luBQPqz5T2X0hu80Kxdiz89Ga1PIB7dbFkw6
 w8FfQGWAOws7Whpek5GTSY=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add () around macro argument to avoid precedence issues

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3570132..0afac46 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -35,14 +35,14 @@
 
 #define VCHIQ_PORT_MAX                 (VCHIQ_MAX_SERVICES - 1)
 #define VCHIQ_PORT_FREE                0x1000
-#define VCHIQ_PORT_IS_VALID(port)      (port < VCHIQ_PORT_FREE)
+#define VCHIQ_PORT_IS_VALID(port)      ((port) < VCHIQ_PORT_FREE)
 #define VCHIQ_MAKE_MSG(type, srcport, dstport) \
-	((type << 24) | (srcport << 12) | (dstport << 0))
-#define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)msgid >> 24)
+	(((type) << 24) | ((srcport) << 12) | ((dstport) << 0))
+#define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> 24)
 #define VCHIQ_MSG_SRCPORT(msgid) \
-	(unsigned short)(((unsigned int)msgid >> 12) & 0xfff)
+	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)
 #define VCHIQ_MSG_DSTPORT(msgid) \
-	((unsigned short)msgid & 0xfff)
+	((unsigned short)(msgid) & 0xfff)
 
 /* Ensure the fields are wide enough */
 static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
@@ -55,7 +55,7 @@ static_assert((unsigned int)VCHIQ_PORT_MAX <
 #define VCHIQ_MSGID_CLAIMED            0x40000000
 
 #define VCHIQ_FOURCC_INVALID           0x00000000
-#define VCHIQ_FOURCC_IS_LEGAL(fourcc)  (fourcc != VCHIQ_FOURCC_INVALID)
+#define VCHIQ_FOURCC_IS_LEGAL(fourcc)  ((fourcc) != VCHIQ_FOURCC_INVALID)
 
 #define VCHIQ_BULK_ACTUAL_ABORTED -1
 
@@ -84,7 +84,7 @@ static_assert((unsigned int)VCHIQ_PORT_MAX <
 #define SLOT_QUEUE_INDEX_FROM_POS_MASKED(pos) \
 	(SLOT_QUEUE_INDEX_FROM_POS(pos) & VCHIQ_SLOT_QUEUE_MASK)
 
-#define BULK_INDEX(x) (x & (VCHIQ_NUM_SERVICE_BULKS - 1))
+#define BULK_INDEX(x) ((x) & (VCHIQ_NUM_SERVICE_BULKS - 1))
 
 #define SRVTRACE_LEVEL(srv) \
 	(((srv) && (srv)->trace) ? VCHIQ_LOG_TRACE : vchiq_core_msg_log_level)
-- 
2.7.4

