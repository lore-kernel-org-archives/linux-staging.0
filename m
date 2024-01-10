Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF583A1A3
	for <linux-staging@lists.linux.dev>; Wed, 10 Jan 2024 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvcnMePM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da9c834646so3245631b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 23:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704871435; x=1705476235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pX+siGsa1lcjn5ja6SnM7esk+Fn5pql479Lrw3+G9o=;
        b=JvcnMePMmF410O4i58NPKesu/6CWFF8LqsUUyZW1y9BFTZ3ES4CCdSx87TLQzAu9Ge
         uTPz0qwjx6Seor2qEc3SjFAKXrHcAIDkQvloXxOrEKH2ZxQ+pX0FDfmU7+EYDxhpXvaI
         R0Sh8YetIeqwhRuO9DISCpsKc6PTahxlax3RtdfsUQ62D0MtIbomuNImJuvcDgu3Sgbs
         JSMx/9kSqVk0OKGAZkK2WVY4oDB/9r3QNRH1HfEHLL1/xGpqWiYV5UMdNn03qxnNf9Zg
         7nCU9y1bC5TRO+NTWvvsomJOExNCV0vh9MpTpaNGjz/jEcBKvPeXEKuKWr2Dx4F+3/Yx
         EuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704871435; x=1705476235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pX+siGsa1lcjn5ja6SnM7esk+Fn5pql479Lrw3+G9o=;
        b=GRBlPa3wkWzz3YIKq3nOW+wlfHCaPEoseP5WuxwY/6+xenYxb+/fUOl4JEVeJjAAmb
         8885GgdMdk4a3C4vnDD4MIqswpdgObFKdoX9iNXPpGwyWa36KaCpTR+TfFKYeIiaMUGT
         AFGhhChDSBGHXZw3zqxvdva98RFrNdqjRXcMouhfiE9//+EnNVUtsfIQ4ynC9cdu9EbC
         P1d60USoZSojqR6SS76bmsnZWJnYViUHuFbCeROq5mUj8UdvEjVd7qJoDAAMAoMDtC+9
         yyB+9e1NJe2z/aV7isiQX0r0hJN/XS1HFfQT+5/cnQDcXPYp6ghlj4AzvprtQ6m4oV6B
         jZHQ==
X-Gm-Message-State: AOJu0YxDED6T5zlakxUYz5LBldMePctqni+Eiv4NQWYkC/tTeVEFdT+o
	iMAn2BUMNAjAN4/Gie8F1ns=
X-Google-Smtp-Source: AGHT+IFkJFbGrfUWwgHXOJs8Oz90Hfeou1ogUwYrvTaxwXqKQfMgZzYszox2Uyl/gw/NiWS/UhVgIQ==
X-Received: by 2002:a05:6a00:2395:b0:6d9:bce7:d8e3 with SMTP id f21-20020a056a00239500b006d9bce7d8e3mr978629pfc.24.1704871434893;
        Tue, 09 Jan 2024 23:23:54 -0800 (PST)
Received: from mgyee-VirtualBox ([47.152.33.114])
        by smtp.gmail.com with ESMTPSA id a24-20020a62d418000000b006d70b0d4639sm2914529pfh.107.2024.01.09.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 23:23:54 -0800 (PST)
From: Matthias Yee <mgyee9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthias Yee <mgyee9@gmail.com>
Subject: [PATCH v3] staging: vt6655: fix open parentheses alignment
Date: Tue,  9 Jan 2024 23:23:05 -0800
Message-Id: <20240110072304.2226-1-mgyee9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjusted whitespace to fix checkpatch warning Alignment Should Match
Open Parenthesis.

Signed-off-by: Matthias Yee <mgyee9@gmail.com>
---
Changes in v3
-fixed line wrapping for commit message
---
 drivers/staging/vt6655/card.c | 74 +++++++++++++++++------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..688c870d89bc 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 
 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;
 
@@ -586,61 +586,61 @@ void card_set_rspinf(struct vnt_private *priv, u8 bb_type)
 
 	/* RSPINF_a_6 */
 	calculate_ofdmr_parameter(RATE_6M,
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_6);
 	/* RSPINF_a_9 */
 	calculate_ofdmr_parameter(RATE_9M,
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_9);
 	/* RSPINF_a_12 */
 	calculate_ofdmr_parameter(RATE_12M,
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_12);
 	/* RSPINF_a_18 */
 	calculate_ofdmr_parameter(RATE_18M,
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_18);
 	/* RSPINF_a_24 */
 	calculate_ofdmr_parameter(RATE_24M,
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_24);
 	/* RSPINF_a_36 */
 	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
-							   RATE_36M),
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+							  RATE_36M),
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_36);
 	/* RSPINF_a_48 */
 	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
-							   RATE_48M),
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+							  RATE_48M),
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_48);
 	/* RSPINF_a_54 */
 	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
-							   RATE_54M),
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+							  RATE_54M),
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_54);
 	/* RSPINF_a_72 */
 	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
-							   RATE_54M),
-				   bb_type,
-				   &byTxRate,
-				   &byRsvTime);
+							  RATE_54M),
+				  bb_type,
+				  &byTxRate,
+				  &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_72);
 	/* Set to Page0 */
 	VT6655_MAC_SELECT_PAGE0(priv->port_offset);
-- 
2.34.1

