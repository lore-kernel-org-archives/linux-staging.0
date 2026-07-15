Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D148B362
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119856; cv=none; b=ZKoT37pVMLgf7RoZtZWr6MO9HdqZ+/ZZz6SYfnq73QAYlNXxqO9XZJYVR7ZoulP8dScmyXc0TX9wV8bc5yqw3ZDkBG+9mgd59gdp+HLhUx1Y+x29izoI6OGvp9oebp6j0vj89myh/YDV71saoTYY1F/gnkiTjnT2mS4/Kn+lgf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119856; c=relaxed/simple;
	bh=Y+mJVQsdOZhHspaLoCX+QJxQEN60zb+BQLiuQAAuisE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlPSo0jWMUGQkstlTqihXTbq/6YLuSHFxWzyQBF99TAz0sV8HPTE1gDNGr01o7yc3R+E7Su0iDCoIuaG70vtjiRS3iXkwQPWNZj+uSh8qAExS8DddwckpWNWPJy+uop9pW0lmmfz7kQ7ZHopdsZBjMzh2A/8GSzHsCUTOvOuRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON024K8p; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON024K8p"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c9cbf0719so45509131fa.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119847; x=1784724647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFZ/4Gw2NifXMZ8Gb7PCOFhMD9zPHtXEzuF5ovYnS7E=;
        b=ON024K8pB2CnNr7tbYJChMSl6zeTs6rGngu6J4kv1Nl+ZHMTmCqx9ZnZpZs9ogNSJf
         lrWvgs0Ux1Efm17LRN6oOEbF0JJqig8G9FNrBULjcb3IuB+71OxqrLVkmnQ66zJY6E0V
         TUeh1VgdIu5ubKpIlSwiA3iuOyBqJyxXAxD9Ty1SNv74P0M/7liD9IOt9UN0fBe6mtQC
         5q8tQ+w6SNneGpf2XA51C9b0qlNZqsAlOL9sAA5EBWEq5YoNEGbcXeddBySwochMyVTb
         owhXQ0AkN47+BOlSjRBPHrR1FL+NzeELxaAwObS4a5uaQy4d/yZtJTOGJRtEzWV9DLRu
         uR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119847; x=1784724647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFZ/4Gw2NifXMZ8Gb7PCOFhMD9zPHtXEzuF5ovYnS7E=;
        b=T5Iwvj/WvSKf9XOSNDDep45uquNRAUmVu6hucO80rrhzwZ4igU/KUd6DdMEZQEaAv2
         5q1iCrOqkqK4xkdJ/MfpdG0qk8YGeo/4iVfoFKpQWhySOslI0sxqc+QOZ9owL+1fJ4q4
         kG6ZnUSdd07BZ/2q8Z7mz6kBBQCDHUJ2iexEKZ/uOVcHZ254X9ZtrgHOM/KVZmjIx+IS
         fAushcjtK3+RqxLiTT/Z8WeBAX7hD/wzgf5buRK1ENYirOrYrQ6pG/mlZ1o/m/9EMRJ0
         pwdAj5w58AMV6RZnmMAMCrbpeiZlqntPv9OLU6g1bCpbDJ7/eUVyrDlebR0wqN56RZBd
         rAAQ==
X-Gm-Message-State: AOJu0YxkOpqTYMs38bXT9eo1uMyTbhZwjMLjulEHubAhPMPfDG4hSYdi
	Hzm1t5IDdz5YUwBnqqgSIgpvZRtgxT2AQFBhtYh7PXYhuqFhmeehehvj
X-Gm-Gg: AfdE7cllnVhTLzjwFwQ4F3NFELH2EINRSXUAxC7Jr1bNTqBYC8dAa5ySk6vAJXLBLZT
	tEUZQ342+2nCwTyIc06DFGMqw8xshRaAL7gwLUn2dKG9vhhaqBHbNViKSmMIEYlhlhdhn+Cnvoa
	X12LPX8lX7IrBCqY8PoqyTkUTZr1Wl7e3Disz+dM35RamryxxCW2e0cGurh2BQKBpRUVhaCCgNz
	zkdjXS7sOGO6JlgLFejNrcUFPtoms/0qjOuts2xzbD6y48jwCz9Pav3qgWtvlm9EfxxTxlAErRi
	VGuKIzy2l5kAPY5uRtn3gPerE66VvUJ7iu9dmwSizefv3xpUkIyTa8WVkw1z8s2SapJp2mTQSa2
	CyTiExge0eXCffyJuKGw43Td4L6lcsZ6Fj7IXd52B+l35ZrzE3+2c05NxhaDiofAouWtfkJSy+B
	X2kic7uHTe92yw3Rf4RcdyxDhuS2QSBY7Z5Flk7qtFncJrHUTSb58Mv7/WcbjWQPTKB2MWMJT8C
	M6S5UG2K7lUZTNojMg0ZjaZ
X-Received: by 2002:a05:6512:690:b0:5ae:bd4d:68c8 with SMTP id 2adb3069b0e04-5b159b874bemr1279318e87.46.1784119846371;
        Wed, 15 Jul 2026 05:50:46 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:46 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 39/61] staging: rtl8723bs: remove redundant DM wrapper
Date: Wed, 15 Jul 2026 19:48:07 +0700
Message-ID: <20260715124829.90290-40-ulijg308@gmail.com>
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

Remove the useless external wrapper function
EXhalbtc8723b2ant_InitCoexDm and call the internal
halbtc8723b2ant_InitCoexDm directly. This cleans up the driver
code and cuts down on redundant layer calls.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 5 +----
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h | 1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c      | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6da6940c9..f1d8e01bb 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2378,10 +2378,7 @@ void EXhalbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOn
 	halbtc8723b2ant_InitHwConfig(pBtCoexist, true);
 }
 
-void EXhalbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist)
-{
-	halbtc8723b2ant_InitCoexDm(pBtCoexist);
-}
+
 
 void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
index ebc47f65e..b0e24c69d 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
@@ -131,7 +131,6 @@ struct coex_sta_8723b_2ant {
 /*  */
 void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly);
-void EXhalbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type);
 void EXhalbtc8723b2ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type);
 void EXhalbtc8723b2ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type);
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index c66ca6f73..a975e3393 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -846,7 +846,7 @@ void EXhalbtcoutsrc_InitCoexDm(struct btc_coexist *pBtCoexist)
 	pBtCoexist->statistics.cntInitCoexDm++;
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
-		EXhalbtc8723b2ant_InitCoexDm(pBtCoexist);
+		halbtc8723b2ant_InitCoexDm(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_InitCoexDm(pBtCoexist);
 
-- 
2.55.0

