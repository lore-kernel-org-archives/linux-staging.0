Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68688204C26
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739346198; cv=none; b=e0hbWPes9bygXsXo/QreBMc29GwS1HFw2bp1EzOQUfRrJNuG4XfIhGOQdxt5/cRYD8Z73rjKPiDBB/rpHm2tI4tALqDJrfvfVjxjIR3o5eDfXalCdiqKKENJQvXB805VY2pK41LppRkxNq3ZqX1+xeEJj5O/M4Bf3SZrRGWqSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739346198; c=relaxed/simple;
	bh=uYeXJyn5UeUw6qcDYRDrfV4PFQBbTfNbcG3JQxPQTfc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VM0PshiYb5VNAv9yhYI9ORCfV3X3V/TF42v8pNSzMcR8zNFoKq+0rxi0jCkBex68aZq35xGrbNXVgC9D48VuQwGXkHVOGOFfCO4adXGduPmw0W2OOLSUZUofqtC/RmmhNa0E1glabfeIrHqh7FJvK9mABLDijw+hgbogsI9+CDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0JLvjAf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0JLvjAf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4395560cc13so14404965e9.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 23:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739346195; x=1739950995; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faKuoffM1gAZWq51vkqkknQzyRKywd6R7upna9jS1Us=;
        b=H0JLvjAfY+dB8+csOqT4+2rOJgo8KW43mjtgvZJ4qG6ToiT19/V4Wkk0oeKRCsrjjV
         uPjmY3rQdd7/v3DgDYSsAVuGqJs7ZaBseBxJZHZDbbyDmWzdYAdgaPomJtgjNbunBA8b
         t7THUyyZiQcMhVix+QrKtDArqZjahrkhURhgDkJL1UDb8CQjhm1e1kUC1bmk/j2udFcS
         4dUr5jVtOUMvR30HoNx/zwC1wr/3DTXCUyFuZz2Q5J0bOgqo1EPNeUp3m72W4OCcP3/y
         pMKUlg2uX2biERhQrBCKT0quAk37M4K7w3cZA87/4W8CmUT2Xr7E6PMlvQkBdRSRzruf
         zvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739346195; x=1739950995;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faKuoffM1gAZWq51vkqkknQzyRKywd6R7upna9jS1Us=;
        b=HEEtU0EhrAlolqTB2FlJFqNWU2KIzszAO0dpUjy9wlUFCz3UgmtPTXsZCrixhKMMFt
         +Y8wy//5RPcNVfnovwP9S07gqc8XnzaD03Ic9ONNCobTdA/lPGz48TFniOBevvHdvZqC
         8debp+3mEUv7hq+GGpldlD8JBFjJLY8gmtCgvQoJ+SiIkbXYied7zF2JSKBbSRPCIYhJ
         MV6bZH5me5ddTDr+6UVAAcoWL3bvVVjecgd3K7UeDFpCn/vURZ+WOPYPDhmyjzJk2VHe
         e9iqo+WQm1jKcUesLc2dExVJARLHTB2O3Er96MY1jth8Q1sc3F0v08ssmkstBLKmcRJB
         bW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxTbGmvRuFkOcX0zkCspL1ZToK0TtiCW2t/kBorsQwQnXfQ+fwCXdPyeSNAiAykXyiX+9ImgcVRZzNAd+K@lists.linux.dev
X-Gm-Message-State: AOJu0YyysoHSZdR0hcaY3wlSrMWqjreKQAz/zonb6TqX4wyXThFRIhlK
	v9KQ/Ll1AYGc1YkUA71pTSWhiqh0D9AwpzPHyp162vnRdJkwUGiL
X-Gm-Gg: ASbGncunOwSqtct12EGdbEKIXPme4M5GUnhfw3QaPQj2J9a8BH768tyM+FVWulKlJPF
	Rm8QBAqyR8f5/ZEw5E+tFc2En7ovrP9xTqrHx4iNF5UnAKo4HJYTss5NCgRJNTvw3OhBaUzM94+
	hZa0dY1VQyVub3ebQHAD3wh6Dt3FtG2Arh4TvyH3D7Xgut0Zm3iVB7H9nkewDxmCTZMGCy1zype
	eroXrrRijc8/9szJQhymcrUqywZq/p4CuOwVJ0fBvJ6MdLv2n5j5RIGZvb8i/OA3/5tS/8Hcs0v
	S5wmXS0Y8ahoSOWp7IfRSuBUVgxgIHVscU8mUpsOCVtwiL4pUWVRRs/zXmNEXhExu9SUjmxgzIe
	Sj0he+zS3
X-Google-Smtp-Source: AGHT+IFLnB8Ymq1rlUTsAloZXjXNuyEHGglxk1LiY+nVnHMEX5ZdXYat3hHkscmmVysqmC10clk5kQ==
X-Received: by 2002:a05:600c:510c:b0:439:45ce:15c0 with SMTP id 5b1f17b1804b1-439581bed06mr15039995e9.25.1739346194504;
        Tue, 11 Feb 2025 23:43:14 -0800 (PST)
Received: from michael-devbox (ec2-52-59-234-77.eu-central-1.compute.amazonaws.com. [52.59.234.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d22csm11458725e9.22.2025.02.11.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:43:14 -0800 (PST)
Date: Wed, 12 Feb 2025 07:43:13 +0000
From: Michael Anckaert <michael.anckaert@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: sm750fb: fix checkpatch warning architecture
 specific defines should be avoided
Message-ID: <Z6xREbLLtexX4_uh@michael-devbox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace architecture-specific defines with CONFIG_X86 checks to improve
portability and adhere to kernel coding standards.

Fixes checkpatch warning:
- CHECK: architecture specific defines should be avoided.

Changes made:
- Using CONFIG_X86 instead of i386 and x86.

Signed-off-by: Michael Anckaert <michael.anckaert@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 02860d3ec365..67a2f60440ca 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -229,7 +229,7 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 		reg |= (VGA_CONFIGURATION_PLL | VGA_CONFIGURATION_MODE);
 		poke32(VGA_CONFIGURATION, reg);
 	} else {
-#if defined(__i386__) || defined(__x86_64__)
+#ifdef CONFIG_X86
 		/* set graphic mode via IO method */
 		outb_p(0x88, 0x3d4);
 		outb_p(0x06, 0x3d5);
-- 
2.39.5

