Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDD34D90F
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465580; cv=none; b=oVzPhhA9R+ubGP3dGAmlnANPjNlfhITgzWFAA51Sw9fcRXFwO13iiBiUc0ivDv2nOdunKMLQHLY/XR7tWUMhf/2KY2Y/AIx9S/onBlbTe0avFoT9ujlsf4egUB86YOGfIfUnxFUv/yJ4Un13enjruwzushoyEtOLzyMr8QHlpkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465580; c=relaxed/simple;
	bh=UoObvnnZRPgdvTgqoymjmAp+D17szqmEHwzVj+aDlXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRNEpSTeeDXkDnXRD1CGsvYsDhzMB6VWPCpV+jehlq7X72IbhTihpcGufSMNB0Kh9h5YRrDsUBz2yL/QNK2Rfq8xDgdc+0yqh0Rgz12ZYoVGo90P4NekUoEiUgWCa8C5wy6wRHtVPcQFVU/TO+eQE49jkTzJ48tJ5QQnpTnt9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO7ERwx0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO7ERwx0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so90834f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774465577; x=1775070377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=AO7ERwx0xPKOU+ySTxVTRiRe5ydCrMBQJr1aDslQaeWjdSLribuvQBT017sz/ZZd7B
         l8A84bkMqxTch2sKwQrlB3/dT4WCfKhJMuezVI8dRDxhoBidfcdSIXNqbGlxWzGdLywk
         3aXA4dRRYcF+V+pyb3KCSfIimcA6tiHgTiFNdWRG1eP0sFw6ehfDqBSsr0VbTad3Vxt1
         sROLe1Xa35J91HKDcOXal33dk3j0el2heVQhRmfs+1KBi9KRVVAgXDK9mC+4sW4kFJs3
         G8ylyzAptC1IDh7ZRIhr47qsVtWQetzQ58a030ufObZoINcmjJ+/cnF+dOFXqJjXiUAT
         kfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465577; x=1775070377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=YoujwtnsUWbFXI+cAqiiVxffS8rZ40GZctyLMP9aSc8MrUW2gCunlA8KlE2dVEkHRp
         b1RMt3KvqFRl83naAPLswykhL79Sz/UvJ7vLkvPe1bga//RpV5Gv7Z+hcxXD1UWGCXN4
         SPOs8z9fN/RGE6yMGmRXecCyhmqiTZs0C6NIlK0UWpiBfw2nlG83gm6VFbTQU1MZVxCk
         59w7FNV9UQqxnJ+CGfOFFilWNeFtZ1sh0StdC+blF9hSu9CyKnOUzyoL5vzd7Nqdh3MW
         iURq4ypxiu6ZhYl/4DOaIz4bXrVtq2+ZGFDI/Xghr9YWzMdaQdCPIOOlgc6F/E8/JZQp
         AuTw==
X-Gm-Message-State: AOJu0YxePkkyT2Hl264S5UU67nXVYCatVIserQ75IrGQ3VCZtC8TSwan
	pLQN/Fy+HTIGrBH3A+gP4CBKOanofHVr9L/wacqHw2bEnYRh1W9CPMh8UYqVsM6u
X-Gm-Gg: ATEYQzzVktI7Pzt8qfcpYEwddATD5xCJ4bkd094GAAgUUHZNVl9i62e+fWTXhTStVSY
	C8AOnUm3WmhiuoCgHwZPu12gDmYT1A7WTmsQtM62nHDiY+fyTLRy0qO9HG1oroSFC2z6ytSRVdO
	Dw8RQyOwJmKZYTkCcgRMAKkffFrmRmpXhU8mF3DoApfOBWQZJ0NOx0cfZtO0zfyAVTy/CrT/RJ+
	1NQ0i472Umxg8Y8sYNPHA1/xdCdn5zaGPrSY3aD3L/9+0NUQaxOZzaLRJqEIMY0Ks9g7z1E+Ksa
	Kt7S0gMs3lsKPEPYw3G6mBHBm+aI/qEnU8VXV3+GkxH26vpcboVy4bZwJNtEdJamdfDyiNWPvup
	mPSMF8P6BJF/AYHdpmwGIMexixtEenANVGMkYsn3bb522dRPqPKDEI7oZJC8iAfgVT8sMeojAaY
	5qzi9dWS7LlSf3kj+veNBAIo/hNsDE/7RGPg==
X-Received: by 2002:a05:6000:18a8:b0:43b:464a:28de with SMTP id ffacd0b85a97d-43b8899cdb7mr6621937f8f.14.1774465577338;
        Wed, 25 Mar 2026 12:06:17 -0700 (PDT)
Received: from potato ([31.176.175.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm2090294f8f.27.2026.03.25.12.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:06:16 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: cleanup return in sdio_init()
Date: Wed, 25 Mar 2026 20:05:59 +0100
Message-ID: <20260325190601.7906-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325190601.7906-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260325190601.7906-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_init() return errno from sdio_enable_func or
sdio_set_block_size instead of _SUCCESS/_FAIL vendor-defined
macros.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 358eac0837cf..01b5d8a70072 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 release:
 	sdio_release_host(func);
 
-	if (err)
-		return _FAIL;
-	return _SUCCESS;
+	return err;
 }
 
 static void sdio_deinit(struct dvobj_priv *dvobj)
-- 
2.51.0

