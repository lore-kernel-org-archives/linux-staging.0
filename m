Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32E33D4F3
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 01:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337063; cv=none; b=UMH6SsWBb5MTHmSv48nUjARC66D3/h3V5U4E9GSSvVj6tt68DvqRLVgyPd5GsLZmhuleiaqmYxB245LYNTpKSKe19PW2sq8n+h+BdiPrPuWhX4yxd6YjLU0weQuLumw4epimqKDfSywJ3WS58RAt+ZLwDV6JMOdVKUlDRq4Pvlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337063; c=relaxed/simple;
	bh=hRjfKFXXRRxS3ds77GOO8EDnyRQdjhfK6DdZ0IAeJOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXK3j+K0cYeZczW/K8A1ymA9o4Ag+yF+PUAyZ0ofZQ14A5pSvq1k4yS1klQz3XT3F4Aw4wbjPDGZMZqmN0tjtpZFP22eqf3Gd5U/tVKHSTqu2nSN63RTxu/vXtZ9gHoKT/XdkYjM/jru/vLo20yxSGmgpPCGFN/JO3V4m316t3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdRe1Owx; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdRe1Owx"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-499f20c7054so693399fac.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 18:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337061; x=1791941861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y0wy5r/a8wSdsmPA4swctu0ZijkSM7bFUGt/MLOHIyo=;
        b=PdRe1OwxcqTfoQEc3tLHkt14Fzk0cWDuFSRLUa0Q7OUbv9Mab5FEOMRhmWTjGhWRy8
         LwGyLiF9v1HGHLQKK6CrRRC3JAP2gJhcEfhZKIAlWINbQhxlAECnwL4523yvnp//WACP
         z5M0mD4IsBN0Fun7Gek0GgiMajT1Lp1+cVbMg9IaYuayilTxywV270+8vRTebc/t8xne
         aM1Io4ck3VUBWejydncCGcSbInfa2j0XxMx6WnohIGoC8gquGUNoMeA+6XKYvS2KB5gs
         7iLeTa1e7qDdf9VNpglKX6qelPdOcIwGUXWZXvc3cy1kdxvOVsvOoli67tUR4yV4RDbW
         mg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337061; x=1791941861;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0wy5r/a8wSdsmPA4swctu0ZijkSM7bFUGt/MLOHIyo=;
        b=UwmUCF5f8fBg7dkeLBVZw3wBhvC5WAJ6FSXw1kgv+R4NuA4tWsARmkj5zXl4hmoJe+
         4g020dPE6EzJqvzP0emKX5bO8I6+JW1ouhIlfmpNGJTDKFwE3yZR59YdNOJNHmFlOEfS
         Zhz/GlD3IHi5J3Ik4sRvhubZAZUnhFtjFCrbEg6fM8ubeSTmGLSpxYOthXgGd5yF3kyp
         8yk8M2n2udCoMdnNO5j1ZMMyj0sXmVT0naQDFe21OczUHITylPSWa2cltvF708goh5vF
         Ox9zTsUtejRndSk02sKllEzSOnnqw0KVv8fpTz9AGF4aIaxxuEDxeMn8Zy+qWBcXLR59
         T7lg==
X-Gm-Message-State: AFuF++kkTQQG1r+D/AC3hEHCvcKRdnzwwowgH6Q1faQqbSyKZZznIhD8
	yGNm9Ag+0b640chGg9pFHsSakyhbmciz6FlKOlv1Z0OwB+NIvGnRk1CkqCSVwLIj
X-Gm-Gg: AYBFou1WtJ1P9wBV/bCfNitGuHbBKHOEQ52wOktBPzWoUeM8wJ0JDBs6ceSvWeklt3N
	Mcilw2pkKXgJAB9uAhGj20uZWoGIVnETLavoO/qUR6i3tLoQug4IwS6hxuN3GfQkgeybWqPBA70
	fyESISgbWcRfjCoLKaO3ke6D+qbWIQMNPKSWu+8QDLcHxh8I/0xQu5ZqsY0Bz0MHw+oUtjaaCAJ
	7vns4o/fRCqsFEi1yCXD2EpaSysXzIJhe86IwDoYS9rw6W+nX81id6hMJJLAJqsqgfmKchIKqmw
	VIAyURVsVtyQhQYIvR5zSMUO3lZKPHQmcOLV2xVQrj/t8Pk4lDsHMHRhSdpWtj87wq29iAsDKyi
	V5mHNqCxKk9b+IYAIFJNSRdIs4v/AM5z52Rm4esFEQl3rRimRyEeITLAu8x6fHLlTp39YTAQxWA
	j6dZlVYenNEIYSEVyzs9QKdSXT5iAK1GyXGYw4/TyKTFrqrDycOoEJ2xY9qp+ksWJJmqmW8ncmG
	cCJcBrmktcnf5xDKb6EqlU=
X-Received: by 2002:a05:6871:c8e9:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4a25942acfamr984499fac.10.1791337060915;
        Tue, 06 Oct 2026 18:37:40 -0700 (PDT)
Received: from Arch ([201.110.174.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25728fad1sm966520fac.18.2026.10.06.18.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:37:40 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused PCI ASPM OSC definitions
Date: Tue,  6 Oct 2026 19:35:22 -0600
Message-ID: <8b372e2037cff170950c0dc0b94d7cdd78ba4c80.1791312824.git.inakisobera8@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0c4bc57c3034233f330f620eeb03fd7d8f8de457.1791312824.git.inakisobera8@gmail.com>
References: <0c4bc57c3034233f330f620eeb03fd7d8f8de457.1791312824.git.inakisobera8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RT_PCI_ASPM_OSC_IGNORE, RT_PCI_ASPM_OSC_ENABLE and
RT_PCI_ASPM_OSC_DISABLE describe how PCI ASPM is arbitrated between the
OS and the driver. This driver is SDIO only, it depends on MMC, and the
macros are not referenced anywhere in the tree. Drop them along with
their comment.

No functional change intended.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c308fcedd63..60fbd9637b9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -84,11 +84,6 @@ enum rt_rf_power_state {
 #define	RT_CLEAR_PS_LEVEL(ppsc, _PS_FLAG)	(ppsc->cur_ps_level &= (~(_PS_FLAG)))
 #define	RT_SET_PS_LEVEL(ppsc, _PS_FLAG)		(ppsc->cur_ps_level |= _PS_FLAG)
 
-/*  ASPM OSC Control bit, added by Roger, 2013.03.29. */
-#define	RT_PCI_ASPM_OSC_IGNORE		0	 /*  PCI ASPM ignore OSC control in default */
-#define	RT_PCI_ASPM_OSC_ENABLE		BIT(0) /*  PCI ASPM controlled by OS according to ACPI Spec 5.0 */
-#define	RT_PCI_ASPM_OSC_DISABLE		BIT(1) /*  PCI ASPM controlled by driver or BIOS, i.e., force enable ASPM */
-
 enum {
 	PSBBREG_RF0 = 0,
 	PSBBREG_RF1,
-- 
2.56.0

