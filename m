Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB51C84D1
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562960; cv=none; b=WtBSvnM422LR4PqROC7XQ4TjaQFuR+0VxRnt44yCSwtrmYW6uzYJ5W/SR8RGajUFcG/fhgQFw9WH2VkmRc0xwnTwmbx62S/572aa+7DMIrzvTWBd3Zp6pJSRyeKF5S0RXSu93bXlQR3AvCm80Tu1kyhdny1Gbg5+zZzrMLBUSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562960; c=relaxed/simple;
	bh=K7bYDqnR9vXpWMpWttOaWLLbXoQP6llK5irYRI+EMaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=la696MX9kq39yD4Cbr9fgFnhqr/wFKxoJ2XPW9HvvkJ/23g/5npHnXUFK9ZrfdKeFXMBnM9eKOdUCEbtdQUNEXUOw+dGfGl9/QONqJzsnCxsfwnghbFb7Vvq3bQFfF87tvjEc6eKXFhlqtfQ6HJqMT6lgilZmbQUoVrBF7KlbrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ54p62S; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ54p62S"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so538348a91.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739562958; x=1740167758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8eFD8Y0Jdwt006d6ZGfmM2mEuwTtejAwkszA51XpJo=;
        b=KQ54p62S9C1aP8z/PPto7AWdXULlxdQgeQYPYFj6xriGP6mhAJMOFbinlnFhou8JvJ
         p+gJiV3NRF+nXbhz9BdSi38X+akb5IRa4AefHLRgYkEI4H/C3M3dz5e+Ju7sftK2Wg0q
         sRBvDvTMa6sQKsQE5VO6MjdvaDRfJEHzMJcrTynTXlhELG9SHGIogK0v3kGtgW6n04Fb
         4KaCEVMsk6ejZcsbhtxSiqwLp98MafWtt1jNleJL+2JDLAYhReYKyGrYKNdnZmM51Z38
         x0ugtma89I79gIR6RU0Akpd+rpOfEq57MTzcznZUFZ5wBBxV0h1hQj1y4nJIi3irTsSr
         +vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739562958; x=1740167758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8eFD8Y0Jdwt006d6ZGfmM2mEuwTtejAwkszA51XpJo=;
        b=fJGPZzk13Rt7Sj6+fbC4aJAK1qJUd7DJYx+htZany96VHX5Sj2UruHLxwJlH5uTuDF
         cyx4eyYvOQoa23Wv+CqAJADT9p8cngAb4Cl9yYqsEmzfMSrZ+d+fYB+qYE1Y2qwg/ClS
         tp8REKhi6QzAh8QQZyL+UWeVtJgv61T2/BlDaf1Ay0JfzD/y0xxYJzT/yi2CO0nnfa2G
         MZME0rWxG5LwrIcxucNqAlSLmbrf/Xeg8+pmB0oYJp8CuAsbrnr99ncw/a2KzQTFn4/u
         +KhgGwjaQ6dUtvxHWq1aqG4WGUsOli8HATvhku26M/3MlwjALQP8Ajv0r+7FDpuJrFjP
         HATg==
X-Gm-Message-State: AOJu0YyEulMVF/945dd3tQDcp2UPnWslb1gST6dmJ9vuPYqpv4atB5Qt
	+DX1c4PhnhRGu6sykjzSAh7R4lME4bxCZZyJXywRIcXm0Q2QorKItTQB/0O7
X-Gm-Gg: ASbGnctWFR5hS76rLurLz3PAZd5GuBWH2JvteTbeVQnzsqaubvyf0C3f11OoCq0H3jt
	2FlyEf/r97PS6onSqT2Dzp9/b7BmdjvzkjIiuoRe5d8vnGNt2TTfTSNqpAfHpOUh7+Vrwpx6Tpx
	VAFe1L/eW//AfRk5WFunWZMhtqddKJnyBt2sGb3Gc4L82MU7jrTrTxUC1E5jtqaEe4FDOCCnn/u
	BKu/j7GVarK9F4lYb8uOfiIkKrPxEpk7Y7F+Jbq+4LUyTmdRVmHpJYvE1Caob2080wZHy1Q7iyI
	iWtqjPUhgaT2wx0lbgQMwD8WLqUBfLc=
X-Google-Smtp-Source: AGHT+IEDvxqpJwfdkwb18JB4Bmp8msqxbfmJy94sOkKiuSkAxnIjXU1DN01E3qa2U1W6sH9l5reYuQ==
X-Received: by 2002:a05:6a00:3e24:b0:730:83c1:1f79 with SMTP id d2e1a72fcca58-732618d733bmr422885b3a.3.1739562958288;
        Fri, 14 Feb 2025 11:55:58 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73249fe96b4sm2670530b3a.75.2025.02.14.11.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:55:57 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 2/5] staging: gpib: eastwood: remove unused variable
Date: Fri, 14 Feb 2025 16:54:42 -0300
Message-ID: <20250214195456.104075-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214195456.104075-1-gascoar@gmail.com>
References: <20250214195456.104075-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'nec_priv' in function 'fluke_line_status'.

This removes the following warning found compiling with W=1:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v2: no changes in this patch.

 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index d5b1a03abf11..65bb79a8fd3c 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -194,10 +194,8 @@ static int fluke_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct fluke_priv *e_priv;
-	struct nec7210_priv *nec_priv;
 
 	e_priv = board->private_data;
-	nec_priv = &e_priv->nec7210_priv;
 
 	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.48.1

