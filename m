Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983612FB7
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:37 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mz9IT-1lVoMG1iD5-00wHZl; Sat, 15 May 2021 21:11:19 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 03/20] staging: vchiq_core: separate postfix increment
Date: Sat, 15 May 2021 21:10:42 +0200
Message-Id: <1621105859-30215-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:tYUMngbePSrI8TFOaUn5BreXfQBG6BUbM4rX9sgWvrAddSnVHAH
 M4IrBVEFq3sloJx5I2w4A3tZjPMXydQ6P22opcR4PmQyXCX9fTdjAkwIg0HJhSIKLvub3FT
 Bo1Pe85hIs+B1/sZXASLPVntX6XaQuPGHY6Rg3N1obRk6wXMW+YUfX/5sqHprxBIHLNdPlS
 TFkb8XBMzfuj+bMX9xxuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PK7QTy6aJWY=:u726w3IgiKQXxiXrvpmPE2
 FlMZskE6etJ+4TcHpPxfBqfyAgYbF6qNUwPdOmnYOgJRLhgoNjMkdU+n2JS3ozdBp/gd26any
 7jpyIaBhH3xEImTE6yjTPEKcaZIejNtS5aNof/dkzUI69qzs1cBpRW1Ot01h58JtES55M1jYt
 fNZ8L1YmXLOSkNHy1WnlpIv345oEh2mp+/oOgCR5URG5QwAGORurehZh3GyvEbF6MbjWWTz9C
 cP1g4sQw+TqfONhRe3hAEpaszHp5LspzoZ1ZtiZUFhve2Om92arCUZG5r0iY1z0+jul2xj4kB
 2DxJrPhoDdyhdidZfogpAbWKB3ofry6vR4NYKdgdl0fz5JJK3Zzy25giTtASjnA12WrhkyHz8
 9EJ+1EZrIA6w9ccDwjoDVh5ALjx4wEzLj/Nxm1o/hWMweCnlbiTIl9MsDLlYgLY5yUpBvfi7X
 nPMv47JK4ev+DJL7fZ7iZn1YDDeMJ70EbL7v/+9AFc8wt9vSUES1ZsBtX7ln5XhYuJwYRZYbc
 rsCz6TtDxgFt/1ZOCOaOSc=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Postfix increment within a complexer statement doesn't improve readability.
So separate them.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c       | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 85fd0a6..a22d8b7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -243,7 +243,8 @@ __next_service_by_instance(struct vchiq_state *state,
 	while (idx < state->unused_service) {
 		struct vchiq_service *srv;
 
-		srv = rcu_dereference(state->services[idx++]);
+		srv = rcu_dereference(state->services[idx]);
+		idx++;
 		if (srv && srv->srvstate != VCHIQ_SRVSTATE_FREE &&
 		    srv->instance == instance) {
 			service = srv;
@@ -649,11 +650,12 @@ process_free_queue(struct vchiq_state *state, BITSET_T *service_found,
 
 	while (slot_queue_available != local->slot_queue_recycle) {
 		unsigned int pos;
-		int slot_index = local->slot_queue[slot_queue_available++ &
+		int slot_index = local->slot_queue[slot_queue_available &
 			VCHIQ_SLOT_QUEUE_MASK];
 		char *data = (char *)SLOT_DATA_FROM_INDEX(state, slot_index);
 		int data_found = 0;
 
+		slot_queue_available++;
 		/*
 		 * Beware of the address dependency - data is calculated
 		 * using an index written by the other side.
@@ -1175,7 +1177,6 @@ static void
 release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 	     struct vchiq_header *header, struct vchiq_service *service)
 {
-
 	mutex_lock(&state->recycle_mutex);
 
 	if (header) {
@@ -2215,7 +2216,8 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 	}
 
 	for (i = local->slot_first; i <= local->slot_last; i++) {
-		local->slot_queue[state->slot_queue_available++] = i;
+		local->slot_queue[state->slot_queue_available] = i;
+		state->slot_queue_available++;
 		complete(&state->slot_available_event);
 	}
 
@@ -2319,7 +2321,8 @@ void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header)
 			flush_signals(current);
 	}
 
-	pos = service->msg_queue_write++ & (VCHIQ_MAX_SLOTS - 1);
+	pos = service->msg_queue_write & (VCHIQ_MAX_SLOTS - 1);
+	service->msg_queue_write++;
 	service->msg_queue[pos] = header;
 
 	complete(&service->msg_queue_push);
@@ -2340,7 +2343,8 @@ struct vchiq_header *vchiq_msg_hold(unsigned int handle)
 			flush_signals(current);
 	}
 
-	pos = service->msg_queue_read++ & (VCHIQ_MAX_SLOTS - 1);
+	pos = service->msg_queue_read & (VCHIQ_MAX_SLOTS - 1);
+	service->msg_queue_read++;
 	header = service->msg_queue[pos];
 
 	complete(&service->msg_queue_pop);
-- 
2.7.4

