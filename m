Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6894C0438
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119888; cv=none; b=HceO6Bfx7s9o6EQCZpG2wDzYXLHViog7vDdHk+t4fqzSofucBZvQAw4UegqSSwoM1393lTeXAwYPpNAhEILma0xGakXfR3qcmCjzmXSAdOEybjDntHwssaCNTxRa4EaL6KNsF1ddT2tVLWqTf1XgdZv5BEmeim3/asJL1+bEhbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119888; c=relaxed/simple;
	bh=2K3uMd0qj4h5cWvgljLvyufuFwQ8Xol5kia+7tNtQ+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pzt/rNMAqjcHGzgEDafr+vCgn0DOvU6phGifDPK2cGSDdVEKc8FfnRlQDeiM3ooDabhRM86yBnbmlL7ALuinCSdMCK0IHjSmTHbqSBiPvsaWpsfx2jSmKVyfyzvSo1AhM97R1o0NtZPZji2t3JcczQqCX1utGN5akOfrTm+Zj24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKKCdWi7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKKCdWi7"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso2686055e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119861; x=1784724661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/giKKJOlrJZmyyc0tV7j+6GkAzOJxcx9dQZUh/VbNdM=;
        b=lKKCdWi7Rnn9CCxn9vYWjIxQ07qOdRhKKhVndD3xrPCujWvFLMDAWJ18ZtAX0WL+Sn
         pKLOqbSb9Weo88wowpvxzh2AKuzUecQrMKr6SspfCSb2zAkWzMdm1zWIHG/uS3ml88ge
         fvOx5Ps/ku/1K4XWSx9V29PM8nsHjrwXES7u//HIugSX2dSZTTgIl4GqhCCPKKvcEOuU
         fP8Jx5BBH5yrsRTTaWMWKxgYTurA5UtUbSc/wqWzom84Eghg4vW20w/VTpzNACWb8h29
         fBd45A5tl+yrc9C5D8UWHS4n0V1ypLCFsggSRrpbYHcvDIMGwPH6ecEATtizRtvVOHWy
         6u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119861; x=1784724661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/giKKJOlrJZmyyc0tV7j+6GkAzOJxcx9dQZUh/VbNdM=;
        b=e/6FXvQ8hFRKMle12ijUjBhtoewk477lmEDRN6U5PY+puvrxmw6ZmN+R8hVX5jyuqx
         DPlRTPCgix0MxSJRNGOAGKv00ajvhZGoNYLQGxGdz+McQ8AAo8zqJ1WF2cP0Y1KlAiH4
         saUqnGxa44YNxq66doKmftMpa/gs2A7hDSqFKL+vmLa6LNy0VjXK4FYyqPrHk7i8r0lE
         JFPHNeNje+rwKNcKFCHDieUOx6E2ybZOhURsyOA1GC3HKFlC4s0UxBBz9XRNhp2p75Ah
         3z6NkmB9JZhNt/HgwB9lCkIpn4V8R7NYcJTnNNcZ2360R3eSd9Gf2qCw6vW+VUOROnnd
         v9sw==
X-Gm-Message-State: AOJu0Yx5DAf7c3JhS/jcnX9FczgOEAXfGz0iVdQYH0VqdTD56Z6aEvqd
	Sv9FeOqeXeymaetqGt4j0aR1Acu3eYrl2FlwRJ0nqgM9e2DS+DI4HUrM
X-Gm-Gg: AfdE7cli3aNg4ub5bYdh8TFxM1qk+AoTWXo6aYavz+fDmUsVonOok6v4WpgqQrkxVG1
	NJdsnModcUex1/C6kGQXbJAqpLz9ZOgiRMKLKwQ3RuLzH5D32VY/GmfTlMKJUJ1KMTYfBrTYsiK
	ZOoKu1Z2m5AoRW57ezFmN2djChuod39b4AOIQdN3938vcr6GthHfLgJUe8fH/jwm7u8y3FRH8DF
	sF25bF/ZtIkxetCdB5UvxzFGRPrqiYR4HvfvWCdZZcY9SXUSrZPrpRc1pnykqC9An429b1mhxOp
	A+FKGzMHdluqLmZ3nXsd4bM4a7n08eYn5/P7zHdF0AmWqmHQNFIQ28DAbSu37jS4aaiEak6bI7s
	y+zpe8jslQ3CNa7uuMv7OPtGQya1Q4TSt9C4HO2Gr4WaCkf2jJSVP9oSW+UHw8fweB4+RsxAHh4
	ZVQ/hCxCGYcab+qlIUqDtouA1TcHDqYjC1/uLeL5PUiiDZ31blaXehMQpTxZ/CiLLhgZieDI9ln
	O4RA6uEtbHWfQ==
X-Received: by 2002:ac2:48ac:0:b0:5ae:bd65:9e04 with SMTP id 2adb3069b0e04-5b0235664a4mr2971527e87.8.1784119861133;
        Wed, 15 Jul 2026 05:51:01 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:00 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 54/61] staging: rtl8723bs: inline SetHalODMVar into rtw_hal_set_odm_var
Date: Wed, 15 Jul 2026 19:48:22 +0700
Message-ID: <20260715124829.90290-55-ulijg308@gmail.com>
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

Inline the hardware configuration logic from SetHalODMVar directly
into rtw_hal_set_odm_var. This eliminates a redundant CamelCase layer
and simplifies the interface for updating ODM variables.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 36 ---------------------
 drivers/staging/rtl8723bs/hal/hal_intf.c    | 33 ++++++++++++++++++-
 drivers/staging/rtl8723bs/include/hal_com.h |  5 ---
 3 files changed, 32 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 0a0b41ebe..3d6b59c24 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -643,42 +643,6 @@ u8 GetHalDefVar(
 	return bResult;
 }
 
-void SetHalODMVar(
-	struct adapter *Adapter,
-	enum hal_odm_variable eVariable,
-	void *pValue1,
-	bool bSet
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	struct dm_odm_t *podmpriv = &pHalData->odmpriv;
-	/* _irqL irqL; */
-	switch (eVariable) {
-	case HAL_ODM_STA_INFO:
-		{
-			struct sta_info *psta = pValue1;
-
-			if (bSet) {
-				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta);
-			} else {
-				/* spin_lock_bh(&pHalData->odm_stainfo_lock); */
-				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
-
-				/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
-		    }
-		}
-		break;
-	case HAL_ODM_P2P_STATE:
-			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DIRECT, bSet);
-		break;
-	case HAL_ODM_WIFI_DISPLAY_STATE:
-			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DISPLAY, bSet);
-		break;
-
-	default:
-		break;
-	}
-}
 
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 2c50fa5c0..d2e310115 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -161,7 +161,38 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
 {
-	SetHalODMVar(padapter, eVariable, pValue1, bSet);
+	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
+	struct dm_odm_t *podmpriv = &pHalData->odmpriv;
+	/* _irqL irqL; */
+	switch (eVariable) {
+	case HAL_ODM_STA_INFO:
+		{
+			struct sta_info *psta = pValue1;
+
+			if (bSet) {
+				ODM_CmnInfoPtrArrayHook(
+					podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta
+				);
+			} else {
+				/* spin_lock_bh(&pHalData->odm_stainfo_lock); */
+				ODM_CmnInfoPtrArrayHook(
+					podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL
+				);
+
+				/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
+			}
+		}
+		break;
+	case HAL_ODM_P2P_STATE:
+			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DIRECT, bSet);
+		break;
+	case HAL_ODM_WIFI_DISPLAY_STATE:
+			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DISPLAY, bSet);
+		break;
+
+	default:
+		break;
+	};
 }
 
 u8 rtw_hal_check_ips_status(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 962ba3aaa..79bb60c5c 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -141,9 +141,4 @@ bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
 void rtw_bb_rf_gain_offset(struct adapter *padapter);
 
-void SetHalODMVar(
-	struct adapter *Adapter,
-	enum hal_odm_variable		eVariable,
-	void *pValue1,
-	bool					bSet);
 #endif /* __HAL_COMMON_H__ */
-- 
2.55.0

