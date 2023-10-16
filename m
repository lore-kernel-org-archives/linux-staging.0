Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE36F34CE3;
	Mon, 16 Oct 2023 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA70uXTw"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so8604720a12.0;
        Mon, 16 Oct 2023 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487385; x=1698092185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUYZDjo3nNnCe2435X1iMxICDdnMM/czWpG4K+g4SPM=;
        b=KA70uXTwMuIlg3Qs9c31mhXjkIfzj/EbzscRh/5H7PsvwMId7VJW2xmdwDSqW5RAVy
         wSJmoh/nd2FXn6nG4HkKvrnp1xFE21D0AXGfFPkwIELpSDxRe8aT22+7l/LaOt4s6jes
         3+aHiuvD4qB+4YyAfPFZjE0kBcLQOPTMzdlUzue8rWJ1CDHG1HmEGoH9z3u78Bx6+Zs0
         imHjR5sMCPHG7tHOMBsDTJ7iIXA9IHEq665H4pB7yRNaBa/7XARB3KbxWS0Pzs6ID9u1
         KT6PBqlGOwVq2Zr6tS8UzziJFOftcDA/fSPuqT/ALHrkp+B/8tPQM7uO2B2d+NdvlrWt
         TJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487385; x=1698092185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUYZDjo3nNnCe2435X1iMxICDdnMM/czWpG4K+g4SPM=;
        b=ODlNhCXpeYhVaMZh+l3/cqKpmXXgAZk0m9xEk2DXkXJeLEEZM+Khu9owtV8Z7twFwf
         0gKRInoUhr/r+pMEl+N5n6fv1JW5RV3l2+eJn93TjH1aXLEdIhmgKbEV13G2pdrs2U5m
         vbUkdoK+56s+S3HAYKlLXq4Pmgonk92sPDgllTPGYSNrMBY79SlXr67NHcqJIMCHYBTW
         1lfteG4XK9Nd250kVMFzW2kDuZPuq49rM4nOjHET7HQQ4SuFbd/N1hvMSBuel9AoLqTX
         xiF0Lk8hDQyCFEa62FZS3T27MF5/TZdUVGd+XGWP5ifKQK0L7A0hQ3JeuRGBCh5sVqcH
         yl5w==
X-Gm-Message-State: AOJu0Yw6p6HZ6323CaW5g08DkSQOqx/xH4luBVNI3409rW4rguRQjscn
	cfOE1+dHkXnI+MvHXjmFOQ==
X-Google-Smtp-Source: AGHT+IHGTayWdsFIKX5DIfZ4bt0TvbqwGILNLrrx0y4VXUYHr2i1Gsj6APfHOHu5gHzlVaup6NOEcA==
X-Received: by 2002:a17:907:3f94:b0:9b9:facb:d950 with SMTP id hr20-20020a1709073f9400b009b9facbd950mr91174ejc.72.1697487385170;
        Mon, 16 Oct 2023 13:16:25 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090657da00b009b97521b58bsm4606055ejr.39.2023.10.16.13.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:16:24 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] Staging: sm750fb: Rename ddk750_setModeTiming
Date: Mon, 16 Oct 2023 23:14:12 +0300
Message-ID: <20231016201434.7880-6-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231016201434.7880-1-anonolitunya@gmail.com>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function ddk750_setModeTiming to ddk750_set_mode_timing. This
patch affects three files as the function is imported to other external
files.

This follows snakecase naming convention and ensures a consistent naming
style throughout the file. Issue found by checkpatch.

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

