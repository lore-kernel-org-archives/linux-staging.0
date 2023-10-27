Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E3B8BE7
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR5zHYDc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b9af7d41d2so1773561b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396741; x=1699001541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59Ey2F1WGl117Zy7e/WDuBfmKzQ/9WE16LCyKckLl/k=;
        b=ZR5zHYDcv1cnTLxQM3xZcx2ySLZdfiAjeAesft/yGpKqSWw/kxAXnElLsstLPqvUvT
         b3wQe5NfTBwXFwkq8YDqlGiXd/nRlgQAqzG4Nbkk2xc1dv0kxxZdiNI2TFMwscZ0WDKP
         eOF067DXUO2ssmIGg/DTThdHenpL6juq7ShH0eXuQYlPlKm1F7pmpcnUSDXVjg+mF6bZ
         zOHpMi0/UxV499NHrMxj+onOMQQ0eIrkDCAuYa0ucW2EO0+xy14JjD/VMGQE254DctyC
         kDjoFkMMYtjHWa4Ldp2E0SvcvxaZSpO/sUghqryN8ABKfJkl84R3mfdM8Us+zC+8q6NN
         adlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396741; x=1699001541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59Ey2F1WGl117Zy7e/WDuBfmKzQ/9WE16LCyKckLl/k=;
        b=j7YAPCKFf6J2rMKhRlL4KFsYPANB/cvgC8qd9UaA4PJFx8c8CbU3JTC8mX9aC9Z1qE
         AiJ7v7pvNaqCob6H3/HneKwF3szwCiNCJFDwO0yKtK0xRFbuNy29t+DcrL2tLAIKPUr5
         MyexGFKkiM1DYwQ5iyYrB+DfXNh1a+nnsB3K36c6A1luo5YWJK5X7JbhgUjkBea37PMH
         ZaKyArf7BRm5AI6xY2Zq39J9Ts59TSLc1pRyb6MO3X/XRNCSkgShx0wYOAPaiGNZDN8b
         T/wM2tr1pKt4ODRrHGORixyv3DmLRvPjoKpnGkaWOnOZzF3q/24kSireAsLjd9MyTW5F
         0i3A==
X-Gm-Message-State: AOJu0YyxF+BUb0Ni1HJ11rGtccW51ORxSKufkmJhua8f0B36rOZb9cnI
	z/zSrt0J/f7gMWvwVGthf1c=
X-Google-Smtp-Source: AGHT+IFFdz1tHIqvU2F7u74sK7YEsjTm32cifdtb/hF01T+AFomtICdUTYv5m6oVgvDznjvp+iv2GA==
X-Received: by 2002:a05:6a00:2d82:b0:6be:5a6c:d3f7 with SMTP id fb2-20020a056a002d8200b006be5a6cd3f7mr2337968pfb.2.1698396741339;
        Fri, 27 Oct 2023 01:52:21 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:20 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 02/10] staging: vt6655: Type encoding info dropped from function name "s_vCalculateOFDMRParameter"
Date: Fri, 27 Oct 2023 14:21:51 +0530
Message-Id: <de4817b8c29a1cf5e50afb553e3e30bc0fc44572.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698396278.git.opensource206@gmail.com>
References: <cover.1698396278.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "s_vCalculateOFDMRParameter" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index aa1017d7399c..2968be1f8d4e 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -80,7 +80,7 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  *
  * Return Value: none
  */
-static void s_vCalculateOFDMRParameter(unsigned char rate,
+static void calculate_ofdmr_parameter(unsigned char rate,
 				       u8 bb_type,
 				       unsigned char *pbyTxRate,
 				       unsigned char *pbyRsvTime)
@@ -585,58 +585,58 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	iowrite32(phy.field_write, priv->port_offset + MAC_REG_RSPINF_B_11);
 
 	/* RSPINF_a_6 */
-	s_vCalculateOFDMRParameter(RATE_6M,
+	calculate_ofdmr_parameter(RATE_6M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_6);
 	/* RSPINF_a_9 */
-	s_vCalculateOFDMRParameter(RATE_9M,
+	calculate_ofdmr_parameter(RATE_9M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_9);
 	/* RSPINF_a_12 */
-	s_vCalculateOFDMRParameter(RATE_12M,
+	calculate_ofdmr_parameter(RATE_12M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_12);
 	/* RSPINF_a_18 */
-	s_vCalculateOFDMRParameter(RATE_18M,
+	calculate_ofdmr_parameter(RATE_18M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_18);
 	/* RSPINF_a_24 */
-	s_vCalculateOFDMRParameter(RATE_24M,
+	calculate_ofdmr_parameter(RATE_24M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_24);
 	/* RSPINF_a_36 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_36M),
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_36);
 	/* RSPINF_a_48 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_48M),
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_48);
 	/* RSPINF_a_54 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_54M),
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_54);
 	/* RSPINF_a_72 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	calculate_ofdmr_parameter(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_54M),
 				   bb_type,
 				   &byTxRate,
-- 
2.34.1

