Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A71DED5C
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949360; cv=none; b=JgAtimFfkQ/QccZuLb8CqffI6u+RDxPGZdhPRCu0bmH9aqvD8kTKzw9gDxRaQbsCtDpTJiXYZM50SRm6xs4wn5aD/mXzNOU++DRcNf+VF4NHktEtlv6xb2HAIbCu4SWXCax8+F1RNSCSZ/hkq+FpgobfWWa2fAEqVCViV3UHAy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949360; c=relaxed/simple;
	bh=4O6K2p+TRWmMSjZhkegRQtZOjebtpRx1fOy4QMy15Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CbEMxy2csm5lzdMtuFUfJYP7hoAGtzPsTFK7UYhdy29W++p6BZDR4llcNJdY1a1lGv3d8RZnDRJuKlcixDDkZBUH2/AMJaEcYmFuzLR6qVQvM8qEuInl//4PE9A744h1oSrp5TQGyPsYjaRewbsQV0S3x1eXaIxULKtE7fZLEd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWg7EwKu; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWg7EwKu"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-804437f9470so177589885a.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949358; x=1757554158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYRXyWLfRH1eL49TjUg//MlDi5BSYCOb1YaJi8/zpww=;
        b=TWg7EwKuqkgCPWFjb1RB1WndZ2dtOaY+Tq1jyjDxU/hhyA8WNpNFpxCsW+eEGP3uZW
         ZPvEa9sMS9EFbjTe/DOt5hiT6mRCiGmxMJv9k4qfrezJdb/6bnSeBT0syiY6tyFDLkvO
         TmFCh+GDWQTOyPaJCacCppwXkIPXGOxBawszjQP8lesy2qADTcmqI/+MhxUBeVIVONwg
         TzAWCEu7hY4B87xfuIo05JohSpNnAVpITNP7x+pS9aFg4AXfjodDMya8aO/eVpA4WA5T
         Az6YWKh766RPMFQf9xnZUiHh+BuQPprIx7FgZhoNxTnV4sTnWypXh56AkXhBXxBuQYBM
         oWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949358; x=1757554158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYRXyWLfRH1eL49TjUg//MlDi5BSYCOb1YaJi8/zpww=;
        b=jsAQnqVeLs4kurFBcgW4kP55xEVHy50uPiGz0GiuBMkbuFNzFLd2VwVXiWPJ4bBwjD
         9SEY03h1smZCOcoKpi2BfqAMkGFbqSyH0JrAczY/ZO4LiyTKbBpUED+o7qW3GhSAjia4
         oP+GGL51+EDdiAUAz8PK/h7h9SM0U+PxpGchKNiInMH8GRlQ69EAIRskVDOpkunTKOo+
         pmfez4lCleXe1ApyUHrR4ojcm8rIJlJ6RVscSfLM0RPOh5SwUW0d/Xti/g4D+UZvGsNZ
         1CzAh8rbYV8t28Kzil5r9T+TSBHdVRI8RkGNy2rU3NJF0mB10ziBIQVa65ubG4hj/EXb
         QyHg==
X-Gm-Message-State: AOJu0YyOBiy6ApGXoyvczuEzMLFqORy5xGPJ0C7a/iudApGalMbjsF/Y
	S5IvVrw9TA/Dy7ZNpBHaya96zCFrcRX8SuBZU/DqH7Gif45l8oj5B2OLn7a7ZQ==
X-Gm-Gg: ASbGncvDcFEMSTf8xAfV7HrlLovoNGgdTaSkkDEKsdGJKSsAg7MtAumvaoFaJMD2xRh
	TvScY7Znc/27NOyQgBjwyTdzhLU+O/fhae7yTwKwvlTyyy/Myyd7dWU/g7elDwveiAO2ZNuoUsl
	F9xfno43P113ojGhKOx2dfrYE2HRJrkvpYL9uL2BoeAueARPNHlGkEkP5rAdW0pGnoHtX3svdAV
	NRuPLGQvVrBs7BlUTJs6rxebAuPxVeniYI+VxFrdnyorNR07LoZFUGVmxV37WngBP6qg6sc80S/
	dmYcAy6UACVC0lDCgTuV0PEB+V/X9gSpyO49ttHodrkOKqTYHjPlqHPMql1a7iCnIuhO5xtVXmt
	iCNjEoG1544KIBxE/WdX5YVZsz35hCb+NIz3psPcHxfLjtbdxpGq0MdlYOY4NBw==
X-Google-Smtp-Source: AGHT+IGakzKOEN4iyopngpGCFFOIB/r2XjG59O/AJW8fqmHDaQ361/ncmHr5+VvqIGVmr1ou2mqoZA==
X-Received: by 2002:a05:620a:4052:b0:80c:3418:c27f with SMTP id af79cd13be357-80c3418c66dmr340811585a.1.1756949358155;
        Wed, 03 Sep 2025 18:29:18 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:17 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 13/16] staging: rtl8723bs: add braces to all arms of conditional statement
Date: Thu,  4 Sep 2025 01:28:56 +0000
Message-Id: <20250904012859.215565-4-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
References: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
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

