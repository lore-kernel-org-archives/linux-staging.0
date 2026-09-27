Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49A18D62A
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 01:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471881; cv=none; b=Vpqr9cpxJhZcdX9Bsg9f4RR57g/ug5z2Chb3A79e2V/S8B1LHsRhqqYYR1gWAVKhv2+CHc86YrRPE9kDsWvXHzpz8fTwgeyhXx76otQx9JiVACrNL/5ZkWSJIrSC6/o3ujNtGUhuXW7kYKTaw19L8Ab7RKkgSJQIaUlqSgRJikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471881; c=relaxed/simple;
	bh=j4MY2CMuvs7m5BNgdWLNKr7Heqr8s743RA0gDwzd388=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8dYZbasoEBuZLQQmcj15Z8HuUn3TVYzOxZBb89ydvxB3sncniJEMAFye6YyU1dMm+e7VQx4/T/K2vXg9w4CvZ6F2XzvD36hs2djLYKzQjlX59nhc9pYIPuJUqyjKJzCra3RUiGtq2pVnHYjYAm1R24MVbt5+OhZQqczK+qHjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgHczA/o; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgHczA/o"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98536aec408so1731846241.0
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 18:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471879; x=1791076679; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpkfUBdF/f1+2EmRosbv+bRw3hNHZJ3PSm5fQl8Ev5g=;
        b=VgHczA/ou8wp8dxG3lESFy1qLYzI1Yp+v+qYhEBkoONFPpE+ZbYESbdp+2xIkWm7dh
         tOw7z1+pKJCpOe3Owg4k8nOnKbPuFDLgHupWQBKqSaVgXOp/BIST9wGNf8ZZhkaI1xxl
         xhj0p+W1lIer8zeEdDKZbJLED2rJxVtscSFu8ZWsR3f5/FlvvnZnRVfp8dgkByTIR5tS
         7JZHptdyBq6hDdd3a3gOo7sJ1+9t8KuzfMRKAgKnxvvz0xaPA1wfCMSHB9zCQgzDlcDe
         72qdVE68zmp3dlNbmjFIyApEfYxzVtyKmVGhnZB38S3rLxvUt5VcDNr20yFUdH7Seegj
         LtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471879; x=1791076679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpkfUBdF/f1+2EmRosbv+bRw3hNHZJ3PSm5fQl8Ev5g=;
        b=sYl2VbQxGBFr+zuEVx/QWmFnCXePBy8/WFAkn80C8t5onvyqOBDae3/js05IlTuKH7
         69YLhRb8veX2ptWW7/Kt2I40Udi1t0sT5xqIDAcDvIzH/RdWO25IBjDf8we+nsjrsjlQ
         ZnqFLiKLuUGYWD0iK+fx7c93aoknu23zDMIq8h0myfkLR9pEq2z/N0nsyEG7CzkGQcAU
         U2tuPKIDvqLiywVURJDB+OBnwv3haGxZeCH7gLqc+3NRT4A0ELpQ/GNAvxJNXiZC1Iz6
         wrYw1s37txjd3BzPByQi/VOH2s8RlpNB9x0izl2HHHry6Lh+yjsgI+fHR08jgAJ2Sa2R
         +0eA==
X-Gm-Message-State: AFq9FYIYybx7XMExCpzwlv7SRkOL9Ac/nbLAEDMnX8j3DWIk+3HTMCh6
	SQ/DPv6JQEtOpyOdR3p0ZeipiVBLzu3snUSIhWvwSJ6im55UsngqhPVA
X-Gm-Gg: AYBFou0iVb+icUGgTKnHOt1c/mpEKPJSeG+m1AJMSp4UWagH78QA3Eqt0CmBzHKi34N
	e/qeEyg2t0Cu1b41+IWa27BUJOiOVtlkKyBnD8TeW1l+6vc2Ua0HwoNasWW7jz1TfWdflK18xqo
	ZUdMGoOXJ39gNh0p5LvKAPsWhND3h2XUspktDJmVUR3EqSvDj+SWs1qXjtLvFAbeTD+35ooiWLy
	JLils6BZ9/Jihug4q0Ip8+KKSOPYD+8eMpRH9PGnnMXAnVkzARA+znKongcRyeIfvyIixLfPdVC
	T2wS5bizZaO2B4KoTi2JiV9FeMxWQje8AjmyRRzUDPjmj1CI9FN770TH0c/VD8lagePpX1XL1nZ
	+5rZNaGoPYc+mCjmcS8ydwms6R5BBxLxmuVZ+4BMJSyjdSv/VmZ48sW4JX3DdQtnS2uw7wD0OXS
	VLVK4ZJ1VqJobv95cocXQaWW6uJBFfpppBvD+/BiopqeuzyUhX+oKCbd7MlyslFmBhBg==
X-Received: by 2002:a05:6102:3a42:b0:7a8:cecd:42c8 with SMTP id ada2fe7eead31-7af1fc1869bmr2370136137.40.1790471879328;
        Sat, 26 Sep 2026 18:17:59 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:55 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Sat, 26 Sep 2026 22:12:27 -0300
Subject: [PATCH 4/4] staging: rtl8723bs: extract inner loop in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-4-989dcbc113fd@gmail.com>
References: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
In-Reply-To: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=2758;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=j4MY2CMuvs7m5BNgdWLNKr7Heqr8s743RA0gDwzd388=;
 b=Hg5K+V4QmTVouBv8J5ouqlK4RRVp3Fz0i1kZ+QlfSZkqpGbV0SDNlvdvBxWzwNd/qE2hmTiy0
 Ohl4f6CSLMgC0luTnAxhXzDxti8q0WEPCRc68SNFmWHDEO+/tZ1kQl8
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

phy_tx_power_limit_to_index() iterates over an array with 5 indexes,
making the code deeply nested, move the inner loop into an auxiliary
static function to reduce nesting and improve readability.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 47 ++++++++++++++------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 46402ab07d757b2aba69d6fb7fec127681c9d012..8e39419b95f445f0eb153efcd28dd97fafeb8e03 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -713,35 +713,38 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
+static void __phy_tx_power_limit_to_index(struct hal_com_data *hal_data, struct registry_priv *r,
+					  u8 reg, u8 bw, u8 ch, u8 rs)
+{
+	s8 tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][RF_PATH_A];
+	s8 tmp;
+	u8 path;
+	u8 pwr_base;
+
+	for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
+		if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
+			pwr_base = hal_data->TxPwrByRateBase2_4G[path][rs];
+		else
+			pwr_base = r->reg_power_base * 2;
+
+		if (tmp_pwr_lmt != MAX_POWER_INDEX) {
+			tmp = tmp_pwr_lmt - pwr_base;
+			hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][path] = tmp;
+		}
+	}
+}
+
 void phy_tx_power_limit_to_index(struct adapter *adapter)
 {
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	struct registry_priv *r = &adapter->registrypriv;
-	u8 pwr_base = 0x2E;
 	u8 reg, bw, ch, rs;
-	s8 tmp = 0, tmp_pwr_lmt = 0;
-	u8 path = 0;
 
 	for (reg = 0; reg < MAX_REGULATION_NUM; ++reg) {
-		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
-			for (ch = 0; ch < CHANNEL_MAX_NUMBER_2G; ++ch) {
-				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
-					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][RF_PATH_A];
-
-					for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
-						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
-							pwr_base = hal_data->TxPwrByRateBase2_4G[path][rs];
-						else
-							pwr_base = r->reg_power_base * 2;
-
-						if (tmp_pwr_lmt != MAX_POWER_INDEX) {
-							tmp = tmp_pwr_lmt - pwr_base;
-							hal_data->TxPwrLimit_2_4G[reg][bw][rs][ch][path] = tmp;
-						}
-					}
-				}
-			}
-		}
+		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw)
+			for (ch = 0; ch < CHANNEL_MAX_NUMBER_2G; ++ch)
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs)
+					__phy_tx_power_limit_to_index(hal_data, r, reg, bw, ch, rs);
 	}
 }
 

-- 
2.47.3

