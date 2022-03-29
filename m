Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC417C9
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 01:59:23 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id f10so5975805plr.6
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 18:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Q2tEzc6qqUTq/8x9S+eo1Cjz2mjNMrLq0btC0WZqnOM=;
        b=Bj5rWMMqUgL/GsAyNikkuLD6Fiapi3KQknPLIqpvdw6qNvpOodVRhqD6Zx8YE7Kb5e
         3AUWVNw6NUkGik5KKu4qU/k5YSyrktA1aACy9otYtuR7WMO4E223UxWy4Brc9wvDB0/O
         uEM2mp7QVYOo6yXgu2rWNnRCJbCzraQILh34397i0OhyjQNSxrr2MQBLAr1ouwfiq0pY
         bIP7nYqAoKu5ZKSwDqeIBUHJpxTy8GdT1OGVKoWSCDVTp7NOdvI5E16vben5U3PJ7B0y
         oVIQTTqyZfbfFpg60kfS5hpXGY0saEXIlfNLCcD5lYt72/l0ZHNZISmY5sXkxhwZBJfQ
         N/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q2tEzc6qqUTq/8x9S+eo1Cjz2mjNMrLq0btC0WZqnOM=;
        b=RuRbYT3P/QfP7+EFqrRdEFSOr/duSwg3baUeJJgRyM/kc3fPdpEcWgeZePI8vHMCui
         QagPhCxWLmBo7iUWyBynQ0xFNXBZNYifWrkq59tJWzmJcfxYs8xk8tiaQUq8I+ZFKK95
         pTwEdj48xT3vmx8jE4ZITNhARLzRjyvSrKb9dN4wn+nUDXSIC/7RzGq9HfTu5O6O1Mwp
         wwhaKlLVzjn4GA8ZafhaZb/HGTGQzCI5fQ//0ruqpGlKM5N11FOCAvToOtsX8k9N6cxV
         dXUbZVMI02Phl+TyJvuuxyQKIQrMXOJLX/Z77LcgVDjZY4C+n06l0IPiulEC8gvHDdFf
         4BIw==
X-Gm-Message-State: AOAM531FDbkmSrqu/EAh3xb5/+VePDRnPkvSpOyCNbiXixdv2LRqJ9sJ
	atleA6OachS0zuRbVn2hoTw=
X-Google-Smtp-Source: ABdhPJyFcCNoQ/NPBV248dgiFpK3SjyUeJt5otlQ2gLkLeX9M1U17rD6APQ7GfI1hPe30uxQGJncyg==
X-Received: by 2002:a17:902:728f:b0:156:24d3:ae1a with SMTP id d15-20020a170902728f00b0015624d3ae1amr3094825pll.9.1648519162988;
        Mon, 28 Mar 2022 18:59:22 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
        by smtp.googlemail.com with ESMTPSA id hg5-20020a17090b300500b001c795eedcffsm736287pjb.13.2022.03.28.18.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 18:59:22 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: vaibhav.sr@gmail.com
Cc: dan.carpenter@oracle.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaomeng Tong <xiam0nd.tong@gmail.com>
Subject: [PATCH] greybus: audio_codec: initialize data to silence static checker warnings
Date: Tue, 29 Mar 2022 09:59:13 +0800
Message-Id: <20220329015913.10420-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

These three declares are here:
	struct gbaudio_data_connection *data;

Since all three of these functions check for if the codec->module_list is
empty at the start of the function so these are not real bugs to bypass
'if (!data) {'. To avoid static checker warnings like Smatch, initialize
the data with NULL.

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

