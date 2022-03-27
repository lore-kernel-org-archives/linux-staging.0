Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D8B7E
	for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 06:01:27 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y10so6509676pfa.7
        for <linux-staging@lists.linux.dev>; Sat, 26 Mar 2022 23:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=6MKU8QUY1L2KLGR2DZj/SIjJO3VMsnbAwKdZVAvU38Q=;
        b=HeE1ltv1IyIhmk58qv1eyAf9pMH6GYBlfgasv7WjsmP493BjLvnvxh/Qr//YKmoprk
         dJHLY8dBuVcvUCQ5SbyTBHuU+TIKCJSKxkQVEmSF1cILKZtRrlQpUhkODPHOBWJw+n63
         jVf6yobuNTTtS/R/f0DJY1oZ5eAe+zzEKMB1UH1dRXBHojFqGb1VBXkIsMUaR9lKyukF
         rRa9rePYYGMCGVmKvqIdprDRs7zv0sMsUxRbb3jFMA0BUuUQcinalbpn+jyIJLg06fKH
         8E3Esd1XUqeAXkg6otjwhKUrf9AXzzdoOF77iBu+zix4sOTadvjTiQVXEjxowy2YkzNE
         hgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6MKU8QUY1L2KLGR2DZj/SIjJO3VMsnbAwKdZVAvU38Q=;
        b=oJXhO41tqjhS6AN/F2twgkgVaJBSKNs4PY3AjoEDM3fOJ23Y/MW1JTo6yCTPrOWPyZ
         9ImMyZ3lwlqZxQRbBQCr78CC7rGcvzvyjshVgA8vBTD+rm3J4sQ8H6mamg5WajEqZUtW
         jwH7Vi+bI85cg4bHJ6OK5Wby0YvXISoNpgzij1a33cG9BvuTSvH5J1dBmLS12xu807ha
         LWQXz7klc/owPbTTqnEtypdnIwdyUFNFvFG2N6Nk5I8ZVJPUQGQ3Qes2s708eGUT+I0q
         SjCQy6H4DRpuR6wpXDY3LSbah7TZBx6Uc3s1r5yIA/Y/hN8BFrBcj/6oWs9vfnhlCw/7
         frbA==
X-Gm-Message-State: AOAM532LshKl73P/uhhAjNSd6HHT+gjG2YKpoKn3eueYOIKnw+PSPWQ7
	0naFADYDM13esGt+9bElF6MOU0rr1iZ0VQ==
X-Google-Smtp-Source: ABdhPJyePl/vuwUdTIAiOaZRsyJHZjTnbNl7woqQl9dyqCIcpM8g3SZVs/4/ckj/KQcrkLMUvw3Hkg==
X-Received: by 2002:a65:5a0d:0:b0:381:3c1e:9aca with SMTP id y13-20020a655a0d000000b003813c1e9acamr5741001pgs.562.1648360887480;
        Sat, 26 Mar 2022 23:01:27 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
        by smtp.googlemail.com with ESMTPSA id ij17-20020a17090af81100b001c67c964d93sm15834043pjb.2.2022.03.26.23.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 23:01:27 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: vaibhav.sr@gmail.com
Cc: mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] greybus: audio_codec: fix three missing initializers for data
Date: Sun, 27 Mar 2022 14:01:20 +0800
Message-Id: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

These three bugs are here:
	struct gbaudio_data_connection *data;

If the list '&codec->module_list' is empty then the 'data' will
keep unchanged. However, the 'data' is not initialized and filled
with trash value. As a result, if the value is not NULL, the check
'if (!data) {' will always be false and never exit expectly.

To fix these bug, just initialize 'data' with NULL.

Cc: stable@vger.kernel.org
Fixes: 6dd67645f22cf ("greybus: audio: Use single codec driver registration")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..939e05af4dcf 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -397,7 +397,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	u8 sig_bits, channels;
 	u32 format, rate;
 	struct gbaudio_module_info *module;
-	struct gbaudio_data_connection *data;
+	struct gbaudio_data_connection *data = NULL;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
@@ -498,7 +498,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
 {
 	int ret;
 	struct gbaudio_module_info *module;
-	struct gbaudio_data_connection *data;
+	struct gbaudio_data_connection *data = NULL;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
@@ -562,7 +562,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
 static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	int ret;
-	struct gbaudio_data_connection *data;
+	struct gbaudio_data_connection *data = NULL;
 	struct gbaudio_module_info *module;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
-- 
2.17.1

