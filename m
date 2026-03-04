Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017883CC9F4
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645761; cv=none; b=ZwNAeNKvDI/M2peBgzpu/criQO1MMBCl+U3bBzFPBQLigX5WUFYQAA3x5OcQ9pVAscX/MNPb0GCOjY+D5K+D42qK6H8upF0elt6hhFPgsO4Xks/8ks/0n2Y16VF/HMIgCJajP7Px2a73Gmh9R+NQyaLCnkSiWWLG/Hw2BhSXymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645761; c=relaxed/simple;
	bh=P3RWSgaNEweBva02qPe7Yoe68GpbgepTxng62JJRc1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQQAk5VAO3MHyQy8T78tgR7JybPXI8xLEfZW8DK9Jfb52lt15pl8dn5mm/PElNV5zm0843ydPAQB52cK3/lfUpCmBF0AQ8CUKZzC1SjAP0au5Vipz0whjklFfASAqdRrqKE3osPBx/JyTWzC7H5JPizqRNL7mOvNp21G22/av/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSIWs2zb; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSIWs2zb"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c70e3eb3af1so282952a12.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645758; x=1773250558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GqwX18uDR+XHlbxuX2mrRGPI2OBZOF06h+p3yCHrqs=;
        b=ZSIWs2zbQ8okak5BwKCDwqohAce+OkYWsxUmlQ0Lp77z0q/J2xp+E29EMjyMQyx4oY
         yT5sfMU/NtBSq6Ame+OF1NYnQGr1/7SCELuCN1eRhOrSlcRWDFxezUVlhSVTg6MxXejj
         LcPM+chCGb/KlrhO2ZfyXL1gZUsGOkWdBn3mz3JQS5JvLXKRY0vz161jYAIxmYm4tiE4
         +OnHw0UCJNQDNkeH6gH2l/A6W5F+ublo6TpnilPnxayeAKmmZ9PUz52EoMBRpIqp8F3G
         ORNrtrIqePEjXOWff69cp2ZriOMByCY2czji6sqxhDzlBR54KeWyS9/HktAkD2gdgznO
         ztUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645758; x=1773250558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8GqwX18uDR+XHlbxuX2mrRGPI2OBZOF06h+p3yCHrqs=;
        b=wAL4TwpaH+jEBc/Oj/98EDB5YbAH7eGo3Vktgb05vkDHwNi7KyLy1LT2zCAolCdAvD
         MvKmRjjz71H3iX5X4KVEpa8Z+S75cxAIaOAZApq/BzjllG385rGl94Fiu3H3HyC21GKc
         kGS2LbSI7ntfAfwFnyN15A01zHWS8tPK55IKi8Hb86AcuXiXcuhZ0xJRWPF3dX/B0pRP
         nBRiu44RgLz2PA7WQ924rGOCuZAo/R2xOJ/rzvF64uNF1AanTjydsNsCXGi4CyngYkhq
         2W/9fWphCeovKY+6qYPrQx65gelgNTyjbsS3NMMh9ETnyg/LzpeYr/zv1y6Tt0xz6raZ
         IDiw==
X-Forwarded-Encrypted: i=1; AJvYcCUVFWsKEH0QsOl04FnIi8ewFEDTIUxXLztrFDYot9uRK0Q5nkeeprfVJJmZvWAu4ZFZ8bRMhqX2g4M8Qeo5@lists.linux.dev
X-Gm-Message-State: AOJu0YwhhlugMnRx3v6gIHh83fmVguC2SWmSGTzjyYDq5l9xpMbWdE3Q
	oK+UX46SQRCkGX7UGT3ocEH4zyQxLeJ50nOpda5BJWsd2KTatktrQFMt
X-Gm-Gg: ATEYQzzJzU1NhnjAKhDIXww8PDvrHmiUeB2ZyOERUg3ZCEN6zu/tgYwXSZ1TRJuSkOh
	JZEQCUfsQIfntTE/SCioAFd6xQU8Z2OiNZz74/lvSYYgHzMEiPVhEfEjqRrDh8VKyVek60nYEDU
	9QgHyfgABKVJvft5Jw1hyqCww4VgbE80rW7A1jBsclxuH4TjhzUcXexqHRHzzYEMzUB06zUs+nr
	8ijP+VuFNxmBqBKyUYSDUG2ytybyAyBBZXe6jyKQzena2YWe5uU7DRWmRKMmIGyFJmCtkoSj/ED
	VraSWS5BVsbjoqFL01lyGTsDDs199RXbaJDSw3IGQ3HQnmjYCpvENCfjQzMNHJbCnU9LxAuob8F
	gOoW4MeXu8j5iOtLfOLb7LVj7FnrBPOcr8NqqyZXei66z6XqpQSV0KrwG8Edf8xUdU+/uQWSbEV
	kAnHruPKQVPcYKTPGlxRn3uDNa232oumu3Yx4QIW7Z1qfMvAG4gh5iVy6pZfqR/6h/R0iICqUFM
	+xvtoK2JZ3w1/4=
X-Received: by 2002:a17:902:cf04:b0:2ae:3f3f:67c4 with SMTP id d9443c01a7336-2ae6a8c0867mr21923665ad.0.1772645758234;
        Wed, 04 Mar 2026 09:35:58 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm136901955ad.64.2026.03.04.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:35:58 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 6/6] staging: sm750fb: sm750_sw_i2c_init: return -EINVAL for invalid GPIO
Date: Wed,  4 Mar 2026 23:05:29 +0530
Message-Id: <20260304173529.192067-6-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304173529.192067-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304173529.192067-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return -EINVAL instead of -1 when the GPIO pin number is out of
range. The caller ignores the return value.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index c73943341f66..46599be8d6b9 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -344,7 +344,7 @@ static unsigned char sw_i2c_read_byte(unsigned char ack)
  *      data_gpio     - The GPIO pin to be used as i2c SDA
  *
  * Return Value:
- *      -1   - Fail to initialize the i2c
+ *      -EINVAL - Fail to initialize the i2c
  *       0   - Success
  */
 static long sm750le_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
@@ -382,7 +382,7 @@ static long sm750le_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
  *      data_gpio     - The GPIO pin to be used as i2c SDA
  *
  * Return Value:
- *      -1   - Fail to initialize the i2c
+ *      -EINVAL - Fail to initialize the i2c
  *       0   - Success
  */
 long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
@@ -394,7 +394,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * range is only from [0..63]
 	 */
 	if ((clk_gpio > 31) || (data_gpio > 31))
-		return -1;
+		return -EINVAL;
 
 	if (sm750_get_chip_type() == SM750LE)
 		return sm750le_i2c_init(clk_gpio, data_gpio);
-- 
2.34.1

