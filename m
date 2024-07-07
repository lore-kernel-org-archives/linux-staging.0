Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD83F501
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335245; cv=none; b=VUNpY4y819tltx/3g7whkNSP+y3PEt/Dg1nLo6XnUmZEH4FAiqKeCSOqh18Af8wurtny+PBWxktG0h7vnW34+V2Yz5nQpj+gOVR6jvkSqbch1fYE70RbmKzzLwUeXtUFeZzxWgT5krevK5r1VwhxPJZPpRUIJsuoOF6RucaISfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335245; c=relaxed/simple;
	bh=vzhS4eOdB3JVBmGj6GZR41u0035kWUjZHf2QmYjBHj0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/Zd0EXcAE0DAyAz6EteLKrVW+oHtneg6W/lcfw17vgc3y9m18k/SNgBj9/o3au143H+DfE/NpHBb7L6OtzH6CP/n5m4Bjxyy4W0VrNvbLtniqQ86CGDIvfPnw+ITck8VS+Xh8qB0wi0fOLBsBszmAoEQJFoJe5tHiav6emOshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiRv2TLE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiRv2TLE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4212b102935so3368325e9.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335243; x=1720940043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L17bu5yX3ssgKrMTsiZwMgl58vpmJ1s2WNn54DauvtI=;
        b=kiRv2TLExoHZzbXkrCSHFANnUcChTqwKAJMMvD3MJCnCYScy9sYkPBgBSoKsVHEEpN
         hZc2G5Ye2LUvAzdXuVFTJp+zhwP2G8JxMIuQnjg9hhwAW90m/ceogphEtizN/DZeThwK
         Bp5L40eL6mEhC9aCGPTSglpY3i9qt3B3N2kJPvtq1wuy0xMLGjq+3rCLiPQn341H7IZb
         sjlcj+qbT0NNWWEdv4sIg4eOyOllzuMpsXjFcZ2WsbKkFXRs2qyyMxnzbJQbYyAgHiXz
         b2OCBhAOaWUa759Rp7rcuG/GnnxFMGkLpGrFsivpOVcnKc/CCfb+Eg4VYmhNmUlX7nrQ
         K4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335243; x=1720940043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L17bu5yX3ssgKrMTsiZwMgl58vpmJ1s2WNn54DauvtI=;
        b=uWjpHHLlKzYQKoqtS20zwEyKEfVIinY4KoAZfe1GtgoRcuubN7vtU715/oSs6cmD6H
         iAvYqoVrTJgEmybaTk/cFCsQ9iL6p54oA6e3jHgROCVuMUQZSfy8ZqVgRuzXLgCoqxWm
         P5b2JsMYjstUAD/7cNp4UJEJvKL48PAzoYJgBC2/ijyhVKXcrnYuWqehuYHfWj8Uawyc
         XuSTpynhoCJacESuQZBam6eybRbDAOhz8U5bisVz3/gULWN5enGnpBu/goiv+SCXxeVs
         q7Lp+fO664M+FH5V8Hx9lKRospuJQcyHhx+D5KVTk2F289OUpor8DKTHDEG6uGKfrra9
         sdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKUJkOwT/7Z/QHsSvRCaEZliVu77aZACl1l7msW0xu2hOfBx8/ZQdU/hEr4yQ7pTLBG7jC6abHq9yS0+dg9OKqPZUlOg3T4xKArhb5GA==
X-Gm-Message-State: AOJu0YxcC2DK6VhTvEpolRDyNpVt6fpgPL6VSYWEL8UAnzAVpiArrARW
	aRWaWzbEeN+Igztt09SkmRSLDqDmiZET0ZuCYV80SAn9YYnCGlJ3
X-Google-Smtp-Source: AGHT+IEQVNF8CLloFDHw1LG1lFShBIaHRdILEu+du4X3fMXKOpjm5yvzkkVqU6oMCYCFgqaXvqKjoQ==
X-Received: by 2002:a05:600c:4c0a:b0:426:5fd1:281 with SMTP id 5b1f17b1804b1-4265fd10561mr19771895e9.1.1720335242564;
        Sat, 06 Jul 2024 23:54:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42662a21066sm29644725e9.22.2024.07.06.23.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:54:01 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:54:00 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] staging: rtl8723bs: Remove unused macros in
 HalPwrSeqCmd.h
Message-ID: <ac52d73666090a70e8c1edc87e511f1ea2c139e4.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
index e30071935d27..b81252d374ef 100644
--- a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
+++ b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
@@ -49,8 +49,6 @@
 /*---------------------------------------------*/
    /*  define the base address of each block */
 #define PWR_BASEADDR_MAC		0x00
-#define PWR_BASEADDR_USB		0x01
-#define PWR_BASEADDR_PCIE		0x02
 #define PWR_BASEADDR_SDIO		0x03
 
 /*---------------------------------------------*/
@@ -64,21 +62,12 @@
 /*---------------------------------------------*/
 /* 3 The value of fab_msk: 4 bits */
 /*---------------------------------------------*/
-#define	PWR_FAB_TSMC_MSK		BIT(0)
-#define	PWR_FAB_UMC_MSK			BIT(1)
 #define	PWR_FAB_ALL_MSK			(BIT(0)|BIT(1)|BIT(2)|BIT(3))
 
 /*---------------------------------------------*/
 /* 3 The value of cut_msk: 8 bits */
 /*---------------------------------------------*/
 #define	PWR_CUT_TESTCHIP_MSK	BIT(0)
-#define	PWR_CUT_A_MSK			BIT(1)
-#define	PWR_CUT_B_MSK			BIT(2)
-#define	PWR_CUT_C_MSK			BIT(3)
-#define	PWR_CUT_D_MSK			BIT(4)
-#define	PWR_CUT_E_MSK			BIT(5)
-#define	PWR_CUT_F_MSK			BIT(6)
-#define	PWR_CUT_G_MSK			BIT(7)
 #define	PWR_CUT_ALL_MSK			0xFF
 
 
-- 
2.45.2

