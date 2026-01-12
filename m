Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF831427A
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 04:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192512; cv=none; b=h1EEbkmDR2xDhky/FmfZQQwKDLWF3paEIP31HsbZkXuejjNqJBoGPrC8xTUkeBsSoOvYvaWlGRJ+IYikXbywBvOrY/gnRf+SHO6RYsoFYpA5v+zx3lQtpZqx2U/vLDQzuedJ7/JHQ7ygMdnyjuLOY2Fwet9eRx0WBuwFb21bRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192512; c=relaxed/simple;
	bh=eZraGxaGB7rjGUoHxTKNhycBWO5L1f0N+6RwLjML5KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbpnWm6jn44i02963Yl0O2nPai3fwMeogQSHWkMmquDAHGaPPrJvE/18HjqUXjgRfY7KkhprR+0at9dVnkygXi8J6WBvnbK1c8+ELWSfnymi1GFhDWDGhpMO/DigOlbiPlDPxDM57k8uDvFzzAuqSSW+uVl2vEN57ZSnRwigWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8ypMrOm; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8ypMrOm"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-81df6a302b1so2337594b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 20:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768192498; x=1768797298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXayVpLq7/epO98Ha5XVM/DDxYlSMQ8bI/HLoVZTKfQ=;
        b=G8ypMrOmo+gSm3sdcz72BgfYJG+mIsBOp2iRM85HZUtouael8cDbm8s/bLcKrJrIQj
         ++UtUPpoY0jlQ5MtsKGTa8n9gXn217/Sw6BLzzJLTgNRZdfsOrlZSHyc4DrhTUR9tymv
         mWaYtMWjG+IwmV58NYLOLV3nletDjfOCvtr9bfqAOkGuYBQOYn0sQpJZDHw7EFxpM65x
         8vuQl9iKy50z0HdW0vZqfGRBlk3ODTDUEHZRfyEfkBZ+dDX524UkZMari2Esdee88YI4
         DpUKroxJ9quboJjUzIY6ieBM2hTYmvFIwVUk+JHiQM4Ww4AgDfn1zrcW4zt3LEkUHedJ
         Vj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768192498; x=1768797298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXayVpLq7/epO98Ha5XVM/DDxYlSMQ8bI/HLoVZTKfQ=;
        b=wGdlSwhiUGQsPh/gbWlWPCS90PbfwN3ZrciBHykSlkEldB6LjXnZOdZhhIs00vJVPm
         QWGASADyS8+jbLYCyge8f6JcIXPVTujASadpSW09slrM59S6Jl8fXGw83UnjyeUvsgBX
         e1LuICWHK7WdZmc5xf7YSvispFumpFHXJX27e8EADksA0gNqq4WNzTo/HxEJJPRzLLfm
         pTPupHHrheTqf3mp0Mr50QZBBnVwHQm9Mi1OGxiEjZOkaX/SRiE0ooLFQNJ8rsYHqjo/
         F7jryrQu5nX5kdfpPX0vENUsbt9p0yLjudjvvz8xcagDVdiQmqDahf4Wq+qhXx8s2mDz
         rkyw==
X-Forwarded-Encrypted: i=1; AJvYcCXT/Ipz+khFQbrmgiRlUd8riX75Ts+uhkqAQRSLDzQTfsL0RCWzgiig9vtZ8fhAUBv+e9Q+ggVKZXrW/O/6@lists.linux.dev
X-Gm-Message-State: AOJu0YxfNZX1YH+bvcK/owGhQzRLMcYqbciNhZhf8ghQR7Zb8a+h9YeY
	BKP2Wf+/wy7XRk0O26kp27i+Tzjh3EKkfdT49FcFKNpICMs4KLUMOzAH
X-Gm-Gg: AY/fxX65Yz3UTxLAdVrpM8Kt5QqURDdmDX655wa532lm3g3JK/TISghgUWlVekRS4GW
	b4T/IokILR8fKAxRmpfr6OUEyUbzxaNryiUgnwhZ1NbOVnLM8cVXrIhEgmazG0Z20eMOTKI0UmX
	Z8tr8s/LB3LcUTwJSStRve9/RH/Hl1SEP635SiA7KYk2qIyuUIxeLZYRfAJYH/6gyQRnATSA1jf
	RMaJ6gMqtRVUMuZvnhaCY/pXNTSQR5LCZajbyGdJ/1eb7+MiL6u7QwgcknW8cvkBKaTY4EC7odw
	+s8CVEx3s8Tw0DnMzExcGydU1hEYlHjQfLw8AeGSn/w8CBJ0Ntj3j3fXzhsmXZP7JVxnfif742v
	fZLmOiqzE8r8zVTKMFzBEX7615YNth1V3OB9+M30mdlO0ZQ3tl66kFdwnas4LdIO0n9cw2ift4E
	o/o1gimfl4ew8gIf52T3a+
X-Google-Smtp-Source: AGHT+IGOJIlBcXkgdEz+Ia7NTvJuEW1+pMeWGxPp5ZsEKSincjlpBxQSn+oZRe4xaLZSITvTXb4rAQ==
X-Received: by 2002:a05:6a00:451c:b0:81a:a5fc:b1d8 with SMTP id d2e1a72fcca58-81b7d2601c2mr13460413b3a.9.1768192498491;
        Sun, 11 Jan 2026 20:34:58 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm5418655b3a.48.2026.01.11.20.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:34:58 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: expand multiple assignment into separate statements
Date: Mon, 12 Jan 2026 04:34:29 +0000
Message-ID: <20260112043429.42615-5-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split multiple assignments in a single line into separate statements in
osdep_service.c to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c490de437bf1..c082a0359064 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.43.0

