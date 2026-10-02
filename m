Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EC83546F3
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 04:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914107; cv=none; b=q+FFj0ELlGWyWjWOsQVYQI71ON31UBRxW3+sU42HpzhboJSIActygTE2bHdv59RpScj/WkT1EZlBG10oHEi4iMUlC6KH5PAuVxq2WtrxAhKzXNOQGnwUPLPAPscN4IhBOetUYRO08jQXuwdPOWAlyYbkKzBYZaXiUYABR3WDifU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914107; c=relaxed/simple;
	bh=RnKDGOqODAugQKMkCaEvlJp6/vxQ/Fqn7Yn4NMt9Nz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogawgQvlVudaV7ZTL2C0kvRNEYS+623OCdkNFTnyVFbXyAzOXuZeeF524IVu3IvLrENhD7CYg/UvEULjhfke/jIb6uX343NR2KvXwb6+wO24vVHPwRn4Hpf3biXKGp55kIqYIbofp91XwvqyO5YpjrCZCll6O5EAX4JveBIyznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFK8mXcT; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFK8mXcT"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b6f8b8113so1515116eec.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 21:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914105; x=1791518905; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LWvIO3AizqbrrdgnJOfJkn7/+8Sva1Iqh/L+0OPK4g=;
        b=dFK8mXcTYWYlronZaiBQZQou9uw6th8Iqxm4WfrBbFJ6vazYeRJXgOL1NRBsIn+UkL
         53tcRJSORuuZ+2qEYcmwbeUeEQwb9vq/VeOtLqP7OKCJMxy5oZSOJPW6abV99umi3cq+
         E5hRT+r3l5XNQHrcbyy2ZTra0BqHRYjE0S7AhKH2gHQWTAw5VUKRnwOe8kmCXWqrtpt8
         z4THyYjowRf5DKyDmbbfRsyfKxpL9ZNBbOxxDO4w4WczMyLmSNsT33pCZAw2tJquUk4w
         ABu/Z43VCwcATqwvp5AMfGmgCQJlfgu0xWsn5J27H5cNTr4z0N4WvIECF7sVL9dm7vGl
         0w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914105; x=1791518905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LWvIO3AizqbrrdgnJOfJkn7/+8Sva1Iqh/L+0OPK4g=;
        b=myJBL5W8f1OSqXu4hLFTd0ENqRcBUZi3LbyTH37dURkSlfim3MLXGSplHNmH+mch9a
         +niSE0Txy7Y1b5wLgVkVl+YB9U4mAP9G1kJYXkiCodxxXtN6kEN2p9gohrMwGic16E2g
         Jflnbf7ZpE+PNM+YvTmTtV5V5m8inG2fhV5CWovMg9gffJtgOaLs3bX1dfT16ck3vyiD
         DH9huCCbFSJ6IU+cdUQltjbFS+nBmWTE4CInhcRtaEXIRI+kdD3BKYa+3rS6Mn6HytyY
         jA6f6j3B232JK8qriOukFkWCL8f+tJD3cb/H6oTgtlBWY3Ih/bh8WFjKdUfc+KmAChCa
         0dJw==
X-Gm-Message-State: AFq9FYLlAhBKm/60/F7Z4iuUPFhglW6z/vyFw3yjUitaT1n3qH520kIO
	Mn3AL8UIWgJt6Jh//nGvK47ohRyvIE76KquKlxa3FhIxiYcM4w+NKrSl
X-Gm-Gg: AYBFou3QW5bS/cCZeZVyS5jTnfaiD3MXzBl02CRVwEgLQ+EFftHTVy6Ayx49Eyt7WtT
	GAZTro1NHNcWJX787Ot1EOkwtP9s1p7N5eRA8WGOfoxOUqoGnoc7t7TGYbSYWBKoh1HODeUwcJz
	r4YFtREBi1rm+3bgjSrsv00vTPyyZM8BYDiQkREVS2WrTQ3OSvME1Z15QlYTuJdYJygsGmROXIA
	mgB578joUYtOf6hOMVDXfwpMqVxObnTNpc/iwPRdqnz4lSOtzKFr+j5DOHUVeO6k8jy7FdfMsII
	taYWfKnWrViuSOgwZKOo+RJLC9C/YqRf7PxdKEX7O+wAXAFui2jd4Yds00NOn9u2rm3tfPqpRib
	zD6XUcj1FNWOsdFwhndONnWLa9sEngYouHaoSQ9fTIM71zjPHb+0l87qhIRFyGss8lSdfnDfdM5
	3hx/IHl7tNTFRPcfkiPEnI5NRrvA/860CaV8ZZFzrPohrDN2kYnqTHDvy8K+X0gMjDUW9vK3ckn
	pkRvGGenlVR
X-Received: by 2002:a05:693c:65c5:b0:33c:43c:f3dd with SMTP id 5a478bee46e88-34f2196cd67mr1349349eec.11.1790914104367;
        Thu, 01 Oct 2026 21:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:24 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Fri, 02 Oct 2026 01:07:35 -0300
Subject: [PATCH v2 1/3] staging: rtl8723bs: rename local vars in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-1-48b180fb6f7f@gmail.com>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=3665;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=RnKDGOqODAugQKMkCaEvlJp6/vxQ/Fqn7Yn4NMt9Nz8=;
 b=/ecZ9ztqcDLdyxmXm1dSvl/C3wDfcEI7nQFl+4BqigBdzsfDdou01x8nH5vQks+/qd3oCcI9b
 CPC3LqbDNNyAT1rqCdY/oRJlrzm/PjuF2Vgrj2jGDnOyv97ZPk3J+Tl
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

In phy_tx_power_limit_to_index(), there are many mixed-case local
variables, rename them to adhere to the linux kernel coding style.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Renamed Variables:
	pHalData -> hal_data
	Adapter -> adapter
	BW40PwrBasedBm2_4G -> pwr_base
	rateSection -> rs
	tempValue -> tmp
	tempPwrLmt -> tmp_pwr_lmt
	rfPath -> path

Changes in v2:
- Dropped these two name changes:
	regulation -> reg
	channel -> ch
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 44 +++++++++++++-------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 3712b38cd37d5d5a923f54cdeb6675223549f740..e98e8a936630cbb6c336ad923234781e718b5c10 100644
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
+	u8 regulation, bw, channel, rs;
+	s8 tmp = 0, tmp_pwr_lmt = 0;
+	u8 path = 0;
 
 	for (regulation = 0; regulation < MAX_REGULATION_NUM; ++regulation) {
 		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
 			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel) {
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
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
+					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
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
+							hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][path] = tmp;
 						}
 					}
 				}

-- 
2.47.3

