Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A735F9CD;
	Sun, 15 Oct 2023 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsev9Wzd"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so6642850a12.3;
        Sun, 15 Oct 2023 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400936; x=1698005736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh2e0sxZPUbHxzk4qSfOyASeBQgiUPXTS5/RpBzGDJ8=;
        b=lsev9Wzd+3Xb2WTs73r269RTrysATFworcF0s4xqJDIs1eR7ZDJFc66U3w/HukTk1v
         iXYFV8ysBGYmgOmICSyp4l5TN91sVpDDNz4rlWZwAE/WpAWHFctlQYOSyQjvd+3moAw9
         9uZuMod2di9nSyY4Sd4c6BTVRJn1UfJJ47E7FrCnro/cm7daC3bdLkSjTrx9FClkpt7h
         mQwHSY0yTDBYAATLhYt0aqKj1q7fhl5MIEPs7IDQ7BvMBPT1OIzVNbKzw4VArOTn2q1p
         SqooRk8/kZyAEVuYMcTCAT6/xgrFNbXINNsB3VvEDjm/LSNsV+1GEFO4JshIo/r538RD
         6q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400936; x=1698005736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh2e0sxZPUbHxzk4qSfOyASeBQgiUPXTS5/RpBzGDJ8=;
        b=F37CupQsb4QfM4v6oBiBZbhpbYY0Bb8XTdkEmUIRM7KXtpHRj8OG8C4WLWhx6OVDyu
         GS8091DkyWVd1scotk7lUSWJj7UmXFQWzaqxDf48KBETYKRw8zJ5HCxVf+SDzaOoUR0N
         rMpgrH4SBDdNzHYjzOajyCHeWPNG1i2RXjnnoo590+MCASNgdw9Q/bk7WvandI3U1Zih
         00sKNMTgpGC5t9eHJ2ZG4wj3JjPesjKpIaKoKRqwkjwjL/RyWrg0yq4Z/15m4/mQ7t3f
         p4t8OMmUVbSrZs8oftX/bIfM2iIKuRQH93mEzBQMajCJS7Yey5cZC+TWaxmn+jSeHLzU
         kd6A==
X-Gm-Message-State: AOJu0Yw3l/2A0yHrrlRIh6TdKUJaJeMYwOB9UwgMw9L3Y32bDosllg7y
	+PXXN1vpWmR/77Vh8SyIfw==
X-Google-Smtp-Source: AGHT+IFqzTsU6PuT+EvGO/BJNuln/2IQzK8j3ikapXlYLlZLg5TqQn6SCwu5v+2ZILaHz6gL/ZAZew==
X-Received: by 2002:a17:907:6d2a:b0:9bd:d1e8:57f1 with SMTP id sa42-20020a1709076d2a00b009bdd1e857f1mr5290693ejc.50.1697400935496;
        Sun, 15 Oct 2023 13:15:35 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.157.6])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906234a00b009ae587ce133sm2721766eja.188.2023.10.15.13.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 13:15:35 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Staging: sm750fb: Rename ddk750_setModeTiming
Date: Sun, 15 Oct 2023 23:12:38 +0300
Message-ID: <a74a7782b02275a19e7002581855ec23f70b83fa.1697400022.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <cover.1697400022.git.anonolitunya@gmail.com>
References: <cover.1697400022.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function ddk750_setModeTiming to ddk750_set_mode_timing.This
patch affects three files as the function is imported to other external
files.

Renaming the function ensures snakecase naming convention is followed
thus enabling consistent naming style throughout.Issue by checkpatch.

Mutes the following checkpatch error:
CHECK:Avoid CamelCase: <ddk750_setModeTiming>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 2 +-
 drivers/staging/sm750fb/ddk750_mode.h | 2 +-
 drivers/staging/sm750fb/sm750_hw.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index e901855fa9b6..f3f354831617 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -207,7 +207,7 @@ static int program_mode_registers(struct mode_parameter *mode_param,
 	return ret;
 }
 
-int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock)
+int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
 {
 	struct pll_value pll;
 
diff --git a/drivers/staging/sm750fb/ddk750_mode.h b/drivers/staging/sm750fb/ddk750_mode.h
index 2df78a0937b2..1b70885f85e5 100644
--- a/drivers/staging/sm750fb/ddk750_mode.h
+++ b/drivers/staging/sm750fb/ddk750_mode.h
@@ -33,5 +33,5 @@ struct mode_parameter {
 	enum spolarity clock_phase_polarity;
 };
 
-int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock);
+int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock);
 #endif
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 71247eaf26ee..4bc89218c11c 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -305,7 +305,7 @@ int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 		clock = SECONDARY_PLL;
 
 	pr_debug("Request pixel clock = %lu\n", modparm.pixel_clock);
-	ret = ddk750_setModeTiming(&modparm, clock);
+	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		pr_err("Set mode timing failed\n");
 		goto exit;
-- 
2.42.0.345.gaab89be2eb

