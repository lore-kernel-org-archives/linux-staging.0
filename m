Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311564F20C
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551120; cv=none; b=V2PGrgTsaa9bi1rhtGeSHB8f/DDQ5cbOR8ezBH+x5yGkiDExbMFF46elxoojlqGk060WJ3n4/f0Vqkc4Ll2py7KEGMkylNleHjaiX72HQAvIkzBkKZy12Zp/blweDZW3LE3268AQ1eXpXy2V0veTlDjadoDgi1NrWo8P+fqQKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551120; c=relaxed/simple;
	bh=lExOrX63qroyhjaHURfuxChMnHToTXmcCJ+pARDpjqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rZ5JmYCQPPzE5swguqskA7h58RWzlCRe69qW6CP4BM/kj0B02ZfxO+fwU3lMKeXmymfkFtKe8XKLdbBwLymL6bwaoqosW0RNfxVnnHSUgjhXsYt4OFxSSJ/yNKvncbtXHVEBu6l2KJ+CIQyyzHafb10WbLqF7xc8b6MeaQ0hWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=HBAAsTdH; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HBAAsTdH"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7c3e1081804so2336888a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551118; x=1727155918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BbJQpuuZ7BYT4gs2DMNofQ/MuRf6Eta7FLnNUeSPu8=;
        b=HBAAsTdHfT/kmOHcf64PyEtjs/kyKDYyXXEkDo99Iw7A4FNG/CcmA46z1wQfozVh2j
         3WdDaqJQ5vG9TUKoYrAbapLMqKkwcT/N/Kr9pFejap5uMXMoN7G59S7Ue0+0T2IYjwC+
         +qXw3XzbNKjGF1pkWwQoz9rfXw13KHZJ/fimFEWGweMtBQIlEYxv/3GqtcNsWYeF8oxx
         b3GTIbExWXdA1+usGdhYTk8x1pV5Rh9tjZTMw7yJ+lyRK8l8qO4AWLRK2VcJUTlJr+5y
         Ea75gVKXG19hh1qqp9HM+KfVYrSC+klHtx1euK3BUVnVfoea2POHrQu63KVDPndBzcZM
         cvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551118; x=1727155918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BbJQpuuZ7BYT4gs2DMNofQ/MuRf6Eta7FLnNUeSPu8=;
        b=kEbUEaeumMWkvHZ6DReojfbz5dzWJ+cw+O4hF1pWeLWqwObV46unC76bAhjgEtI3xo
         tiAcUWOuEdFPxn9QpCOgu+z7H2rS91yy+1BwZC8KYmJPE5a+G7sfbOuakbfsUqNjJCVg
         xDAPHJem7N0aSTCGaSPTW4aYJr1nXjS8wovBmNhV+77ZzYQ6yQ4RiNCT3X1vt4PAIgIy
         awCSY1ysKmkwfBqstVLIAbsLAqFmbuQuDDmmQgMoFMwGu4F/H1vuNvwacOZnmLKCeBFS
         3f9REnK1W5UyHBT1D+bCaRWEXgG33Mxj3ReFUAFMWcwS2ERt9WbqaxsZ6L3WJjX4qsEx
         a4TA==
X-Gm-Message-State: AOJu0Yw5HVrjnqmPrTEmEdbrimDy3zl+xDx/eW35hlXiHSbmCEJ3dUny
	tKy5+WxHINo1nR4uYbr+bulG3ONE72PpmcjLt6TS8rcAyXoJbxDxZtto2HpHv5c=
X-Google-Smtp-Source: AGHT+IG1F1zV+SY7EGa8BLbwQvUbeHXnPVZ/26DGEmwxdgWhBdSAfyeX81JQOkF916zV5fj3rvEpng==
X-Received: by 2002:a05:6a20:ac43:b0:1cf:36f2:21e9 with SMTP id adf61e73a8af0-1cf76358fdfmr24098507637.32.1726551118499;
        Mon, 16 Sep 2024 22:31:58 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:31:58 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/18] Staging: rtl8192e: Rename variable pMCSRateSet
Date: Mon, 16 Sep 2024 22:31:38 -0700
Message-Id: <20240917053152.575553-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pMCSRateSet to mcs_rate_set
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 9c9c0bc0cfde..2eba916d7f50 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -357,7 +357,7 @@ static u8 ht_pick_mcs_rate(struct rtllib_device *ieee, u8 *pOperateMCS)
 	return true;
 }
 
-u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
+u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *mcs_rate_set,
 		       u8 *pMCSFilter)
 {
 	u8		i, j;
@@ -365,14 +365,14 @@ u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 	u8		mcsRate = 0;
 	u8		availableMcsRate[16];
 
-	if (!pMCSRateSet || !pMCSFilter) {
+	if (!mcs_rate_set || !pMCSFilter) {
 		netdev_warn(ieee->dev,
-			    "%s(): pMCSRateSet and pMCSFilter are null\n",
+			    "%s(): mcs_rate_set and pMCSFilter are null\n",
 			    __func__);
 		return false;
 	}
 	for (i = 0; i < 16; i++)
-		availableMcsRate[i] = pMCSRateSet[i] & pMCSFilter[i];
+		availableMcsRate[i] = mcs_rate_set[i] & pMCSFilter[i];
 
 	for (i = 0; i < 16; i++) {
 		if (availableMcsRate[i] != 0)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5bb928d9cd12..7c575535d074 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1736,7 +1736,7 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 				   struct rtllib_network *network);
 void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 				     struct rtllib_network *network);
-u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
+u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *mcs_rate_set,
 		       u8 *pMCSFilter);
 extern u8 MCS_FILTER_ALL[];
 extern u16 MCS_DATA_RATE[2][2][77];
-- 
2.30.2

