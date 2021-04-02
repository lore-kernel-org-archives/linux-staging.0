Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410170
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 14:29:22 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.89]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MuUSa-1ljaX70Xwo-00rXGu; Fri, 02 Apr 2021 16:29:19 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-staging@lists.linux.dev,
	Dom Cobley <popcornmix@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] bcm2835-pcm: Allow up to 8 channels and 192kHz data rate
Date: Fri,  2 Apr 2021 16:28:08 +0200
Message-Id: <1617373688-8715-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:Ls7Gx2YIgzzxHLh+0Pu2TYOUU9Xn+lcCNOeusvbV4SJKk0R31Q5
 +DTtCyyzMd0cCQAyx5jpTiLWFyutUw21PaIlespT2YRWmc6JGjsb8ZbFb2Ab3/+Ql9KcxfO
 Yz4TlIaBECqQg+YuiKGFZbIxEKZMOYB1DcqKm51eZHhzIpjvwTgemZuYiEZRte31NC0kiBe
 CZeQ0xD58EmnVyUMeN7GQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sczv8zfKmlA=:trm2EEWmxAoWlF4MG0DUSQ
 IYBmdCYPvGyVLjSWv4YMQlAEEqsJcO6BggtZ+Og1BeC2gtVeZkOK7FV+2Sw2fEJgNYnizoKZc
 DkfY8zYfqCfuRAaL0zuPIEAT9aAGhJHbRfANwqeodspkJZcZXUPqjXA9+JeLzoGbnnuY9ZEJb
 Muq5y9MeZsM5/lyXqK4qdidR2vbItYR8IUSW1XZ2Xynu8FqA/DXCzUvUBv5EvoFjcDMWm0BTd
 hjoRUpANgELoP13Lug4xW5nTKV9i7DI77nh88LMMuK22dZwYiKSkxDrvHwyDGZAaUPOKrggmP
 i2TwJfapWMBQ53PRZQBveSbCoK3dWYB79uV+7d/0QpX8A244voCFvmB+bDgvPGS/3FZOOxKMq
 zG13S6hthQtNG11vOdEhAWWhlalVkTgEzkJkq+Dg+EDhaEoJr4qXvJ4VyVW8BVjLZztFlitg5
 2zkxmLR6ZyY78QaIiMUflK5JgKTYSE6osWr32aW5mMKrMLqtVUpi
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

From: Dom Cobley <popcornmix@gmail.com>

The firmware driver can support this, so allow it to be selected
Increase the buffer sizes to handle the higher data rates.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
index 542aff1..f2ef1d6 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
@@ -14,14 +14,14 @@ static const struct snd_pcm_hardware snd_bcm2835_playback_hw = {
 		 SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		 SNDRV_PCM_INFO_SYNC_APPLPTR | SNDRV_PCM_INFO_BATCH),
 	.formats = SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S16_LE,
-	.rates = SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_48000,
+	.rates = SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_192000,
 	.rate_min = 8000,
-	.rate_max = 48000,
+	.rate_max = 192000,
 	.channels_min = 1,
-	.channels_max = 2,
-	.buffer_bytes_max = 128 * 1024,
+	.channels_max = 8,
+	.buffer_bytes_max = 512 * 1024,
 	.period_bytes_min = 1 * 1024,
-	.period_bytes_max = 128 * 1024,
+	.period_bytes_max = 512 * 1024,
 	.periods_min = 1,
 	.periods_max = 128,
 };
-- 
2.7.4

