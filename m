Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C78F64;
	Thu, 19 Oct 2023 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H56BGkc/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40839652b97so15492545e9.3;
        Thu, 19 Oct 2023 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697700522; x=1698305322; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfpvGhYQuCUgDBCdMtII7TE0gbJjpgbukJNGIRocW0E=;
        b=H56BGkc/rgPmU49S5JYaQ7ocGgVs6Xhv60EeAweAlFGYrJU8BkwvLDBChWJWiJFL0j
         7FsViAAbTZgq5EKz/1o7Vt90co05lHgKZPqqhFRcgdWUZax7fw+6T8P+kOaf6Xl9vdZ8
         KobqlE9zTMSY4OJdg9QEWuezcOyOQkbxRnUcFM3b9bdDElf37sD3K1bXOjhR4VvYbb++
         c/TFPrs2Z22g0gskEXssbz0a6ew9+R+PC366n4V3PELjtB6SV8kNM/MQ15/Eaf/JfTjz
         80mYB4gzvtZ2ZrlFQf5guF8JqshlLb6xjJiuYR4iXFcIY2k0QFc9OM1VxqCwe/I7jaKC
         DzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700522; x=1698305322;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfpvGhYQuCUgDBCdMtII7TE0gbJjpgbukJNGIRocW0E=;
        b=gpTLo+DlXZvO4fwL6MUbHxcMpFpPyJVr1aotTp0s1A+6OhHJMiXqgxBXWijghi5CTk
         Vx+4+Yu28BuS5CnmBExSgGVNxZ3CtpHzvx4Do/xkt/DgepA8MWbDWQskPluv1DKZeT+l
         rwPPOR6/WZZ+4FhjH0UP+SEMK2T6kiFzDSnZOFqMDHsb9uI2gxVT8Ei0GGYzVGNuUF8I
         Bc3J3ySfH+dhva8yO5F60q/0IOmmVA7rQAh+7xSpP7lb41ix9DG0JQMdqGJo7pev1D+Y
         WeOVRGZwXJQlLXQn5hFYUzOBD59GeTfwWxHKEcwmvEffjcXd9TI0k1goHbOOd7PsxRNk
         eK/A==
X-Gm-Message-State: AOJu0YxBZ61AoYF3wq4faeOcacV1FdMO941PyG5aaN5T2MXVJ8Cx8Tfk
	tynGLh/z3Vy9s5dOgopbEoo=
X-Google-Smtp-Source: AGHT+IH3+XAG17HLDSZDB9xXIyIIBmyU0RlTB5VpKQAnu9lOhOrJKHCktQ4ZC336u/3uyL4Nzz30jA==
X-Received: by 2002:a05:600c:1c98:b0:402:ff8d:609b with SMTP id k24-20020a05600c1c9800b00402ff8d609bmr1076454wms.33.1697700521873;
        Thu, 19 Oct 2023 00:28:41 -0700 (PDT)
Received: from lab-ubuntu ([41.90.66.104])
        by smtp.gmail.com with ESMTPSA id m5-20020a056000180500b0031c6581d55esm3811228wrh.91.2023.10.19.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:28:41 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:28:39 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: bcm2835-audio: remove function snd_bcm2835_new_ctl()
Message-ID: <ZTDap2d5X7eXXPo2@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function snd_bcm2835_new_ctl() is declared but not defined.
Its definition was removed 1 year ago in the
commit 143b67f19ba1 ("staging: bcm2835-audio: remove compat ALSA card")

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
index 0a81383c475a..49ec5b496edb 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
@@ -84,7 +84,6 @@ struct bcm2835_alsa_stream {
 	int idx;
 };
 
-int snd_bcm2835_new_ctl(struct bcm2835_chip *chip);
 int snd_bcm2835_new_pcm(struct bcm2835_chip *chip, const char *name,
 			int idx, enum snd_bcm2835_route route,
 			u32 numchannels, bool spdif);
-- 
2.34.1

