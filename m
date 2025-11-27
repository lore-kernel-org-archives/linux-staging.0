Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AC312812
	for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238283; cv=none; b=Wdsy/PDRI4ue4eV9VrnHaepLcMg9UVRDWKxMxzfwrZXNCvU6Jo8GZ2DeqWzF7P2h8bmPbyUWqznqrK0j/f+iV/NMYa2YHprXraKjS3qELy8l+tjF9vlx2hliC6B2zGCzCXfCfrs24SGeVxzzZyUWRFSqqnjU7I3sBQk6wTYTJ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238283; c=relaxed/simple;
	bh=5NSCGaNFvnqJmXF0CjSsu22H1Kp8ZT/86iyV9slCgoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Thc2H4v6AqiTsIVcRlpbqDM8xR5szVH3kQZKgwLbyZx8yUzxiOoVJp2ShEFAARgmLgziLOP5Et7InzCXvkw60lD/q7CYICgRMaA+b0996SLbY8laE44xEjIiSa910vLdKOsb88tnn5GU3EBXSiQLoX5R7PNGkK3sfBMDuGXiXcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld2IEmMi; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld2IEmMi"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so1264730a12.3
        for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 02:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764238279; x=1764843079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEdArF0vhr8ihvRRV+War+yNNdhxS9UAOqaT/dQlCME=;
        b=ld2IEmMiNLVSVt9wp3HuIc370q+SFYuqM2imoJZwaNg4OhK+izCpUnlv+0u60TC4SH
         GaSRQ4uMz6J1x0pZhQSRO2IhJvs16xs+/jzIqeSLyMhX7ckftHo+zXLKhk4Z4AmMXGxi
         UYDXOUhVO7d2dMwkM8944lmT1YFPZF/L/KzK4vk+nnp+8Fww69sNtPC9BEa+mQniW2Ge
         BL8vdtL0t8dGjqQuDRL3WjfbJaHObxsC+8UXCo91Dcbro6HmmQ6SbeNrlDYuV04C0q8s
         8bp/ynLBod3KIOA6kXWgeM6aqXYKAxh3v5cDMg0yKK2vs3vNfgDeCvmJklsLY2YdqWB3
         XfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238279; x=1764843079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEdArF0vhr8ihvRRV+War+yNNdhxS9UAOqaT/dQlCME=;
        b=VuWongG/Aov3yGv4FGi9La3I1MZecscYG7xsW8PHORxPTNM+0F7ejeeG2s07qHu9zl
         LLFqOgjLTRkfYXQ5ce6juo4ftV+u2yDjSj8AfIa5hyyKlUFrQDAod1SyRyBK8Jqeg/bG
         bef7xcy9kiUCT3rxzGNl4DYsuc1kIB2copxIkM6I8P4mFiixMOnpyaj7oKTynw+RS1AH
         rESG9Qaikey5IqoPgxcGsc2u4wyNT3rezsuhvf5VoX0C0/d2RDmOk7sgnclPevPj/315
         ca8hRg0Eg9k7/MOK9mYaXe8gL9GmuKzetLIJF2jFIUINkmnCkibPAPDiN/fQSqDxxBoe
         T1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCScByaeh+PAHhxqtsSH4f8+znp3b0QvsfyJ443koK3fxjdXX4FIUnoaCWk/mmEBR+eNpwrAflUl5FXwHv@lists.linux.dev
X-Gm-Message-State: AOJu0YykqCIA5MwmDYM6sqQHhYIVUxS05W7N+5zX7Xixi45xNhGVJQ6O
	XRkakZ/thwHFIeXC2DPJ/Ovut0bPAzKf0cVzy1RoMGUwGC2hmH0qbU7/
X-Gm-Gg: ASbGnctLTC4lxTLWtZw80HMKI1aRigfFjGyyRTmeIqzHvOgXEY+0nTm7UY0PfjcMueR
	VXw5JkoPanxIUyHDq6+tBikUg4PaUlpjMWZ1lDC127wLmSv/vTXFgMBUffqTVflmNNyqkftgV8c
	zZVqFiwYl7j3TS8HjTCto9cHtuvAWUYoS1EMxqSpWPOGjFfl9VMqdv79TSURIIkiUlgQTdrD+jB
	J203BdvpkRDqOi2S58XliqMjYqkX9eJdmrxcLtLgoTd+rTg9sDXvPZ4voWBHfHBlS2GeCYYm7Xw
	deJDs2oOWaFrEP6KenH+E26WGBswSS3yn+1jdJeOpqoMHwBm4Ad+4YRvZzadzMbDcYo/B62na5Y
	tkRTUWTe4l4iw2OxdTN8jLIQaL+I+BvyT9WrBVKo8/Z0Vg1nHPEKQOqlkRxAmuYh3i7LJpm4F8W
	RH1lwhHCFVf7+t3+BSNe6FrjgNn/KizVrouGbWWsaTklAbCIwbCQz0
X-Google-Smtp-Source: AGHT+IGuFIcRLDHi3UqszrR65OZ6YtmdQwU1F56/Mo7y3x16r3ff/vQOXKnwX/dQi8STJ02nNgFfBg==
X-Received: by 2002:a17:907:d86:b0:b76:5393:c895 with SMTP id a640c23a62f3a-b76715142d4mr2506544266b.11.1764238279370;
        Thu, 27 Nov 2025 02:11:19 -0800 (PST)
Received: from arch-linux (178.42.50.207.ipv4.supernova.orange.pl. [178.42.50.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f516a6c1sm123508266b.13.2025.11.27.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:11:18 -0800 (PST)
From: Tomasz Sadowski <tsdwski@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Sadowski <tsdwski@gmail.com>
Subject: [PATCH v3] staging: fluke_gpib: use kzalloc instead of kmalloc + memset
Date: Thu, 27 Nov 2025 10:58:49 +0100
Message-ID: <20251127101055.8771-1-tsdwski@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kzalloc() instead of kmalloc() + memset() to simplify memory allocation.

Also use sizeof(*board->private_data) instead of repeating the struct name.
This avoids duplication and keeps the code correct if the struct name
changes in the future.

Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
---
v3:
 - Move version history below "---"

v2:
 - Add proper commit description
 - No changes in patch

 drivers/staging/gpib/eastwood/fluke_gpib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3ae848e3f738..2b6ba7882dba 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -853,11 +853,10 @@ static int fluke_allocate_private(struct gpib_board *board)
 {
 	struct fluke_priv *priv;
 
-	board->private_data = kmalloc(sizeof(struct fluke_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	priv = board->private_data;
-	memset(priv, 0, sizeof(struct fluke_priv));
 	init_nec7210_private(&priv->nec7210_priv);
 	priv->dma_buffer_size = 0x7ff;
 	priv->dma_buffer = kmalloc(priv->dma_buffer_size, GFP_KERNEL);
-- 
2.52.0

