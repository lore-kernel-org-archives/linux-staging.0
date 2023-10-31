Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D03D507
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iot/QAi6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc3542e328so16041985ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730487; x=1699335287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/fqNuzQYQazb2cxHMITyfFuFwOyOR7YqTCdq7dtzbk=;
        b=Iot/QAi69uV5AgQLr7iiuqv8TDVjjSN0vGzGZHUdDjgA5twn94EUz6T46aJry9i+Wb
         6btr2TH8aRoOUBPfrdjLKjtA2x5BSaaQcXxU+3IKZ+GCI/HKqkc7DT1NE4iCKuZLn+nc
         eJS/wp9QkPlI6WcaHzhlr+rQPpkhdnYondapswnL7MXt1zak992Q8mR2gvZYdY/DtZpD
         vxFPmHFqtEXc/qtHtTW4K1ofPwFKpOTHkeTf94J0WIYk6EJCUqqo8x6xEQkvl4y2rBYp
         JDpLAcDyLfS09hZNWoH3GO0Rxe3+37Nv1XXYNwCN5hnWOjzHI8bsYoQyjfPv2/6n6mqp
         1hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730487; x=1699335287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/fqNuzQYQazb2cxHMITyfFuFwOyOR7YqTCdq7dtzbk=;
        b=ZfkewcpO2Z7tRLGhCahP+lVb7Jy/DBz9JMp2vjri2uZZTG8SlaGAsnujzBV63tLgNn
         TebMoO3prIc4njXMGjZWIA21owDXJVF1MsjrpRZKWR5RBKw6G6MslWouStRl2U+DyFcS
         q4R7dhXaIWrnhzRkdsZg8TPmMPSINBYSUZ37nGJU0r/Gn3mf447+BmvZVdhEHiUShH72
         k2tMGRs35N0D7LXzbOz7GHJRL5D/u3y6oHwk1CShosd0PSJkp6lJqGPdgn0BXi0e0i5c
         63JNhTOYXQOyv4xc2yle+sYU4Gx7bosXgMjI4eJSLoHABycbZt8jW9IoiDHTah3UbqNP
         Pk+g==
X-Gm-Message-State: AOJu0YyCivExSteCEmAXJdMErpvsnVFWHpNqW+VQbqKEADv1wWiPThuQ
	gE3r4/GLc6So+2n/pwlshtM=
X-Google-Smtp-Source: AGHT+IHDsDazw2uQJ+MBPbaAvd5OLst4nxkyeJrht3pxyxUHOxto0rV3E/BaeQ8ahh1dFBG3cuyNaQ==
X-Received: by 2002:a17:903:2341:b0:1cc:449b:41e3 with SMTP id c1-20020a170903234100b001cc449b41e3mr4936574plh.59.1698730487444;
        Mon, 30 Oct 2023 22:34:47 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:47 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 03/11] staging: vt6655: Type encoding info dropped from function name "CARDqGetTSFOffset"
Date: Tue, 31 Oct 2023 11:04:26 +0530
Message-Id: <b6b86bd65669cae59ca10171ecee8aa4a13c4a26.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "CARDqGetTSFOffset" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 6 +++---
 drivers/staging/vt6655/card.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index e0af14eb7cd4..1edf65e2adcf 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -10,7 +10,7 @@
  *      CARDvUpdateBasicTopRate - Update BasicTopRate
  *      CARDbAddBasicRate - Add to BasicRateSet
  *      CARDbIsOFDMinBasicRate - Check if any OFDM rate is in BasicRateSet
- *      CARDqGetTSFOffset - Calculate TSFOffset
+ *      card_get_tsf_offset - Calculate TSFOffset
  *      vt6655_get_current_tsf - Read Current NIC TSF counter
  *      CARDqGetNextTBTT - Calculate Next Beacon TSF counter
  *      CARDvSetFirstNextTBTT - Set NIC Beacon time
@@ -296,7 +296,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 	local_tsf = vt6655_get_current_tsf(priv);
 
 	if (bss_timestamp != local_tsf) {
-		tsf_offset = CARDqGetTSFOffset(rx_rate, bss_timestamp,
+		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
 						local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
@@ -708,7 +708,7 @@ unsigned char card_get_pkt_type(struct vnt_private *priv)
  *
  * Return Value: TSF Offset value
  */
-u64 CARDqGetTSFOffset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2)
+u64 card_get_tsf_offset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2)
 {
 	unsigned short wRxBcnTSFOffst;
 
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index cda969b06fce..df1b9a7c1f21 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -48,7 +48,7 @@ void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 			 unsigned short wBeaconInterval);
 u64 vt6655_get_current_tsf(struct vnt_private *priv);
 u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval);
-u64 CARDqGetTSFOffset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
+u64 card_get_tsf_offset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
 unsigned char card_get_pkt_type(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
-- 
2.34.1

