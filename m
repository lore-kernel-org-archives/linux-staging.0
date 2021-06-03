Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229276D2E
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MeToK-1lGbKX0jWG-00aW20; Thu, 03 Jun 2021 17:50:49 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 04/16] staging: vchiq_core: get the rid of IS_POW2
Date: Thu,  3 Jun 2021 17:49:53 +0200
Message-Id: <1622735405-9980-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:GBsoOjyhGzyvHUQGhEIxTrDc4pVe6FUUh/Sv2UGWeFkPd3nfviQ
 P/bUADCt/uXHQ9CyVejR9b+Gu53lvzX1nTZKom+NyShYJsANprN6ILmd9wpYjrAUopDYulo
 OEMgI1OOefLhbh6VYpiXSUqZPzxEFc5Ko+3igzcsO8jZkEMKzDEHgxCThDnliyX/TPS/Fll
 yHP46DBNgaPgSThGSDTCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5TI7n0Pi28E=:Rn2fImoFVEjvjJlsJkdlBY
 Z4rJ2GC1NKaQcS32Vgj34XiIUZjNDUjg7AWHc9JTLPe+RifhSzOs/XcwgzyXKEGUgmd6AmkRj
 8xFrozFtRY7fMT1WfmZWu2A/tjKic2H18DwgktYIys+pkSjTL0T6E/IL595jrLGQpgCsOyFAF
 NNfa2fGdxin3dzhbhiHvh6GYolYdvljCFTnRh0tfPDPeiN64vwfSBjC1+wcB2LqVxAnwWqwVe
 W356TQ3P/2XdAAOtO5ZzsWf88zV2UOeEwbUgD1PvMdvsPTuZ8d41te7gcUXd4KbNUUP+Mr4pT
 WVe7OEE//QOL7fJ21ZX4XTvkQsIwgUZTrR4+8G+BSIp4tinR5OdBpjQT+BJOT2NbkX6yMU78q
 HlVuhAyjdqBuwV2GNM7w+lfdGfaT16114Z/3eWAFkK6CWZOBWcqLJFeFyOZ6FwI11Q7gUkwNL
 e0g24ewPu5E384e4Mi1lk5xB0Ahmz0FVc88FknZuJdiAQ/bSe7Fvs78imBTCMIIhMzNxz9eyM
 D8hGDRbFYjcfUEWqPAcKyY=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The macro IS_POW2 is only used to ensure some size are powers of 2.
Better use BUILD_BUG_ON_NOT_POWER_OF_2 for this. Since this must be done
in a function, merge all these checks in a new function.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c      | 17 +++++++++++++----
 .../vc04_services/interface/vchiq_arm/vchiq_core.h      |  7 -------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index b808f91..32016ea 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -124,12 +124,19 @@ enum {
 
 /* we require this for consistency between endpoints */
 vchiq_static_assert(sizeof(struct vchiq_header) == 8);
-vchiq_static_assert(IS_POW2(sizeof(struct vchiq_header)));
-vchiq_static_assert(IS_POW2(VCHIQ_NUM_CURRENT_BULKS));
-vchiq_static_assert(IS_POW2(VCHIQ_NUM_SERVICE_BULKS));
-vchiq_static_assert(IS_POW2(VCHIQ_MAX_SERVICES));
 vchiq_static_assert(VCHIQ_VERSION >= VCHIQ_VERSION_MIN);
 
+static inline void check_sizes(void)
+{
+	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_SLOT_SIZE);
+	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_MAX_SLOTS);
+	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_MAX_SLOTS_PER_SIDE);
+	BUILD_BUG_ON_NOT_POWER_OF_2(sizeof(struct vchiq_header));
+	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_NUM_CURRENT_BULKS);
+	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_NUM_SERVICE_BULKS);
+	BUILD_BUG_ON_NOT_POWER_OF_2(VCHIQ_MAX_SERVICES);
+}
+
 /* Run time control of log level, based on KERN_XXX level. */
 int vchiq_core_log_level = VCHIQ_LOG_DEFAULT;
 int vchiq_core_msg_log_level = VCHIQ_LOG_DEFAULT;
@@ -2206,6 +2213,8 @@ vchiq_init_slots(void *mem_base, int mem_size)
 	int num_slots = (mem_size - mem_align)/VCHIQ_SLOT_SIZE;
 	int first_data_slot = VCHIQ_SLOT_ZERO_SLOTS;
 
+	check_sizes();
+
 	/* Ensure there is enough memory to run an absolutely minimum system */
 	num_slots -= first_data_slot;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index db93495..df51418 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -69,13 +69,6 @@
 	extern int vchiq_static_assert[(cond) ? 1 : -1]
 #endif
 
-#define IS_POW2(x) (x && ((x & (x - 1)) == 0))
-
-/* Ensure that the slot size and maximum number of slots are powers of 2 */
-vchiq_static_assert(IS_POW2(VCHIQ_SLOT_SIZE));
-vchiq_static_assert(IS_POW2(VCHIQ_MAX_SLOTS));
-vchiq_static_assert(IS_POW2(VCHIQ_MAX_SLOTS_PER_SIDE));
-
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
 #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
 #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zero), \
-- 
2.7.4

