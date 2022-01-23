Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A02CBA
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N49xZ-1mBkkj3ABd-01076b; Sun, 23 Jan 2022 21:02:56 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 15/18] staging: vchiq_arm: make vchiq_get_state return early
Date: Sun, 23 Jan 2022 21:02:20 +0100
Message-Id: <1642968143-19281-16-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:L4cMCNqxfKMXjaVQ6dVOz25tlaDe4xViFmsejSFn3+PqxnukIDJ
 OA4OYosSMY3nSXLMRfJxbqdRWQW8GP4OsG/2MQASyDXhhLSYu+ondIBwxMp2r7HmEbhEDxa
 ZZGcSxm8XAPdyeMUwTF3tmJHMuZNi8sKaYHzw3Mq/Z2l2XQzZ85HVOmYWcTbYrsvnDJ42U6
 WvBYd8OOJCcaVJmFt5e4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4wvN45pam6Y=:dMzY4tjC05uJvCHlf7551L
 ZBZ3BV9JuLLYiJPg7jdPpbYjb32Oa0t5auHRQBDSxGka4DPkYzyHkrMn31SSmu9ZPxeaW/4d0
 360BLsw6m1JlJQcBhVKvhaFKXp9JoX6Z4xCECx+9PG30FbfMqM7/lCC5urdXVzwNiIfw0JYde
 MPAWr9inN5HhFXiaRZAamAYQVgGBHj/zpD9p9k3Jo5BmnrttAj8jYCGto4ASUDKWt16Zcgz3N
 NGyNK1ae5JqKXlhaYVDycjbmv47gp63dTRtVYDNPLnqxgY03GywMlqGQzSkobyrq16UUN2fcm
 EgQiB549tdPLrHYXaZ7W884IBjfut9bt2bnC6X4hSI85FQw9QGXAlN82lmkiuBJytYLpwOltF
 Da9axYHwDXMqsSJahQvqusUo3WU9D0CrgkKtbFCLWVl5uK6W0+R91KZcY5P0K28EvGUr4z42M
 4jAQjLR24Pqgcp5kLYjdr2NJNhTh/wQZ4lABoqZijYt9uMjEo4mRwmODM5H5NOm4ah3zsPHme
 O9V7dva0DfIdOWHwmydSzy1cVlEYyvO36UvNrDS7V3MmTnTcJFrfMKTRDXMvwpc0TbHMn4txz
 Gdir28EiotwlPPf2vR7VrDU7GgVBAbS2qsoy6Bna+P72YN0w0yGfFpyhVRmlWak5I0YhmQLX4
 sQknSEEHf4d6bDAOsZZFYycSW+c+p8iEhx7FnpPvG+Opd4ZUjjkf0oKmG+2LvVhGIYmW4qAZv
 L9mBTInCqyTrvHTh
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Make vchiq_get_state return early with NULL and improve the readability.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9748044..6ef8f19 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1285,14 +1285,18 @@ int vchiq_dump_platform_service_state(void *dump_context,
 struct vchiq_state *
 vchiq_get_state(void)
 {
-	if (!g_state.remote)
+	if (!g_state.remote) {
 		pr_err("%s: g_state.remote == NULL\n", __func__);
-	else if (g_state.remote->initialised != 1)
+		return NULL;
+	}
+
+	if (g_state.remote->initialised != 1) {
 		pr_notice("%s: g_state.remote->initialised != 1 (%d)\n",
 			  __func__, g_state.remote->initialised);
+		return NULL;
+	}
 
-	return (g_state.remote &&
-		(g_state.remote->initialised == 1)) ? &g_state : NULL;
+	return &g_state;
 }
 
 /*
-- 
2.7.4

