Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420601C84D3
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 19:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739563011; cv=none; b=ZmYOW1UIwnEF6kOxR+9rF8BFC10rmFIsSH3czbFho77pe1L6iGOvLbX51Twy+hJvxJX5HgBSZPEm8pP+vwt2dEG8vZusF+9LaH/HXsf4qgK/Zf8QU5YS3XrhGD8sXL1gVTWtKczaZ4jI8z/L0IsEy4064Kmbc8yU6sMdsbD6bPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739563011; c=relaxed/simple;
	bh=YBwPeQCDJxOHmq/Co+incHBL3UWPQ6vi3ncG/nUGZ8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwHGQUKPmAyYkTjS18YuCU36QrhWN07w6DNHE+YscBklL+JyDmNqRrL4EMCbaEpMm2PvRfZxyt0d+UpOxNM9uk+kqc+7Sl/SoLCr0eZtlrFtufvoF5EmHOnfotq1+82gyBLghFCOyiwWUYdEh6l72qWw/hSzph89z1rN1f/OODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoAgcmGO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoAgcmGO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc29ac55b5so297061a91.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739563009; x=1740167809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZe63HKM8wngZcB9fftBtwVVvlWOpcDUXEwsaiq1API=;
        b=aoAgcmGOVyoyWCOBQM7njlT7GZk3kXjHDSr7k+KTvHARQTzHEGu2/WEUwWxdrjb5w7
         UMXUZRmPZmmsYRP7w99698N0ZDY8ftAH354iFW4HO7id3a8MMlOjQcnnqBwDZwP6LvM2
         9s+LZ6yr+2lqw5svgnyteoL+w+4ssrcDYR25p7z8zU00Rd6AGt3RK2KD2uyW7L6EJH9T
         weKiKlqIb5tixizsjRfKLzlva3e4eIk8oRMllWEpm+z7nVgEjGNo5QThi3+zkjku1lj0
         E6vkwbTa1rIsNdZ1U9SB5YinFSn5bh3bM5BjGY9Z+msGoaoCewSB/CVPwiIPPPT3bTRG
         YI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739563009; x=1740167809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZe63HKM8wngZcB9fftBtwVVvlWOpcDUXEwsaiq1API=;
        b=sySyVV1UHZ7fKaX4c10AOYMwgjtBZ6qyug13XG3AgXQIUCDgW68gUAwcjohRopAimQ
         MHrELq7SSeFy6ZIFNQOk3NbwHDggcKoYMuFSndyNdyHSTSzyQUGcXF1bBrrYU6j/7kPB
         QzrzSIaTNlGlYn+eT2QeSim4DcVGfnJRjy90MjQF9zoSw6muEeRm8197ZRVJjOlxa9FP
         l2ypaTnkjFLakFfFzLjli5om/MyxjfkDVJxhxiW75aHbkz/MNv5O/N4PCNlc9tRy7Y+2
         jIrbaCuMWWS4EacwIkqkSB6Xw3XWlDqk3rYyG4i3PBFT0UhV32oYM9iREiEz+05AfDw1
         HYdQ==
X-Gm-Message-State: AOJu0Yxs+FX6bzAb70K3ukrMxblKSslhF7Gl/HFnDCzt5W2x+3jZJbZR
	b5OKtldFcd/0rXQ0ArKhEY11JtAo1YZUiGUAPiJZuZCdmPc+JbNshawu2VMz
X-Gm-Gg: ASbGnctFrSq8p/7WjgobV6R8P6GClqz7WrdpE7qdyuFcELBr9VvslEqRZKY5GyGiwjo
	usSBK0LXUOSJCZFvbH378m4YoBjQeXiwOaW/5GIYZ+9JwcCD5crppdaTFgr3DzMKOk3Fsl7pt2s
	2zMObF41rp2YT/n3Ck1mRxk6XAv4OdkafqL4OrigN1e7uV3YYPOzTbSbwub7zr46CggQ5xeSpUa
	WqIAD3VF2sMs6mt1mB+V2QH5qfXHe1dzA9w5CXxmOFHoPjeZBnTAYZsimenWkdH2O7EtuJv2vjZ
	Ny+2lnhU5EiTZjNTAYj6mlOdGveVwQA=
X-Google-Smtp-Source: AGHT+IG+/GJB7UKuBoebjGFibYJBhi5i0M3ekF7jrMwSS7Pg5F3IV+gTj1kHaiZigFpU3lR6DmIt7w==
X-Received: by 2002:a05:6a00:3e0c:b0:72a:a7a4:99ca with SMTP id d2e1a72fcca58-73261778caamr439948b3a.2.1739563009122;
        Fri, 14 Feb 2025 11:56:49 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73249fe96b4sm2670530b3a.75.2025.02.14.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:56:48 -0800 (PST)
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
Subject: [PATCH v2 5/5] staging: gpib: ines: remove unused variable
Date: Fri, 14 Feb 2025 16:54:48 -0300
Message-ID: <20250214195456.104075-11-gascoar@gmail.com>
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

Remove unused variable 'nec_priv' in function 'ines_line_status'.

This change removes the following warning:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v2: no changes in this patch.

 drivers/staging/gpib/ines/ines_gpib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 22a05a287bce..ba07dfb0697a 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -26,10 +26,8 @@ int ines_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bcm_bits;
 	struct ines_priv *ines_priv;
-	struct nec7210_priv *nec_priv;
 
 	ines_priv = board->private_data;
-	nec_priv = &ines_priv->nec7210_priv;
 
 	bcm_bits = ines_inb(ines_priv, BUS_CONTROL_MONITOR);
 
-- 
2.48.1

