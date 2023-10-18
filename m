Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1707F168CE;
	Wed, 18 Oct 2023 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5aTDE95"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso3160985e9.3;
        Wed, 18 Oct 2023 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697620117; x=1698224917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzwyhcJNZa6arJQKPZmLNcj0YJDSwAR/dJyY9R0VHn8=;
        b=R5aTDE95myGhaa+irSh+YKTyAAPJfhHo2jM9fTnZje/Cw3FxDemq0P4JmoD8FNNEUR
         gc9t1HlJiho42av1gxiqrQkAJllVjuYHAhWuTJjySYX04sUnJs2UJ2cE6VZ/1N6P3pz4
         aEP2mEVnVPSJFbhcjNDANsShXJdxTw8qoNcpuyq9AV8OWjrwRnOv4g0cwbQaAvaq1maO
         O/EjTczZ6PTdWKLnKkNLbdRL3bxGr6vAwsLKk0Ov/aqFcO+L2sLUKuDc6l5+wzom4j7K
         yJ9Z32r1BN2x71FgPy2QfOlcS3f7RJklI+F8ZobWOuVQqf5REUpOV8OFPnjJ4uVm9RzH
         Y9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697620117; x=1698224917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzwyhcJNZa6arJQKPZmLNcj0YJDSwAR/dJyY9R0VHn8=;
        b=o6jpJn5rXEnBB1cG5prYtUIlgbSJE73rtbnSL/miGZYFz37L3RCk6+H8eaAKehBr5N
         NpTqfCdTeJ/hQpE/h4Ozp7Hd/Kd6Jd8gEc4ii/o40HY6fzNW6/kejuwXEeLiJHTZxkm/
         BXpCOTi4Wblw0NG3pnxTntCMAatB6Zkc5RvElcMP9dwC5url3+oS2L0aBuY4Tn+kUjdt
         4Sm8USOzQb6BSG/8aTjX5ITWbXidaCOKu/L8gw1/PcypYnHIOdaZRDGDhSiC1GIhFKQd
         JXoDB1JyGOAZSNum+iGLYNrA1x+q7AhQ2NNjsd2RPZVu+FMtVTrYs8Prg/yIMv1EYJSf
         dKNg==
X-Gm-Message-State: AOJu0YySdnM7qsagfFdpMmkFc0KvORZfZ6bLjzswTCGdLSLVAlxM/0UH
	H/YzeFcvn7ewCZmruqyaTQ==
X-Google-Smtp-Source: AGHT+IE8Jb8g3iq2lM11tjT+znYj1cfMj3eJY/zNAnipfGZEi/tRU8f65xrzYMXswghDqHtMCAOCMA==
X-Received: by 2002:a05:600c:444c:b0:401:b2c7:34a4 with SMTP id v12-20020a05600c444c00b00401b2c734a4mr3718752wmn.11.1697620116890;
        Wed, 18 Oct 2023 02:08:36 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.0.227])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc450000000b003fee6e170f9sm1107397wmi.45.2023.10.18.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:08:36 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	andi.shyti@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: sm750fb: Remove unused return value in display_control_adjust_sm750le()
Date: Wed, 18 Oct 2023 12:07:35 +0300
Message-ID: <3997a009dff211fe4865644ecfb77406328a6607.1697619623.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <cover.1697619623.git.anonolitunya@gmail.com>
References: <cover.1697619623.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifies the return type of display_control_adjust_sm750le()
to void from unsigned long as the return value is being ignored in
all subsequent function calls.

This improves code readability and maintainability.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index bcdd291d25c9..83ace6cc9583 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -13,7 +13,7 @@
  * HW only supports 7 predefined pixel clocks, and clock select is
  * in bit 29:27 of Display Control register.
  */
-static unsigned long
+static void
 display_control_adjust_sm750le(struct mode_parameter *mode_param,
 			       unsigned long disp_control)
 {
@@ -70,8 +70,6 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
 	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
 
 	poke32(CRT_DISPLAY_CTRL, disp_control);
-
-	return disp_control;
 }
 
 /* only timing related registers will be  programed */
-- 
2.42.0.345.gaab89be2eb

