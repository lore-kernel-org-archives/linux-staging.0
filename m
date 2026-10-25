Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946442;
	b=EQLLjmZxeoB4AacSJFLODK9P/LgPiBgv6XTxnqVpLoRrHussfVmUy4xyfooHKnapEain
	 i+MZlElUIyQSZvd/mqZYWYsnC/RBgdt2eV10CPWhm16142/E0tU3T4cYOVKyKCrFHh4et
	 8Hjh+IJSJW+2MxOoFHRsdwF5Qut6Fg5f6FuWnbMDOQneBc5Z6T+PvIa3fYGvtITfkA1CP
	 qQwGqkpzIGYna0vRTdp/doYDro77UjugS0+gbhGWUV24+P1CO7UFDtbzG4xQAaC01qLBq
	 7mu9KdHPD7yQ5llkyBkLnlNjsvchzBbAzvrKKyJaFXZyief4u7C9EokfbEEWfaC/LBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xv9NAEq9hQ0540bja4x3wK9UU5VFlX1ceZODo3NuB5Q=;
	b=nQuSWZBERgAqp45KFnn/KtVhfj6gsGOfdM7zFwv8OHMTNb2KwLCFN1ggZMQntDFKlfaR
	 zz6F6ojyMi+SIdNxv0+v2YMX/DJW2JOq/xVUeE4VRRMyTXVRLImw1Li7VeXLULxQloruI
	 rlNju53doIccZ0wWsT5wsYePYUoWmAiSiowXliSlLoYjr4NEZST7gZNYHIC93L5GJXGHn
	 pIRIyBqAKgMCTJHUEM+JUVmRlfVw0u92mw+h48abiXAlm4rXG2rWF6R7Z4aPYpr0rGTYz
	 9LHygK/mm2/rhtCQeQzpVi8MhEbthc+bdoKgR8x/dQn95I6u1M5/wMFyQsAlLgOZTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J05cmZGE;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138C2606A31B
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 16:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J05cmZGE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35829219da8so4134158eec.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792946441; x=1793551241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xv9NAEq9hQ0540bja4x3wK9UU5VFlX1ceZODo3NuB5Q=;
        b=J05cmZGET1Ak4dNUpfwViglGUCYNJo/pkHd3GiWrCif4zIytH/BdTTXMFDRQv+RK5B
         QiVo50Kl5bk8sQBP/MsXovAoskEawT7bSsOfSvyIxLBptZmxNP1bfArxHChQswoJQS3J
         hWJsReZls3y3TwT2Vf0w+YRqzvij7uhoOQR/o9uYvVW5fLez36UOCLsxpec33MsDDJKS
         aLex5bK6p8l9M7zfh7rPcfIEx++C0Uby4ZlGPYvatppsJ2sU3sXlwPFT450IliJpmJ3l
         0APCgi/os33UV5rlt4PzAwOfU7p5s72OcEqLd8gSQJkXqv039gbjEgYRS2nYnJadzHC9
         mezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946441; x=1793551241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv9NAEq9hQ0540bja4x3wK9UU5VFlX1ceZODo3NuB5Q=;
        b=rCREI9/pAR6R6KPC0As++a2QcnXOU7Siv5pJ/jWLuydRJvqDWuc2sdthxEufK8uMtS
         ritgRwXmIBWNqohyZBVmch3QwoVNRlTgngLPA/f+afmg9+gMxYVAGfsRwqTfoKi8xNbK
         VwcNNolo5ecS4aFvgmf7jaDiIaQ4R60/eZu2htGJ2AtzyDAfIPGRDKYjztWesbv1hNvA
         OulCaQXO+6oQ8YCJrS49qlie8SbXPTZUEUAVjzKC0ygjxYS9TZiVlgLjMtCEccptG/Ei
         14LLSOvjUy4VfGwWAv0Npd+pCxjtjXK7EIPScyY3E190fGWZOZxpqXPa0ARBF+f3mUuq
         Qj3w==
X-Forwarded-Encrypted: i=1; AKwUvBwMYoYrUh1m6A4y+mcjEAylv4rWl9GMHg6+NKsgLTDlSlZSW0oYKrM4LCe+JGDuDl4M6zz4seT89C4sZ4Tq@lists.linux.dev
X-Gm-Message-State: AFq9FYIN/yGgIlynHxyc0EP6K3HdIXH9BvY6L6bA47mRNcCfaMYG9DDc
	cITbxLYdDxiNkuAj2CLCiZ435O14+3Flry/K7MkTh/WzGpb5SRSIvknpEQdYCVvp
X-Gm-Gg: AYBFou1xz/CWaGhc4x9h76pQG+a+130zrCMIrw+QSf/GUJOH7PXVXfKpYbwEkU8IOa8
	5iwQ1ewfqljEEM2RAtv9tp+oB4h9H5cHWG5rVQGzfocSEoxeXD4sjVanlmD3QwQX4QlAbte2xDX
	kZC5bnN0966/xaOUvcaX4YslRCeVKEwtYjofPYGL9LcWETbg/mmi43jqmLD249sN/KR23LO5cEa
	BEAsfxiXL9/+M4eFaH7bHQPJSbtNc3nxTKJkEKgYCaDBBtmChD16exG2INzE1AOacPzynEYvp87
	I9vOGV+vMXAF/DPi9NaiK+rAJcLSTHXKsH5vVzDb2BNZ55qWk+pDTdkj9lenSVyQDjfGYtYowsa
	//n75KY8Z4gBxu9jnkIsaS2Im2rOd55EIT55zhe5W9hZJO9Trse1QsSruloDG/S8BpH2WEfSDqh
	YrvZUEUrJeVDG1+5UuBXQ8GT6z8MC7OIEQXxqsr8ZrM0GLNrZnGmJzRlimRbNCYVS3MCxEfKTfD
	ubc/qvpHkgMTbkBFRik66ypK4M8+00abcVCl/7U3OWNjrT+VKPWzg3VfoW5gVRrb1aDE/LF+ZOm
	bNgwkOCxtlTw8Bs67pBl
X-Received: by 2002:a05:7022:28d:20b0:15c:a04c:cd4f with SMTP id a92af1059eb24-1993fba292amr5562765c88.0.1792946441092;
        Sun, 25 Oct 2026 09:40:41 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaebfsm17401503c88.15.2026.10.25.09.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:40:40 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v2] staging: fbtft: Fix line length warning
Date: Sun, 25 Oct 2026 22:10:03 +0530
Message-ID: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Hi Andy,

I have made sure that the \ (backslash) is properly aligned to the same
column as the rest of the macro. I have also taken into account your
advice and hence added a local variable for platform data.

After some thorough searching through the respective directory, I have
not found any calls for fbtft_init_dbg. This might be because it's a
helper macro that might be useful as the driver progresses.

I have also noticed that some other macros around this one have simple
style issues and if you would like, I can send another different patch
cleaning up those too.

I have also done minimal testing by using the macro once to make sure it
compiles and has no errors, if you would like, I can also run any
standalone tests for this macro.

Thanks and Regards,
	Himanshu Bakshi

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index fd7f8fc2afba..ceaa9a3906ef 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -421,12 +421,11 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)-> \
-	    display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
+#define fbtft_init_dbg(dev, format, arg...)						\
+do {											\
+	struct fbtft_platform_data *pdata = dev_get_platdata((dev));			\
+	if (unlikely(pdata && (pdata->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS)))	\
+		dev_info(dev, format, ##arg);						\
 } while (0)
 
 #define fbtft_par_dbg(level, par, format, arg...)            \
-- 
2.56.0

