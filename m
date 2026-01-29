Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D12868A9
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693063; cv=none; b=NKFXbDcqoOQRgMu/w6q+kizBzfer4IsTZiDX5mDi0k2LWe6jVetBY+BTD7Q10qdfj27NAEpzNM3ayW6LCHI4JV6foBDF0arCk5iGmwmO0/HKwYRy+bqEaEW9cHUmYX+NndmuzTI0cuVSa2+iR0qVsl9o+as6x5LSTl3Jho+POs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693063; c=relaxed/simple;
	bh=qYVtkn+cxp4QV6/+jBhIsXMwrmuZrnkA6aQayP1iKso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMKFZNbC5Hce/fkPWzevhBaWHZvJ4t3m5U8pFeQORt9opYFbtKu7IokBbeaKIShC5rOEbeW2N7JlLBEVHKEg3/2xO+eP/PExnP2rhNocJFx9LEhSaPs0v7oCA8MRrCDw3dgVuygY5/zbTFi9Klq8Im3cV6pmFeIMJIRHpeb5RoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEbTh1o9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEbTh1o9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-480706554beso10237835e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 05:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769693060; x=1770297860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s+z8TAXRPptxKCmOFNnf6+JM2I9hNSLblXA5N2Wnao=;
        b=cEbTh1o9TBerQTV7YS+mHfwjBjIsD9fYuXaO0KOKpsg3kGG43bjbKbFiF5dT+Reled
         cdBUPr0QYFNZvKcDb89E1JfmjqsKSXp9/HeXltyZNBDk7OOZ6OCPFtVXjimHrmKOPOmr
         hT9h1SnUPAg2+PoUcM1bfLnKTPwwcbxWru6yU5+YccdrIMJAY8HUJaybXZHYiQUp1NNr
         nRWoYURbuzpiKZWmlMDU0vItV/CttPTTc0WdYrJ0I9wk1TGaPbYzQWQ4c7Z5Xk3Y+K/e
         6cEzt/XouaHi3KipD6WqPg+HNf1+ozZgnZaxhPmOhswuQOZzV9w4wWGCEHt5nhnta4Cm
         8Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693060; x=1770297860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1s+z8TAXRPptxKCmOFNnf6+JM2I9hNSLblXA5N2Wnao=;
        b=nE4jyLQbmbO4EEyiNfUZ9Ic3bOLRqWqx7KaGqAD3qUqO2G2aHc7x8M9unZGq58AVnN
         D/nbG2IDa31vHUlKpjfNN/ohCGRcah6xskzpN5/GfswM8wccfk1eZq8JvDJXbdM0Y6uB
         Wr7NPO1wKFkGqE1DWQfjZGMBrBLK5eia3d3cbJ1hJ97dS39qlArefdDbk/MlIfj6hpx1
         vBLOhsgIchbz7NeOUse5BpKMY+jeq5cFSeV/+tg+Kg0iWpBRUVCyLn5Ey8atu2pyVirq
         dKfGQ+vaPvB/VsruKqW4TzS2TQeyhuO3qeiNXVSaQvKcnEAvOH/giTR7YMBoAWQHo0vR
         O/sw==
X-Forwarded-Encrypted: i=1; AJvYcCVeJyZEF4Lgfg1+MXdVswShigQ4FamxYpkrReKYSzJCCN6e2SNwYI68cNoO98PUrZQyUBFO/JWTOre0MpD8@lists.linux.dev
X-Gm-Message-State: AOJu0YwX+nmR+RuxBbSmKFa/hgPwr4idUsbdavB5o+0y9pnnUNP0xKhj
	JMPL0mbkWZv3qq3wJHPICPbhGNohaFEvyLYYTfr2+BPXXGUSkhvsqWA=
X-Gm-Gg: AZuq6aL4m6JUzsFYtWxaYdlnhhUAI3T6UBqupLil6BHAq9zQoG6CnTVs/jRL5NQ9AFK
	ocm7QIPR5iHvjjcrMBv294HV4VTi2xGOmDK8fwGC0d/DWjvn265r7KydryLVz5Zbc1FhEmW6W5o
	YDzj6AxoUJ8ARqsC+MPmWBvL5dtgBUiuCZKtvTD5EDZX6z17voj5sOBHhQB9FJ8JsN5E/q/d5SC
	fdLiXYCtTTRArGVeUMZDgiz5Tz7FXHh7UV/btAb6QeaTdAI2GeAOjO4s7ZPNwv/P5YfBjBcHOUR
	doT3d851BfWzkI01XDw0/43A2n9RwH9RffA+15nEGpj8O3YiFE4dvGAr/d3MoktHTJVceI7GTtW
	iCkJSN24F+iYOyUR0glkmBTbSWysQ8VFUlYesZELhjV2aXEUXdqIYWQ1lvYY5dvtVxNk7Zmi8uI
	UoBZg2b7Ic+IY=
X-Received: by 2002:a05:600c:1992:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-48069c74078mr112409395e9.33.1769693059958;
        Thu, 29 Jan 2026 05:24:19 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm217492315e9.1.2026.01.29.05.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:24:19 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v2 3/5] staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
Date: Thu, 29 Jan 2026 14:23:50 +0100
Message-ID: <20260129132352.14615-4-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129132352.14615-1-lukagejak5@gmail.com>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual hex-printing loop with the standard
kernel '%*ph' format string. This simplifies
the code and uses modern logging practices.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..c4f58106b3bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2084,8 +2084,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

