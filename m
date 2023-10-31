Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F4D507
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhkfmjBa"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc2575dfc7so25711505ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730497; x=1699335297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uQtO8M5ioqZ7+MOOU298ue9J+3vWCy5YR1WIv7HeCg=;
        b=dhkfmjBakRZT9kMdDXzilrVcQoXZZRnzW7RZ8kWZgvmPotzqZeT7w6atxDS37qqOuB
         n9dkdAidNOhWmNicmqd3A6ZyqFnUCojpCK8GMPFCFF+GFqy2LIMZmFKzxdFRDhKddZZv
         lalADIQAqCSIymbCPDNRAnk8AlMcpqNZnM+PGvEpQufVyhOFge0sqgxY+PFQKp34SrUP
         k2s19fRwWTtcgEugaWJ4me2TmEpZB34KnnPP/6OeqAOL+gkFhtfwyzKrmmtKlbfEJRFm
         F5HkCzhmxpFyYt0+HKrI0/KX1IjmMrdSx/iUomBu/tKA9pYAzT/uWaC7de5HS09HLzRA
         l2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730497; x=1699335297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uQtO8M5ioqZ7+MOOU298ue9J+3vWCy5YR1WIv7HeCg=;
        b=X9OmXYevVMp62lW9avwoWwdMmzUEz+5g4xOTo+W62UAaCCFKu4jDkXcCJ1GmTaLE+K
         +6c5QDbhrLoPKxV61gJ+u61vRIZii8rEXh2y+9mbfc18eJHfIikNSv8KLosDrYx4anpk
         gLJ63eyH9NMU9ohq9hcwr6XRret/dPjzhGmsDYq8nxWFo1UFixFs++8CJqZfG8niby6i
         EX4KLsAgtXXUEa5uBqxhrN9xVuDFsgRVdHkSaXX3xUD8oWpJlYOz9sSpd35/qQOOLgxH
         1got5Xi7qPJcvXlKRm7rdxcF0HDRA6ZvHbcHVWFnvsowbdCoCubgHbjfhrRtBfTMouHk
         FcyQ==
X-Gm-Message-State: AOJu0YxughENuTELRkBudQQK+RcyCU0Iuw5Hm32UHBzKPAgbeziPOl/t
	MQD58d9kJJCZFV7I4u8gXwE=
X-Google-Smtp-Source: AGHT+IGH+Q37s6NRSzSU3WWulvYqXR8L3ot4ArUROzWVEfOM8q/0W2cVvok7wY6SJR2VFqvxXXALzg==
X-Received: by 2002:a17:903:246:b0:1ca:5d1a:e77f with SMTP id j6-20020a170903024600b001ca5d1ae77fmr11216386plh.43.1698730497107;
        Mon, 30 Oct 2023 22:34:57 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:56 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 08/11] staging: vt6655: Type encoding info dropped from function name "CARDbRadioPowerOff"
Date: Tue, 31 Oct 2023 11:04:31 +0530
Message-Id: <5b264db5a6d5ac936e02f0a7f465e648504a049e.1698730318.git.opensource206@gmail.com>
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

function name "CARDbRadioPowerOff" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 4 ++--
 drivers/staging/vt6655/card.h        | 2 +-
 drivers/staging/vt6655/device_main.c | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 716fd3632508..7980b93d2b1e 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -15,7 +15,7 @@
  *      card_get_next_tbtt - Calculate Next Beacon TSF counter
  *      CARDvSetFirstNextTBTT - Set NIC Beacon time
  *      CARDvUpdateNextTBTT - Sync. NIC Beacon time
- *      CARDbRadioPowerOff - Turn Off NIC Radio Power
+ *      card_radio_power_off - Turn Off NIC Radio Power
  *
  * Revision History:
  *      06-10-2003 Bryan YC Fan:  Re-write codes to support VT3253 spec.
@@ -351,7 +351,7 @@ bool card_set_beacon_period(struct vnt_private *priv,
  *      none
  *
  */
-void CARDbRadioPowerOff(struct vnt_private *priv)
+void card_radio_power_off(struct vnt_private *priv)
 {
 	if (priv->radio_off)
 		return;
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index ab1193799239..5ca715b415e8 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -52,7 +52,7 @@ u64 card_get_tsf_offset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
 unsigned char card_get_pkt_type(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
-void CARDbRadioPowerOff(struct vnt_private *priv);
+void card_radio_power_off(struct vnt_private *priv);
 bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 		    u64 bss_timestamp);
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 2e2a8da571ab..210c94312310 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -454,7 +454,7 @@ static void device_init_registers(struct vnt_private *priv)
 	}
 
 	if (priv->hw_radio_off || priv->bRadioControlOff)
-		CARDbRadioPowerOff(priv);
+		card_radio_power_off(priv);
 
 	/* get Permanent network address */
 	SROMvReadEtherAddress(priv->port_offset, priv->abyCurrentNetAddr);
@@ -1349,7 +1349,7 @@ static void vnt_stop(struct ieee80211_hw *hw)
 
 	MACbShutdown(priv);
 	MACbSoftwareReset(priv);
-	CARDbRadioPowerOff(priv);
+	card_radio_power_off(priv);
 
 	device_free_td0_ring(priv);
 	device_free_td1_ring(priv);
@@ -1712,7 +1712,7 @@ static int vnt_init(struct vnt_private *priv)
 
 	priv->mac_hw = true;
 
-	CARDbRadioPowerOff(priv);
+	card_radio_power_off(priv);
 
 	return 0;
 }
-- 
2.34.1

