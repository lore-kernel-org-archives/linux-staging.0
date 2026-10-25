Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905708;
	b=f/Kge+G9dk9PUqW4OeAGzV9BcrDCrLv9ZS1n+dejeFen2n4itbati5Ecuu6rD426FJTy
	 iCaSCWbSRNGwla5JY58FKMaSrLro/UTtYI9rsXvNibcTI9ZfBDfFxMXyQ1502zQ7i8tzp
	 ctsGFTKCTCyvO0l+C5fY51YC2RMUpHvPrWOkg+PLKYu1V3R/pd4Sg1PwWX/hJLR6gv0PP
	 rvDuFawUL+wW/Tx/e6IzdjTMGPFxMQZwKHyPVqcriojWHpGw9eltgquBYUa2BzX4A5EU4
	 32OERpYqEPa39zUZquUwH5snIvSl1CUMruTm5pis9NcqGUYaMZZJu9xqsWGrlsUIrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VrsetohNIasoINtJjADb3Jjeqh2EUCIwdnh6PcRK+gk=;
	b=BoMhVuPlu6wUyi7Xv0tBZBmlzYpfpcVA4QZiCzsPQU4mQlBvB7whkAWqcckxIfmtRIT5
	 VlbdxhwxpFHk4R75M7K3ky+gfn/75IPfkWVVx2AKu5LUIXXVhq/DVkvc88OAnoztysqJ5
	 VpP55rs6e9818N81tXY5Ts5zq36yPkP2J672AkIoNtz7+GTWGc2bFAWjT1dN4M2/EKSUa
	 Nrl0PtL3TzkwxCypnRuGQOti+spG9co9rktHDCVN6iXwkv9dxNoIlibcgOHcoWkqulsS/
	 3vWtGgOpxaqpUh/0m8dSBMS4HlIWArZHLJbI1wCreZnrgWS1Bp0bVA4GZ6BGx08l/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O0zCv7bP;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E72606A31E
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 05:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O0zCv7bP
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f036b17easo4981101eec.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905707; x=1793510507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrsetohNIasoINtJjADb3Jjeqh2EUCIwdnh6PcRK+gk=;
        b=O0zCv7bPr2Rav6saezXdNKLHRWRIJMDmpLof92J70pEHPtKY+DZNVr3O0dhUm+V8M2
         ylvxIUH6w7P3iCPRFUCTDUyO7hmcGSE9u4NMnv44S9KNmaqr+7El2/P5y5k5c7H4rOTH
         LMe+wTh5sTGDymin6DkvbMpsn8Og9lwe8aRGZMmCAuxB/klrihuQ5chmsug6xq02zkX3
         36NJQCboOSIqgF33ILjPcGuoJeFcQGrgNspA8bDW89qRf+Wa8kpQXej9NXcgMG2WI8Q7
         dDEcHHWmKVefErQ1RQd8Cx30gi7SVmIXep3iRi8dWIKo3iJpaE2TaWXQZ1C70Im+AJ8i
         VOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905707; x=1793510507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrsetohNIasoINtJjADb3Jjeqh2EUCIwdnh6PcRK+gk=;
        b=GS+eE/d+UkfAIOHfs3zYOcCLt+szF5fQ5w0BCQ3eAvJ6gGRc//zxhYA+zKpByRePjo
         1/ZixxBwsj+hLmaLXZM+72uY/LgBAxEKpHtQg2rrN2lR5WX/GGDIGWt61aSEwpXVN0Qn
         vvBdym3EXijK897wNVBgb48hYFI5JDFZYieKpV95UHMa6Kp1p5EDeGfvR0g3UgdhY+/5
         StJcIJIRUzCST+oDXKkeRA7qDYvR82GMt7+o6WLG0hNqg1hPyTRB0cDHusMe56O+cdxv
         +Gw2vX5cWwUtoUV8EwPuwSVSQfnrXwP+cwqwD5DwcSurY9FEDpHht45lPQdFrGFuHieO
         +cog==
X-Gm-Message-State: AFq9FYJ9KH/mxYMaV8duoMW/nZuPrFo1RNU9YpxblPMmWq+dHPWP0DvW
	HTmAw3ui2Mkt4B6/Z/xTDONjOGINqEs2lM4EYoI6i5/waN7VszPBXXox
X-Gm-Gg: AYBFou0LIczxQ6GkTkRdaS+NU2KgdJJ/2Zst9jvzDIf2aS0HvTcXrGlfHq3WZwZJW1l
	TrTDf2OKfCFXeA/DiKeY94O+qZ9gPOh+qm+Stp+EcKCABFXSWbqxE/DW8WiO082ic9ufLY+jayx
	zKvoTYMUzwY1zeyupeiOV9r38/PpjdUcWQyklhQDkwBPr9suBhAjcHGf1Z5Jz+roP3wtUwQtolb
	e5XXa0rIOpWHbJFz/2Iv/KVw+K7TuenMESaoQuW26nseWBrIKc0ROTqdlYk3NY1cm9xtmS4m+QE
	RkF+kRjZPulvaq7/g0z9N2DCoXNNzLbwEOXlTtKh7TAx8pkunrWrbnFjuWxY+Sbz2CgGIkd1kpd
	FsOm/JuXaqZW+Lbahg1bb3YEbubipLlEX+wTYGLnX5L2mNuiGMF1yIRCLCE5coI4oK+Muq5MbiM
	owcphVAxDuftQeL+I0jEDsDtwq/VB+xtn36TO1BLaf44p4OhcMhEq8PohXHwaHyYqFBkVNdyJ8o
	d/BM/yzj4kRKJRwI2jXclLG1yvr37DxLdwhSCp0jQ1hXBeb2Z0LUa51
X-Received: by 2002:a05:7300:cc14:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-369e84dcb4amr6835607eec.24.1792905707382;
        Sat, 24 Oct 2026 22:21:47 -0700 (PDT)
Received: from myarch ([49.36.79.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm15239138eec.24.2026.10.24.22.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:21:46 -0700 (PDT)
From: Aditya Nagar <dev.adityanagar@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aditya Nagar <dev.adityanagar@gmail.com>
Subject: [PATCH] staging: fbtft: remove unused argument from FBTFT_SPI_DRIVER()
Date: Sun, 25 Oct 2026 10:51:36 +0530
Message-ID: <20261025052136.389541-1-dev.adityanagar@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _compatible argument of FBTFT_SPI_DRIVER() is never used in the
macro body. The device tree match table is created separately by
FBTFT_DT_TABLE() in both callers, FBTFT_REGISTER_DRIVER() and
FBTFT_REGISTER_SPI_DRIVER().

Drop the argument and update both callers. No functional change.

The argument has been unused since the macro was introduced in commit
c222ea5d2f33 ("staging: fbtft: Deduplicate driver registration macros").

Found with checkpatch.pl (MACRO_ARG_UNUSED). The change was prepared
with the help of an AI coding assistant (Claude); I reviewed it and
build-tested all fbtft drivers with W=1.

Signed-off-by: Aditya Nagar <dev.adityanagar@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df..62d5c39d7 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -279,7 +279,7 @@ static const struct of_device_id dt_ids[] = {					\
 };										\
 MODULE_DEVICE_TABLE(of, dt_ids);
 
-#define FBTFT_SPI_DRIVER(_name, _compatible, _display, _spi_ids)		\
+#define FBTFT_SPI_DRIVER(_name, _display, _spi_ids)				\
 										\
 static int fbtft_driver_probe_spi(struct spi_device *spi)			\
 {										\
@@ -319,7 +319,7 @@ static void fbtft_driver_remove_pdev(struct platform_device *pdev)	   \
 									   \
 FBTFT_DT_TABLE(_compatible)						   \
 									   \
-FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)			   \
+FBTFT_SPI_DRIVER(_name, _display, NULL)					   \
 									   \
 static struct platform_driver fbtft_driver_platform_driver = {             \
 	.driver = {                                                        \
@@ -363,7 +363,7 @@ static const struct spi_device_id spi_ids[] = {					\
 };										\
 MODULE_DEVICE_TABLE(spi, spi_ids);						\
 										\
-FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
+FBTFT_SPI_DRIVER(_name, _display, spi_ids)					\
 										\
 module_spi_driver(fbtft_driver_spi_driver);
 

base-commit: 4a177d5e688e8e82113f7a32d6f75f0bab9658c4
-- 
2.56.0

