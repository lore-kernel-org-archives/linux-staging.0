Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3925332E
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952124; cv=none; b=a7LqoOWTsKtvy4RcfsVNVN5WjEF0eOrEvn2s4y9Dx0uhn1iSxuTIKUm6DE7dxTQ35trlj79D5hcCY4T1GW75OBev70omfOUw6NJaAks7m/1Y8NhXS2uRb91UVj0rq4gJ7qkfRF6z/T69jpNxQENyInsZPfX+3bm1nDmSGHfYr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952124; c=relaxed/simple;
	bh=4O6K2p+TRWmMSjZhkegRQtZOjebtpRx1fOy4QMy15Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCcQgV1PfatdYkkYE86oEZBtIJV+Ag5VW5agHv48Di4nY4WlNtoDU1DKc8SdXxFEKd/782h6OOlfsV8BAcs5hgxT8fYe0uBpzJHshjkFIU4ckQEKFYc8juxo+yBZ0YVz/JStqeUzmT2JlEAb2JdmU50tBxiv1vMJU2IlZJwGJi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivq5L6xn; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivq5L6xn"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70dfcc589a6so5721296d6.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952119; x=1757556919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYRXyWLfRH1eL49TjUg//MlDi5BSYCOb1YaJi8/zpww=;
        b=ivq5L6xn0gNTHS2GN9MfYLpfhb4/LdTQFCZG/Iqs8nt7ujxVEa/RRRlw9mBbUgp0Ye
         gneBlRd/+w07cs8TOBIkMcF0fs9iJozP2+9m7SVFIzUhEWmsruGUrqfsE2YBsI4r8a67
         RborTbz53/8PkW4MYyjQsfVlWnDHl4gvP+S6HPF14bvx8dlonjew3dqXfLEUAli4sNAn
         Gid1uDxS5IHsXAnywMmdi9ExDDi72pNrNRS9PBeOiXuJjvYELJ1EnhQZfISVtb/rbdPl
         eFzUJaY8KxTYTzk31kNIe7z/KuVVn5thHwwXWm6vS9JHxM84B4CdB3M4F2BECofoCmzI
         d3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952119; x=1757556919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYRXyWLfRH1eL49TjUg//MlDi5BSYCOb1YaJi8/zpww=;
        b=wixD9Q+pRh05iZhf7qlSueiaiXlZVxUCkf6M0YWqQiPw1mmG4qryb/mureeD1vu9je
         MmgxAXJ77ele5asloBy4jJ/yUTkSqcwz+DJjj/aVwJGf8oYcA7WbAZRcNtKSEBOT39Mf
         LKAIlauNc6vsV+oy7oBuuLt4VknfiVBRgIplWUj6z70gGHu7TYJsgIVnxtWr1ko83ISs
         KlZEFVpKEFkClnknnIgmIv82WGXoWvdNq67nTZVwTUgUsRyxpA0cuYxL+nLSilJgsQsa
         1Jq4z9ggkR6zPaKPpMyCv2TmQwNibedQSpVzXsaOUpZtkknRXlJdcUo7UoKNInb1NCB6
         7LFA==
X-Gm-Message-State: AOJu0Ywh1Y38bSPqAPUw+meGyupxTeZP5vKptmbUrS0l1k0LHFKufSxj
	6jZj2xjl5cSNWz3iFHCYmE/wy25UTEDM7GwC2fHs3+F6WXpAEX0jO0TP
X-Gm-Gg: ASbGnctVUUO6kFR4ej/oHbKDr8Yuuc35gzkKIl00ma1XDlCiG4T2aop+giDpxX8Yf/Y
	4Q+3nICZCQ9M3Yz3rgzfhz8Q3I4S+HBnWMb6eBmIj2qjtBB7dZQxMyEdSTUs/b7SJmUB4jmrkww
	9BVhHe0+ZX6/1mNhvj0xEQzbPLE6UhK+HZ00zEcB3OSRbsXqyJspDvGEXu+yk0nEqnnTI0zENd5
	i3LqyKxFBAEsgzKYXyLDhJAY2VhvIuanVPs9NSIslbrlDrLnWKXZaQC40eYVthFZpHDdwMVCRb2
	7cG3TW6MTWX+k18Tdc6NhmYMDKQUJtxmTI09LIegyCjENBim4m6LzLMXF0FgxAmoSuUNTvoaAHM
	gzh1SZnvkB4TaVw4id3sLI55Q8e4yhl2TAVNDer1BpJ1EkdgUVWASegAIlF8T7NzC6MMx8HzS
X-Google-Smtp-Source: AGHT+IFNUhoFvVgPo5tuhX1Rvc3EenlIpbeOVZGp3S+WhPDOXrsTsP9ogT1y019z5zNXkfFQfr+zuQ==
X-Received: by 2002:a05:6214:491:b0:70d:bcbe:4e87 with SMTP id 6a1803df08f44-70fac70188amr174020156d6.8.1756952119247;
        Wed, 03 Sep 2025 19:15:19 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:18 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 13/16] staging: rtl8723bs: add braces to all arms of conditional statement
Date: Thu,  4 Sep 2025 02:14:45 +0000
Message-Id: <20250904021448.216461-14-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add braces consistently to all branches of conditional statements to
prevent potential future errors when modifying or extending logic.
This aligns with kernel coding style recommendations for clarity and
maintainability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 27be46c11b65..25f333bb0816 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1667,11 +1667,11 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
+	if (pmlmeinfo->VHT_enable) { /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	} else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true) {
 		mlme->auto_scan_int_ms = 60 * 1000;
-	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+	} else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
 	} else {
-- 
2.39.5

