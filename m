Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF2B3CB2E4
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645756; cv=none; b=gBKkXsrSnkkvK7ZmFHIeCmpNg3u+NTMMv/m5c7n1Q0Xp1pkx1si3ONjC+OLvbV8DkzQ4FUGzXGZi2Wn2bp4ZtgeRX2bMV1Yj8W5y6DRBaXGHwJC1ofGADZe/tNvrx03xdwIX7oj722lkbB1wrSaigtfzaHWsh5TyxJ2nFha3Q4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645756; c=relaxed/simple;
	bh=NrewVoy+CeJ4LUS2omlQWrWteEd+0dreb3Su0BiNHn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCGJTZTPPLEO1LU1eVCB1K1ywPiaIGhgLBkXT2H0SUVnYKENhWkVGT1r/0SZCJSH9OcKHP8gq//ZPKQsI4FkGxvQuSAhqfLCIRf5jnWL9e7Ob9Vd9DYfEBt6gPEVZ8fFS3GiQSrSO247u65HxI1cFM/EgaPO/JqPUTjTHs3OMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqRdW1BP; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqRdW1BP"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3598d3ec542so256543a91.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645753; x=1773250553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kueakoTFarHtmRefKHO97IsjKUAic56lekSnI1LQXA=;
        b=fqRdW1BPsei6d293MoqYFRauRxcdlOWFBaQRa8AV0PCDDsjI9Dy/ZDGAXzvtfhmYZq
         RlebND2rwhh7amKQ0qdDGmEdcR4m38a+XI/RnfMVTBqStWgJhi3Eoh2NjnKo/kgH7e4o
         aMKoCVnBGbdCCmHqdWX68vbAEjn7hj9XojWP3IpfKc6T4VGnDVKoRMxmPHyyXIu8nI+V
         q6OsnOxN7UDSEARsxi/hkhZeBurfNIMya7ecah0RGYHQnfRwUNTtUi8eC2qBk+NMSNyv
         XjxYCtrA8o9eHU7YXo90KFuPig2/GVI2K1t6ZVsxWA5pxt4H5JtTIl9pWM+YwfroeYJ4
         sOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645753; x=1773250553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5kueakoTFarHtmRefKHO97IsjKUAic56lekSnI1LQXA=;
        b=FFYndfXKr+MhoAqc/NBf5NQ9OD8FJncl3+qY0lQxoZf2SbxWGPwjJ9ceFk0RmyiwKH
         p2dwi8aBE2lUWRqfKfZggwXFWGJwdChzB603oF7UOE0JMuxtUlw7e5keu5+zeNYrEkak
         FPKTy/Jqz3ZVjcVsyCR+dJolxpdJI7cPjiaXV2BJn7sNNaO9kmYi0RI+jR4xNZNSWjN+
         oYq6bn1/47c2uovX4GyLycEh/hhtTOOkriPWDapnUuJl9Y27uUHn8wkVIbULtfm1M1cJ
         s8XuYd4cPtgI3v+OWEA4tz9C3YRT0eKZL385RElEDgoKaO/wy1AYo4HDEMN1vLxtFjxo
         BO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV41dhWktny7TazSN9xSYJAFh5i10dQpkeAmBJ58pKC6+wXBzEIuh3tESXd/kw8ERzY3W1FX3WNG8bsbHF3@lists.linux.dev
X-Gm-Message-State: AOJu0YyhUBQ/UbWF9CXggqmQycVNh5OfX+oKcEH6Y7azN003BRJXEU/v
	EA9fzhmtJglCuWt6dbydPQt6RMiI4suDFTBubaIw8OgwqWE6n+XqGL3f
X-Gm-Gg: ATEYQzxfbWnnJ9vqlsguHD0wxQegun3PaUMsBFemIW8fKTA2q3Bwj/zOYFIWFCo1eIM
	Uo5zf5ZR/OKZYBk0c2ITGHY+50KxqJ9wOZIXGZM/nsLeJYN3NjmGeNX4EPTLpYzauJ6ML00wQ5s
	+sezCtKirder+3BPY0gBL2CILvyUp04ZVijwUSD11vETOqeY3apjCFHVrEWeMbGgA7D+uQOyqDv
	QxW5H9El3C5c3amaje/sbYMEwPRdg6U0E4QNOZa0Ju3lI6kCudS9Y3lZlKSULuIHb+K9cQd5otn
	2pNWzj6TySPGc/qbI0+lJDaNF17eNQ7HiEiZ+rBYlv9hnPILZp/dxX5/2/L6AhjfhfIHLPaE2C7
	BbntcZ0kGe4TtCUbMM/Vl6G/nROOOtv+Xia1bSHdlNFjN35iHIb/8VPTU0mRcaOn1vagbvYN3Ef
	zy55EVS1KU4lg7MPXDUBqc48Kop7f6yXDaTPgGiFIeII2Va9rH638WCgS2Kps9cNGMo+hSIdiCK
	nhuY5f3kQxiHV9YdFb+IlUfgg==
X-Received: by 2002:a17:90b:3fcd:b0:359:7b9a:2cf2 with SMTP id 98e67ed59e1d1-359a688f6femr1869151a91.0.1772645753531;
        Wed, 04 Mar 2026 09:35:53 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm136901955ad.64.2026.03.04.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:35:53 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 5/6] staging: sm750fb: sw_i2c_write_byte: return -EIO on failure
Date: Wed,  4 Mar 2026 23:05:28 +0530
Message-Id: <20260304173529.192067-5-officialsohamkute@gmail.com>
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

Return -EIO instead of -1 when the I2C byte write fails.
The caller ignores the return value.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..c73943341f66 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -239,7 +239,7 @@ static void sw_i2c_stop(void)
  *
  *  Return Value:
  *       0   - Success
- *      -1   - Fail to write byte
+ *      -EIO - Fail to write byte
  */
 static long sw_i2c_write_byte(unsigned char data)
 {
@@ -294,7 +294,7 @@ static long sw_i2c_write_byte(unsigned char data)
 	if (i < 0xff)
 		return 0;
 	else
-		return -1;
+		return -EIO;
 }
 
 /*
-- 
2.34.1

