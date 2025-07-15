Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130922BE62C
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604115; cv=none; b=Geci1fdfuJrqTTesOE1Xyr6sdzkj34We1XKNjtAYADV7vBPC+LDHFoEjwSyNYv+shWs0jEvvJcD5oW96eOZ/7dDk6mnH43IEEEoHdn2+DG5z3ozmlyOUYGGMkClKZzpuxgPMx56ZPRCBfXpNk2WhUg0iNcRflfHkjvNkpOqEdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604115; c=relaxed/simple;
	bh=vV/CQqRBUfW+q04qz7oDwgxjQyCWpB6ayxZ959pOlNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnHilE0sukKG2mPyQUxULHT4IkXVXJEPqTkN9rQM4CYzQ1B4/kVwvP2sm2JbuFXhxfkoDQ0ozaFdtzah99t9jVFVlTX1JVLiFva0jGD4TXFBxinhzk3E80QC/aKY2Jgn7HJjoeAUuhGVOlJW83NiLo+SPvMqpGRojwIS8jklQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chbMgRWk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chbMgRWk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1172592066b.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604112; x=1753208912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9gAh2MoympKgGXV7ayiMBOsRUSAhF9sCP74gyvTm74=;
        b=chbMgRWkZ19Te5SsuHO0Qyto827In6lEJVFZJaW1lVpvgrHz1ptJfazPcXkmYjRGvx
         Juymuup+XrgNgsFt+fdNMVVyQgaLBWIpE51RR32CGVk/++YSeZD+mP4+XxUw4MOOpF5U
         c0zDMxDppCHsjQNTz36jPY1iSRcRyTNcmYms3c/z2i3B78htS9sF4tu9BHFWg+Qos9Do
         3Y0wHh1gddEDzCSr2YDbWuxdCze6u0C8qjpN5UV340YvOSZhUKMKXYbk0BGpM4lYo7RI
         qKpuJqlP4gZrwfEC+KwKdqrMbrd7B7ukMjEfVAz2m0fZUZxdPJOSHIPGl4mKFgSMMXMW
         fyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604112; x=1753208912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9gAh2MoympKgGXV7ayiMBOsRUSAhF9sCP74gyvTm74=;
        b=lcNDzAH2LSIiW1N0QZu8KPQsIUawYkqX50JuUA1+q2aC5B8xICjH18UOLNSTKzlM2O
         pBZJX+truTRpKyfZiI3Iiwykp16ZpfQrKEwo1Hd3tN6swKEcFqlcNSPKy4KK6B7VV38/
         68rdTOGST3hQi5GV9Q7QNlvSxMR5+V10B3f/tzDdSXAG5trTlAdmW8FuYIfwNPO+qomx
         CusRYoBbErNrly+h1knu8NuCzqI9zDJX853OgrOvpPxnY2JPGtJRjwlLO1EpWluXHfml
         bMnmSDkRPFzzpUL1Qyb+8B3xLkUche3TjXUkGVblY9JJjndxPFdeb3JigZopk+vRw2IA
         TLDA==
X-Forwarded-Encrypted: i=1; AJvYcCUnSWW0hCo1/AH6meuctUfotlqVYyYAKiRGFhGuLmYMDXv65VNV3EGa4woq3ykRt20d2s02Pw3PtBZoM10j@lists.linux.dev
X-Gm-Message-State: AOJu0YylDYtb6qQuhtypp8sxkn/PJ/KFi+3G2JAxe0BdM5gsIzY5xWTa
	l526o/OM+Fnd50D9oJYAHmw4nJE8m8N5Wnpox++cnVDSANHhr7h3svfe
X-Gm-Gg: ASbGncvjnFmV26WQz80HUTeciuCPeLR4lU2tHtMzrtlZDkSAZUii0REDWRMef+eN+u0
	Ra9mPHSEvKtJ68S23/hT0J4CbJGUrmK4ctJbo62bbhoR+v4G77hLeEep9CadxDpM7B+W2XCm+YX
	TzN0nDbvXdsb3ryq38S1M7hs+HmsbFirpjjAVk7slyTyJzEV3jS7cMElr+FBr7RBGC/K7btz8CS
	6qwd7yFBJ0EHx6YIJKpYZB2bfJDoc+TMiU92q2X/S6igBVzsslVxTGUhbUgeQYhqPOO+IqGKT0v
	pKC0n0yeje9y48D+ngVOF3zQG6lytFObwiMM1wc20BBw7C/KV51zx088reFSciLaaf0kaQcJ2B1
	eFKRcnJe2fHG+Rjej0qOPIlTPOPw3cw9LoA==
X-Google-Smtp-Source: AGHT+IFj7MqGp84U2AE/I7iWa7jPrlVIrlYSMB9Pu9pprSDSe+Z55zgzq9DjdUwSwmpzbOL8x9Ne4A==
X-Received: by 2002:a17:907:2d8c:b0:ae9:b800:2283 with SMTP id a640c23a62f3a-ae9c99cd716mr58420866b.15.1752604112155;
        Tue, 15 Jul 2025 11:28:32 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/11] staging: rtl8723bs: remove function pointer c2h_handler
Date: Tue, 15 Jul 2025 20:28:07 +0200
Message-ID: <20250715182814.212708-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer c2h_handler and use c2h_handler_8723b directly
to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 6 +-----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index a168852cb6c7..beb4272a0992 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -308,11 +308,7 @@ bool rtw_hal_c2h_valid(struct adapter *adapter, u8 *buf)
 
 s32 rtw_hal_c2h_handler(struct adapter *adapter, u8 *c2h_evt)
 {
-	s32 ret = _FAIL;
-
-	if (adapter->HalFunc.c2h_handler)
-		ret = adapter->HalFunc.c2h_handler(adapter, c2h_evt);
-	return ret;
+	return c2h_handler_8723b(adapter, c2h_evt);
 }
 
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index b746e3e05d16..10224d096886 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1317,7 +1317,6 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
 
-	pHalFunc->c2h_handler = c2h_handler_8723b;
 	pHalFunc->c2h_id_filter_ccx = c2h_id_filter_ccx_8723b;
 
 	pHalFunc->fill_h2c_cmd = &FillH2CCmd8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 72ae4cdcf0dd..64f5d7b58258 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -163,7 +163,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	s32 (*xmit_thread_handler)(struct adapter *padapter);
 	void (*hal_reset_security_engine)(struct adapter *adapter);
-	s32 (*c2h_handler)(struct adapter *padapter, u8 *c2h_evt);
 	c2h_id_filter c2h_id_filter_ccx;
 
 	s32 (*fill_h2c_cmd)(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
-- 
2.50.1

