Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6F846A
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471870; cv=none; b=E5SUg7QWq8y5Eo3+U7Fpnegi0CzqJ5y38wejNAL+jb40JwuHl7pfkHtvkBIosRwQwtaovxvH8QBAasD9dytAUrKTjLF3PUGWnCX1lUgK68JbckHSYfi6lUsMwHTFo0F3QqeUObqAA77ILidVwUODJvXyNVKFoJdyATRTdpb9l40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471870; c=relaxed/simple;
	bh=N6271wcUxP5BDK/+dDmxvzUtyqOKTcvOanJ4DEE+wZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUcf6D3Uo5kuLorxWsv9PQ3NKcRkFFRoZYIxDLU3tKSN7XF3oITNWWfmuwLDKHjuIXyk7oF1SWOuId+BVilA7daTEVLmpoMnH07Zgr91v4TYkFANwB7ePDmML/xtnU9enH7Zm2er+bvLIHEGq0j3rYKsRF2RX7GEiLv64G1p3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stU6KzW1; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stU6KzW1"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98531196e6aso565035241.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471868; x=1791076668; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYVl5EqQ3p/o2mPal8Kno9pZP083cJ868GdALquLAvM=;
        b=stU6KzW1/yjpIXr9yHkeJJOtn8EIPlVwVEqrn10RTDrF5tcyhJZVWkvYNvZ+7nc9wv
         cZatWD1Ve3tihGp588wajz0HaC6bFAygi4njzKc0j676WbhNNvBswXAFkdZDfU2ZHngg
         luUQlaZ1SRStn6R7bejKpKzwqYfTN4ASRyH0EWnfu12uR6q3lyehX3xSJFE7YoOLr8WG
         WRXCipdKqSaQbUkzLJPJ0OE6+UwLCo0ZoprpFDWGYBs5DPFwihdnWqEDlHC6N1ttEAWi
         Kn6RlxvN/PMz4HyUzLtUJnq1JX5WbuKSOSOps3tKgLb8Msk+vofg6gxt56rNuQ89d+pz
         D9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471868; x=1791076668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYVl5EqQ3p/o2mPal8Kno9pZP083cJ868GdALquLAvM=;
        b=lOFVzXxXdZttmcgjBco2RooeFWik6t8yKzhBseuQlixcjEfrmFf71GtFhfZY2K5427
         //RyYywfrwf3uqV6RK8a7lsT5jK0A0AOQkN0q2Ci3Ly/I1NeNoZG+x4r+bSM6G8zddsK
         SW6rA+5euCEqss/9bydmEgz1kGM1GjwUgAktH23pvQrE2NeYBp5tpaTa3Gr+1Wvq7SWo
         vOlAfOG60thXSqfPwgOBmFybxrWnKhjBrpdPpfTTLQvKvR97QEZsaBDj+r92+OVgkJfw
         1RPPE4H56hmQ1lReJZB7WrsWWhREcxYf68ciN0l/Jf0E2JopImJfEbB7/02efVfFs87m
         Llcw==
X-Gm-Message-State: AFq9FYKN9elZBqDb3rvGKznVmMS/dCUEJSHX5WLFgfisD1xNHKaZAAb3
	En0IePQWEhG/obBIi2iKLHozYH/NOStZ+/3kPdw4pAZGFfoDXKqGknBSU90uiw==
X-Gm-Gg: AYBFou21c73/HTjbWVBWc5NhCHSF5jXv37mhHdJIeGRXE7gDiHNOWwBB5XcPGwlbDjx
	k0TJBoGOj2CZ9F/38N6Plpw/Q1QJirYWHtNBnM2efagd/6qdxiZry2TGWIJODjcIsnC2azMQRE5
	ogfDvydTgZms+kxiI67sWyAf43FnNcX4XDlAto6OXYe/GusZv082FNBwOnWv8oIwm2rbrhOGMRi
	c3sUA8Rx0uSd+u+sO42HGM9uNRgOwEcDzZMHrQrnUif48FQMK2EkjVHT7y18V2RkWAeRJolQgBz
	rWoCLh28Ui0YjL2Ofwop286yTRVixKdV/E6cb8Wp2Mv+NGnhvQs+5qNtAUrBULcJ4LeNP+1Vdvy
	2HZmft78z9ilPjgPVCc7/9RhCncVfvnBdcDAwYfPnXR6dS84GJvWCkkYK5Atty45mQltPEM4xMg
	izg/U87HwImURu4tfEr2n5e+y2euj9QLvV4hjg8Wv1Nz+VeAtqP0D23wc=
X-Received: by 2002:a05:6102:549e:b0:7b3:3b4e:e4 with SMTP id ada2fe7eead31-7b33b4e251emr1157245137.2.1790471867803;
        Sat, 26 Sep 2026 18:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:46 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Sat, 26 Sep 2026 22:12:25 -0300
Subject: [PATCH 2/4] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-2-989dcbc113fd@gmail.com>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=3820;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=N6271wcUxP5BDK/+dDmxvzUtyqOKTcvOanJ4DEE+wZk=;
 b=K1p2fmh+1sCg4n+Ib2KyJH25agNDWOOZVEK/doy/nhwOqxFK5FeLfB1bJUFJV3/eb6YGoBne3
 oVgm6OSh2KwAafLasYkaLV+sRxN4CI1jNTRm66pkZs15WKiKg3r/zwc
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

In phy_tx_power_limit_to_index(), there are many mixed-case names and
needlessly verbose names (such as the iterators, in other realtek
drivers they are shortened like in this patch, by renaming them,
accessing the TxPwrLimit_2_4G table takes less space), rename them.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Renamed Variables:
	pHalData -> hal_data
	Adapter -> adapter
	BW40PwrBasedBm2_4G -> pwr_base
	regulation -> reg
	channel -> ch
	rateSection -> rs
	tempValue -> tmp
	tempPwrLmt -> tmp_pwr_lmt
	rfPath -> path
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 48 +++++++++++++-------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 1228be0cbc839041384f3e434d22b4f039d69986..6d8e3b26da6d29863bd0f4f43fba6abcdbdf5c9c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -739,35 +739,35 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
-void phy_tx_power_limit_to_index(struct adapter *Adapter)
+void phy_tx_power_limit_to_index(struct adapter *adapter)
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
-	struct registry_priv *r = &Adapter->registrypriv;
-	u8 BW40PwrBasedBm2_4G = 0x2E;
-	u8 regulation, bw, channel, rateSection;
-	s8 tempValue = 0, tempPwrLmt = 0;
-	u8 rfPath = 0;
+	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
+	struct registry_priv *r = &adapter->registrypriv;
+	u8 pwr_base = 0x2E;
+	u8 reg, bw, ch, rs;
+	s8 tmp = 0, tmp_pwr_lmt = 0;
+	u8 path = 0;
 
-	for (regulation = 0; regulation < MAX_REGULATION_NUM; ++regulation) {
+	for (reg = 0; reg < MAX_REGULATION_NUM; ++reg) {
 		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
-			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel) {
-				for (rateSection = 0; rateSection < MAX_RATE_SECTION_NUM; ++rateSection) {
-					tempPwrLmt = pHalData->TxPwrLimit_2_4G[regulation][bw][rateSection][channel][RF_PATH_A];
-
-					for (rfPath = RF_PATH_A; rfPath < MAX_RF_PATH_NUM; ++rfPath) {
-						if (pHalData->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE) {
-							if (rateSection == 2) /*  HT 1T */
-								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, HT_MCS0_MCS7);
-							else if (rateSection == 1) /*  OFDM */
-								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, OFDM);
-							else if (rateSection == 0) /*  CCK */
-								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, CCK);
+			for (ch = 0; ch < CHANNEL_MAX_NUMBER_2G; ++ch) {
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
+					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][RF_PATH_A];
+
+					for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
+						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE) {
+							if (rs == 2) /*  HT 1T */
+								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, HT_MCS0_MCS7);
+							else if (rs == 1) /*  OFDM */
+								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, OFDM);
+							else if (rs == 0) /*  CCK */
+								pwr_base = PHY_GetTxPowerByRateBase(adapter, path, CCK);
 						} else
-							BW40PwrBasedBm2_4G = r->reg_power_base * 2;
+							pwr_base = r->reg_power_base * 2;
 
-						if (tempPwrLmt != MAX_POWER_INDEX) {
-							tempValue = tempPwrLmt - BW40PwrBasedBm2_4G;
-							pHalData->TxPwrLimit_2_4G[regulation][bw][rateSection][channel][rfPath] = tempValue;
+						if (tmp_pwr_lmt != MAX_POWER_INDEX) {
+							tmp = tmp_pwr_lmt - pwr_base;
+							hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][path] = tmp;
 						}
 					}
 				}

-- 
2.47.3

