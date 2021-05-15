Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179332FB4
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:36 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvrVJ-1lSWZr1WUB-00sxeT; Sat, 15 May 2021 21:11:20 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 08/20] staging: vchiq_arm: Use define for doorbell irq
Date: Sat, 15 May 2021 21:10:47 +0200
Message-Id: <1621105859-30215-9-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:c2S1blVVoooCSBj+LEXcXBNy8yAV55rHFmZX4bAlNF84wqZju2G
 JTSOqOl/2VCn7j/F46Y+LB9qLqwZpX114U0buPNW4RzqB79BSlsxRtuhaNPEgUprlitj9F5
 t9PzFktof1dYCR2PVutD7pYdqLC1V/Ui+SNawxAJa6W5T6C7CtecdJMbCBk6btBo03WT7I4
 oOd2To1C7qyym7cjYe1Xg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OILm/+vaAig=:RozXvcjx5Ng49gIdz7mEEH
 tnHzvkOnTSy0D95BVMoUS+jktwZbUeOa7bnnbZMwxA7tfykArWmahV7lBqVTEQLhsxIr3NLk0
 GTH+Yhrrql+a6B5SlabBodxG8AEZGP77oZq2c3UeES3V8vht7Qv+v8+YGNCGd3YD+qItMrbIG
 lQRkVn6IoraunCo/2Y5IVC+jjPkAf8epj2lHm2dbOhbTZdmjU+R63fUscf0FuC6x2bU09DPqu
 twQgyT+DTvoAp7iqkG+hatLXCMWFzksyB6UNrxXHFwslZ695Yjac2umEM7MaYCbrCklnrt136
 NYG3thedZ9oiV1xp9Afs+K2L696BYTHl+EsaLMMGsSlXly0sBcPQK0WU2JaK33l2hsOe3NN2G
 AKOHFvaZYyXiweeEsz6xeeWXuRmka9OdSgnLFg50OfoC23w1MkH3hAyNlnDqbMMaXvDizn9TK
 HQM6ai8oMrJl53fHfTLpbdb/oEIjLvjIEj0sESfpEWb3RQZTK560ddILBhdyo61gKZHhHzmi3
 cugcev1yi5BG94zI3Br/rM=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The interrupt handler uses a magic number to check that the doorbell
was rung. Better replace this number with official Broadcom define.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index c3fbb29..30d6f1a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -29,6 +29,8 @@
 #define BELL0	0x00
 #define BELL2	0x08
 
+#define ARM_DS_ACTIVE	BIT(2)
+
 struct vchiq_2835_state {
 	int inited;
 	struct vchiq_arm_state arm_state;
@@ -269,7 +271,7 @@ vchiq_doorbell_irq(int irq, void *dev_id)
 	/* Read (and clear) the doorbell */
 	status = readl(g_regs + BELL0);
 
-	if (status & 0x4) {  /* Was the doorbell rung? */
+	if (status & ARM_DS_ACTIVE) {  /* Was the doorbell rung? */
 		remote_event_pollall(state);
 		ret = IRQ_HANDLED;
 	}
-- 
2.7.4

