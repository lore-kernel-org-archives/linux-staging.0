Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE102FA4
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:34 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Msqty-1lLHKr2RtQ-00tEdk; Sun, 25 Apr 2021 12:51:29 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 06/11] staging: vchiq_arm: drop return value of vchiq_arm_init_state
Date: Sun, 25 Apr 2021 12:50:58 +0200
Message-Id: <1619347863-16080-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:J/jSs7c8Cs8gC6dkIpGyV9Wz0oCMHwosOYzHzPUrzPy6sE1AP4k
 67+gWjH4WzUxRSFAjX4CtLK7zOPbLdZVgb3G3bY53g9rUFyz/ICS1fbrChc6DLuJTws/wwb
 zPexkcNmvHg0Oo1IvFkZgycsSWwHlavC+pHmpSIzDW+JX8nj30TAMMEcRQCScMl5J6NTici
 337z061oJkwgp6KuRTIBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DPAQVrCOArU=:R4XD/kaG+u9jGd7FWGK5W4
 vKcq6ze950vHpr2wcLYH/C9IvTiciwM9ow2gQ81+EZps+U0BKeSuHmFmZmKq4XUHb704k30vU
 ars5cIFtJTH7nFELr/kIG7iyxL0Oi1KjfdsV61ZXWv4mfdrlkPII8I0oHcmPlelDhyk6T3wX+
 MmXKLiva7lJT2DC2AiUdQV5ZFnNbfFtCnQdiU0bJ9SA4ukUYqpoUiBTQYePz4108M0pzRK36H
 1RdDRL0XUp+gZRHwb3S+7ftDFdpmk+CLQZRodLSERMI+uXp+XgA6LZ3huNegn1CebZzkalRjL
 DAUgIE0c7PL9uswAfEHainKlt+mq+5ga6d99wVp443lTkjz5NfSkDZfhjsb9B8GyB72Oujezf
 /UPsCJV/lclISC1UzTnBY+ySg6QBJQUNliCo0GHEZH2HWbL8ZDQ7f6bdr0tBhX7RBECQOeFK0
 XI6sXzK4iUlGJ5BM8WbFrhMyfDHPnHkMkVOD5orrQpGyKW6o7WZ0AlrodPB6ddYednoIlL+Yi
 voD9IeV23AYAzOi/shflcw=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function vchiq_arm_init_state() cannot fail. So drop the return
value and the unnecessary code.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c    | 8 ++------
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c     | 3 +--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h     | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index 8782ebe..7c336d0 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -172,7 +172,6 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 enum vchiq_status
 vchiq_platform_init_state(struct vchiq_state *state)
 {
-	enum vchiq_status status = VCHIQ_SUCCESS;
 	struct vchiq_2835_state *platform_state;
 
 	state->platform_state = kzalloc(sizeof(*platform_state), GFP_KERNEL);
@@ -182,12 +181,9 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	platform_state = (struct vchiq_2835_state *)state->platform_state;
 
 	platform_state->inited = 1;
-	status = vchiq_arm_init_state(state, &platform_state->arm_state);
+	vchiq_arm_init_state(state, &platform_state->arm_state);
 
-	if (status != VCHIQ_SUCCESS)
-		platform_state->inited = 0;
-
-	return status;
+	return VCHIQ_SUCCESS;
 }
 
 struct vchiq_arm_state*
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c51840a..db10d83 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -2312,7 +2312,7 @@ vchiq_keepalive_thread_func(void *v)
 	return 0;
 }
 
-enum vchiq_status
+void
 vchiq_arm_init_state(struct vchiq_state *state,
 		     struct vchiq_arm_state *arm_state)
 {
@@ -2328,7 +2328,6 @@ vchiq_arm_init_state(struct vchiq_state *state,
 		arm_state->first_connect = 0;
 
 	}
-	return VCHIQ_SUCCESS;
 }
 
 enum vchiq_status
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 24c331c..c7d2cf1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -67,7 +67,7 @@ int vchiq_platform_init(struct platform_device *pdev,
 extern struct vchiq_state *
 vchiq_get_state(void);
 
-extern enum vchiq_status
+extern void
 vchiq_arm_init_state(struct vchiq_state *state,
 		     struct vchiq_arm_state *arm_state);
 
-- 
2.7.4

