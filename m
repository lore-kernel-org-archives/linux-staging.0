Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FAB2CB5
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLiTI-1muCBs1sMS-00HfcK; Sun, 23 Jan 2022 21:02:56 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 14/18] staging: vchiq_core: use min_t macro
Date: Sun, 23 Jan 2022 21:02:19 +0100
Message-Id: <1642968143-19281-15-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:ubAyrZLvjewc5SDevuk55AkCn1zK0Jxvfq+EtSFhHqv03Exxa6p
 t30TZJedkrWHY/l3amFnsLiqhHn56LaB9R0wCti+hMhdhW0+OD+1ZB3ZtHEr9fa7W4Qgjll
 lP4hf7Q9uqldFIMXAi85eZaWnI6POjPoeLZQtYXh8EeAQqIW6f7WAtFRzdr7n4wlYQgb+i+
 sfLMDhMvIUZFN4xBwLoeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Dvv67vKPM0=:8PpyclsXub2h6viiXJf4p8
 cm229TuMZCqW7GpSa5MlAKxtVyABh7C1skylRH0HK7ADj/szCEjPsB6lqgpwD6030Pj6rT6aG
 9t41RqQ49GqL1Wbh8HLsCts5yMr/efqvdjZ9wM4HOtdn6kv++6LWS93LRPYcmyQomibAB+Yrg
 NFUNBnVzUeG5puRTjyAzJddugUDlRpmuun+x6GoRCcy08A76SLeonmm/nRaz/BrCFsr3ZXHMI
 ZRwqGnxVZtN2+4vBnogsVLZeoOM2dFu8lSUXq6q6EZPFLxdbAxfxA3Ns9+LMJ5E/r8SENvYJv
 HJ2ctfPGA/NofYmboH7Yx1MJYnr2o4+vDDNJfrElx5dhLIFbRVVQhU982LE8RVMHJ6Jx/S+Do
 POwKG+wxLLHxu0Rbyouv11KChvlpNVelc7S5D5f1MEQ6BW54lWyq7yi2WjDWiIl3+JkbiOPpy
 m+czobhfcsF28Dzt/nuYBvZee9w3WcVFyhzldixpD9RvuxPkbfl8cdFUanmFEjNi1Dd+Y4KfM
 rVAGfPlt807C/RmBcm4jnCPemiGzpJEt7Ceb7xpU7bsEmMvdKWSQDngggeo0qZmYN1pEgwvOk
 qcUTGBYNb5WZVmnG8imky57celxr0gygv+9NlD3OSfd657QHWs+4n6SgK+PMZ6uylvLT+P8I2
 PctEexhtuAJBTYcQnDlBnbe+3qJYjbwwMvAfEgYrEjVGOxGUQUrdDft1wjglaKUjheYTltldA
 ttPwe+IvW4But8hI
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Don't try to open code min_t().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 6127244..b32cd12 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1035,8 +1035,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 				     VCHIQ_LOG_INFO))
 			vchiq_log_dump_mem("Sent", 0,
 					   header->data,
-					   min((size_t)16,
-					       (size_t)callback_result));
+					   min_t(size_t, 16, callback_result));
 
 		spin_lock(&quota_spinlock);
 		quota->message_use_count++;
@@ -1184,8 +1183,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 				     VCHIQ_LOG_INFO))
 			vchiq_log_dump_mem("Sent", 0,
 					   header->data,
-					   min((size_t)16,
-					       (size_t)callback_result));
+					   min_t(size_t, 16, callback_result));
 
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
@@ -2209,8 +2207,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 
 	state->default_slot_quota = state->slot_queue_available / 2;
 	state->default_message_quota =
-		min((unsigned short)(state->default_slot_quota * 256),
-		    (unsigned short)~0);
+		min_t(unsigned short, state->default_slot_quota * 256, ~0);
 
 	state->previous_data_index = -1;
 	state->data_use_count = 0;
-- 
2.7.4

