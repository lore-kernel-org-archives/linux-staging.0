Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A6156C8
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQk+FCXP"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ba172c5f3dso1754516b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396758; x=1699001558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtKdN8gUg9+lMym9YqfmjhQ5Z4QidptzAJvqHwUlM7g=;
        b=jQk+FCXPotmUV6YVMm0zA6lutRcoq9UUXhjIDOX3Pmnvevi2uBrhd0gWslJfqqm/fa
         UqfN6T6OPCp31DTq7PGeytHWiEmGQ9g1/HHMOa76xzhov5pz41sjYXRXRLr07d2laqYz
         fMkzP6896i7D/tiaFAwfY53G5ixJdX4q8ho3RkjcLQ2GPSjcckGg07ifQpz9BQXR9/xR
         UBeS/bySY6rZ351oO3FolTF5cdGYmy+oTNSP8sSPSNQOLw00SkZP1gdRGIVuCNpwFJRY
         hQvcosQoc4TnurfWCVAiuA4ca3M4ZZ6hpV3RAwqUxQo+mT6h0EmreXBBfuuiQnR2aE4y
         2wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396758; x=1699001558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtKdN8gUg9+lMym9YqfmjhQ5Z4QidptzAJvqHwUlM7g=;
        b=MSgEcHwnD5HZUTPZUVmU/HmPhz9cdgSihwmL0gW0QXSzjrOSTIGnoO6RjoQnO8MEJd
         Jd2EQdXaLXGbWX0YdQx99UTkw+0IM6Skl38YSxATAcd3BmX7TsikoeJrzpKL7B4GAiqz
         jV2vjvUfDNHitgc6N84WweDqjdZJ9fLKPdNFi54h5U+eLike9nQxofbP3YBerDeVE497
         eSwUwo/poppqESVC6TPrQn+cd4neD/2Mdpc6r+4MthxxBcZfc3FBxTGq8RPI9sNHtaN1
         nX+d7907nJRfs8zEVU3lOO5dz1zxo9YldkJkeqC0/aochDeVBcd8PcHE+V0mpjxc0DqV
         A5uA==
X-Gm-Message-State: AOJu0Yx7CZ818fxhSgFsx1ROqUqcisfjWTm+emuvOSlr3EXyUG9iSLh/
	DGR/AQ7PIovWCtIOEnAD4KU=
X-Google-Smtp-Source: AGHT+IHBCLzZpU6n8om3D/dn92DIeV8MgVjACdnbzcVk1bkmBb9Gh079jTRRKZd4w9ssolNOPTQvrg==
X-Received: by 2002:a05:6a20:c19a:b0:16b:ff2c:c42c with SMTP id bg26-20020a056a20c19a00b0016bff2cc42cmr2092003pzb.62.1698396757804;
        Fri, 27 Oct 2023 01:52:37 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:37 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 10/10] staging: vt6655: Type encoding info dropped from variable name "byRxRate"
Date: Fri, 27 Oct 2023 14:21:59 +0530
Message-Id: <16d6e4f4fbf643b45a9e2e5b4c48c93450543ecc.1698396278.git.opensource206@gmail.com>
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

variable name "byRxRate" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 12 ++++++------
 drivers/staging/vt6655/card.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index ebb96b4c9406..350ab8f3778a 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -278,8 +278,8 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  *
  * Parameters:
  *  In:
- *      priv         - The adapter to be sync.
- *      byRxRate        - data rate of receive beacon
+ *      priv            - The adapter to be sync.
+ *      rx_rate         - data rate of receive beacon
  *      qwBSSTimestamp  - Rx BCN's TSF
  *      qwLocalTSF      - Local TSF
  *  Out:
@@ -287,7 +287,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  *
  * Return Value: none
  */
-bool card_update_tsf(struct vnt_private *priv, unsigned char byRxRate,
+bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 		    u64 qwBSSTimestamp)
 {
 	u64 local_tsf;
@@ -296,7 +296,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char byRxRate,
 	local_tsf = vt6655_get_current_tsf(priv);
 
 	if (qwBSSTimestamp != local_tsf) {
-		qwTSFOffset = CARDqGetTSFOffset(byRxRate, qwBSSTimestamp,
+		qwTSFOffset = CARDqGetTSFOffset(rx_rate, qwBSSTimestamp,
 						local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		qwTSFOffset =  le64_to_cpu(qwTSFOffset);
@@ -708,11 +708,11 @@ unsigned char card_get_pkt_type(struct vnt_private *priv)
  *
  * Return Value: TSF Offset value
  */
-u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2)
+u64 CARDqGetTSFOffset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2)
 {
 	unsigned short wRxBcnTSFOffst;
 
-	wRxBcnTSFOffst = rx_bcn_tsf_off[byRxRate % MAX_RATE];
+	wRxBcnTSFOffst = rx_bcn_tsf_off[rx_rate % MAX_RATE];
 
 	qwTSF2 += (u64)wRxBcnTSFOffst;
 
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index caf72892c1cd..19689a291f5b 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -48,13 +48,13 @@ void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 			 unsigned short wBeaconInterval);
 u64 vt6655_get_current_tsf(struct vnt_private *priv);
 u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval);
-u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2);
+u64 CARDqGetTSFOffset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
 unsigned char card_get_pkt_type(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
 void CARDbRadioPowerOff(struct vnt_private *priv);
 bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
-bool card_update_tsf(struct vnt_private *priv, unsigned char byRxRate,
+bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 		    u64 qwBSSTimestamp);
 bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 			  unsigned short wBeaconInterval);
-- 
2.34.1

