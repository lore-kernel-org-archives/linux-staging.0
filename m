Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A541CD31
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382468; cv=none; b=kQs7MJnnNDifhMYt2fCbgQAzT+CRgYHuvsGiHw2ThHDAjjYVuICIVYInGtg4jv0uvJ1MAy/or4iXd+s4n9F67deNqUZBTHoL+76bE7ry9n+Q3jd0NYLDUJu4vMc4r6jmqkPCuqnxRU0fAS4yYKtUuisQBJCuhx24NIEPpC5Ac28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382468; c=relaxed/simple;
	bh=Vy4Z7ogZT6V1enSiVeEgUoSoj9IL1IcG0eoH+OHj+Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7Rx+Qcgm7pmDprD0GgmKUHJ04GyzB3Zyrq3Z+3CBtRsdC/9M0K92yYL3YiUj7XFpWTA+mjymTTWxcidmrk5G4QtGRBJfMrucKHxLwq5wM/Uolk9gc9/TXsdVXF0f2PWh6EaGQ91ISNhf6Ui7f5jZDEglGsdYCYq6zrkPeVAke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f21UEO+4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f21UEO+4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so446484266b.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382465; x=1726987265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRQIYYPh7+sB41jLCAlLwMG5cR5oSUg70pK1/hkRhBQ=;
        b=f21UEO+4a4swPCd7Eujtaj9JRHmSy4je4EntMpDVS1aYrQEGkWEl1maBEpGv0rFwv0
         SDtFYnilFb1koX3R/Kh5t5Q+1sBsKAO9Z0mxgq8hoceKK0BnprymG3slR05IliiBEiGA
         lALrlnU1GRoMQIK9nBF/RdRJUfDrPycLptBy1j3gyCSo0y53nu+MsrYjYCqC5d4zSZaW
         3SWOvG30kd8ziDr2h03vB7CG91hKIL47U43F4NLa18NyHwPcVB/wUHC90LSB7URGyRS+
         +xNPGYIAr27W9sywOWgbg5K0yPi+2PJoizL64DlKAV7r284kVD9im8fjM/dGjW0nIDfk
         xW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382465; x=1726987265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRQIYYPh7+sB41jLCAlLwMG5cR5oSUg70pK1/hkRhBQ=;
        b=Isduv7byDK2gwm5AAA6ZMmU1643ROWgSahbPcKw0eypKNOg1yyhEXY3m3UxaSzyqR2
         VOqvL5xJ43zT91leD4Skgy/YUyLVSsLYjiacrT9Mf69S/YjT5f3D1z01I0DJSG9I2bUB
         eEENI9M64Afbbff02PmIdzFaC/Icfw7NeGIgktYYjyqDNSLDRItMzgQpoI5A242Y0cDj
         pl6f5vMVPP+cC9VRbpXq6vBgUH1qVHDNXvLeTd1awM+BBaepOElqVoyIvsV+DoPNOgQR
         MiXppcMrVVQJ6MEgRRkldUH3DWCw34oGxSm77I/XC/xQ3rrB8s8Rc07RC3U65kJdybjs
         Qhvw==
X-Forwarded-Encrypted: i=1; AJvYcCUpXxrXwzhEGInrBA7/7R09xdLudjxhbulvrPREcXLKy4ZQbrD8i2SY7njpzei9PUHXSDknj7S9lOj9Z48z@lists.linux.dev
X-Gm-Message-State: AOJu0YxpEmg3qsrfb/ZwzhXvNSCPjGzuVSeA45AXciILd3AzP3v2tL5X
	68meHSOMPyGuiTtxzjHQHTLPtRBhdrJnzVOHfj9nUTtLcIcbCHJ4
X-Google-Smtp-Source: AGHT+IHP6XQs1lHVokE4Zc1X7LdOcT6wFW2nV7n9gM1PvFIrsqe/YisTi4556BKADZNBHqsNr6q7Xw==
X-Received: by 2002:a17:907:f1e5:b0:a8c:78a5:8fc4 with SMTP id a640c23a62f3a-a902947d512mr1057428366b.19.1726382464789;
        Sat, 14 Sep 2024 23:41:04 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:04 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 12/17] staging: rtl8723bs: Remove unused function GetHalODMVar
Date: Sun, 15 Sep 2024 08:38:26 +0200
Message-ID: <f6f589189a72a55d3a57bd37299929c307f31b4f.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function GetHalODMVar.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 13 -------------
 drivers/staging/rtl8723bs/include/hal_com.h |  4 ----
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 719dd116d807..492889c837d9 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -796,19 +796,6 @@ u8 GetHalDefVar(
 	return bResult;
 }
 
-void GetHalODMVar(
-	struct adapter *Adapter,
-	enum hal_odm_variable eVariable,
-	void *pValue1,
-	void *pValue2
-)
-{
-	switch (eVariable) {
-	default:
-		break;
-	}
-}
-
 void SetHalODMVar(
 	struct adapter *Adapter,
 	enum hal_odm_variable eVariable,
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 17d5cfb66a36..4db93484725f 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -158,10 +158,6 @@ void rtw_dump_raw_rssi_info(struct adapter *padapter);
 
 void rtw_bb_rf_gain_offset(struct adapter *padapter);
 
-void GetHalODMVar(struct adapter *Adapter,
-	enum hal_odm_variable		eVariable,
-	void *pValue1,
-	void *pValue2);
 void SetHalODMVar(
 	struct adapter *Adapter,
 	enum hal_odm_variable		eVariable,
-- 
2.43.0

