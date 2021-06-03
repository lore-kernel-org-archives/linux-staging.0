Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA36D33
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:54 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mnq8Y-1l0aMi1e4g-00pPTG; Thu, 03 Jun 2021 17:50:50 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 10/16] staging: vchiq_core: simplify WARN_ON conditions
Date: Thu,  3 Jun 2021 17:49:59 +0200
Message-Id: <1622735405-9980-11-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:8t24r/MeIqSOPTrUPq9ZJcsFxBLcROcb27t3mnJ4iulI4u4SDg8
 V1Ez+2GssnYTxOBljQ5jLCaT26bG1kG6oyNd44ncXAPjbxs0A5183OFPZz8HHnIxnsVTeK0
 SsHWN6ZRefC1D5pSG29sMAbRNyLpcQZ9UO/bv5Evfe3ciYHsUQMPTnW08r1h3Tcf4KxNCvp
 RlySmY85SsclQecOBFtYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h3Cdtk5rS+U=:3CVX8DBHNJft87w6Gchres
 4+wKy13I3ceVHdYX/mHkPO6rc2U10dQH8ivkwvZBxszFzlMK043LVc7fp8Z/Uk6Se9YgoerWT
 Kx9ZAKMNsgoSnzKAAiuhxF33dNCPRzJ/0W0piMk/lpumdUFftdL4EhwVZ5F2yWs3K0dg5mXXC
 1fmNFRVxzmOmr+C+Sfb1DzZ/B6k9GqDbmRtlU0SKyWzFRXAjcjveKuU/uuT9PortlxgXkriK1
 eTphiKr1Xzm3tUkHREBbpcvz6rPpHyScR546NqpMjvyFUumaLBuvbmmbFI/J+h2XZUiv1lsoT
 AbR/Mata9vVJVjT9kyQtN//azMSeFvSTWnPYM5kkwIp4p8JWFMQEcCkLIALQ9oAOjvUjCgube
 vht32IhmmeU0j1Ln6iv0dHasj3MG/dqTRuI52UBxC1Gl446XtSZCNVTJFK9snqSEUNUImu9Ej
 zaGQHgWz+MkjQjFV2841tfPMbXdELVyHSiEickVtOEp6h4jEcZM+teGD3aKEjf8nFg4uxR6DT
 Rr/t4MOdZdCgJFINVn0pDE=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

During a recent review Dan Carpenter noticed a double negation in a WARN_ON.
But a quick search revealed more unnecessary complex WARN_ON conditions.
This change should simplify them.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 99624ca..2e1b218 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -924,7 +924,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 
 	stride = calc_stride(size);
 
-	WARN_ON(!(stride <= VCHIQ_SLOT_SIZE));
+	WARN_ON(stride > VCHIQ_SLOT_SIZE);
 
 	if (!(flags & QMFLAGS_NO_MUTEX_LOCK) &&
 	    mutex_lock_killable(&state->slot_mutex))
@@ -1480,8 +1480,8 @@ abort_outstanding_bulks(struct vchiq_service *service,
 		service->state->id, service->localport, is_tx ? 't' : 'r',
 		queue->local_insert, queue->remote_insert, queue->process);
 
-	WARN_ON(!((int)(queue->local_insert - queue->process) >= 0));
-	WARN_ON(!((int)(queue->remote_insert - queue->process) >= 0));
+	WARN_ON((int)(queue->local_insert - queue->process) < 0);
+	WARN_ON((int)(queue->remote_insert - queue->process) < 0);
 
 	while ((queue->process != queue->local_insert) ||
 		(queue->process != queue->remote_insert)) {
@@ -1729,7 +1729,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 
 	switch (type) {
 	case VCHIQ_MSG_OPEN:
-		WARN_ON(!(VCHIQ_MSG_DSTPORT(msgid) == 0));
+		WARN_ON(VCHIQ_MSG_DSTPORT(msgid));
 		if (!parse_open(state, header))
 			goto bail_not_ready;
 		break;
@@ -1756,7 +1756,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_CLOSE:
-		WARN_ON(size != 0); /* There should be no data */
+		WARN_ON(size); /* There should be no data */
 
 		vchiq_log_info(vchiq_core_log_level,
 			"%d: prs CLOSE@%pK (%d->%d)",
@@ -1958,7 +1958,7 @@ parse_rx_slots(struct vchiq_state *state)
 		if (!state->rx_data) {
 			int rx_index;
 
-			WARN_ON(!((state->rx_pos & VCHIQ_SLOT_MASK) == 0));
+			WARN_ON(state->rx_pos & VCHIQ_SLOT_MASK);
 			rx_index = remote->slot_queue[
 				SLOT_QUEUE_INDEX_FROM_POS_MASKED(state->rx_pos)];
 			state->rx_data = (char *)SLOT_DATA_FROM_INDEX(state,
-- 
2.7.4

