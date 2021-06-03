Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060276D2C
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjjOl-1l5HKk1ZH9-00lGbr; Thu, 03 Jun 2021 17:50:49 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 05/16] staging: vchiq_core: get the rid of vchiq_static_assert
Date: Thu,  3 Jun 2021 17:49:54 +0200
Message-Id: <1622735405-9980-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:m8b9zUFa0JLR7b43lIUQNmnLrwodUSpS/CCNQ7quPyLQCNqnv16
 IW73NdxStyeu9EEnQsxPwXzJ0lfBeDTbqG8L8gE2ekS6brkgggZLFSUqXEAG3AmTsEJprBw
 szWatd+3ty/BHj1yuuFA2HaqZ4xAXiRLS0JPbCWNLIL20tw+MgwvVUDF1y06DHA+F7W5E7l
 b5DhlFFGOtahxTyChU8Sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VvGU+IrSNvw=:iwUeq4ln5J2bCxHT/n8ATv
 nsDoTnm9B4R/ZP32uOOjNzxkcYzFrqx8y+QG9s0p2y/B7Rq4CdGBZaeGdKa0D2hBBuLDemJeY
 lSDyzU0Hy/G5sRWon1bjT8xovwTbDXwQ4l1th/B2QV9bsiKqrEJYts3ZRsE5HhU0oRTt984A/
 g0Tjx2YOS/IrT1wXVsT0qfLlgRDep0h3XRE1Iu1NQVQ9AmPv/TH1V3ILDL258BCYfBJH9eqoH
 9aHg8ERGwzDxJNBoD5poOPPtosFZyKy2jm4D44VNZS9uZPOjFFBO9zIv2GxCiejxPUXt9LfZ0
 J0KeWyUWbLSl1z6FkGJ16bSN+sxZ/oT3m5HgGthFV2hprOmjxO7FrLp/0Mf9tGmkhSCdaxx6f
 cfyztOTU2VeUm+ejX6AfpjUALknnNldpSmhLU0HrzaCs3QvWahwJ9pkEkP3iAPeuBfPsTittO
 p3SEkP7gQLz63a9vaGeNd2zCWJOSYDeVhiIijzwOYTWvhrm7dbp0dtuMdI4OjoRf9E8Q0jAQ+
 bVUpDROTmRsM5Sz+Ck8s5I=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Use static_assert from the kernel instead of opencode it.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  |  2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 10 +++++-----
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h |  7 +------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 12a294c..32278b4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -139,7 +139,7 @@ static const char *const ioctl_names[] = {
 	"CLOSE_DELIVERED"
 };
 
-vchiq_static_assert(ARRAY_SIZE(ioctl_names) == (VCHIQ_IOC_MAX + 1));
+static_assert(ARRAY_SIZE(ioctl_names) == (VCHIQ_IOC_MAX + 1));
 
 static enum vchiq_status
 vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 32016ea..7fe0583 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -45,10 +45,10 @@
 	((unsigned short)msgid & 0xfff)
 
 /* Ensure the fields are wide enough */
-vchiq_static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
+static_assert(VCHIQ_MSG_SRCPORT(VCHIQ_MAKE_MSG(0, 0, VCHIQ_PORT_MAX))
 	== 0);
-vchiq_static_assert(VCHIQ_MSG_TYPE(VCHIQ_MAKE_MSG(0, VCHIQ_PORT_MAX, 0)) == 0);
-vchiq_static_assert((unsigned int)VCHIQ_PORT_MAX <
+static_assert(VCHIQ_MSG_TYPE(VCHIQ_MAKE_MSG(0, VCHIQ_PORT_MAX, 0)) == 0);
+static_assert((unsigned int)VCHIQ_PORT_MAX <
 	(unsigned int)VCHIQ_PORT_FREE);
 
 #define VCHIQ_MSGID_PADDING            VCHIQ_MAKE_MSG(VCHIQ_MSG_PADDING, 0, 0)
@@ -123,8 +123,8 @@ enum {
 };
 
 /* we require this for consistency between endpoints */
-vchiq_static_assert(sizeof(struct vchiq_header) == 8);
-vchiq_static_assert(VCHIQ_VERSION >= VCHIQ_VERSION_MIN);
+static_assert(sizeof(struct vchiq_header) == 8);
+static_assert(VCHIQ_VERSION >= VCHIQ_VERSION_MIN);
 
 static inline void check_sizes(void)
 {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index df51418..8d8e104 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -64,11 +64,6 @@
 #define vchiq_loud_error(...) \
 	vchiq_log_error(vchiq_core_log_level, "===== " __VA_ARGS__)
 
-#ifndef vchiq_static_assert
-#define vchiq_static_assert(cond) __attribute__((unused)) \
-	extern int vchiq_static_assert[(cond) ? 1 : -1]
-#endif
-
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
 #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
 #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zero), \
@@ -82,7 +77,7 @@
 
 typedef uint32_t BITSET_T;
 
-vchiq_static_assert((sizeof(BITSET_T) * 8) == 32);
+static_assert((sizeof(BITSET_T) * 8) == 32);
 
 #define BITSET_SIZE(b)        ((b + 31) >> 5)
 #define BITSET_WORD(b)        (b >> 5)
-- 
2.7.4

