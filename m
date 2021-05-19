Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094670
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 04:17:03 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id q15so8511842pgg.12
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 21:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xBAmlGmAhkNvMdsddqA/yKphvAVlxqJKNJ9NsTJMkQ=;
        b=htk8OOx/vusfyShmWu8F4zdFd56n888Iy1H+c5O0xWAcU9BiGsSIqilCcnrG+/tRGu
         8+hZdO77kAA4wAqGkUVdiNQQmjcm//lpUNgHoC5L9mqQgvEn3JwUAP33rtTmHrChMql+
         FQECDi9ohd/daGZqbq2Bq6rmOUdZRjmpYss2zdx86PMBcILnc74hWLhEui6P/lFmCXXi
         B/S6l0aAaBwi2MJwBpAk5onvpS9uQ9wB8nNZYaj0xoHRr4hodsIbw9uxR3zUpEGlR6l7
         TpXEoFWahreZavOJDnliGf6ZOtnBFxYrGLk79k+YnjXZ/qRv6ncwZpV3mc+Q4f9ucRfk
         Qh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xBAmlGmAhkNvMdsddqA/yKphvAVlxqJKNJ9NsTJMkQ=;
        b=hUuMz3078HlgNaCs2czKWkcDX77vjDr6sjg1WzAh92Cpd3QpuGjMrqbmAFYkvYnkIa
         ZfLEHIyD01imJWSk6OJzjulaKFTWtRTXmmJZCBJwR0RBMhPJIc28wJxL6oWM6dnXqMxQ
         hQXTdkWjFhCpS5V48gH0WWvbvqxp+I5iwBZcAXbK/vpDtvkvAOVVCAq675L0ZYR3T7O2
         Ri0vZ78zCcZ9+rz4yYki0v2LwUJYBYA+fvZO47mPmMok+4LLYvlVw6rllYCTuCXrzArw
         E/CxW0oyFNu/sR/N6d4/1NQ4bDhroOu0YOV6yGYscvjd/yuFTl4qzMPn2FGyPBKuiALN
         NOqg==
X-Gm-Message-State: AOAM531vKr3YcjlKrdvIRGoaX7e5uIHXSYTfhChEmOIrKjLx7+fuXHUZ
	k+PgiGLDE560607NwsjG4iU=
X-Google-Smtp-Source: ABdhPJyuQ3XeIA/Rnm+1ljTooR6LDM5UoElLgzIApmc6Q9q3m1pBZjg6RNlV0xP2PKY+k8qTWfp3Sw==
X-Received: by 2002:a65:668c:: with SMTP id b12mr8765066pgw.212.1621397823065;
        Tue, 18 May 2021 21:17:03 -0700 (PDT)
Received: from novachrono.domain.name ([106.214.255.120])
        by smtp.gmail.com with ESMTPSA id b1sm15231500pgf.84.2021.05.18.21.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 21:17:02 -0700 (PDT)
From: Rajat Asthana <thisisrast7@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rajat Asthana <thisisrast7@gmail.com>
Subject: [PATCH] greybus: audio: Fix sparse warning.
Date: Wed, 19 May 2021 09:46:24 +0530
Message-Id: <20210519041624.824757-1-thisisrast7@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enforce int type on SNDRV_CTL_ELEM_IFACE_MIXER to fix sparse warning:
> warning: restricted snd_ctl_elem_iface_t degrades to integer

The iface field in the gb_audio_control struct is of type __u8, but the
values stored in it are of type int. So on conversion they are degraded.
Adding (__force int) will enforce them not to be degraded.

Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 1fc7727ab7be..1e613d42d823 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -676,7 +676,7 @@ static int gbaudio_tplg_create_kcontrol(struct gbaudio_module_info *gb,
 	struct gbaudio_ctl_pvt *ctldata;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_kctl(gb, kctl, ctl);
@@ -903,7 +903,7 @@ static int gbaudio_tplg_create_wcontrol(struct gbaudio_module_info *gb,
 	int ret;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_ctl(gb, kctl, ctl);
-- 
2.31.1

