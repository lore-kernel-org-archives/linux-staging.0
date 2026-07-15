Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C61481AAE
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119850; cv=none; b=YMb21AfWE5i6QpL6kzKul2Qnm8WvYsBkif9zluZ/wOIZT3Bmw5MBkyCPOPALo+uBAvPlmojr4rkQc2TGY85idumyychVA02B+ynFsgClPHxWpZVVB+Vv8MZaKFUt4wrPTEiE4K1u6g6DWVE7IFCeQuLkI+uUZl42e7kHNdGFIB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119850; c=relaxed/simple;
	bh=RQgHe7MNFy2jTX3N82Ppi9LspoMW1n8fVhbZL+pIuxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFmeBwrFDgDpv95RXbv0zq/5/vJr3vGzk2tYEa+FMiCrrIY3smTcALlcPPf/vP7otmWlnNHlhn52/lrtq/5/NUcPL5bE34A4gJSMzG3Y2aEvQYQKdBKYwMSwkwOOGXVW1QxMoNsQ6sbJn0mQEFySGBV6ZImFI7an1ZctvcT0Jlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8S6yGNy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8S6yGNy"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2285215e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119841; x=1784724641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EccBw5SDsbElCyYYL5IOHllhMjqbCF7PrrIukfOLRUY=;
        b=O8S6yGNyvsdLCxqdwIr7+6vRI4fXX3gvhooN9Nv4WZKICAaac4Bn1eSzsoeI8ezUQm
         /3/XB4m0PYm0UeR9PZuTtIy5V51h8aQavIZNCoLqyN1Kr8aqEnZq2o0JSGKVJeN1Hd2w
         c3lxZExfihoH35i+cH3CenWLgQGnyXSyrzPDc0OWsKmCXqjKHW9GKmly3ME/y4AyaB8/
         E0NKGUmCmzt+Nmhg1Cmupkk3GybLJJuSmguS5mNon5T9ws9P1fWsHn2r0EuDw9LxL7fV
         l20l/Rnu6A3H/MpbXkAMsfujsMaWtxuTgN7skJ4x0dXHEkKoJqoE2bL8NUmG4W/3bQz9
         c9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119841; x=1784724641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EccBw5SDsbElCyYYL5IOHllhMjqbCF7PrrIukfOLRUY=;
        b=g6SVFXNXkMP6LGfAQpmcafTOpPcc/W9qef0jlVJGUs+/2UFnff012ELanKVpaAd3sG
         xqzJaSsSImb247sKNtaXmL1SJODCVy6DLmbakoheUJx28+aMhj6ACxj5xPR3y14lnlEo
         C+UFNP3YjPgyDZS9IgLDI2SCqvFmSRPeSNQ+hLeVB1uTzvPPLRF16WWSj4e59Aud3+It
         kNaxWgzgEXxh792nWo3B0BMt7hZ4qQXhMDh04khNumZUv5LPGJzEhx0Us5vY2EIs2RdW
         LXDu2MdcBcYUJc28qNLd5mxDmDtMRzKxAmsBRmSxZfhxVHfi6weEn9Uv5CANqDWywJ/J
         /JrQ==
X-Gm-Message-State: AOJu0YwVE7LBeVRg6VlyN9LG6Dk8roZ1Wb9gYRVYko3Aan62g6I8BvJc
	h0AdIrenB7iN2aBCt0mJQZOECuoMliYfVn80rSJ49KiHMTOcHNVPX9NVe/UHdi3kuYc=
X-Gm-Gg: AfdE7cmXYm7vHmtauZ3N+NVi+6e37//WGnK0QvB86se55+uc6f1HY6j5ymvySQ23u5X
	PuZQPhsaOzwibC+HlKZJLkLMysA/7HwHYQCLTBh9gNlSynefiRRFullL7U5ezdO5OAKrwWIZ2Hh
	Xq0TXWd7Kd0mwQNcZRJFf7ed9aHzr5w5FDpVW3PuPh3zBCqiKIX6YLk4o6PZy8+FhQZUaXDjck4
	N5YJ1Kd/Qhb4md0plsPTFm8NOUvkoxH+l/eFB3zZ1GTjupyo8yI6Y+pW8uwMnir4m+LApV2U9hZ
	9RaFLMTxUxS07PBg5Y5DZDAokYDryHKUgaTn9hw0hmaRPPLmhPXMLJTz0WRYXTd69bTEGfoa3PK
	GRmhHUAEGHoShs2ntVexmlV0A/E7J0W4H5U7T2eNBxIuguptvsQbI8n1+mXQEvt1bp2EjtdyozA
	gzIjSah7kTOwz6xZjyy1LZ1bzgb8CwT6qKZJ/P0+Pt4+ewSGHkBtr9Qsbj3VECtbFEeNt1cYZak
	DGWjseW+KtV2g==
X-Received: by 2002:a05:6512:1081:b0:5b1:54a3:d133 with SMTP id 2adb3069b0e04-5b154a3d1b7mr2946167e87.44.1784119840835;
        Wed, 15 Jul 2026 05:50:40 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:40 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 32/61] staging: rtl8723bs: remove rtw_free_mlme_priv wrapper and rename helper
Date: Wed, 15 Jul 2026 19:48:00 +0700
Message-ID: <20260715124829.90290-33-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_free_mlme_priv() wrapper function, which did
nothing but call _rtw_free_mlme_priv().

Simplify the code by renaming the internal _rtw_free_mlme_priv()
helper to rtw_free_mlme_priv() and using it everywhere directly. This
eliminates the useless leading underscore naming and reduces call
overhead.

Clean up the old wrapper definition, update the function prototype in
the header file, and adjust all call sites across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 7 +------
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b038233af..e86a4e83b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -129,7 +129,7 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
 }
 
-void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
+void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
 	if (pmlmepriv) {
 		rtw_free_mlme_priv_ie_data(pmlmepriv);
@@ -302,11 +302,6 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
 	return ie + 8;
 }
 
-void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
-{
-	_rtw_free_mlme_priv(pmlmepriv);
-}
-
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 233bf98e2..8c924e35a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -349,7 +349,6 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms);
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
-extern void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
 
 /* extern struct wlan_network* _rtw_dequeue_network(struct __queue *queue); */
 
-- 
2.55.0

