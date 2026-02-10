Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C72638B2
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751437; cv=none; b=Ciu1ei1VIJx8ZQRkL3CX/kgniR+BVJI29QyKHardQWZn8EGAZXhf+yHFVKdPZU1kx69ZncXjY3PxBDqwgCOpYIzDFJ7mQYMCjtHC1h0GTCOUAJUhh8EkxQ7i9o17gSXyOTWMQbo6K16pFHOCaZgizr8kAvCObKn+H+J2TWvq21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751437; c=relaxed/simple;
	bh=vOVA+kGzaGmTmP5UGxNk5afUQ+uzViEnmXfbeCe4RNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwL6HPZDXuawFyIvWrLtk+rP8y5y7pJP+1jzx9myqCty3vuebl8XRIIcNs0GlyhyikBaBPiEKEfrqU97a6mqfcP3fCL8Rkn5h3ymeEI2oafajqMFfz+agQf7F3g7GQvBnT9AEVVPohmHUbMsrpMsHx0eG0vXukUfzDP9ou3y8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAL1zHGy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAL1zHGy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a1b17a99aso1325194a12.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 11:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770751434; x=1771356234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/qjQknBhj1g5hflh341vGQ8gt7ai7rpOHf7+cHVcSI=;
        b=FAL1zHGyzCqxQbQeFi1Ak7dYeWfXrV3ZcJqmgHgNJVSSun9kV0430eVu5F7ZnSvPCY
         W9cnlN1dQWKGvzRTckpzT3k/vpb8nw1PQzoOBuKA3t00E6aNu2G9jinYn8Cwy+wEKuRS
         B88vhOFy5Pbm1EPxH3fkJ4qheIkIY3TA9X31SdDnpaaZWs16A4ApZzGhRMAtHmMgwKPU
         gB2OYFdafqknVidb6qaWQTXBI0WZSDMSP7fy5Fgqhumjvwac1gtU3H+W5FMdYW2ciwRS
         hqVkiGeksWbedcbUjsXEV4MWVyLWGWF9aVvUas6pMNIZpfxieecrMfMdNLqHptCcT0dG
         uyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770751434; x=1771356234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/qjQknBhj1g5hflh341vGQ8gt7ai7rpOHf7+cHVcSI=;
        b=NvKZ+CmdeQlaDhDgB8vD61M/B1JSZKEGcfrb9WByBMuyv1Ce+hdWc9bhwLK4zRW7q+
         /p/0ZPue0zQASR4Z2b5th/tYaJ6MyYU4s4V9WEaXl45I7D7+SIFIsf2iTSh9PFRWqfdI
         VDo3b6ONifmJ4CvbhAbndhwHU0owaQOayA/4P+3z2V6HwYVRqAOxt0flX9UBSDmweif/
         phzSVVTu4YOIbjcVRawj+DkaIawnNKCIvollYU4AHO2GUEzYMuMmUYU6Mf5rQzZzF2Ry
         opO5/MxiqiX+T926WdPI5VPcsBkU3Ss+XECNIe0v/XUIhYD96Poaf5D49RKiQOps07CK
         LG/A==
X-Gm-Message-State: AOJu0Ywc5x+XCqz7k1e4uPDRJNUti9NEOg5aq9p4CN2AD4iXAxESwlkP
	Ym9I4OazUWee0UulffLAAtgApxX64XOECsdUc54co4/Ku2+pqRvhDIe6zv8ZL1SbUAY=
X-Gm-Gg: AZuq6aIDHzghTlM0q5EgYlZPYR9ttJXujMT7GcHIONBRR/rlCs607VfJhRoXpIyjh3G
	l71NxFlbHNX3yENX4S2wGP87z3Owz7S/4RFwJP4rZCpiKFnxYPgjZRlYUxZi7TfDX1q8rCoyZgq
	qX20MPLisw14lM5mfagwJ7e+QVMRIc4CrDlESIUWe/xRqTVVFscaiyFaZoI/MR+JSQhZzfocvfq
	XX5W7fOoY7jEhMkZmQAglTDpxvKneh8QDhHPDj44hQi6UKmC50c49Jw5DVkKE4VSAw6AaF6Eo32
	Cx/Bn4xL6ejswP4hsXTUsUBzbLK4YkKPohlZ6HhRLPmqTnbIvKNFc5un2UfOzznnjtB/iQ2QYl8
	AM+XtQqol9j6afdnN352SZlnth90/QXh46Hwbm9RwEGV5wy3u/QLlaB8djTwqBXXA+p/cxGH8iK
	bmq5DdtBdSnopStAU=
X-Received: by 2002:a17:906:4fd2:b0:b87:368a:2bf7 with SMTP id a640c23a62f3a-b8edf174604mr1130961366b.13.1770749794599;
        Tue, 10 Feb 2026 10:56:34 -0800 (PST)
Received: from arch ([178.230.12.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a52bsm551546766b.14.2026.02.10.10.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:56:34 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove shadowed variable in sdio_halinit
Date: Tue, 10 Feb 2026 19:56:30 +0100
Message-ID: <20260210185630.54577-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'bMacPwrCtrlOn' was redeclared in the function
CardEnable, shadowing a variable of the same name declared at the
top of the function (line 21).

Remove the redundant 'u8' type declaration to use the existing outer
variable and resolve a -Wshadow warning.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
Changes in v3:
Resending clean patch (v2 accidentally included unrelated changes
from another commit due to an oversight).

Changes in v2:
Removed incorrect blank line after the opening brace that was left
behind when removing the Adapter variable.

drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0fa1b22fdf9a..861d5162de15 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -30,7 +30,7 @@ static u8 CardEnable(struct adapter *padapter)
 
 		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
-			u8 bMacPwrCtrlOn = true;
+			bMacPwrCtrlOn = true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
 	} else
-- 
2.53.0

