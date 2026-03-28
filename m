Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2558345CA3
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726073; cv=none; b=BPhBVU21DI1ZOD51YX31cRNjHAuiW3Dzo3KLWN4Gebq/ns1zof/LEn81K1L3s7/KrHXMCyh/702t4pfhMxofXQ38GyVGJERjp5DMeyGh2nSelPPPPv1KPyzYsqMJE3O/GWFTk23tnA2miaiN7jop0yOW7xijbO2SBl5st8bnh+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726073; c=relaxed/simple;
	bh=VCjYkJlHt2KeassIJGy2N0LBPr08lc0SqtKIK+BsqKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebfXuCpzWGaoW+qDM8QNEovrjb/5W+BVfGPLOB66oTI63u3eUzhbxvSqE7hFjxtHCApkhNOPJhVDDoRR933REty1Id2wUDkOJNA2BTRFhVlXJ1CqCxGmxbf9m5dTDCgKHqVJmEvhsdhvOcsHtcvBsdV7P1LwwKOAUZrk3G8p6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgLlrv64; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgLlrv64"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66a87eb232bso5259838a12.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774726070; x=1775330870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HJqgHNS0jccRam77IAJrO7UQzaoX2UBlCisSbr01r0=;
        b=fgLlrv64CNUWRymt+gjeo4iqi3r0amAlMG+wkErglNXJaio7l4QqvEjRMa8NXl5kvu
         qGItzbjv86f+ocFWWQ5iMUEgRwrftQBnwCsmSTau95MOKMujCFvCIZqIYvmglZl0qtr5
         6KtOpFxXp5sQN8Lr2itkrDnNHOx/B5PP69TGNb8DgtXV43gRNg3VZ1cnMiBWCmd2mbWN
         8illDOVyxnNLdjj12phK7aVM/IMOxfQ0Ze5FB8jwnZNiScQBACoGn9CzA70pjQE+GgTZ
         2dZuR7vXSymW3QUfY6zzRCMt31PCoFuzHJAEI8RpoCM2PmXk3H5zpDV7pa1uDnwZsZCh
         LmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726070; x=1775330870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HJqgHNS0jccRam77IAJrO7UQzaoX2UBlCisSbr01r0=;
        b=EqjzXkzh2wzzVjljg5GT6vR/AkUnUJJmGaGTTXS9yw4YatCOIYIl0O/9iOdLdYCNMR
         T+KkIWeRGbs0LTAXuOD2nMotSvm3n0ON7mn0kzb8i6HkNm1RAyHK9qbfkqwjskdJJ5Pi
         Wx/9ruUN1M2Ccm+/4uOLvo/s32yEw0E12YpRnMnZzKdG5h8XcpBcFCvoh6UkB1dtlpc7
         MospHIgVCciYEo57Q0Lx8+jutGESQvkkNVUT0akI3fltoBBKC2TumjZwajDh0KImbVqn
         TGrRCBjgD8gSub2v3/5UzNc9hR2fMdgRWigegILZuad3sWQIgIrbPs5CZq9DyNVwPLUx
         6JrA==
X-Gm-Message-State: AOJu0YyBzLrgm+FLP03o0DwIMTBGdX1DDmDRwOEbHPk95wTv1s/NlvWx
	+RhlHRiZP8vGzs5nKjSp7sNLafYb6J1Lt+v9dPcMbNnvfp59M7NKlu067EC+oly1
X-Gm-Gg: ATEYQzwvgLZEz7vkEyMR11ABQrjuGTt+M+UwYhfXtu3E7lVZ0Al0M+nFS/hLCWK+P07
	CCkKDhvpmNfaTw6sQPz/H9uc1SKDuInSst54c+NWeLf53bPCybuS0kZVPzGkcWmGl71Ib7QGFAU
	Lzw4kvk/sWgWWUCNGo6bk1+nXIQFdXqxcwSPvGl/hNCxCSqAYuC3BMJkaqv1flmmrRS9D/yTi81
	IMc9977DM8FL7WVNv8fpF0lwPwBwwQcCDWQb3vGiovCi6TMOODgRIN26XCAVT42mPxyyBaso88R
	s83edHn197XTDARxZrvqaKYrLoawNplJx0FwXC40hhhCZkZjnYlUOPI0NGYG9TfBO/H6OFamNPk
	Ixa21DAOGVUrVst6G0gf1kVxwzvany4w6MvrcFjhqm1gDBEDzRqrGfbXeOjQcvkOfBVl2BwzM4W
	Me7mjR2hvABReV2j4xzrs+MzLxJOiDwBMx0v/CAg5m4MMopQ==
X-Received: by 2002:a05:6402:4403:b0:66a:7888:eb25 with SMTP id 4fb4d7f45d1cf-66b28b565e5mr4767304a12.14.1774726069986;
        Sat, 28 Mar 2026 12:27:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18b7:e580:68f0:a6ff:fe88:bed7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm857420a12.27.2026.03.28.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:27:49 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Sat, 28 Mar 2026 20:21:38 +0100
Message-ID: <20260328192721.255493-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328192721.255493-1-azpijr@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove
the redundant call to simplify the configuration path.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 2904455b35f7..1612bb2fd8b0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -796,9 +796,6 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
-	if (ret)
-		return ret;
-	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
-- 
2.53.0

