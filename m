Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A6C3FF4
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 12:33:22 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MIdNt-1mcDkn2sxZ-00Eaxk; Sun, 03 Oct 2021 14:33:16 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 1/3] staging: vchiq_arm: re-order vchiq_arm_init_state
Date: Sun,  3 Oct 2021 14:32:47 +0200
Message-Id: <1633264369-998-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
References: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:7Grpx24jR9r1sMAY7MVNhFB0RWv0pytxd6D8neXYAHIAH/n1uRH
 z19KwooTi0PpfKG6n4hQAhG4hcCXxuKeCd2bIqhvDRh1n5ZG0jOlazC/r00suWTej2xVtKK
 QVGqn4ozgjDuyVsrIZOsaHi4hlk+FYdZOHnoQubXqlZO00jgwkBYRYlMBBiqYi0Qqm0YlaP
 qUzfuJV9Oy1FLnrcjLWUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4i5Czyv/KNM=:26enmd0b5e9CyJi3UUzcZC
 Q61QcYRUVpwm1F+nwlboM9mZi+5XqpK8mha6iBf/kf8z/uHCvo61fVSecM3Sju2uy82FmQZrL
 dHVuwd0fgFubSGdPT/mkHBj17wgGdYVnkZd5dD6hTJ94rKl9ciwmFWClRZ+DvHqGod3FGl0Rs
 oGltpRb2sjltY/e0zvxr9XmUqt0WGxcyMS9PwlY6PhuzlorSa4fKOvC0JyRXgg/i1oFma7hTZ
 EQ3UfFnt3GeswryAVmeVO6XgF673o7jtAMZqbdL2JngeUCrow/0QF/lCMfaCzdg79o0kc+9Hu
 8PsDuExMxWv/dmETwCNYajSCF/6LqPwW9y8LNRRhvVpKmAAvICcUQv6VkiNzejudL5XLkCMVc
 WOrymz53WAyRoqK9ejL1oLQU9S9+IJcG+rIYeF5CFE3JCubgoVf41D5mpvrKpzd2qJ16Vfz1+
 zfj/4gvwi5Pz6o6EHdkAwFvr0RX76kr6b0izhC2347422EChLbB3NCzvT+Vfddwq92P4LaNLs
 Yt9+YbNn9dO86Iqr8ZyMp7+1yJg5NZAQUw2ZmbM8JGv3Ga9CF9ceBSNs0j7kSn2NhKYk07sGO
 8+uChaMH1CJEYQ0EiVBRmjMRuTSYcceZJHVtewhOqM+hVI/ZiszJtYtnUnQXNNI68kK+PE0gt
 +m/91CNIlLsybMYoGVmI2WvACCwH1FsCzlshQVeEAOcpJUmBBFDZaRW6Hwsc1uT8WucMTkJvk
 GrEKopGNCM8EtlShB37aVdOEMp9/+6IkotGf9Q==
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This moves vchiq_arm_init_state() above its caller, so we can drop the
now unnecessary forward declaration and make the function static.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 34 +++++++++++-----------
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h  |  4 ---
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index fcff2e5..9c424e1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -509,6 +509,23 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	return 0;
 }
 
+static void
+vchiq_arm_init_state(struct vchiq_state *state,
+		     struct vchiq_arm_state *arm_state)
+{
+	if (arm_state) {
+		rwlock_init(&arm_state->susp_res_lock);
+
+		init_completion(&arm_state->ka_evt);
+		atomic_set(&arm_state->ka_use_count, 0);
+		atomic_set(&arm_state->ka_use_ack_count, 0);
+		atomic_set(&arm_state->ka_release_count, 0);
+
+		arm_state->state = state;
+		arm_state->first_connect = 0;
+	}
+}
+
 int
 vchiq_platform_init_state(struct vchiq_state *state)
 {
@@ -1324,23 +1341,6 @@ vchiq_keepalive_thread_func(void *v)
 	return 0;
 }
 
-void
-vchiq_arm_init_state(struct vchiq_state *state,
-		     struct vchiq_arm_state *arm_state)
-{
-	if (arm_state) {
-		rwlock_init(&arm_state->susp_res_lock);
-
-		init_completion(&arm_state->ka_evt);
-		atomic_set(&arm_state->ka_use_count, 0);
-		atomic_set(&arm_state->ka_use_ack_count, 0);
-		atomic_set(&arm_state->ka_release_count, 0);
-
-		arm_state->state = state;
-		arm_state->first_connect = 0;
-	}
-}
-
 int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 8f5182d..28f94b6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -128,10 +128,6 @@ extern struct vchiq_state *
 vchiq_get_state(void);
 
 extern void
-vchiq_arm_init_state(struct vchiq_state *state,
-		     struct vchiq_arm_state *arm_state);
-
-extern void
 vchiq_check_suspend(struct vchiq_state *state);
 enum vchiq_status
 vchiq_use_service(unsigned int handle);
-- 
2.7.4

