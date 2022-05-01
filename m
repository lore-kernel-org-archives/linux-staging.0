Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069C2C9E
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 20:25:39 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id i27so24528402ejd.9
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=otSZ1vNlbZZnefxXua2kl3gSYjKRO6kJyYuaC3ipspw=;
        b=JTO0wQlOqJpwRmwKi3r4/4pBPbTm0NQUtwE52bMaok+qwz6S+6KLrWp7lxu5BwzWid
         CUr6Vc24Lt0lypOrlaI1OsAENaJR9XLUXfi5M1bnuXAziTaLAM/I7bkdlvk2QBiroUlM
         JpMp4dok4VettjoBOsNIZKXFdw4+XLNvcOby38VO9atZ+lFSfO1kHCwjLHTBZBUK/Y6U
         k+vw1YBI3rsCP8ViybvKVskU2FB5K8CX92UNKn/3fwa4hfaSL1tqYUBrQe/XGDXNE+Iz
         zvA9TOBpeNDWaWPD+3kyOJVmsTdkahtFJhZdLNH1bsAaHrqHeVIlhHDui+J+K4aL6Rt6
         +XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=otSZ1vNlbZZnefxXua2kl3gSYjKRO6kJyYuaC3ipspw=;
        b=NxpsnucLmRkxJzAdhKCkcxhLe0zVJub+N5WhPLXI7jxSZrCwW8mVA+0e7t+VldIeuz
         +1b1mLE6Wz65sbtPAPAJlSHo0mP05UC6u/j+T5u8/dlSg7halbEDHK5Tuek6p5Dftdw/
         zV1Fw4H9LKKzBYGAKsHlaQFh9at4bgKhNaVUG6BJhApasjMptXIozGsDYKSORHX8yjQ2
         lM59URAZvqm2FGNIPJ3DLXOVAjBil5Mxezocc5fIUMq1B32KxBvXqooLq0Vh9mifanej
         cZ+EcwwIiq3FVzVCUL2R3pOxy8MZ6Ozlm3DtV1T8Chca45/x2dbxiI7/W/H8r6guC07j
         J3PA==
X-Gm-Message-State: AOAM530loTihzf6bdoGtx25durGPzx6VyV5VMgEdf3F1bMi5sb0mPwpU
	0Felmy9wK+auQXZqbsmVrizlpte6GABrdA==
X-Google-Smtp-Source: ABdhPJyGIwncKgiS8FLl6mJ6K3tCH+7dtaGJ9w1yvlBORuHE3OQTwl4Zt62pJpGCol2+7Pu3e1DADg==
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id hd15-20020a170907968f00b006dba3c5ae3emr8898304ejc.770.1651436738031;
        Sun, 01 May 2022 13:25:38 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id gz25-20020a170907a05900b006f3ef214e63sm2896059ejc.201.2022.05.01.13.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 13:25:37 -0700 (PDT)
Date: Sun, 1 May 2022 22:25:35 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: vt6655: Rename function CARDbGetCurrentTSF
Message-ID: <2b92db8d67e8dd1fc85b45efe3b32d2199371190.1651435890.git.philipp.g.hortmann@gmail.com>
References: <cover.1651435890.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651435890.git.philipp.g.hortmann@gmail.com>

The name of the function uses CamelCase which
is not accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> v2: Changed function name to include driver name
---
 drivers/staging/vt6655/card.c        | 10 +++++-----
 drivers/staging/vt6655/card.h        |  2 +-
 drivers/staging/vt6655/device_main.c |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 431890e6b8d2..c8372701bf43 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -11,7 +11,7 @@
  *      CARDbAddBasicRate - Add to BasicRateSet
  *      CARDbIsOFDMinBasicRate - Check if any OFDM rate is in BasicRateSet
  *      CARDqGetTSFOffset - Calculate TSFOffset
- *      CARDbGetCurrentTSF - Read Current NIC TSF counter
+ *      vt6655_get_current_tsf - Read Current NIC TSF counter
  *      CARDqGetNextTBTT - Calculate Next Beacon TSF counter
  *      CARDvSetFirstNextTBTT - Set NIC Beacon time
  *      CARDvUpdateNextTBTT - Sync. NIC Beacon time
@@ -288,7 +288,7 @@ bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
 	u64 local_tsf;
 	u64 qwTSFOffset = 0;
 
-	CARDbGetCurrentTSF(priv, &local_tsf);
+	vt6655_get_current_tsf(priv, &local_tsf);
 
 	if (qwBSSTimestamp != local_tsf) {
 		qwTSFOffset = CARDqGetTSFOffset(byRxRate, qwBSSTimestamp,
@@ -322,7 +322,7 @@ bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 {
 	u64 qwNextTBTT = 0;
 
-	CARDbGetCurrentTSF(priv, &qwNextTBTT); /* Get Local TSF counter */
+	vt6655_get_current_tsf(priv, &qwNextTBTT); /* Get Local TSF counter */
 
 	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
 
@@ -739,7 +739,7 @@ u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2)
  *
  * Return Value: true if success; otherwise false
  */
-bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
+bool vt6655_get_current_tsf(struct vnt_private *priv, u64 *pqwCurrTSF)
 {
 	void __iomem *iobase = priv->port_offset;
 	unsigned short ww;
@@ -807,7 +807,7 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 	void __iomem *iobase = priv->port_offset;
 	u64 qwNextTBTT = 0;
 
-	CARDbGetCurrentTSF(priv, &qwNextTBTT); /* Get Local TSF counter */
+	vt6655_get_current_tsf(priv, &qwNextTBTT); /* Get Local TSF counter */
 
 	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
 	/* Set NextTBTT */
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 09e7f3f1cbed..340516b329e3 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -46,7 +46,7 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 			   unsigned short wBeaconInterval);
 void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 			 unsigned short wBeaconInterval);
-bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF);
+bool vt6655_get_current_tsf(struct vnt_private *priv, u64 *pqwCurrTSF);
 u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval);
 u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2);
 unsigned char CARDbyGetPktType(struct vnt_private *priv);
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 12fd825c23fe..bb8a30eefc74 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1603,7 +1603,7 @@ static u64 vnt_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	struct vnt_private *priv = hw->priv;
 	u64 tsf;
 
-	CARDbGetCurrentTSF(priv, &tsf);
+	vt6655_get_current_tsf(priv, &tsf);
 
 	return tsf;
 }
-- 
2.25.1

