Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602713A4F51
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260127; cv=none; b=WN8zyi3RJnjXq6IuRiYCtDTphrkpipesu97dpz2tfJBOvbhsz7cD6MQczrxuUi5OVhSITpQm1lWXlbxcSHVpXFItiI62SpT3TI0foKetSrRzPpI05Zpxcc9o8bwzFQ7ZMX4wQgNErQ0VD9rodlJYtPmg31NuqUcGUWVuIFgSxNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260127; c=relaxed/simple;
	bh=Ny9LvBTM75ruiDJVoNE1yRAF6lRU7oQlO1JFeuYHHtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grOXUAhNSgqHlnQRg7oZD3e8xfkA56wPhsIulCFDAEe0WyoPfrVfggXC2s7HOdKJvl+atzIbc7SSD+mr0CSTlp3NtQManZheNisc0VLwjqQ4OAETG74cWAx+fQKHv71fWkHzzkYGM5/zpm/cM0WPhomTxeLwumOc3S0wD+KMhfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUsfhyyy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUsfhyyy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1229643f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260125; x=1781864925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/6/lyOl0qLoBEqv2MuWDJ1Z2AwGZ5onzaS5BgVIqXQ=;
        b=LUsfhyyyklToew3VWTUJwVh2BzOO/kIdSpkWD0+gBEFiUwAvPkFXt/gbn4rCTYBX18
         EXE1yzLGMX0eUPORHwYfdGlPF+O8LeTeFN+mEtGhlFv335PV1gUFjKnuFddSU6P7Jdi2
         3J740h2QWagCgXbciNmCGjesNbYO2KjPOkFzQS4GS5Ak/zekDh8ceQhjMT0fNj2MBEy1
         jcZfogE25TbrsYUsKT6FTGCEBWt+BxWYT32Q4NA+9Wd1M5T7lQIvIoJuW9rotEGnTSXM
         L481p95zTnt1M3ZzRa71sKFy72C/k2vO7jx8bep5vpuuTZ4RUHtaJHGM0TccYVNGXSSF
         rErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260125; x=1781864925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/6/lyOl0qLoBEqv2MuWDJ1Z2AwGZ5onzaS5BgVIqXQ=;
        b=K23XJzIKZ4Wkh7rkLQdssOXCHIq1Ks6POLhye/Xz97nX4/3AywoLS9Op9uWk2W5ppm
         Y5A2WdHpEyRHvQvacbNm938IJIPHRChJw9893m9cjt/t5IMPEQPe9TB3d4HD6nxXPJjf
         PZBQVxM0ZuXkNah9HpBo7mvmtGgxSEi411iEQdDZ8uaA7pr1X9VRMWNorSMYh4Qfnf6O
         ES9ek5TgoAMACArKkqTp/H8/I8cb802qOMsw9yY9ul9sH+dJbHk/ip7lsiSYtY2PzUeg
         tGRVsAahHaIJKps7vDaJkQj2FQLW+BkZvvtqNmbsj1wLiqp8voktgKuqyKnwjxDgRgMg
         wCqw==
X-Gm-Message-State: AOJu0YyKABxhvvRRiypTHGwxtwHSzOEyryJGPnw4P1dIlR2lcE0XtdlD
	JFArOmjOU9wU3HVJus36fMJzAUgazsPtWXW2OwYJwApBQBTHFCDPB84c
X-Gm-Gg: Acq92OGzgSg26KEiYjnFte8LJ5yDfmx5YvH+jjHt1x0kIN16tOZ1TH3d/qszRATEe0h
	cTVf28Xur9FcMp9Gbv4lyqZ4/ZA7/N274BdiVUHVlM4RFEjCeqtqRI3TABXESHd4bB3wZ3cAZVB
	4DYmZMUzWRtW05DHwrqb+D6EyNl+RQsFbzchb568kzZ3cmm8gh+DmXemEsu9KSZ0uAyiJkBaRBb
	+bRMoGhYc6pLqiTSX6PRc7Sl4jyBrGnmJ9mWWfCl8C3flXSGy5cudgESWZab2XCXOnxeUqETS+n
	LJ3Pmfl6CZMhpCHfYA9yA6rFkJsJ+NjHcxVnfXmVa+w7MtOit6JwdqvLYuvuvi3IyYplEhuSYxq
	rZkgHNcAS+5KvCuu6iUXOGugmQqojTi4vXKdDSIyN1nkvWK8AY6KBeKao1KF+PvlECIPI03NUo8
	QkgS5tQjsL/HDtbd5kIjVcUpvKMA==
X-Received: by 2002:a05:6000:70e:b0:45e:f43f:128a with SMTP id ffacd0b85a97d-4606cb295a6mr3393891f8f.7.1781260124587;
        Fri, 12 Jun 2026 03:28:44 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:44 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 2/7] staging: rtl8723bs: hal: fix space-before-tab warnings in hal_btcoex.c
Date: Fri, 12 Jun 2026 11:28:29 +0100
Message-ID: <20260612102834.39935-2-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612102834.39935-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
 <20260612102834.39935-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 195ccc4b710f..a6f5b6ad471d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -9,14 +9,14 @@
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
 
-/* 		Global variables */
+/*		Global variables */
 
 struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
 /*  */
-/* 		Debug related function */
+/*		Debug related function */
 /*  */
 static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 {
@@ -549,7 +549,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 }
 
 /*  */
-/* 		IO related function */
+/*		IO related function */
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
@@ -747,7 +747,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 }
 
 /*  */
-/* 		Extern functions called by other module */
+/*		Extern functions called by other module */
 /*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
-- 
2.43.0

