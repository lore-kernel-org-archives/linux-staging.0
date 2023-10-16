Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA2273F0
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkGIwcp1"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57bc2c2f13dso2593901eaf.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697461257; x=1698066057; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRSNHwdO/tIPJtA5wXwUSgkVx6Nppqe1ZqNrcskxaoE=;
        b=mkGIwcp1Q348hHFumsMgPIuJSc5BSn+mlx8TyezePcNwzSe21M+scpe6JgeGSzrIOz
         i+KpAIBQgzdAIuxUWu4z8EEDRb+EOClqQsVNvfzPSDN6NpKYD9+IG0t+lvexAyB3/j/L
         Fr3oo+3HPk+ryPoVgElhegY2zY8pPYjyAm8/OJr6TX6bVODbTSR9YxJMSzIKpgBQS3Vu
         a1Sm53Um4S6qBRF5Mz1dtqqudvbjNm3fwDcoej0k1bu/Fjoq2qaf68BX6d4V4PZ1mAkU
         JD3G9gGcYzjlSCIU7/zAJb5vrgsAvN1kpw9w27U+kURmpRJDpo9D+PAXXeK9OHz33f9Q
         3mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697461257; x=1698066057;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRSNHwdO/tIPJtA5wXwUSgkVx6Nppqe1ZqNrcskxaoE=;
        b=E3hPCf5WiJCmcrxVuy/CAeknyvi8wwavIwZjKsp4xfpqYx6mAmlDAYRByRAEen1ods
         8TlBVBrVEZNgbJCeh3+D+f0fcIu+VewlSvChj2DvEJ/XO/I6M0pZTXEexghJjRRVCnik
         AjivTWeLQxszI7kyrBZ3PvN4SeOitgHUkJCeUuCaR9DWt8qjmJBGBO9OFoEdM+o36G79
         wh2YWvSQFkonQdqILeNiJ4quTa3Vib9SS469eFOMvkjK3Yjh6U7FYJwL3mqz5G3sQswf
         XBx+h1nQh4wqqdZ2NOxAl5BP4dq0WAiFbXT7IvAL3VEgMl3Xqp/TznAUXHt9kQRl07Zh
         svag==
X-Gm-Message-State: AOJu0Yw7aiOU0bkPWohZ9RpnpjYf6sPn66FngRb+stO2RN3HkiDN3R3B
	pWZEcbvpR4S0eFGI9tFlygU=
X-Google-Smtp-Source: AGHT+IHkqaGRFiSDzIC8/PY+WcmLdafEJPlOVfqU/vUx0GF0CaZ4cYipr6e7qW1L1NjWOrO9T9Ck8Q==
X-Received: by 2002:a05:6358:7e92:b0:143:5383:af8b with SMTP id o18-20020a0563587e9200b001435383af8bmr35449974rwn.11.1697461256761;
        Mon, 16 Oct 2023 06:00:56 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id u12-20020aa7848c000000b0068883728c16sm18783070pfn.144.2023.10.16.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 06:00:56 -0700 (PDT)
Date: Mon, 16 Oct 2023 06:00:53 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: remove unnecessary parentheses
Message-ID: <20231016130053.GA9696@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to linux coding style. Reported by checkpatch:
CHECK: Unnecessary parentheses

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 drivers/staging/sm750fb/sm750_accel.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..50e51d730d86 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * Return 0 if the GPIO pins to be used is out of range. The
 	 * range is only from [0..63]
 	 */
-	if ((clk_gpio > 31) || (data_gpio > 31))
+	if (clk_gpio > 31 || data_gpio > 31)
 		return -1;
 
 	if (sm750_get_chip_type() == SM750LE)
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 44b9e3fe3a41..bbef19a39f81 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -215,7 +215,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if (nDirection == BOTTOM_TO_TOP || nDirection == RIGHT_TO_LEFT) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
-- 
2.25.1

