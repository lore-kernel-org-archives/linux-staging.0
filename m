Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810526AA8C;
	Tue,  8 Apr 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107666; cv=none; b=cazzlu0vkfnLPYGxNsHYfyAXrO85hq/qbWT+J3IJtRikPCYX16M/Zi342Kx5YCGvGaVTxabPZpv0P1zhdfjZKknws8Fmonjr8nvUoBNEUpRPSCpkMEi2tu7SxX+MWI9lX/zEUJV1EP0LKyGT72906G31G1mGLZV9Z3BMdo9SKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107666; c=relaxed/simple;
	bh=+7dT3tL82Twj4medpCe66/0q0Wl1ZErhjrtaxQu867M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jNplqiIpT79uwiJwVvo+ZDj+tVWN7q+auvRKJ7Em2rgtb5/uY6ngdcdozhwGKrgbzDFOgDvYHjCSIi0nBXnUaDXRjurvUNyjPw4TUAXyBGr1h+jMg+fFL06ZNC+xMhvJIrcVGX5lgPQ9awMSwVQsjMQK3uAsM0Ke6daXvotL62s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3Nx8LAn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3Nx8LAn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so36167865e9.1;
        Tue, 08 Apr 2025 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107663; x=1744712463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4QDk5t1ncy92IlUqUOHalwkPhSsIRI8ajRfXHeyssg=;
        b=P3Nx8LAnNVnN2uVsla0jhaM/tqnFXsJxHEDLjOC96v3RvGARBrh2GfxEyC/C0yKcYT
         vrx2sGNtqS7ZBWWxVd+Qot5zyHKjHfVg4Tuox15ja3D2xY50zWXqm3c0+T42paB9Wj6l
         pWM66gDC+zfKMj7lf79etTojoWDj1MJglK/8dtnjrDxY4Y0Ln7PMIzC70z4uK2LZ61ja
         vnCMjMnEFMJ9eTuEZO2lauQHyuOFxnUB20eedi1aacaMm5fMDXpLIlFFlq0S3qflHsSa
         UPFYYYv8/IdEBzMqm1yrUbQtx65GNyXoEUM3N71csZYcp5CxNCiQoN3AEx9I+g3h9dCg
         TCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107663; x=1744712463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4QDk5t1ncy92IlUqUOHalwkPhSsIRI8ajRfXHeyssg=;
        b=Y0AJ4btrrbo78CUh3/Uko96gmUDyLV1NnaCZHFIO4AjkKd5F4xRmX+A/6WxsxB2bkg
         em/1n7fDCzFhWhWAP5HX232RS0jXUKhrirQe5KdhAaHZ/n9VrN9p0VzmfAqG7Z/1ascn
         q6r6vDzZuow+/VVx7kx1KMQg4Tj3kQtz8O+0A5Jub03ZN8mubq+QeJk1+thzh3yZGt2N
         Ji+U+3J/SRURAHWrpCEb8HElXfQWmYGh3jbv6xyPhrSLYmhM1gDmkxj9Jb+k5mncS5zj
         dW2FiR80ojTZeBXdyH3ffXieBoKHVhvJD5q1ZRFihltoRTcbsh6gMy8ru2BMtUoEbrl4
         pH0w==
X-Forwarded-Encrypted: i=1; AJvYcCVow4es38Ym7hLtUgLcaOHytEJK90w7vEkfp7iFs/vcbMT7a1K3TPLzeNQOzoDaf5YZP0pcgiaDEP5z81Q4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd2siL2izAjhuz0akjYQXleetqjIkHWmTJwnAEVxoaTcOfkMsJ
	Fs5zPkjld43pHJ0tqbkmfW1IhgLtqWPgpIIpbgwkDwz1HCdEW9Xz
X-Gm-Gg: ASbGncscftWEIJF1M1Tm/ke6b72MCIFy1q/BHi69SJJ3uWhXXQncIWcMTkUBdeklDXR
	0Sf17u1zunaj0uXcp/SjmCRFAhvPf3Yoiq1jVrB376dMYqWIYTicnri/ERJp5L1l9RVcXVDLIS6
	PyviEx7ELXcwaTcOVG4CUNL6YzJl009fRRq/CZB4TlbZU5GmIMokNPb6EtnJb1FFQu0+9ZuRADG
	VOOg591WM+nk5bWgjslrf0MuseTM21Y1tjqCVn3n+asaWzZwmKaVhElzWwqEcZiauqeFB7LzfJh
	JVfKlNkZw4O0VoviCshJesFvqqI=
X-Google-Smtp-Source: AGHT+IGqji64W2lk6xzwBAi67a+TNfZqjDz2g1ujSqj8hFJXuoGxtXuka1lU6WBSwWNlaeNBcOjlcw==
X-Received: by 2002:a05:600c:4f4f:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43ee076d88cmr109745295e9.26.1744107662728;
        Tue, 08 Apr 2025 03:21:02 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226bbfsm14913352f8f.90.2025.04.08.03.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:02 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 4/8] staging: sm750fb: change sii164GetChipString to snake_case
Date: Tue,  8 Apr 2025 11:20:36 +0100
Message-Id: <08eb6104c7b82aea32796163421a7e795d3d8964.1744105389.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744105388.git.princerichard17a@gmail.com>
References: <cover.1744105388.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164GetChipString to sii164_get_chip_string
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164GetChipString>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index bb7538682b7d..c12df1f9fb00 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -19,7 +19,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
-		.get_chip_string = sii164GetChipString,
+		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index b96f9369fab4..d0b80b86a4d7 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -261,13 +261,13 @@ void sii164_reset_chip(void)
 }
 
 /*
- * sii164GetChipString
+ * sii164_get_chip_string
  *      This function returns a char string name of the current DVI Controller
  *      chip.
  *
  *      It's convenient for application need to display the chip name.
  */
-char *sii164GetChipString(void)
+char *sii164_get_chip_string(void)
 {
 	return gDviCtrlChipName;
 }
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 45a90489c95c..c15cd6a5d53b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -32,7 +32,7 @@ unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164_reset_chip(void);
-char *sii164GetChipString(void);
+char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
 unsigned char sii164IsConnected(void);
-- 
2.39.5

