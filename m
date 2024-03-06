Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC9612BEAC;
	Thu,  7 Mar 2024 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818198; cv=none; b=Q3fz91oAJW9E5ltlzsjGWWKABTfDBI5HaVHuLgPGrwsbrj3djvq1gr0Rlb/E/f/zEkzChf/71xGE+vbgrmIGBsFy9zp3SfjaWJRLNC9MoJcMYX7M8OJAtCgbUVi4JqRA5s4Xcgqamth+sT/aTIVaoCxHRf85J6iOPYuDkak5FIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818198; c=relaxed/simple;
	bh=ibepIF9bXfxjJy8ubk2guzvC9i4eiSZBntOXeHT4GUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LQ+82JC5PPI1lpmLBlXXbs2rJ38Wwlp/Xv6gD9H9Awc8fprNLNXwELoITPpEcDqDlTEfjnNzxJ9XyxXTRcVeyIaKc8xMQGkZz/Nw1CMzFbLyszKXgxY5mNYOlUo50MF9+98km0zRQJPt6deFCxmGeaU+cp12glJRjMmTTg0eYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MK31LBde; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MK31LBde"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5131c0691feso1167765e87.1;
        Thu, 07 Mar 2024 05:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818194; x=1710422994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ab+A71aFeT1V+oIJ6gmm66uFPixnoZbmgTSddbK5Ns=;
        b=MK31LBdetUwaAOtsw96/DavEjaaJv57/8MzVsmHrbE/5EndfZxp4hNwHBtfvn1m0L7
         zYykKp2WjHmGYco5ZW231f9DjI8u2Vmo5r/1UXevyj8M3cB2/nbbLi5y3J9XAo18ZCGF
         +2XEHHB4R9bOzHSA13jrLLzIqV4KnGigpSydJWibWahTxm/tHhYDHfozUjxw0S2AJC5a
         skxSk0Vm3Rk1hwBEFELMNDknqoa8nYgnk3RE3SlS8r6pA/yomQprbMO6RK9EC6SNescY
         ox0CNUEonFXHoVlxP9OtwhdOiOp1UOcyx2LjwNV980Dql73E19oewB8tlm4uJ+H0mj6n
         cxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818194; x=1710422994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ab+A71aFeT1V+oIJ6gmm66uFPixnoZbmgTSddbK5Ns=;
        b=wSa1XsKRIIWcWvp19Iahpov7P3BDPSKAQzIehA8jJK9/qYcvOpeHsYI/+hqrutmI3Y
         sdUnUIN8LXlbARpHZwWdzhyRwNSW5KsOj9/8PuHka2LBDwOeThiQQTE5OZ8KnL9TbKXp
         fpCmuyFuDZCtau5jnkNQnRnEepzTSP17RsZu7jpwZl3q6Rea1Vt5myggPuSfAzAqANLg
         MgFL7ungRg+edSNrGg0QN4kRsu67SLwoi5Kj3PwriGmYFBuX7lJ8KDxDPEM7UK20EZ+8
         ZxOn1tXKw/8X/Ff5p/G5yWJ5o92NO992a2y41jMZ6J79XsZZLYLuVPE4/LPdCf7BSKk/
         4baw==
X-Forwarded-Encrypted: i=1; AJvYcCWa6jqeTAyJ5/5jvRq4hKBV1O7swXEnlB45pjswsXYGhRbXvQQBswm7r7OETAn27e4+31wW4yQ/hK7BiikeVch/EI3OSSO9ur/zquzG52EDgLeoiT1ukVk7SFMLe+zE1/OTqetJUyGdTQ==
X-Gm-Message-State: AOJu0YxJJBjTMUrEFNY9qoNrg+Wxx0vryo2/sVTIx7Ek9/SlWgeSpsUs
	SESBz42UxiTdbLCsxrOWA2cXB30NjQBDEOG2N2t6PyXrlir9Bf7F
X-Google-Smtp-Source: AGHT+IFPyUdz2m6aXQfPNl9+vq4/YahzJNwOCwVohg6tfo8iZqsW6+/kuvbf8rHccxgLHEsXKyLNnw==
X-Received: by 2002:a05:6512:3488:b0:512:d830:358c with SMTP id v8-20020a056512348800b00512d830358cmr1299945lfr.49.1709818194276;
        Thu, 07 Mar 2024 05:29:54 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:53 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 8/8] Revert "Staging: sm750fb: Rename variable sii164GetDeviceID"
Date: Wed,  6 Mar 2024 05:44:58 +0000
Message-Id: <20240306054458.102288-9-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 30c83463c8dcdc808d4f10d44c5a4f19d3b5f1f4.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Compiled the kernel

V3: Reverted a commit in this commit 

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 6fef1ab484c1..c572967bcd1a 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164_get_device_id,
+		.get_device_id = sii164GetDeviceID,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
--
2.25.1

