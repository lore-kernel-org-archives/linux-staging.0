Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E62FF169
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172520; cv=none; b=TgOFlkXQJmIhz/PHlMb7gjdezFTEWUNz3WBmXe/imf7d7K+zGw5DSwfEEQ+cEX0A/VQpZB0QYjM8WIHT/3l29MbJjOwFRSKqtyQh5wK1crhBR54qs1N0m9iF6nmmuo+HxNlWxMvLwnb8o7bOh5Ru41lu3oRM6YAr/riYGWSon10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172520; c=relaxed/simple;
	bh=oIc6d2LlQO3UfiYzLsgNESi2ksb3+2Dq7FBVlE4XtEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/aIH0O2SPUYY/najYBukmDaITWDDhO5B6k8Y/cHsoL+zyJn5aIQSL+VBm1TiTttkXMy0r1lW03eyGCoIadEJ3kT2Mr7Z0BEJXAg1AcDq+zd19st+r1+kbZIwALY7y3PoVIG09D+PJXjKuv4fs2iZ+L9BF5FYxeGslDsWeIJtMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPnhYC+w; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPnhYC+w"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so10425877a12.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172517; x=1764777317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6ymbr1nGlfuDVt8qf0Mxub6qmg5Zen1rYczCu9krm4=;
        b=kPnhYC+wUGrv39ENt4T3AYAZ1PLHoDC3weDW17QhwfoAAZzIznFJOwBVKcPAJZi24f
         qSw7jz9BlBp1GejjtcrmYO4G/sNpseFhRSXNxGbYz/9ptJRUmGu0hGkJu50OTM8s4Vyk
         ssHsG8RPmwJwtCtIe99ogo2ZvNVmD78NtOj/bYIo5jRGNEPE/X9IOTuUpeudQYAan4ye
         rab5cnN9QifF3CHUu92eRVpfw3beWlzbIAw/K3MeZOnLP79Ln3RB68zCqdO7iVFuKkFe
         fU8Xg5/F2RIWSi/wmQxM05bDsKRsE8rXq4yxZdfdGE6XAfSeJ5AocTUGI7zTFIiNrRnD
         LkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172517; x=1764777317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6ymbr1nGlfuDVt8qf0Mxub6qmg5Zen1rYczCu9krm4=;
        b=KiWlV4/nTqurRLIlZQBN6WEzPFwrjK5khcx61fLB5PFSG+T33C6oi3sD0A7bARJETa
         SoCm89FTt+1TiLkQTeWjbvi/ywmSZuqEl5uSqKZDNWgpLZ7Hteu+Q/YirYHxrr3U4kJa
         zrQ4Raz/2aTpY7194fzEHmBgRaQPYpP0dBgGWWQSNMinNUL0CB9cNPgmcik1mo/J7Rhw
         k3t7ZRO1MOCKLOGPLXLVOPVM4DW5p8WQ09Pv3awsrCGyNVXvaa4f2YTFoNS8OAnXg4L2
         ib9kTSXrSiohCxEy9wGYP1cXwf+L+EfbvwQOjHPR05eqDxDudndQ95ziHbBBtSR5u0Il
         +T5A==
X-Forwarded-Encrypted: i=1; AJvYcCVVIVGEL0lzAFvTZugoq2wewTrglP0BTzFxZOClMFMf/Mik6mMrhmlh6YQPJxirotn4CUi2SE8wB2sFlfjX@lists.linux.dev
X-Gm-Message-State: AOJu0YwCE4tszZ5vffQEf3TuLbw+xzx7USwkHv8mymzLXcHUNmBliXz3
	CzhLHJluOdRcZ4JXBYWcTyF6WxAqBz5qvtMbXZ9f6eIoLsU0TIjUtQQy
X-Gm-Gg: ASbGncvEHjOQrOEbXISviGq0YdEo+6RIscstZ9e9+ZUwJliOM6chM/BNuxEI+6/vuNe
	86DWDXXs1S1OXqg557ARl1C6GTZh48DeY/GG/3ogeKScXkMGNHSqqardxSrkRxk5r0YzYCyRfF4
	mKRacL0n+dMpL/jXC3mjYyPfje/tbXiX2mlB2pusq6TUwXcT6JUduBJ3UinCWI++XAi9NOVtCiJ
	tAYpBmHi5EPQtbq1RnY9EmUINykktAWJ6AIlmBwcj7FQryPVWVUsOG/OqaLvJ06FnvdGeqkREpT
	F9mKtJAL/asOpsD0hjBRGT3xn5Tr+qrnY8vDiIabFuo/y9WbeXuZa8tI6vOGOgpSkeQR9rvwhYc
	y/19EYYWq79SnhKcJZf56E862sOqb1VvSnIM7aboOaUkEkzhoEyt2AxT/+scPbAeD9zdfS3GKkS
	j7B5S/Zj+2wd2q1+wn5OmJQgcKnLLzm/0ruhoGPg==
X-Google-Smtp-Source: AGHT+IGM6F/j3/Ul1lTRLpDEuj3a+kx6uuXA8Z1zCQBsx5UcvlajM9BABOfT9EMpGFoqsRpglxqJhA==
X-Received: by 2002:a17:907:d8c:b0:b3b:5fe6:577a with SMTP id a640c23a62f3a-b7671549d93mr1926058666b.8.1764172516966;
        Wed, 26 Nov 2025 07:55:16 -0800 (PST)
Received: from arch-linux (178.42.50.207.ipv4.supernova.orange.pl. [178.42.50.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4e8esm1905950666b.41.2025.11.26.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:55:16 -0800 (PST)
From: Tomasz Sadowski <tsdwski@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Sadowski <tsdwski@gmail.com>
Subject: [PATCH] staging: fluke_gpib: use kzalloc instead of kmalloc + memset
Date: Wed, 26 Nov 2025 16:48:52 +0100
Message-ID: <20251126155453.45178-1-tsdwski@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2025112636-planner-straw-a530@gregkh>
References: <2025112636-planner-straw-a530@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> You did not specify a description of why the patch is needed, or
> possibly, any description at all, in the email body. [...]

Thanks, the commit message now includes a proper description.
The patch itself has not changed.

I also realized that the previous subject line might have been incorrect.
The correct subject should be:

    staging: gpib: eastwood: use kzalloc instead of kmalloc + memset

Use kzalloc() instead of kmalloc() + memset() to simplify memory allocation.

Also use sizeof(*board->private_data) instead of repeating the struct name.
This avoids duplication and keeps the code correct if the struct name
changes in the future.

Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
---
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

