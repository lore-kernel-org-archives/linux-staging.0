Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E93223B1
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 13:23:52 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id n12so35697519eja.11
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV4i7O8BzgnNi9s3HIsw9M8JIdyfTKAykF37RMUEeDI=;
        b=FmwPwbnr0QiwbN9cFi0HeIzq91QfJ9NAmquz0Iv6i36HQBqvOLp7Xbg/fMhtUACapS
         2W5H6W73OAc6rbsdatD8MTqCkgrmhxEPVkoQwhbQwq7frlPhDLzqs7IWxoWcEcmlZAOt
         hZPaLY0H6iDWRRpzclVQuU8j/nK0rI7fWRYG5uaHTCpz8W6UhCP2WpdQXBd1kFC5ZglH
         OH/pWbbGqFRMuIZkp9PeHgOlTUuGf8mBarEUFQvkfarXgHildhXmJzv0/R7ZX4bMB9aS
         XPkuXpLV7mDnnF5mxRoJRm1OuiwRmL1/PJGZ0UxNKkdWkTHtRPIopDZziAAA7DnxWNLm
         UaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV4i7O8BzgnNi9s3HIsw9M8JIdyfTKAykF37RMUEeDI=;
        b=VG+9SzTQoe/hAX5+o62OtNOzJVCgwpnt1jlPkG4uSogX82s7VVc+4ySKXNFCzWN+Ma
         KPzLzndu1wItqnD5CMRwhMIc5Pzlg14BBrHja6bmaSiZ2Eq48hzp0IyCiEH4kD51AReW
         sjq1gjUR+OgtNX7gDgFKd9F0AEATm1cE1YpVsw8DiP2zJHpjQJh/wcJN+M7wVUrU4WdN
         Cpmb8ssWnJD3y4nyeIg1tWiUAgDMs27bzXsi0CjlZ6b90ar29IwZTfy8RgVdylLtr7bT
         SY9r0CbY6Hew8UX7lw95RCHjxUaMYIjkYvnkQJLBMWGZBDeP75ga54Tv2h1ua9JlXkLj
         Ecsg==
X-Gm-Message-State: ANoB5pnBJkCswJj2mF+lZChGhfSCUzJEoV5+N1KhN30F9p6l2U1ci3ad
	AxGp6r8kVyZeXtZ/VBlnDnk=
X-Google-Smtp-Source: AA0mqf5zQy0JMJm9xD6ZBOVIN5DHUP0heNHNJ5Y+eIMmNRJoeW2dTtMzPucyUyRkNu04MavtMVvUcA==
X-Received: by 2002:a17:906:1244:b0:78d:d4ca:21f7 with SMTP id u4-20020a170906124400b0078dd4ca21f7mr20059292eja.128.1669123430366;
        Tue, 22 Nov 2022 05:23:50 -0800 (PST)
Received: from felia.fritz.box (200116b8267b3700c41d4e99e424db57.dip.versatel-1u1.de. [2001:16b8:267b:3700:c41d:4e99:e424:db57])
        by smtp.gmail.com with ESMTPSA id bd27-20020a056402207b00b004585eba4baesm5429717edb.80.2022.11.22.05.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 05:23:49 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] media: imx: remove code for non-existing config IMX_GPT_ICAP
Date: Tue, 22 Nov 2022 14:23:30 +0100
Message-Id: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There never was a config IMX_GPT_ICAP in the repository. So remove the code
conditional on this config and simplify the callers that just called empty
functions.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/staging/media/imx/imx-media-fim.c | 54 -----------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index 3a9182933508..19a48eb445fd 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -187,54 +187,6 @@ static void frame_interval_monitor(struct imx_media_fim *fim,
 		send_fim_event(fim, error_avg);
 }
 
-#ifdef CONFIG_IMX_GPT_ICAP
-/*
- * Input Capture method of measuring frame intervals. Not subject
- * to interrupt latency.
- */
-static void fim_input_capture_handler(int channel, void *dev_id,
-				      ktime_t timestamp)
-{
-	struct imx_media_fim *fim = dev_id;
-	unsigned long flags;
-
-	spin_lock_irqsave(&fim->lock, flags);
-
-	frame_interval_monitor(fim, timestamp);
-
-	if (!completion_done(&fim->icap_first_event))
-		complete(&fim->icap_first_event);
-
-	spin_unlock_irqrestore(&fim->lock, flags);
-}
-
-static int fim_request_input_capture(struct imx_media_fim *fim)
-{
-	init_completion(&fim->icap_first_event);
-
-	return mxc_request_input_capture(fim->icap_channel,
-					 fim_input_capture_handler,
-					 fim->icap_flags, fim);
-}
-
-static void fim_free_input_capture(struct imx_media_fim *fim)
-{
-	mxc_free_input_capture(fim->icap_channel, fim);
-}
-
-#else /* CONFIG_IMX_GPT_ICAP */
-
-static int fim_request_input_capture(struct imx_media_fim *fim)
-{
-	return 0;
-}
-
-static void fim_free_input_capture(struct imx_media_fim *fim)
-{
-}
-
-#endif /* CONFIG_IMX_GPT_ICAP */
-
 /*
  * In case we are monitoring the first frame interval after streamon
  * (when fim->num_skip = 0), we need a valid fim->last_ts before we
@@ -435,14 +387,8 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
 		spin_unlock_irqrestore(&fim->lock, flags);
 
 		if (icap_enabled(fim)) {
-			ret = fim_request_input_capture(fim);
-			if (ret)
-				goto out;
 			fim_acquire_first_ts(fim);
 		}
-	} else {
-		if (icap_enabled(fim))
-			fim_free_input_capture(fim);
 	}
 
 	fim->stream_on = on;
-- 
2.17.1

