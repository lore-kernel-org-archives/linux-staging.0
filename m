Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1659C22EFA
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308300; cv=none; b=Gg1FeXgIBaBh6lmXhVo4CStK/3qPL2ac9eD8mn+hKjDWs4V1bM+e9eZaSsjJC3kxJb1+ObMkH1Ks9lS7vwp6Jr94qd/jawDKc6EreLkzs8x82fHT9g8m0l36QKthWp77FB5PznavXa5Jc9+p85ZUFwiqE5hz8L4AACOFmZ4IEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308300; c=relaxed/simple;
	bh=jOl++2HVJNWtEhnqLNXp11rpLyr2YgETrxZTkmaKRbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mRT8JKCKNHndYgFxSbVmAuM8Oj5nDvMhSGHrS9tWbICJHnQI8eztH891c6qUJcSDs3x+d+HLEtjYLl3KIVY1NO1ZipSPGSZTmV/BwO8sP0PJwLGniw6LQioPfpTvsA7VeNheDRnv9/e0O+G4zrF9Iaq/uoK1Z2pPOCfZkI98Irs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ckLU8aUK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ckLU8aUK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d730b6943bso5977515ad.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308297; x=1706913097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocy4xNuI1aWxJ9NCP60qvK1mfFV9OPkIlnUlYlr+R78=;
        b=ckLU8aUKwJxkcWeS2dm9SQm1ecZrNU50BBQdSrwPnfwYvt9yEMlNPjIVdCnEqzHJiY
         wvYrk6dtAYRdmGqCjikIvqk13skipk/x9B2oCtdXarVL9N0kr4GqZb4g1K02ljk6dABE
         wMPMl0AeBIUgvBfE/LaSth2oCUzU8TwtbxxUmXseApMGSeF2bftRBoRyl71mHzBeVjxr
         2uw8Wad/OZCVCftnIJAdGo9TBCgFsymX7H+NioHAl0eNPdGWfpUHhnlD8OT1sRTZt+ZB
         O/JkM1czr3K/TxRsprRADQ8TNrw6umjLX8QiAfAqzYucuGA3yKAjvQT6z7NdkDDZ55HZ
         F1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308297; x=1706913097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ocy4xNuI1aWxJ9NCP60qvK1mfFV9OPkIlnUlYlr+R78=;
        b=THSsJc7kmNuNLqfnusu/VxXLiF+xt4LIHoDbU1f1os4UqNDDgHLt77RhdIrVasCsPL
         JHnlVV2oJcp+6U9jV5sFXq+u8LIcq3r6u0xC4kkh6DS3bbvnOo5BPTWc+ilqWKe37DYW
         f+W2l6DSNapne6Ny+Wfs284Mc2joBk9/TOhJtFNRW95nLI605/tFXhE9uinkvo0y8K0u
         0Bua/z2+c6XL8eY2KtGdHiUa3uaFbH0C/YAXMqkW0t/mpjxQda4E9l21vo0MWQSvKayh
         OBE8hL7uM9zI1YfX5Hca83rerr20x/jY84Tn1HCXsS6b2OJc5izLnPTLnYeqH7As3mh7
         26ig==
X-Gm-Message-State: AOJu0Yw+cBFm+BeDbf6uXLhxx5AAntpjYK9znz3QTU5Z9tumwFubWqK0
	QVKTAq6Ztkb0FIhbROG4WrQGFGBB1kSEEHrhRGCAt5LxtLY4Ci8IuIJEQNMt42A=
X-Google-Smtp-Source: AGHT+IGJh9eqHFmXfNY1NZO+0TFfkIOqsN/pN2sHET6j9hMFRKbYFc8jUnMfSDZas2N7NUPwntU2nA==
X-Received: by 2002:a17:902:db05:b0:1d5:dfc6:c334 with SMTP id m5-20020a170902db0500b001d5dfc6c334mr455827plx.61.1706308297378;
        Fri, 26 Jan 2024 14:31:37 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:36 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 01/18] Staging: rtl8192e: Rename variable FirstIe_InScan
Date: Fri, 26 Jan 2024 14:30:49 -0800
Message-Id: <20240126223106.986093-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable FirstIe_InScan to first_ie_in_scan to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h          | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 5fd44d0c4b1d..d131ef525f46 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -269,7 +269,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 
 	mutex_lock(&priv->wx_mutex);
 
-	priv->rtllib->FirstIe_InScan = true;
+	priv->rtllib->first_ie_in_scan = true;
 
 	if (priv->rtllib->link_state != MAC80211_LINKED) {
 		if (rt_state == rf_off) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0fdc767d43e0..13a901c0db1d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1201,7 +1201,7 @@ struct rtllib_device {
 	bool cannot_notify;
 	bool bSupportRemoteWakeUp;
 	bool actscanning;
-	bool FirstIe_InScan;
+	bool first_ie_in_scan;
 	bool be_scan_inprogress;
 	bool beinretry;
 	enum rt_rf_power_state rf_power_state;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9d1e9b780bc7..44b36cc867d9 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2101,7 +2101,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 	ieee->reg_dot11tx_ht_oper_rate_set[1] = 0xff;
 	ieee->reg_dot11tx_ht_oper_rate_set[4] = 0x01;
 
-	ieee->FirstIe_InScan = false;
+	ieee->first_ie_in_scan = false;
 	ieee->actscanning = false;
 	ieee->beinretry = false;
 	ieee->is_set_key = false;
-- 
2.39.2

