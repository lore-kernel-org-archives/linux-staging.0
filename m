Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917B3FE6
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 12:33:21 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsqMq-1mmLjg47qq-00tFK9; Sun, 03 Oct 2021 14:33:17 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 2/3] staging: vchiq_arm: drop unnecessary declarations
Date: Sun,  3 Oct 2021 14:32:48 +0200
Message-Id: <1633264369-998-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
References: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:EKeX7yZsRaCLW9q6rjJEZmn6SGJsCn3BWElMB5PtzlcLIkczheC
 gzsGvuZn5tjfIAgjhVRJBCfYX1p74usr3kcZI/FvLAl/BUHQpyi/pNsErUbLlFEeR6j3R9L
 1KC+faxDzYGq8dWK/393ByVTyQafmpuoOKt5+94kbQIEm8+h30sIKRT0GC2JelwR7hOyoj9
 I6BhxZ02FVsKgwgZzjPmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LoiznvltjgM=:rNeV1AewqgG/1jB00zSJv9
 AbkQHFIqWoptig+g+/M8/3dxwwVb4leZcAc3JmYmPSJk2t7eHwozfMZPpBuWlS/NRW5n6CPOk
 90OMMu89qN6IO3ljtezai3T76Cv4vVAKwBI+BtFEVJGKrW3hKMqZFHvCbTAajHnS1E0/gffAi
 P1s7PH80OpK4ugN9KoECOtI3GKLKOB0vFxOAjnE8lsVYShFDyau2TvRRVto/CyPw+KXRN4wEK
 TMlh0l7VRq7o5M/ma/kcQNy5WOd6OVSGXZF7Jn6AWxHXcw0V14/IPh3MH5Sl8BZdjE63kdekQ
 sDRWLH1JEI7v253J//jaib4Yhaiq50Ef12Y/f7akQnWawjpwJ2VV7zf4oGvP8PD5z9204nIu5
 IT3OM9jMY9X8xhHmFGMJPn7SuvZLOAGmLRUdxVNnb35H96HxUyUHdSiLjoeeuDmwEy6AmdIT1
 t9Dwby/tonunepTkBZKGyDQVRe9XVC28IOl52wARNji9uLB0QLdFcXWfpACGhBqhG59YCEjQ9
 0/gOy9rWhNg1YOp2y7tM/oK5zYa2vDoksJ+0sgaPepFZyn9L/qkAbu7eeCR8FGYNQP0w8AZNY
 o0E8d00cJKBfHslWRJVNOD0tMVOgBkcqj5JcBNRYsS+AM1DD6hdbhMbyPuYzKJYBfHD6rBisE
 4QZFj2SFt8TfeLxCnjOtFv5dPjo2cS6gUqb0L1oSK3GOgRyOZkz5GhGzPFgpCDIF97NIsjdTb
 J6WQ1YdS1I9pGH4a5MszrYIeEfIYURYeRExKej1Z+auZeiCBrmy+DPQh01w=
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

vchiq_arm.h contains some unnecessary declarations, so drop them.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 28f94b6..c77d5ab 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -121,14 +121,9 @@ extern int vchiq_susp_log_level;
 extern spinlock_t msg_queue_spinlock;
 extern struct vchiq_state g_state;
 
-int vchiq_platform_init(struct platform_device *pdev,
-			struct vchiq_state *state);
-
 extern struct vchiq_state *
 vchiq_get_state(void);
 
-extern void
-vchiq_check_suspend(struct vchiq_state *state);
 enum vchiq_status
 vchiq_use_service(unsigned int handle);
 
@@ -144,9 +139,6 @@ vchiq_dump_platform_use_state(struct vchiq_state *state);
 extern void
 vchiq_dump_service_use_state(struct vchiq_state *state);
 
-extern struct vchiq_arm_state*
-vchiq_platform_get_arm_state(struct vchiq_state *state);
-
 extern enum vchiq_status
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type);
-- 
2.7.4

