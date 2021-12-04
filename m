Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD7B2C9D
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 11:04:32 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r25so21889658edq.7
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 03:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y4OE7fIxM3IBUgU1FDhrFV7zqIHjmcZuHxdn2mMTL+4=;
        b=fzBAkR9ouvyPXBtGdsx5hm5ykf++qu7R3H9hH4wsRXTchSXlULLktyTc59Jcs8JtYQ
         pOY++WEpl9djG1KzH40n5UmBYiN/2xHCw8YGR6prmLDej6RFvtgAn5e2XKn32Qh6Bjcl
         rsO8NNMBwMSIETHDVFqpzK8k9WZROn8GsJES6NoF8GIdY6VeIiDPikUdG1oMTwJmpzOh
         cg5seF0RfzmQDTlWwXKW70J9WuhJWj0HASFtli4Vlr8VbGw7EZsebpD92hPevVCEe5jp
         TQq8oLTJnh9PGHPuUKax8WnmGFDsN3vUFkPL6+jS/s1rJZQKdPi152PRpLGOeV3/xSby
         GglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y4OE7fIxM3IBUgU1FDhrFV7zqIHjmcZuHxdn2mMTL+4=;
        b=uXyDuGSWk3izuNsg8j1hSw/SaXUyEg4WghDulSxrOYzRD2ujIkVJOORCdEX+MkV2Ut
         eDtwkoPEcPy9X/Wp/dGbb1UxSytGcbNFwPw6YeynCMcG1q5Uitqj/KHMq6Ls3uurniFu
         6DoeWH2n1zJ2Si6Luyt3hPMy3u5RKQuNVHVN8dnI/+hst7pVhjE8U2FiizayVyd8NKth
         8NGF8smVg0xCDW+WVYjPTJOX8ycrkYQP43a+ThMtoi1wmZDc7v3nIyYDqx1w+Jfht5it
         GQoOGMSoY2PlHbovqvlBnvgKeubHuHYtg0loCkl5vwNSP9V6PnDfo7REdtA7D/tYvDoV
         OwSg==
X-Gm-Message-State: AOAM533lRyanIYshX0sFOTQyOrIlIMomlgAi9omFaasaxrLnYVG3K+Nf
	YSKeb2pXqQwQUl03sOW+p9g=
X-Google-Smtp-Source: ABdhPJwrUcop2q1OkSmOaK2VwhSy2S+RNXC9arqc5w26Pyd6I7khb0ONP7Joi5JIENapxGZPS4iG3A==
X-Received: by 2002:a50:fd16:: with SMTP id i22mr34246672eds.224.1638615870491;
        Sat, 04 Dec 2021 03:04:30 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id e8sm4013373edz.73.2021.12.04.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 03:04:30 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: rename s_vCalculateOFDMRParameter to vnt_calculate_ofdm_rspinf
Date: Sat,  4 Dec 2021 12:03:38 +0100
Message-Id: <20211204110341.3938762-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename static function s_vCalculateOFDMRParameter into 
vnt_calculate_ofdm_rspinf in order to make it compliant with linux
kernel coding style.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/vt6655/card.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index ee2d145778ed..dd1d8872d3d8 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -56,7 +56,7 @@ static const unsigned short cwRXBCNTSFOff[MAX_RATE] = {
 
 /*---------------------  Static Functions  --------------------------*/
 
-static void s_vCalculateOFDMRParameter(unsigned char rate, u8 bb_type,
+static void vnt_calculate_ofdm_rspinf(unsigned char rate, u8 bb_type,
 				       unsigned char *pbyTxRate,
 				       unsigned char *pbyRsvTime);
 
@@ -75,7 +75,7 @@ static void s_vCalculateOFDMRParameter(unsigned char rate, u8 bb_type,
  *
  * Return Value: none
  */
-static void s_vCalculateOFDMRParameter(unsigned char rate,
+static void vnt_calculate_ofdm_rspinf(unsigned char rate,
 				       u8 bb_type,
 				       unsigned char *pbyTxRate,
 				       unsigned char *pbyRsvTime)
@@ -639,42 +639,42 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	VNSvOutPortD(priv->port_offset + MAC_REG_RSPINF_B_11, phy.field_write);
 
 	/* RSPINF_a_6 */
-	s_vCalculateOFDMRParameter(RATE_6M,
+	vnt_calculate_ofdm_rspinf(RATE_6M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_6,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_9 */
-	s_vCalculateOFDMRParameter(RATE_9M,
+	vnt_calculate_ofdm_rspinf(RATE_9M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_9,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_12 */
-	s_vCalculateOFDMRParameter(RATE_12M,
+	vnt_calculate_ofdm_rspinf(RATE_12M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_12,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_18 */
-	s_vCalculateOFDMRParameter(RATE_18M,
+	vnt_calculate_ofdm_rspinf(RATE_18M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_18,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_24 */
-	s_vCalculateOFDMRParameter(RATE_24M,
+	vnt_calculate_ofdm_rspinf(RATE_24M,
 				   bb_type,
 				   &byTxRate,
 				   &byRsvTime);
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_24,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_36 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	vnt_calculate_ofdm_rspinf(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_36M),
 				   bb_type,
 				   &byTxRate,
@@ -682,7 +682,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_36,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_48 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	vnt_calculate_ofdm_rspinf(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_48M),
 				   bb_type,
 				   &byTxRate,
@@ -690,7 +690,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_48,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_54 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	vnt_calculate_ofdm_rspinf(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_54M),
 				   bb_type,
 				   &byTxRate,
@@ -698,7 +698,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	VNSvOutPortW(priv->port_offset + MAC_REG_RSPINF_A_54,
 		     MAKEWORD(byTxRate, byRsvTime));
 	/* RSPINF_a_72 */
-	s_vCalculateOFDMRParameter(CARDwGetOFDMControlRate((void *)priv,
+	vnt_calculate_ofdm_rspinf(CARDwGetOFDMControlRate((void *)priv,
 							   RATE_54M),
 				   bb_type,
 				   &byTxRate,
-- 
2.25.1

