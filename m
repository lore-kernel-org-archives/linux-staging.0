Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0B480DF5
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119837; cv=none; b=XXXrdif4taTSYMYfEk0tFvnKlraNIIciVxrux+sK7lSQqLxPJt5boF//Lv5pjKBmthDiWIZycfu6ulRRwnLtKxKOmlN71rIGk1TQ/MQh9rIhNtKgEcEnCIs3T8o1mlU/e5w5crLPmgaADOButXIit8UYsDHh+mcaHMMUAUUAzDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119837; c=relaxed/simple;
	bh=im5v7plYnVL19o33g8lyvm2Jq97CV75vKcPw6PmxTKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezFvwkjZYmzETrFE3Rs0AtjQDiVozMP9rMIue8omLvsuppAiga7ZDKonfsdhRCxyrJl6LDZFd+P3q19QU1avNvDAUXgrAdbQcZZw76ESqZfrjst/MuAQx1pO8dddqSyUZ4I2tOKYMgDsGeuGrmtn3jE3nfFMnsGcdV4GzxUBIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5s/+pqb; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5s/+pqb"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so19181141fa.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119833; x=1784724633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3xnvEidNAcLGJBtkHvj3DBY0GwTLkUJo2iIVQ5ynqM=;
        b=e5s/+pqbKohCQKrVOOiboJcVyGKTY8XzL+gfHLhbNrsGg0o66We77dHEV3dW1gTgru
         FYRm9aBjX9tImVF9a7PyFOFYaDqypzKExQ1Jg0kWM6IZ09blgfnW8PHoKcCw+ZJzSjhJ
         oObGppgJizvI5otGOQEaTYq9D0b4qzuEUn4YJdUwuBIqFIOo0WXcX61kHi6e3EvmIoX+
         tx0rJzVgVxsbdT3xuqR5YYxTjQUrdDqO4gwydzDKRx8M5luh3UBqyvwlRHliVqWbTe7U
         S0AfOgkKd1dl2rHP9Uv8JBNMXM3T/WchiFSLe0wgqi/4iMJpbs0hnruZQ4eaTpSY34Uq
         kWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119833; x=1784724633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3xnvEidNAcLGJBtkHvj3DBY0GwTLkUJo2iIVQ5ynqM=;
        b=IAdmzECA6c18L6Vr94MYhUNc9pb+sO7WKyd5BeprtAsS1CdO83pUKCoInffOzxFsOF
         MV5DNCdLvQe/MDgxKnDagWx7vfh6vmTAHwIPm8jQcr095At8mv8cIctoGnyzfN3IvG0P
         w4ipF2jLUfzSG486EZGWzgJ1ZrUpq1U60n06wFS/zgIuxcGr83/pj1LbZ6a8F4mo08VZ
         gqMQTBYjXmEny/bsTIoE46wiC2YehgEDSJAeHXHFH7uu+WN6C194kZWI3WSo/zxL/Via
         v02aWsrSD5fVRimV7tenXyjxjoNFoJqsXgKXszviB5OY0LQfpODICzjzPUeplzpZyCXG
         7ESA==
X-Gm-Message-State: AOJu0YydVG3waOtK2HUJBx/AJJeFoRSh8d80cjEMDQswB3FdEsO1Q/8L
	MSEM84i++tEDemX2i/OvLnw4wyTQ4CJyjOVJWRsneJI1lQ7+Nosn8K59IdP8IC2WVzE=
X-Gm-Gg: AfdE7cncfD+S43Z1ciPhqLIWzIJAyAlnePjZHkppGs10Dlk0l+/S0zvNjMnoXq9Nt37
	TNJnas3ZvRtWTbe1JRTfYftZjHQVnlNavZ+bQQA7EtFXXEiRrqXY8aSHJi0fIZRWjMUjDF1WZ4B
	D2Id+Js75Qq8h5HP5RCq8UBCH2U78ff3NPu5pkXrCl2pIa5nLrOCBpj0c7sOgczE4MZn2tnURp0
	k9myNIJgSPihIU6MsbMCX3rfBQTB4It98jcHIGqf8gPZSHYtOUx8qoFgtpXJi6V2MsouFK8OFu6
	2hGCVm5PUXm55b8RrfTgDPdKinUXD/steZgi1v/9sMiPsdGIJSyJ3pGQlRU6eWO90BVNjLyG5Sh
	qF6S5E7pKHKk9VH4gFGU/rqp+Y6LU5FrWWbrahzhtLfI9P8BWCDccZAvK8tz9Dnep3PXAwpZsyI
	eRQEJYy2izXTOfqFMFHaiDiAUQVhATk+z5E0wvvfpIx88U/3Cu9T5gShiu/dJoUuDqn3RP5uql4
	lUVcMhkgyNvkg==
X-Received: by 2002:a05:6512:3509:b0:5b0:197b:9811 with SMTP id 2adb3069b0e04-5b0236b6f58mr4393191e87.53.1784119832671;
        Wed, 15 Jul 2026 05:50:32 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:32 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 22/61] staging: rtl8723bs: inline single-use init_mlme_default_rate_set
Date: Wed, 15 Jul 2026 19:47:50 +0700
Message-ID: <20260715124829.90290-23-ulijg308@gmail.com>
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

Remove the init_mlme_default_rate_set() helper function since it has
only a single call site across the driver.

Inline its rate configuration arrays and memcpy operations directly
into the initialization routine where it was used. This simplifies
the MLME initialization path and reduces code clutter.

Clean up the function definition from its source file and remove its
prototype from the corresponding header file.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 34 +++++++++++--------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 064c9923d..54690c2fc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -184,19 +184,6 @@ void init_hw_mlme_ext(struct adapter *padapter)
 			   pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
 }
 
-void init_mlme_default_rate_set(struct adapter *padapter)
-{
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-
-	unsigned char mixed_datarate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _9M_RATE_, _12M_RATE_, _18M_RATE_, _24M_RATE_, _36M_RATE_, _48M_RATE_, _54M_RATE_, 0xff};
-	unsigned char mixed_basicrate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff,};
-	unsigned char supported_mcs_set[16] = {0xff, 0xff, 0x00, 0x00, 0x01, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
-
-	memcpy(pmlmeext->datarate, mixed_datarate, NumRates);
-	memcpy(pmlmeext->basicrate, mixed_basicrate, NumRates);
-
-	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set, sizeof(pmlmeext->default_supported_mcs_set));
-}
 
 static void init_mlme_ext_priv_value(struct adapter *padapter)
 {
@@ -216,7 +203,26 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 
 	pmlmeext->cur_wireless_mode = padapter->registrypriv.wireless_mode;
 
-	init_mlme_default_rate_set(padapter);
+
+	u8 mixed_datarate[NumRates] = {
+		_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_,
+		_9M_RATE_, _12M_RATE_, _18M_RATE_, _24M_RATE_, _36M_RATE_,
+		_48M_RATE_, _54M_RATE_, 0xff
+	};
+	u8 mixed_basicrate[NumRates] = {
+		_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_,
+		_12M_RATE_, _24M_RATE_, 0xff
+	};
+	u8 supported_mcs_set[16] = {
+		0xff, 0xff, 0x00, 0x0, 0x01, 0x0, 0x0, 0x0, 0x0,
+		0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
+	};
+
+	memcpy(pmlmeext->datarate, mixed_datarate, NumRates);
+	memcpy(pmlmeext->basicrate, mixed_basicrate, NumRates);
+
+	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set,
+		sizeof(pmlmeext->default_supported_mcs_set));
 
 	pmlmeext->tx_rate = IEEE80211_CCK_RATE_1MB;
 	pmlmeext->sitesurvey_res.state = SCAN_DISABLE;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index e949f5efd..a850675d5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -418,7 +418,6 @@ struct mlme_ext_priv {
 	u8 active_keep_alive_check;
 };
 
-void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
 void init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
-- 
2.55.0

