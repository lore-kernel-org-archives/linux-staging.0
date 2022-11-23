Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360891860
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:52:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id e13so23740565edj.7
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 23:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0yfirNFzSWzAhcJFMcFEJmgVxDm9YhSShEjcea986w=;
        b=mVj/FwhVcYMzmmP6AxFi7yqc+VHmkYbSfU6P2CcX2UFk13En38/5mWgcINrhK99rF0
         AqyVrj3uUWsdJ4Uk2CZjdSWHoyv0IvJidNtBFdKNHIla8e0WGA3rxv8iq3cuUuOMEu+q
         /+yeU10agp17Su3tYED3qb4kvtY/1fs9s4BZDXc1Zc5EdkBaH3mzScuut8bO+5bW4FkJ
         yavleHZfZCG0rqUFCOJzmFJj99LXdrlaLgGX/erQHjs3uHJBO89l88m64D7ekF/6T+XQ
         w1dc5kNBvuEGG25my1Wz7AbUoyBOQIizysbrnKk74jbAWkPQhAiolNjeIVz0OcSWRioJ
         EWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0yfirNFzSWzAhcJFMcFEJmgVxDm9YhSShEjcea986w=;
        b=y4RRuPpu4E3I4t70Dmmx7EPhtcWcniMeT/9Da1nNCkqvt2GX9pk4iWazAgvHr24pDG
         nptMjkseJxk6MwVEE1Nd1zMgtRltYkhjb0COa50w8aekoYL8n8VVhGByfc6DH1jTmr5R
         i3n0QDCALEVeCVI6zxvWQR9ukXpcb6ZzO6wwej51Hb1i20uwK82/Y3hcvRRwelIOyVrQ
         MadFvmuX80/Ozi/OinTNJwY6cc3Tl1bRNca+GD04t/Cx9ACasms7uTzy3MYo+/SAoXPV
         yGucA3tNuF6tKr5d7EHBO0lJmiciturQfoswyU9VgLKxpM3vMdAfnBvebk+GXyten+P4
         cBNQ==
X-Gm-Message-State: ANoB5plD/MIT+oKFkersa2JPd3Hrum8vDWqAdBgIBxYh+0SI+8Ee5IDL
	wFT4L1NoVzygQ6FJUtlqkaE=
X-Google-Smtp-Source: AA0mqf5Xvi3z9Sp5yVfGgZrxfUb2PGtJP+JBHOpfXSH2C8Ujhc7Qtn9CkEBRCV0uOdixgrRjfeTo6A==
X-Received: by 2002:a05:6402:12d5:b0:469:885b:fcfd with SMTP id k21-20020a05640212d500b00469885bfcfdmr9646583edx.177.1669189976429;
        Tue, 22 Nov 2022 23:52:56 -0800 (PST)
Received: from felia.fritz.box (200116b826997500d517ac74edd630a9.dip.versatel-1u1.de. [2001:16b8:2699:7500:d517:ac74:edd6:30a9])
        by smtp.gmail.com with ESMTPSA id w14-20020a056402070e00b004691de0e25bsm6112889edx.54.2022.11.22.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:52:55 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
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
Subject: [PATCH v2] media: imx: remove code for non-existing config IMX_GPT_ICAP
Date: Wed, 23 Nov 2022 08:52:16 +0100
Message-Id: <20221123075216.28193-1-lukas.bulwahn@gmail.com>
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
v1: https://lore.kernel.org/all/20221122132330.30408-1-lukas.bulwahn@gmail.com/

v1 -> v2:
  - addressed Tommaso's feedback: remove braces for single statement blocks

 drivers/staging/media/imx/imx-media-fim.c | 57 +----------------------
 1 file changed, 1 insertion(+), 56 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index 3a9182933508..fb6590dcfc36 100644
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
@@ -434,15 +386,8 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
 		update_fim_nominal(fim, fi);
 		spin_unlock_irqrestore(&fim->lock, flags);
 
-		if (icap_enabled(fim)) {
-			ret = fim_request_input_capture(fim);
-			if (ret)
-				goto out;
-			fim_acquire_first_ts(fim);
-		}
-	} else {
 		if (icap_enabled(fim))
-			fim_free_input_capture(fim);
+			fim_acquire_first_ts(fim);
 	}
 
 	fim->stream_on = on;
-- 
2.17.1

