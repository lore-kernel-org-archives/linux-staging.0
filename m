Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC2072
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:23 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MStOy-1lujf70spy-00UKHY; Sat, 15 May 2021 21:11:19 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 02/20] staging: vchiq_core: drop unnecessary release_count
Date: Sat, 15 May 2021 21:10:41 +0200
Message-Id: <1621105859-30215-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:ESOnJlI90oujaEqN52mI1qXiWJ3aO3XnzurC4nBmmMGPKoNcyE8
 XqSEtC+5h96ZytCJDxDTWPkGeLXbAzf2IS8hIbh6UjJyJfQeSGUIWJCSxS5bFeR5cqtt3mP
 ceRtfvtrSjSxRWYeWKj2zQXpzENd1fISacFAzu1Zl2t4FWvtZ2xBvNe2FgPEc3/ogQUoJYs
 gmosCIpeilccdsyLy8n3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6UiBB0MBrs=:Hnal5VbZJ8opYtoEcLSon7
 ytGTRfBx59y5DfRrvkZRfUHiFafxftM6tVkLM/CV8rxeHAXS7F8jJgpJd6JCOFuL+UgoFDzQs
 eA2Jx0wTlGtA3tVcfmR0bI2ow7qf5r49ga5dQa+nHttsZAqhzXUq619bSEIRQXoN7EvLtdi15
 mQAUSTu1W1knK6APVdqSQb68aoxrAubXMvOCNEljCPYepLKtcx4d0DszRLb8qVdbbJlzuzkIy
 0dmWqEvSmblPhZwboeiSqSkbtdiZAnEpbmmfEpttc/IBeQuHFZo+WU2h/MiUi4KrtJUxUZJec
 QXxkvA6eim6yhlpLucG2PiepMMPv23gFLCmq713qRJCWOsk4MfhiAFSSu9gqdtqOzl91MFMSY
 CIgRWdvSW3bdwdDpMz7U7OEjeFMsaqd8f+8FZewtJBKI1rS/HYF+LVlhLi0pbDdQDQayslthL
 bncMA5FjbeuBcV9t5MN6cpeOIM+s4ZYQShG/3R5S22Qsm7IrfwwT7ZuMHRA9XIFnYmo1xkytt
 IlyuULS7S3Aq7QSHe5Me04=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no benefit of the variable release_count, so drop it.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9b6c626..85fd0a6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1175,7 +1175,6 @@ static void
 release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 	     struct vchiq_header *header, struct vchiq_service *service)
 {
-	int release_count;
 
 	mutex_lock(&state->recycle_mutex);
 
@@ -1192,10 +1191,9 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 		header->msgid = msgid & ~VCHIQ_MSGID_CLAIMED;
 	}
 
-	release_count = slot_info->release_count;
-	slot_info->release_count = ++release_count;
+	slot_info->release_count++;
 
-	if (release_count == slot_info->use_count) {
+	if (slot_info->release_count == slot_info->use_count) {
 		int slot_queue_recycle;
 		/* Add to the freed queue */
 
-- 
2.7.4

