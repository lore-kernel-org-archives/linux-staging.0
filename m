Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DFB3FF6
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 12:33:22 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.122]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGzDv-1mbfG22Hvn-00E2jW; Sun, 03 Oct 2021 14:33:17 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 3/3] staging: vchiq_arm: move platform structs to vchiq_arm.c
Date: Sun,  3 Oct 2021 14:32:49 +0200
Message-Id: <1633264369-998-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
References: <1633264369-998-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:yXX3JkG44e5aUMVkKLAVKTIFa+Xy0/MBRslvazd60J7drXuFXH2
 ksfg9rOOYMp8N0nu+3/oMav+6Gvj20/uX22B3GWx/wxL9Hqp4pDGTxMVirqM+odMaVcd/1n
 C+w7jEEetGzH3uGYzd9ie5u7O1zXtdKM4iH3V3oZhwacjconz6LRv9SlsvQQdaUmPs7YO87
 KjBhJ23m3Jsksr4MoDQrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FE2+yG3/tUw=:mzTf1i3anjqKRIIBXr+rGa
 /SHxd4SXD8y6Cs5mDdPljHQxqh3QYYuSlX24Cc77WQStmE3bdaXA1iktlYmVEFgEZ985kgcac
 y3I+RSO+2rdaQF9fAI0+ARDDcIS76JOL0WiX8l8K28GfCb2kxbBdmM5VGktRuLr1Tz8NgjR28
 j0m9snJtMq+LumK1e34hjoYM0N2LORYTn8oyQP9oqarhIKr7DJsBPCjfRm/m9yI5WF5TndN9j
 Hl9tTslbiVT3TxSLLErikAzqnxt4HP0fTGg9lP8R+i0vDg0wnBAqkPw38mzhdPTzXG3TJlpiT
 B94Zi8BSVZyBMvP7ClFbmTC/ljhJ64405VrwKsV+Kj58L7YAiPA0e3/WLlW6EheJ51eB5DLvA
 gc0ks4iMN15gMxrrAkDzss89KKjnHkQJUSwfoZ77d0Q8vrbFQid5sMliWTmH8hsINrtyWX4hY
 KeTgal1gXM8OsB6mB3V7i770Z9xarZOjQOKBx/oMFlJzRV/vvbiVTQnqiOHYfNjaoknb/Q5lg
 V6CGxvllSDYmlGz8IZf2qSu8hRdrun/iYLDQJlPjbYFryWYH1mNhF3MuwrfC/a5jbyYhnyuNN
 33v/ZX9A+4BJ4T2vQdzByoW3jhlJ94Zyi4K2ZlHfpUDc0wG8IlpdLYmudMGKhc7pKNQrLH0xa
 1c5lJy+kezX6STHhGCGoZ03z4jtH5zDvnNYTbdsDkTkkV2BBcMMuQ8i40F1jB2tIowz8rw66Y
 K1ZQG2ncCbvSqYljQG4castnBAHflzPF7XwBs1Rkipyv9Y6+Ct4E44B//g4=
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

After merging vchiq_2835_arm.c into vchiq_arm.c some platform structs
doesn't need to exported anymore. So move them into the C file.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 39 ++++++++++++++++++++++
 .../vc04_services/interface/vchiq_arm/vchiq_arm.h  | 39 ----------------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9c424e1..6fbafdf 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -68,6 +68,11 @@ struct vchiq_state g_state;
 static struct platform_device *bcm2835_camera;
 static struct platform_device *bcm2835_audio;
 
+struct vchiq_drvdata {
+	const unsigned int cache_line_size;
+	struct rpi_firmware *fw;
+};
+
 static struct vchiq_drvdata bcm2835_drvdata = {
 	.cache_line_size = 32,
 };
@@ -76,6 +81,40 @@ static struct vchiq_drvdata bcm2836_drvdata = {
 	.cache_line_size = 64,
 };
 
+struct vchiq_arm_state {
+	/* Keepalive-related data */
+	struct task_struct *ka_thread;
+	struct completion ka_evt;
+	atomic_t ka_use_count;
+	atomic_t ka_use_ack_count;
+	atomic_t ka_release_count;
+
+	rwlock_t susp_res_lock;
+
+	struct vchiq_state *state;
+
+	/*
+	 * Global use count for videocore.
+	 * This is equal to the sum of the use counts for all services.  When
+	 * this hits zero the videocore suspend procedure will be initiated.
+	 */
+	int videocore_use_count;
+
+	/*
+	 * Use count to track requests from videocore peer.
+	 * This use count is not associated with a service, so needs to be
+	 * tracked separately with the state.
+	 */
+	int peer_use_count;
+
+	/*
+	 * Flag to indicate that the first vchiq connect has made it through.
+	 * This means that both sides should be fully ready, and we should
+	 * be able to suspend after this point.
+	 */
+	int first_connect;
+};
+
 struct vchiq_2835_state {
 	int inited;
 	struct vchiq_arm_state arm_state;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index c77d5ab..2aa46b1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -25,45 +25,6 @@ enum USE_TYPE_E {
 	USE_TYPE_VCHIQ
 };
 
-struct vchiq_arm_state {
-	/* Keepalive-related data */
-	struct task_struct *ka_thread;
-	struct completion ka_evt;
-	atomic_t ka_use_count;
-	atomic_t ka_use_ack_count;
-	atomic_t ka_release_count;
-
-	rwlock_t susp_res_lock;
-
-	struct vchiq_state *state;
-
-	/*
-	 * Global use count for videocore.
-	 * This is equal to the sum of the use counts for all services.  When
-	 * this hits zero the videocore suspend procedure will be initiated.
-	 */
-	int videocore_use_count;
-
-	/*
-	 * Use count to track requests from videocore peer.
-	 * This use count is not associated with a service, so needs to be
-	 * tracked separately with the state.
-	 */
-	int peer_use_count;
-
-	/*
-	 * Flag to indicate that the first vchiq connect has made it through.
-	 * This means that both sides should be fully ready, and we should
-	 * be able to suspend after this point.
-	 */
-	int first_connect;
-};
-
-struct vchiq_drvdata {
-	const unsigned int cache_line_size;
-	struct rpi_firmware *fw;
-};
-
 struct user_service {
 	struct vchiq_service *service;
 	void __user *userdata;
-- 
2.7.4

