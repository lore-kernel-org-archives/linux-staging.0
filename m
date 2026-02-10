Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BBF38F93C
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751203; cv=none; b=d+P6hsD+prabis/gSdaoqQrmQRV9W2r9BbtW61niiMBT2IBNeQrt8icIXmj6arFWY15Y4V2He8hS7AV8crotAaZoyM+/o+tDx5cTLeMprQfvKlpagDya/17UAx2dB21I9YIVygulyLqZPVsNtLdI1viDSkA9AGZo+2rnCTKG3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751203; c=relaxed/simple;
	bh=rG9JGb7/r8c/oqw9RwPZz9+jyDf4pcT005rV5izFGrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4BjZZerRutQB0RgEwKMMly3U+pLdUJXOhUNgXhQcOXnBBgEqRC93Cz+KOuRDZ+hVOZuScspo4uhD9qso2ByYGI0M2kizicyeTfYBGyJ8b3oRXG/6wGJt0hfwEGa6VQy8fx7jMSY9BDAy+WROTuuT+1iKUELRCiLUnxG9Md3lr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFKocuzS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFKocuzS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-482f2599980so13245115e9.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 11:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770751201; x=1771356001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+K0kgdJScH77v+miZDgwdRiig6kltvC/8TzF+y48IM=;
        b=RFKocuzSI8U0IMpR8ZE4TVmCHSoALzFvVAOofMF7iqOBqjN/470fqi+xfqgf3/ucN2
         o8ieMqCOJ3ttS8/d9IN7D+MWDACVvF97DRo34tUvzgA3I79AIVeAIb/YxTforo8xNeSN
         orZ7IBl7V3eobE+tMA40qti2CdM+aMxtwdpwlMSYnknToeREwT2zmekz10feJqoYVDDP
         zsrIc3qkpq4pTlRV/3YgArKsANu6VyO4HbrmFcBwW8Cc32/qEhga1FmPCj6j9UMtXKeI
         waLVeSq5aCk5Q2ovDCVrfOJfl5eesJqjS4UyCVqTajQ8hJVgpHpEHXnRtCu6KCH60zGR
         WE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770751201; x=1771356001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+K0kgdJScH77v+miZDgwdRiig6kltvC/8TzF+y48IM=;
        b=Vd4ESuIHHL0+a0dq9ek7zBWfuwRQyql7ldzqS35ZxuVLLRwqoTKiJsk9WKzcWky8Mo
         KPK/sq6GeDj/VDMIU3SJIMTj8kHoOALEYRXvwR4U58GADLMq+llaLcl6h28ZR7xLuPz7
         PFREeJWSOhKKTyarqyhCDhnbtMHbGHd726qeBNk++Zw9qX9fgR55+rfzD4lO00PbcvZw
         ddvUF/yGKyik2wcXvre87VvO2w0wui7vssdmQipGsqS28aXqOKOGDU9ZnT+y3EAoritM
         dLrasHKKpcJvetihDZS0vBdb0G6ur++ce5YQgzB3DZ/kcGYGo7+5nbkyQicIukfJXBdE
         0e7w==
X-Gm-Message-State: AOJu0YwwUMIZYUu+qOe7/K843boRWlDYBKP7itWpnGJnbISPGZSRRK+3
	zmi4lwudw3Tn5Z8wSV6BbKS3x2OPHxe1qMoDZwXtcgBeytD/N3vJdv2lpMMiAO5xsmU=
X-Gm-Gg: AZuq6aJp7Q4zNtQQeOmOB3joRKiLPoWAg1vu0YFaZwKGWECSBcYF+RRi8lZ6Tp+oU67
	rahwifiXfeVhpqfLtv9KGVYupTZ/rF0MVWcFpWV8t9Z2u/ai24a2ucLpyuBb97WMoT7TWbfwKYo
	NPo6geTIK89xe66DHUGB3kIh0vl9Uv3gKTDtmDGBmtvV7+uetNv8mrKL9A+l0O788UNXS01lg1W
	DPWfz9eEUqHbi4003Kb7YMp2QwXp0jbMiziaXHrnSQuFXBKdc/BP8R8ekgWN8SFEj6FN/yTXIRp
	oANaf5p2kxCAS8xxgvgak2rLmkji7Agz3CodUeY6mMHV6vYB5WaLd+pc5ofbS6sNwZbQmLbKwDz
	IKc6Zc9GmKkXBxgZc4K27y/0u+O4MqouKbmnWLcN19ysmWxrUDsSCQSqe6ArxG29mwC1IAuzz6X
	Zy2y7OtT4yIswc0oQ=
X-Received: by 2002:a17:906:478b:b0:b80:149b:badd with SMTP id a640c23a62f3a-b8edf34b329mr909518366b.37.1770749448696;
        Tue, 10 Feb 2026 10:50:48 -0800 (PST)
Received: from arch ([178.230.12.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983e5f42esm4221536a12.0.2026.02.10.10.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 10:50:48 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove redundant 'Adapter' variable in HalPhyRf_8723B
Date: Tue, 10 Feb 2026 19:50:44 +0100
Message-ID: <20260210185044.53754-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable Adapter was declared and initialized locally in
an if-statement, but it shadowed a variable of the same name and
value declared in the function scope (line 169).

Removing the inner declaration allows the code to use the existing
outer variable, resolving a -Wshadow warning.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
Changes in v3:
Correctly removed the black space left after the opening brace. (v2 was
sent wrong). 

Changes in v2:
Removed the white space in line 211, which caused a coding style warning
(reported by Greg K-H).

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..0f915589b518 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -208,8 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	}
 
 	if (Method == TXAGC) {
-		struct adapter *Adapter = pDM_Odm->Adapter;
-
 		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
 
 		pDM_Odm->Modify_TxAGC_Flag_PathA = true;
-- 
2.53.0

