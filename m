Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273254756
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008932; cv=none; b=p2c8+NzZYawMrnNllCH5OM5XCkzRl+Sl8z+4fFOAPiJ+6yhMtFcYFNR6BHMGUGGczkTUPZsbTkMtBtsPBEuzHxzXR7LTYcZr7ZfimwWt02Eeo0OuKypt5JEageyVF3wsmpN5j28wv9u1rCFaL9+e4A6gBJfKT7jNnFfQ4Im0Ols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008932; c=relaxed/simple;
	bh=NgTkCr0gehBgV1KCivs1oDK2kOFW7oHrFLKDK+Ht7tk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FZEXyfOh3UccnGpRtQrVuswy2KAZK1lvxNp+AQ3jGq9x3NaxhJ06T0GfbEFP5mRTutX+/86iG6SuK6TuK2C8B8hEADPFTQB2ousB0Iwacm8P5f50lS+iNImm5ygGte5bdg6+37mdnlQaaxbaMRS6fBARlv5UF2uZh6LGNVOKtIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=RA9Gah2a; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="RA9Gah2a"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e459b39e2cso2282433b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008930; x=1709613730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OTz9b34bEXHsUaswBLFVAyQKLcaocJ+qtGhmHq+b+c=;
        b=RA9Gah2a4kXtZvrb1CetoEiCUoSVqvN7bC3wmmIdA7VzSz7fUw7C5hTje9ST1HdjGa
         R1MfHSdkz+XbW6fvYon/aq7Fin1JoRSez/uE294JDQRaHEmpCXTK/EjlTkRpnumopekx
         zKf0BvuJ2hDyGj8yePbAI1/68EwxC1HpK/LOgTLjrD4hrgJDsS4vh+voPGm/CHWzV2tA
         47ElO5NDPg/R1mbDiazoqu8FuoGnkN3M10AFNdY1DqtkMggDlDkXkg3FObKRzjS2WVYx
         WC9mMeliT/IRJgW3GvQT4tX8ApEJ1jXJMZMwNrypI3pMobo9e3yam5qNdJACK51AnXef
         zPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008930; x=1709613730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OTz9b34bEXHsUaswBLFVAyQKLcaocJ+qtGhmHq+b+c=;
        b=Bb8mjN35+01aeVI7vjiOPBe/KX49ZeIZsevXS8VzS5Uc7iGFTjChTPs7bTHLeOg4+K
         8KBmtJlh/5mC6lcdULjagxTA19ZIkzrF0iOJ/FqTcaUXA0zjwEmd41m1GTTDN6a722rH
         gr3HK4+c7XdCnnSqI5JdED9J9xoUqkiZomMLH0e+l9Cunum2Y59+6h7ngiHGldEvl4pa
         i+tDNJrsAW2gm9ZG7fBju0uLL3AYjZ5HOtA0DUhSn1/sR2ryptW28Ab91Ot03ONB4pIq
         l9lK+t5DmVuK9bROjuWwpyEmZHCUQK4X3uvR4vOAUkEfImdmeCmIkpAj39c+NWfEeGyi
         n8rQ==
X-Gm-Message-State: AOJu0Ywb+BjxEhOj98c6EPkIShjDyw1ABaBHWvywRfmt3Ge9NGX7whju
	yBl/kycREZqAMAJvbSUsGelnG0EddKvGS2ylF9ubFFP+pz9o1cES00lqwRn6nfU=
X-Google-Smtp-Source: AGHT+IFdTmBeovwypIs0SfBKmu3Z6v4WmoeSKrxw9xCqvJg/OV6k/8Is0ws44olSC4graimBO5WmzQ==
X-Received: by 2002:a05:6a21:998f:b0:1a1:e4c:2ff8 with SMTP id ve15-20020a056a21998f00b001a10e4c2ff8mr1089510pzb.12.1709008930323;
        Mon, 26 Feb 2024 20:42:10 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:10 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 08/20] Staging: rtl8192e: Rename variable bCcxRmEnable
Date: Mon, 26 Feb 2024 20:41:45 -0800
Message-Id: <20240227044157.407379-9-tdavies@darkphysics.net>
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

Rename variable bCcxRmEnable to ccx_rm_enable to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 8 ++++----
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6cab19b03f4f..9ec4a3b8ae3c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -929,7 +929,7 @@ struct rtllib_network {
 
 	bool	bWithAironetIE;
 	bool	ckip_supported;
-	bool	bCcxRmEnable;
+	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
 	u8	MBssidMask;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index cdb7e87c0c89..103117692a88 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1818,9 +1818,9 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 		if (info_element->len == 6) {
 			memcpy(network->CcxRmState, &info_element->data[4], 2);
 			if (network->CcxRmState[0] != 0)
-				network->bCcxRmEnable = true;
+				network->ccx_rm_enable = true;
 			else
-				network->bCcxRmEnable = false;
+				network->ccx_rm_enable = false;
 			network->MBssidMask = network->CcxRmState[1] & 0x07;
 			if (network->MBssidMask != 0) {
 				network->bMBssidValid = true;
@@ -1833,7 +1833,7 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->bMBssidValid = false;
 			}
 		} else {
-			network->bCcxRmEnable = false;
+			network->ccx_rm_enable = false;
 		}
 	}
 	if (info_element->len > 4  &&
@@ -2351,7 +2351,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->bWithAironetIE = src->bWithAironetIE;
 	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
-	dst->bCcxRmEnable = src->bCcxRmEnable;
+	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->MBssidMask = src->MBssidMask;
 	dst->bMBssidValid = src->bMBssidValid;
 	memcpy(dst->MBssid, src->MBssid, 6);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 0915f4f8761f..f5e0741af047 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -742,7 +742,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if (beacon->ckip_supported)
 		ckip_ie_len = 30 + 2;
-	if (beacon->bCcxRmEnable)
+	if (beacon->ccx_rm_enable)
 		ccxrm_ie_len = 6 + 2;
 	if (beacon->BssCcxVerNumber >= 2)
 		cxvernum_ie_len = 5 + 2;
@@ -837,7 +837,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		tag += osCcxAironetIE.Length;
 	}
 
-	if (beacon->bCcxRmEnable) {
+	if (beacon->ccx_rm_enable) {
 		static const u8 CcxRmCapBuf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
 			0x00};
 		struct octet_string os_ccx_rm_cap;
-- 
2.39.2

