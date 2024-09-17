Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D215F40B
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551130; cv=none; b=hw6B6rxdlfizZ5/z17uYY2Vqk6dZSdUqw1G4zVO2GFeJrszA7ZdcUvtDjlFxRMD3hC7cZauBj34QejHcNWnmCsSUonvd92sp8/LxTf37q1bq95JgI16dJ6ECIPimpF3E0qE5/01kNvkoaPVW7FE1T9xvFdwZHHe+rlsZVIXKIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551130; c=relaxed/simple;
	bh=6yEMFfoSwpjfCXOzC67az4SEYPpIZWGHydG6G11AuDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/qYtzkqn/P41Zhn1VDBiEj1rBSQ4YRFityirRJcDDQcdRJ/epAnI2SYJ8ZueO1l9noWKj94e8qD9QyR7h+c1DHg/SoGCly15cWGJq5DxSPRXnrr0DY7c6c+R1UQ4KjWDIG0C3dlBcg7ZWnfIb02Q0hoAgmA9f2xRSRdluQZADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FPrCkLGa; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FPrCkLGa"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so3927576a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551128; x=1727155928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt17mD/dE//1Ybyc4L7AOySBbggFjSxKjKPkk3oTidQ=;
        b=FPrCkLGaLEYsh/UpW1yu3vdmlGkpTgWwM2lFhwkIp6erTsr3Gn3TXfincanLSbi74X
         Zlhawn942ACcTiWCRlRGlQl8c53K+KHgkrQn+ernfgEtCBfEqv6n+niuZpBF0mtXU0cC
         iBilrU2Wga79Srkc4VvsvSmzej7pQNTyFpU8oTCQtzQB0aIsCGFB0go1/92lLi3Qt9ww
         3s1fjk3UX5IYto1wPcD3IlRHumnSyOPWvt/+4+Fao5w1LQqcJWF3aN4NWbtdwv9Sqh+e
         /D08PmJ79eQOAcRIyTjlWnqKGaS2Um7M3TBrLCAzLRtJye0zL+G4Ihds1RY9fTtZ7GzV
         jgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551128; x=1727155928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt17mD/dE//1Ybyc4L7AOySBbggFjSxKjKPkk3oTidQ=;
        b=iKSb2AqJtLVfcIS61Ad4Y85la6kiUUCtHsprf4C0oPrUJDoyav5nyIO16aXb1b8sJ4
         jH6ejub9D1+FH0PrWuDXwa0bcPWjaWbQVsY14Npg3aIZ5AwV5rTuDpkJftsgJkOywArx
         l6syeAJgiCTsgQiw4SqYvGs+4Xf0TvcI5tyrj88P37pazORUSmHW2c16kp1x+KMEDEmk
         i27Plh4DIxSktwONxByqVRvVHBfLF9kwFaNsvaB1Yj63lHFwhYotQk6QILsCPzppsfF6
         WkJEwqnUc3fn/AUOvZgVvVEG+fpEVJpisTESPOKzCuNu3EGC/Ah7Hb3LiEkUlixuDKcK
         oVPg==
X-Gm-Message-State: AOJu0YzzijJOeCGW4lWlDkIMA5Pq9c8QT2V1IrJ/xjHmW+n1uVhIwG9D
	t9DJDG4+gOg1YPBbDzHiAqdL1sqhLuJWtnFOudyion5VcmWdxZNcWJJfMxafjBQ=
X-Google-Smtp-Source: AGHT+IHH7RLFZsPJYTmnjGh6vw5+VSIHlR9cQa8vhyBFrLJI1jwlzdgnVqAuQQqrwNXSJFPRICHYuQ==
X-Received: by 2002:a05:6a20:cd0e:b0:1cf:337e:9920 with SMTP id adf61e73a8af0-1cf764a7aa9mr29036901637.47.1726551127826;
        Mon, 16 Sep 2024 22:32:07 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:07 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/18] Staging: rtl8192e: Rename variable Sbox
Date: Mon, 16 Sep 2024 22:31:51 -0700
Message-Id: <20240917053152.575553-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Sbox to box
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index fb80ae6c3f2f..2b9e882d0bef 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -137,7 +137,7 @@ static inline u16 Mk16_le(u16 *v)
 	return *v;
 }
 
-static const u16 Sbox[256] = {
+static const u16 box[256] = {
 	0xC6A5, 0xF884, 0xEE99, 0xF68D, 0xFF0D, 0xD6BD, 0xDEB1, 0x9154,
 	0x6050, 0x0203, 0xCEA9, 0x567D, 0xE719, 0xB562, 0x4DE6, 0xEC9A,
 	0x8F45, 0x1F9D, 0x8940, 0xFA87, 0xEF15, 0xB2EB, 0x8EC9, 0xFB0B,
@@ -174,8 +174,8 @@ static const u16 Sbox[256] = {
 
 static inline u16 _S_(u16 v)
 {
-	u16 t = Sbox[Hi8(v)];
-	return Sbox[Lo8(v)] ^ ((t << 8) | (t >> 8));
+	u16 t = box[Hi8(v)];
+	return box[Lo8(v)] ^ ((t << 8) | (t >> 8));
 }
 
 #define PHASE1_LOOP_COUNT 8
-- 
2.30.2

