Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C041CF90
	for <linux-staging@lists.linux.dev>; Sat, 27 Jul 2024 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722072701; cv=none; b=N6Z4WUniq/LzkCGuV8BYYbqHc4d38AFSxggMEih8E7tC8+lcKzmeEw98Ve+PmyJq+TACdBMnT5NUM+advV7eOOkILJTtk6CNJj5AtlPWQuYHw4QiSPjaymKMWaJKOiT6UJ2mSkhi5N2b+wXVxUKFKnoQxqoCZqygVl7bX341tjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722072701; c=relaxed/simple;
	bh=/qFW5Ca5kgqHBPu15m59/5gnXX3T+j5zWhdd3LNCfmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XbMh/avU6Wnx+3AlHBnJmSmUSnc68QqSbW/yUmCxxN/NxOmkHIORVewwyS4TbbP2E6I9jAvoWx6IPXHPU34MyrNLye7lbqtTPBp36wEz/6g/KCVkGoE7PAwkJSJu+QuQR9tbSwo4lRM9vNO8ZfughJITKD6TLbUVLY3Fp85pte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG9D82YW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG9D82YW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d2ae44790so1268183b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Jul 2024 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722072699; x=1722677499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ6xbkKisMWheOb5DEgUNo89JS6VKyra5I1hoBscMO0=;
        b=XG9D82YWjkAIOPEOTjXSycuusNYCqyE7cXtl61bM9ps4EpXYvWW7vhXUVgRk6iypTn
         R1Mw58G3TF0mwwJvJTO9wr1M9kt8NVBjMS2M3QQmJ2JARzgltyMOajQayrfRCBv/r+71
         8GKKgcTW1le4wN58eptgh/I2n1wpR+m1SocaTFRwW9P1BMnyQUdI8KA1b5+atfxTe/Ik
         lrv3dZ/lkUXqfNAgmVV8XTj1ipJnTgAqRu3b2kpbae7RuK3rqhLwttkysq/aI9yIW5c6
         kmHWVHupEe/uQBvd6kSTSWrlctfrKFCilL9EeX2qkCrOuJj5VM+uVBHTc2eH4+Fgo0eT
         PTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722072699; x=1722677499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ6xbkKisMWheOb5DEgUNo89JS6VKyra5I1hoBscMO0=;
        b=fP8VD2RLiWocV9XyxhLysLGS1BmpBr4bKJ4XI5f2pAflVUkQNUbqy1WGMm56kj5Nnx
         Rjssdm5PlFwenMDsIvFUT+HFeJ4kJ0PPoUZsTq1E+NWoIJ4qqPNw5fhqAZzli6SOW+Mc
         T2MkTTDXLxdaqZoEaWKhJgmF07SF3/rspgyBW3nCT8927ahjxhDkOhhY6ONQ5orJBswg
         Q63Bza7BSqsDrwlyxHmaxdpLJeZXj6s4iwCABjKqY4JQ1U/5KqWsqiggXGboj9o5xpIg
         ol7A2ek+TnoeKuSjLm/ftxlBTDGYKZci6nC4IKu7ANz4BuhtWJWzM+pU030BJ6SwL1Cd
         YasA==
X-Forwarded-Encrypted: i=1; AJvYcCVQrFKG0fYGT9wBSg1yEkdT+2wgJ0GSEy1s5rsyhXsoiubOKleHW7HCRYLbYqUmgbokKTUG1UFZVzRpjJc50Hfa1vE/vYOFBlO7TpLMlQ==
X-Gm-Message-State: AOJu0YxfUHpvypU+R63jyEcn6AQvsXlu36kh+NQ/PfEmS+3YCR4KcggQ
	4Us2A3h6rLEeXGxk4UkdpgURhOXJI+ChtEeSg3HETXtuYJp+7+Rw1MuYf+wkIn4=
X-Google-Smtp-Source: AGHT+IGl8+M8s7vYPYnrmY+kyvUAZGBLMAvnuu5Uxvsd7sa9rLn8732cnUOfBx8BnCpGmzJ47DNlxA==
X-Received: by 2002:a05:6a00:138e:b0:70d:37f4:2c73 with SMTP id d2e1a72fcca58-70ecea13e6amr2223477b3a.10.1722072698999;
        Sat, 27 Jul 2024 02:31:38 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.193.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8a2bebsm3880245b3a.212.2024.07.27.02.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 02:31:38 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: fbtft: Fix mutex and spinlock without comment warning
Date: Sat, 27 Jul 2024 15:01:06 +0530
Message-Id: <20240727093106.11214-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style

Reported by checkpatch:

CHECK: spinlock_t definition without comment
CHECK: mutex definition without comment

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index f86ed9d470b8..3e00a26a29d5 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -202,6 +202,7 @@ struct fbtft_par {
 	u8 *buf;
 	u8 startbyte;
 	struct fbtft_ops fbtftops;
+	/* Spinlock to ensure thread-safe access to dirty_lines_start and dirty_lines_end */
 	spinlock_t dirty_lock;
 	unsigned int dirty_lines_start;
 	unsigned int dirty_lines_end;
@@ -218,6 +219,7 @@ struct fbtft_par {
 	} gpio;
 	const s16 *init_sequence;
 	struct {
+		/* Mutex to synchronize access to gamma curve locking */
 		struct mutex lock;
 		u32 *curves;
 		int num_values;
-- 
2.39.2

