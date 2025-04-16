Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488624A062
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836141; cv=none; b=mqWQiimRQrb5ZmDgWQWPNfPrlt6p1TWHMMh9HWDhhcp5jvmlAHuyh6tjakW6HXn+Nq656kXCm7JU77kM7W9QajqfUpyw8nqOCo8r30iBS2yEK44r5UZiBGMuVjoVoYwWagSJeQX0beltca1sUsMP1Z/zcDsMClx3M0IAFTo6wHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836141; c=relaxed/simple;
	bh=sm89KN7M+N+cjb4kBf0tDv/avTft4wb53ORjh52ocFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOkkUnAhCgaoY4o+R1YkIlF9PqPcGfuIkqKypo7ajhPHmCuuyYg30uCuPaex0KUtiPvjSKpRDeilUK2qwYjnTeuBbPqOLrGEs7Zl0LRF98j0swbTIWs5A/jLLA7VufnEDTLR2+ysUCiFZsJOiWqIVzuIZ1h+TVR+myr7poPxDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=VhQPztYx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="VhQPztYx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b45cso1717605ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836139; x=1745440939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=VhQPztYxToAgcjc+eV4RVOUTCyHb72F0xKhCe8K2+3/fQ4iy7taExwZarzbr7+S0Ju
         R8pzVmPMOgYHVholw7y9XxKoFjT0nZ/ImpaDOJwXDQLknKGSmUwL0negaDoJuikRct2C
         YSQf78ECjT5EZffsRVq7x6TgA4coIrBo+0mgVeOEck1WA3hskU0fOMM510czR8kZTeF6
         zix6cEV2U285L/O6j14ERVAssroZlY9/hYm6+dxfQRykdxiZU6IQKYXiIBdcf0X2r/SJ
         U3kKSYQ3ViyudG9eIgJO2klJrD5nzXFaUKmjnNwbEGjohysovtcBwZ5GcPUwlM04f+Rm
         Nv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836139; x=1745440939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=mBdCnXhPVw6VYIV14uuIf6vLrFhGIkFECW3tpn3fEPda7Wdm+eBot9lk33v3orLl/K
         PhG6xwCdN2V2RRtKvQ4S5qmIc9KGG+8iwNFIjdUfuBkOIpuOHOdtd9yN36L6xbpqqYeu
         25KUv7TI5bdqsl0uaQu6x9xPMDGCVcnfZLjc6l7Jr1+VVaphmjg4MMOm5E4b2Q/lQVZv
         qptC1HpyR5WS6Y3jEVPk6oqqMK+B76TF6Fv7efdymamz5OeCM1H9KHbSfemUqAzahWrg
         y5HnjJazE2vBWGqD2uo31YhOftWa84tfPyI0VMMFegVVyFnNsyXMdba6nrHIkk9Z/XAU
         hhjA==
X-Gm-Message-State: AOJu0Yy1OHWT8Hx2IOj6EXZnu2BYhrn31liPUEJ/+Vf6EffqswwUsrel
	OLLUbuMsKiyPjQiWJYHKsPiWEha0YJLIb6HDa58C/ofhPUFevN4hNd+itmCKxw==
X-Gm-Gg: ASbGncu3S0P+N82nFYfURwrqa3+NWSmDUHGlTyAdBBB+fs8k2qVgvvelZwrrHZXl3j5
	0LgZ7RmClMswz3cS6P2VwQd/UHJNN/N3yK5xqw3DvjKQMudqMi0DpSISH2c8ijsIwqs/zv2UJcl
	4uImiSNPrVTe4gg8h41T0qGLC/Z7VLcgSl5NrqRptABfg/bLTqBoKn9E4ua4KQJGXWu3HRVm6s0
	JbA1FEK/28/kA+OCEMVu5cHq7zPJM8KeA6OwNfGV7wu+mzsnCHRfJOaoTjdAJzWSqH05Nr6/JiR
	U4a4c9JdDWuJJn/IVhylqPr3Rqk4SqadppiWrPWsCJNN5F2+ReTbmZL7AUDa7rtAwezn4GRVSrs
	dNSJtvQ==
X-Google-Smtp-Source: AGHT+IEC1UkYosCEAC/j7pcT9vJEGJ6m1/2mfcIOPpw/u+A+HsK9Ra6AWSZTeSi34DA/3N/4QvxGwQ==
X-Received: by 2002:a17:902:ce91:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22c358c543amr44393225ad.1.1744836139287;
        Wed, 16 Apr 2025 13:42:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33faac7asm18797245ad.137.2025.04.16.13.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 10/18] staging: gpib: hp_82335: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:56 +0000
Message-ID: <20250416204204.8009-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 319b7f6e35ec..7f14ecb46026 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -180,7 +180,7 @@ static void hp82335_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp82335_interface = {
+static struct gpib_interface hp82335_interface = {
 	.name = "hp82335",
 	.attach = hp82335_attach,
 	.detach = hp82335_detach,
-- 
2.43.0

