Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0476D2F
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:54 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N9Md2-1lKsdp2Shg-015IQm; Thu, 03 Jun 2021 17:50:49 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 06/16] staging: vchiq_core: put spaces around operators
Date: Thu,  3 Jun 2021 17:49:55 +0200
Message-Id: <1622735405-9980-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:/b/AEq2+1KcBZztD9hzaa4nr67pZJydV/JpsfZ0Dn15WhWeqRlW
 63LpPbtENG93jTD8w6qwnTnFAS7IkppWVb2JDarDJ1xIKZUUryQ+9RnYw6pOPfei1jZ8w1v
 N1cr/863B1gwsj6oqTsgxh7QA3VO1XLVt8Grd+CUeOVZ3T2FZaXwImVbxW0DbqSq2YWLSHk
 CAw8TU4sDykSHFevnTDRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sbQ6dvcMluM=:+kTrJF1NfugV3JDdR+JLM5
 NZOyFNqKdN7TEOVNNx36bYl0YGWQ5oG6E4aG+gdzleZFc7AqlhiPS4M4vrsVDyA+1eXBdE9ys
 xz+pE+3qHSWi2CUC8cxaTIY76Ratjf19XZsM6tyQNzCUqpUt/YZVoV2/wx1mmmmWZV5KKa4Dy
 hs5NPYXUg8C4X4MYrH34o3BL6ZND2w50QwkdxFLFtO/kgVdG2etj1hf8gUj1wmsV8QSQdWOgL
 gMg/JAEW2Za45YKXofgKHdE+JDRysjHwtYCqHx57DuV5yP+4alROLsoVgnb+2Xvu0JXb/Iewq
 q1OVckT4hnenlhmjRGI163O78KxBGovN3H6T5c+E7hnIL5VcyT8rHcg5rff5+AO4kmeGEIJNK
 5ZFdGVKbutbg3xh1RELauFDnPkjXHrkJKECqX0Ej9rWNnQaQeyH71oPirQMPTnqxTb3VbcAmk
 hsUW420hGhH7PVq8iF522BBpTd6TOEcuUtyUCIcR2d+aXJ5Pmswyw8UA4PoEkD8i1mYFxRZAf
 QXUIiwU4WOiBpr93daAvHA=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fixes the checkpatch issues regarding missing spaces around operators.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 7fe0583..3570132 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -37,7 +37,7 @@
 #define VCHIQ_PORT_FREE                0x1000
 #define VCHIQ_PORT_IS_VALID(port)      (port < VCHIQ_PORT_FREE)
 #define VCHIQ_MAKE_MSG(type, srcport, dstport) \
-	((type<<24) | (srcport<<12) | (dstport<<0))
+	((type << 24) | (srcport << 12) | (dstport << 0))
 #define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)msgid >> 24)
 #define VCHIQ_MSG_SRCPORT(msgid) \
 	(unsigned short)(((unsigned int)msgid >> 12) & 0xfff)
@@ -2210,7 +2210,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
 		(int)((VCHIQ_SLOT_SIZE - (long)mem_base) & VCHIQ_SLOT_MASK);
 	struct vchiq_slot_zero *slot_zero =
 		(struct vchiq_slot_zero *)(mem_base + mem_align);
-	int num_slots = (mem_size - mem_align)/VCHIQ_SLOT_SIZE;
+	int num_slots = (mem_size - mem_align) / VCHIQ_SLOT_SIZE;
 	int first_data_slot = VCHIQ_SLOT_ZERO_SLOTS;
 
 	check_sizes();
@@ -2237,9 +2237,9 @@ vchiq_init_slots(void *mem_base, int mem_size)
 
 	slot_zero->master.slot_sync = first_data_slot;
 	slot_zero->master.slot_first = first_data_slot + 1;
-	slot_zero->master.slot_last = first_data_slot + (num_slots/2) - 1;
-	slot_zero->slave.slot_sync = first_data_slot + (num_slots/2);
-	slot_zero->slave.slot_first = first_data_slot + (num_slots/2) + 1;
+	slot_zero->master.slot_last = first_data_slot + (num_slots / 2) - 1;
+	slot_zero->slave.slot_sync = first_data_slot + (num_slots / 2);
+	slot_zero->slave.slot_first = first_data_slot + (num_slots / 2) + 1;
 	slot_zero->slave.slot_last = first_data_slot + num_slots - 1;
 
 	return slot_zero;
@@ -2309,7 +2309,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 		complete(&state->slot_available_event);
 	}
 
-	state->default_slot_quota = state->slot_queue_available/2;
+	state->default_slot_quota = state->slot_queue_available / 2;
 	state->default_message_quota =
 		min((unsigned short)(state->default_slot_quota * 256),
 		(unsigned short)~0);
-- 
2.7.4

