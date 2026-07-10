Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349036BCC0
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702362; cv=none; b=DHTFtoCY5W/In0pmCVOYqUwIqth6sBzAFbSdriBeh3pjzE1c+BJEP6TX4sNpG3rSZTw99c4SuI+Y1+Zv6Nufy+k1W28B/NVdOyjY4LMqjqkH6+83RY6lCMlm8+2MGPybDBwXVyoL5KpsA06XH6cRT86x2n6RuV8Md2mSZfKmfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702362; c=relaxed/simple;
	bh=a4xhITD0TvZEHam3U80mivwJN/1ImHfhyLc0Yapyblw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2ISzcVweHCT275CQzGj3SxcxNMdyl3RSm+Ccj7ro6WW6gF8syXXlgD1Ed/ZHVWSuXKIBTYBkwQmQ8OzmqWLECPpZR5aKHojFdCP1o4pjHEfA/EZOI0thao8rEij3ETAl0YHgv0ggTCOdM3rKw2PXckoHpqVkwGuLu2QW7tgIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhqXyaoV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhqXyaoV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15fd3a299eso145333866b.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702359; x=1784307159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIjrGWwrh0huOmzCOapvKSDqKgUvQOQBx7lA86iqaiM=;
        b=jhqXyaoVVWva41vnTLbqL11PRNLneCxm6u5EzxNCHtvGX2KenmgTf0hoXFD2cPb63B
         NMzAVX8XvkFqov+P+16CMG45Mg65jysRjBAN7MuY7O+5aDi3JMQOmS6+9TglUPq4y4eR
         AFQAbYyfU3CMbtJuQjmmdoDJFtr1JtgwEIuqrfFmM3JPSyqp9q+gw0U/CFupqaorCN6k
         qV6LsZ2Va/zojqgayWFQRJRo7ubLXosfq9iPJlygAeIkJ0pxHe/6TgpK4Tz6XOIZuFqi
         RJOHQcbr0N2pofOtm3BC7S1RlBzvYn7AhdpDwGdkirchgQzEUWJN7UYPhJnQK3Ua6OG4
         a1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702359; x=1784307159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIjrGWwrh0huOmzCOapvKSDqKgUvQOQBx7lA86iqaiM=;
        b=gVACUNTiW40t2vLikWrDKdOo+gLwxJLmmLe0GOcgZq0JsGpB+Fuatpr3aNDkShJvAB
         rlZhvOMAQ60sZ3N3ZeGvweuK4MAzoJvVrE1BWeOdo44EL7NCKsoBLrsBko+zxTk0xkYO
         d3ymKU6gGedDdgDS6D4YdsJaEGabEeIvI+FFH1XKVtPqDfAJHwuihzbWtcAiM+XUgSL+
         9YnTWZNL4rIyW6tNUgmRMGjN0mq/pHSBA+86PVnfz7NDwhYod0F/pXBbNHAolJUjXvXE
         5XcdbTZLnquoobStkABDSmNGuVS0eqBJozdDLgCScAK2pkvdv7PJTwOBU30aAJ7heJv2
         lZng==
X-Gm-Message-State: AOJu0YzY+QTDfUgHXs+kVt9BReihok/MLMWErDlL32HCwoeaz6Ny/6LZ
	gRG5kMD1utna93xlsHRJWI4o/egHU4CuGO2KKez9roDd0bhV50WRDd9F
X-Gm-Gg: AfdE7cm8xR+2i4ancNWtY3RWHiLEgu5mp8Wl9kdPfUF45d/7y9zQQloSLSznOAiN7sc
	1nibLinuZsN2eBfhcRv5LiVM754Sx/6CdRqkRD9FeLoJAE3SaFwKvDU7cG6+Ec8UYUD11xhYP8H
	2tn9csuH/xjl/+SVtw3Cwg/DkkEutk1sx8F2/IvJfVgfxaZFT/Raoc5/hNAK/ocEnuGv9CV7DMm
	ND6sU7Xt5x+Pjs52nt/ET/QwaP4Eq/Ya28N9oklYRPPLk7dsDwu0eCuTCJCS0iUqBQCvkl3zB6I
	GAPpxZj6MH5qz/LhDiUXJkzUY/Hike5Xb1xz+sF3mJeVNhreo000RE95Q/D/Zz+rP6Efr+yCXDy
	QYjYTfmhOprIXs3lv/4mBGjP3RxjpbApNZScWqy7V5siYq010TvSWLb7KDkyNivDC5We7NGI0Nx
	ZGXOTS945FAG4vwhvunTeH
X-Received: by 2002:a17:907:9d17:b0:c15:fd72:7ac9 with SMTP id a640c23a62f3a-c15fd729078mr235559266b.48.1783702358967;
        Fri, 10 Jul 2026 09:52:38 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm643050266b.0.2026.07.10.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:52:38 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 4/5] staging: rtl8723bs: remove unused EEPROMBluetoothType from hal_com_data
Date: Fri, 10 Jul 2026 19:51:11 +0300
Message-ID: <20260710165220.68599-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710165220.68599-1-nikolayof23@gmail.com>
References: <20260710165220.68599-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value 'BT_RTL8723B' is written to this field, but it is not used in
any other way, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 drivers/staging/rtl8723bs/include/hal_pg.h        | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 20ee21c83500..a4149ba47069 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1345,8 +1345,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 		else
 			pHalData->EEPROMBluetoothCoexist = false;
 
-		pHalData->EEPROMBluetoothType = BT_RTL8723B;
-
 		tempval = hwinfo[EEPROM_RF_BT_SETTING_8723B];
 		if (tempval != 0xFF) {
 			pHalData->EEPROMBluetoothAntNum = tempval & BIT(0);
@@ -1365,7 +1363,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 		}
 	} else {
 		pHalData->EEPROMBluetoothCoexist = false;
-		pHalData->EEPROMBluetoothType = BT_RTL8723B;
 		pHalData->EEPROMBluetoothAntNum = Ant_x1;
 		pHalData->ant_path = RF_PATH_A;
 	}
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 0a25688de041..f4d4127ed5a1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -164,7 +164,6 @@ struct hal_com_data {
 	u8 EEPROMRegulatory;
 	u8 EEPROMThermalMeter;
 	u8 EEPROMBluetoothCoexist;
-	u8 EEPROMBluetoothType;
 	u8 EEPROMBluetoothAntNum;
 	u8 bTXPowerDataReadFromEEPORM;
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 3362b349904d..32e66fe451b0 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -60,8 +60,4 @@ enum {
 	Ant_x1	= 1
 };
 
-enum {
-	BT_RTL8723B = 8,
-};
-
 #endif
-- 
2.54.0

