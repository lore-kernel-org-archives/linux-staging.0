Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A485465C
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008932; cv=none; b=dirnRZAPFBxOwxjGbXNFs65UBzWvMxfQ65c29juO8GnONPPUeXcSXVWViiSlfs/5aj8F2jk+UqHo/PtcrOkBnaS4lq9k1KDNNJwq4tGcYhUOoSP4Hosaezouu/zPxyKxGmnd3xY/M5S99tsDNrresGeoa0mEpF/9M+Dg3pZSOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008932; c=relaxed/simple;
	bh=zqAU5uebjy/mNq/kk4zX8lZQPe0Q31dgLBJ17Bty4Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jsy0BOG1yKT+5QPHLtRvIiFnoPTcX268LhxYWvooOQOVaHx6ix/Dj/7zW3TEvtFA8mCw16tLyqsoMlVz4s48IwpEPUyXBcvNhHBSwgY39QsQJnfV5GyLzxJQeDZJTD1YfO0JA1gL0YjolPC2OKRrPoZ8+SEx6jYiv6juYSE/n54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=kBnLOpTh; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kBnLOpTh"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb9b28acb4so2699389b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008929; x=1709613729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=494w9MJdhPcRyE1Ep+x0N4ZDZPcir/0cIQ/GDMguAAI=;
        b=kBnLOpThv4GezMxcwSaZh7cBgiPsxgWfxyO1YP/2AxEDiUNjZYIp6ZWAAUQSgQimjT
         bVct+oYQk4dAjIN+UQdbqRkUtynkDLrDt6pcGz5VDhPeJduila7eR0cHnmJf6xDRSYwX
         OcDf/vB7wicy2ImSRtqmT0ULI/a2UP9BZOUZ2Ix/GCG4dZjnWFzF702xZXCMMHbvZMdu
         ES+VwuMoaSeSNhyCnW2O0s4epr5GT7UimTN8Fdy1V+DonPTxwMh0ng7Xb0bwh2HxfHgl
         JUoG5orwPZc7v5DVjobrxXO6jwT8Sq6VF2vjm9c8eIRmuukm9r11cTR5KgytJddKF23R
         g/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008929; x=1709613729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=494w9MJdhPcRyE1Ep+x0N4ZDZPcir/0cIQ/GDMguAAI=;
        b=mYstT/qclPyga1Pq71lxQB6aVa95xc94WW+XOSIUQDgW4/0xEyiFDyMxyh075hBqiK
         ZJ8WbCmGB3dWSvI56z46cOuQU25JmJC0yr35FJLWFwFCU/91qk4+IZ8yXdeJ0vpNRXPC
         hRtgJa2XHft9Kcy5bpVvxo+QV2fOAExdcPvABh4hDr9rkbZjDLT3jQTGwv9OAFWmcwPq
         S1X32O8PWb2bKJbYhGFbjJ3VkGVE07hZYuiLLpgW4licFkvm7fK78xQSsyqRRHK8cDvX
         7afo8ihyTgsDysQKQ8qlntrCbrBFyt4VUuUPlqeASa3+fENEJi1BE9gCQFAAL54OIQqw
         PMmQ==
X-Gm-Message-State: AOJu0YyyaZJGC8yctmWbru/cXaiot7XC7WhIDB93JajdYgYnHXF2ds7T
	b7N8TDTnEq6CJrkm37+FlR/6zWcOeDn0YxEIX77J2DqPRZbJWhN6SYNvJXqOHGw=
X-Google-Smtp-Source: AGHT+IG4YUhVxaSBnXPsJIULUKt9gS7CBx7x0PLGIkzsVv5hpJ5BSwaLS/B4nsuZ9inxMJ044rQCag==
X-Received: by 2002:a05:6808:2286:b0:3c1:b017:173f with SMTP id bo6-20020a056808228600b003c1b017173fmr100403oib.12.1709008929538;
        Mon, 26 Feb 2024 20:42:09 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:08 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 07/20] Staging: rtl8192e: Rename variable bCkipSupported
Date: Mon, 26 Feb 2024 20:41:44 -0800
Message-Id: <20240227044157.407379-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bCkipSupported to ckip_supported to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 8 ++++----
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ea08ac058421..6cab19b03f4f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -928,7 +928,7 @@ struct rtllib_network {
 	struct rtllib_qos_data qos_data;
 
 	bool	bWithAironetIE;
-	bool	bCkipSupported;
+	bool	ckip_supported;
 	bool	bCcxRmEnable;
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 63e3b655e4ee..cdb7e87c0c89 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2099,12 +2099,12 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 				     & SUPPORT_CKIP_MIC) ||
 				     (info_element->data[IE_CISCO_FLAG_POSITION]
 				     & SUPPORT_CKIP_PK))
-					network->bCkipSupported = true;
+					network->ckip_supported = true;
 				else
-					network->bCkipSupported = false;
+					network->ckip_supported = false;
 			} else {
 				network->bWithAironetIE = false;
-				network->bCkipSupported = false;
+				network->ckip_supported = false;
 			}
 			break;
 		case MFIE_TYPE_QOS_PARAMETER:
@@ -2349,7 +2349,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	memcpy(dst->CountryIeBuf, src->CountryIeBuf, src->CountryIeLen);
 
 	dst->bWithAironetIE = src->bWithAironetIE;
-	dst->bCkipSupported = src->bCkipSupported;
+	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->bCcxRmEnable = src->bCcxRmEnable;
 	dst->MBssidMask = src->MBssidMask;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c3f37e71d614..0915f4f8761f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -740,7 +740,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		}
 	}
 
-	if (beacon->bCkipSupported)
+	if (beacon->ckip_supported)
 		ckip_ie_len = 30 + 2;
 	if (beacon->bCcxRmEnable)
 		ccxrm_ie_len = 6 + 2;
@@ -817,7 +817,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 			*tag++ = beacon->rates_ex[i];
 	}
 
-	if (beacon->bCkipSupported) {
+	if (beacon->ckip_supported) {
 		static const u8 AironetIeOui[] = {0x00, 0x01, 0x66};
 		u8	CcxAironetBuf[30];
 		struct octet_string osCcxAironetIE;
-- 
2.39.2

