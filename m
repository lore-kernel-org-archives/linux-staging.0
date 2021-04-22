Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34A2FA1
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:13:58 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M8QJq-1le3Lb0dA8-004QRb; Thu, 22 Apr 2021 22:08:39 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 05/10] staging: vchiq_arm: drop return value of vchiq_arm_init_state
Date: Thu, 22 Apr 2021 22:07:51 +0200
Message-Id: <1619122076-31785-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:kgi/l58Vwn60iK1EveYzV3gSMw7RJrsQu3wEtZlEwVSOKJbzu3B
 C6u24+7+3Jjd8wa5WjFZ5pXkr+ncZuh1/DMl8DI7yM9LO4Gxlh6pVZqRrRWvjL5t5wE7aw+
 E6E9Yu9QM+vQOG670I0FaWdtv3SQ+qyQe+QmBgH+djEiM0okqKO627KjWmJamo9fzXcLRsV
 vpvcdLPD4zSTQeTJ4JSMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t7QaOhVX6N0=:DPheqXBnm/gba2lSjLhzml
 tQgvaIb587A+WgWbNt3l+rU81UeAUJOjlhRh4kJDG2zMbR3GGGTYtF4LmU1xloprymVIu8Dmu
 ZyxIii+/bW9agCbpM69FINmOcHmWlYV9X2udoLLIgIsIekyzgsYg2PkHgWdiBOJBKTEakvDtz
 7G3d/JJ/yzDcTt/sUGnbNLo9dFdYp0GrfHaTkytlchKWFvusjcRRTJXTGvnFIyjfwup30Qirl
 OAaCWm1OSeTbuhQrw0O+V+BZzH8f/WU9GvK/KnnazAmfZ/mfMCfM+4dO/6UylT0CjlLiBrspC
 fj+FvhrpvZR5+rY3FKeFhRrEHm8w7oFJpyI4ps5yvZdcCDWVUekkAdIZZ8wyeNZ5j9xIhh3JV
 oEUPIUEIOVMTvePfr9cVglRseqvqPED0qHV/QSCZ7yJ2blGtdvVNtNi17DtPwR0759bwTLQwR
 NVBw9xnMlBuDPrz94SaicLBTQSysM6az8wFBiCOAfvi48n6de+RwMwAuYcmDj/fMjhqDjEKxw
 ufLpQbUo2W2Sc8+U5/AhI0=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function vchiq_arm_init_state() cannot fail. So drop the return
value and the unnecessary code.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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

