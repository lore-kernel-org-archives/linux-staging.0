Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4A349CCD
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914110; cv=none; b=beHtWhV4vzQ8LEK2lGfEtx/4F7kzTOseYFM71x7zeP9lvM2J+ndK6NkKdqgUF2ZZF4/rAT9WZorZlSfw2dx64t/jpQgZP2hqTQwNlJBNrizsCQaMealfMyojL4LczSHvK38PS991vwHghalaeN26Rs+3L6elLkedUr0tCsMijLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914110; c=relaxed/simple;
	bh=XxuR4V6flJexrudr1v4kOBAI37rC+/aNdKk/vImQRnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TylOGEhd3aJLaeGR29PaXeu9FxPP4nq00Xs/O7QoAJPPFjsl6XUv6NZ3VCqbuEEx0XFUsSU7+nPsWRUxsiyFeIqsTZMPip39AC8KvYBpTdq/r23XSmUvuLsPj/Rnu0jSAigwpNPJRyMI9pdYIT3RYH76Gt8hzN0tyw+X/QTr92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLxLZNEC; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLxLZNEC"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34daf1b9a1fso1223037eec.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 21:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914109; x=1791518909; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ub6XH25lfLy++mrqdvv7EIfPuPzxSLopDfg1ndI1Os=;
        b=FLxLZNECTkgdM5OA4jbjxKgGXtmpEhPAyESOjNGK8yN5/DnZyg029+3D9ph+Byrskz
         BrG+cez4v88Z8d1N8jwdku+XIdT+uHi9JvCZg0KPDF02oFkleyUgRCyz3haLTgsTmJbu
         kqDfOpdxE9rN+MMu0SSHs93K2A5oEq88t1kXWL4zDxTI+uxDrU/AKuHfF2eOq5AHJ2Sh
         Bp+TnxkEOvm0+hj/PHssPH+AUembEXutKm+RFVqDIv/hX5vD1pKTQ26otTAXfEmYS1Ud
         t2cZYKVHsRQlAmG0ZhcmxOnSE8AvJ34p1lnTizB/NVxrvNtAKBRAtl+kLlLvX6rdOROk
         1CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914109; x=1791518909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ub6XH25lfLy++mrqdvv7EIfPuPzxSLopDfg1ndI1Os=;
        b=0HrAukhUl1IivW/LQ9gWFsIzX+NmOTgh9JqzHT9vPGcIUWGPxJwecf66dBwRxWR/Wq
         edxe2yKc/jXWZGwjSYWfzFaGZNdqalqMpTCqI5HRYMDxaUp6WyoKzF6znPFK5OnqJA8W
         p9bKPDY4IksYSxrgkAW/NM6I4VWh6lnyR/F7ZMQQcfAakweo2xuxUa85roZjfeM/jup6
         fNVpllORDiOpGjsJypGy5egu+sEhPQDfrM4xLRQMfg45w28A9j+V/K4Kwrxp7P+lnAI5
         aGdzKT9XGGU7l7ois6Nbkn9sqVLskVF9nsXceJITNJ53bXCTlUFTiF5UMZuMVyfuT34N
         QeqQ==
X-Gm-Message-State: AFq9FYJ/FmoGTc702FF6qV/LTOdLnqpE/sMsPB+kjaMhHVt1+VdQ3qIT
	Hf9GnHXiSncUhWY+0/xXnxgOSgPPy8cOMK0ZSdim3l5nK1TswRqbV6YP
X-Gm-Gg: AYBFou0XS/lCDZI+9ToRBHPW2txavbRWJ9IRxZthqIcf2/5jOx+oiOLYdrxzFkH0mvF
	lyk6XWdmyiUykqDcDk7SSwtasjjRnZ1efF0Te5jlqSWxxd3nBaHei8tblkHmijLjmicJmW6y7Aa
	W6Amz1iuNYf1hSq2o+wDW6PHsn9GdHbA7LSm6Y9UBY1UbvUOXByv1XgqT+x23govbzgldmM4r2V
	FsPevyvBOG1agmsT84lkoo9ea6sdy67zPG5F0JoGCtS0aE+d8AxkM5yjD5nP+qB5iofzDyYHaWu
	TDnnyeY0QbntrUbViET2t65O/CZDiK856RUZxHFZH4ETuD2geB2wurZg6D8aaPXfFa9RY4FpHwc
	2UTbS4yFjPM5KTBlfuu1MUFCDrI3vogCTOEN2nALsyE9k4RA/7nedtwo9qxXxigHa8dcSBalpfh
	qLXzHXV/S6BfU6PHeZxK/Rfk45bECSAHu+HODT3O7JYzU5HlOnTJkoOLStqQR7+/vGQNcRWLZCQ
	2KMW5n18QKa4Q==
X-Received: by 2002:a05:7301:4887:b0:344:7aad:8eb5 with SMTP id 5a478bee46e88-34f150ed00fmr1547768eec.23.1790914108463;
        Thu, 01 Oct 2026 21:08:28 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:27b5:8987:8e28:81fb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35105dd1dfasm492558eec.8.2026.10.01.21.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:08:28 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Fri, 02 Oct 2026 01:07:37 -0300
Subject: [PATCH v2 3/3] staging: rtl8723bs: extract inner loop in
 phy_tx_power_limit_to_index()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rtl8723bs-tx-pwr-limit-v2-3-48b180fb6f7f@gmail.com>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
In-Reply-To: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790914100; l=2909;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=XxuR4V6flJexrudr1v4kOBAI37rC+/aNdKk/vImQRnI=;
 b=8l/zHfRhbiFDJY0bEDe2wCN48tReEPfOHU7zPSk2USjZTqtiLPR0DgRB7Elr8Sqdhz8tJ6/Ee
 ir8Rc+qx0zEDSIvvDNwMKGhjoP5YGBNP7OFbYufHvG1LaLYZmqZDsRO
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

phy_tx_power_limit_to_index() iterates over an array with 5 indexes,
making the code deeply nested, move the inner loop into an auxiliary
static function to reduce nesting and improve readability.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 48 ++++++++++++++------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 937441aa7dfee50857d37e0d0aa1415037b8cc60..f9f79bead66dcf3df155b505156f2ff73ea5fbed 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -713,35 +713,39 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	return pwr_lmt;
 }
 
+static void __phy_tx_power_limit_to_index(struct hal_com_data *hal_data, struct registry_priv *r,
+					  u8 regulation, u8 bw, u8 channel, u8 rs)
+{
+	s8 tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
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
+			hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][path] = tmp;
+		}
+	}
+}
+
 void phy_tx_power_limit_to_index(struct adapter *adapter)
 {
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	struct registry_priv *r = &adapter->registrypriv;
-	u8 pwr_base = 0x2E;
 	u8 regulation, bw, channel, rs;
-	s8 tmp = 0, tmp_pwr_lmt = 0;
-	u8 path = 0;
 
 	for (regulation = 0; regulation < MAX_REGULATION_NUM; ++regulation) {
-		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw) {
-			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel) {
-				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs) {
-					tmp_pwr_lmt = hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][RF_PATH_A];
-
-					for (path = RF_PATH_A; path < MAX_RF_PATH_NUM; ++path) {
-						if (hal_data->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
-							pwr_base = hal_data->TxPwrByRateBase2_4G[path][rs];
-						else
-							pwr_base = r->reg_power_base * 2;
-
-						if (tmp_pwr_lmt != MAX_POWER_INDEX) {
-							tmp = tmp_pwr_lmt - pwr_base;
-							hal_data->TxPwrLimit_2_4G[regulation][bw][rs][channel][path] = tmp;
-						}
-					}
-				}
-			}
-		}
+		for (bw = 0; bw < MAX_2_4G_BANDWIDTH_NUM; ++bw)
+			for (channel = 0; channel < CHANNEL_MAX_NUMBER_2G; ++channel)
+				for (rs = 0; rs < MAX_RATE_SECTION_NUM; ++rs)
+					__phy_tx_power_limit_to_index(hal_data, r, regulation, bw,
+								      channel, rs);
 	}
 }
 

-- 
2.47.3

