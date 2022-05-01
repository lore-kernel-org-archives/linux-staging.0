Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E612C9E
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 20:25:45 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id i19so24486945eja.11
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 13:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BIvoiMNV2suMEQS65MP5bpJiVeZk0XLREaqe1qAhSxU=;
        b=gyzFpCRv/U6BNSYqzAmCRmCXWJU6HqVl/ku7gQ61xyhMJsArJx68IDOG31jkezrlos
         1R/jwbqbLWMw7I6d75FW1q5rcXnDuQso+Ei3JisvY3j7Wslf/xLHy4wGSFsP9cNMxLTK
         oPSz030zyXEmhcDe3m4MOM2yqTQPXpcQVPyRwfvPZYz8g9dOg3+1zLHCr3pQITztg5cZ
         qG77J0GKonbJWBTxi7vJ+MUqLjG114PwsYF5ZumdP83N73xnkPI6/AO7SWUg5I+UPgx3
         MyOZx14ori+Si0YY4+j1jNUTOBeeHJ8RByp7TNVeO/27XYHSi5gWyh12npjf+aGgdyHE
         Zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BIvoiMNV2suMEQS65MP5bpJiVeZk0XLREaqe1qAhSxU=;
        b=ve7BpqcIVTFR5Wx7I9VuAt0SyT4fTkrf1/tMzrtkIz844RTULiEj8rw8i99YJfZV7B
         wtqqML2pN1Grs4zIO1SDqDtty8edmuBHzyKM/sjBRBPDVK5ikmcdI876IniCZxjiYko6
         oppzOMRaXNZDz5qdd9ynZIGEF4tim3vSdrTCZaxVDkEDVLdlIyilKGrCxI2tvcChnozh
         lkfMqTJWikHESg0vjCw+6EAHsHpe+9zFEYEU/I9lvFSjnHPECL2TwiOVPrd/gwgn8IS6
         wKJOgf/KDCh4utofG/akZnB6jnTbvbmDQ8U4L265apBdTwJx/LB3WGAC4bxgz1y/KyWr
         W2ZA==
X-Gm-Message-State: AOAM532/D2Q5epGAIdpdbDapJRHoQn41lssWU3MXs9r8UanqCTrfUrtB
	1d7j0qCQv+kR+Tuw5gvDp2A=
X-Google-Smtp-Source: ABdhPJwQ4YAhxPfsb4bkGuMLmzKYYXZmbLqsnhQuJiuw1zmdbo5kMZZSOTBa/RxC1eR570ihEAwpHA==
X-Received: by 2002:a17:906:5d08:b0:6da:b4ea:937 with SMTP id g8-20020a1709065d0800b006dab4ea0937mr8849505ejt.446.1651436743984;
        Sun, 01 May 2022 13:25:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id gx10-20020a1709068a4a00b006f3ef214e6bsm2829254ejc.209.2022.05.01.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 13:25:43 -0700 (PDT)
Date: Sun, 1 May 2022 22:25:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging vt6655: Replace unused return value of
 vt6655_get_current_tsf
Message-ID: <62c83d78627196ec0ce2f5a562cb080a1c87a05a.1651435890.git.philipp.g.hortmann@gmail.com>
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

Replace unused return value with u64 to increase readability,
reduce address and dereference operators and omit pqwCurrTSF that
uses CamelCase which is not accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Updated this patch from changes of previous ones
          Updated below test

Code for testing:
void CARDvSetFirstNextTBTT(struct vnt_private *priv,
			   unsigned short wBeaconInterval)
	...
	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
	dev_info(&priv->pcid->dev, "CARDvSetFirstNextTBTT 0x%016llx", qwNextTBTT);

bool CARDbSetBeaconPeriod(struct vnt_private *priv,
			  unsigned short wBeaconInterval)
	...
	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
	dev_info(&priv->pcid->dev, "CARDbSetBeaconPeriod  0x%016llx", qwNextTBTT);

Log of the microsecond counter:
vt6655 0000:01:05.0: CARDbSetBeaconPeriod  0x00 00 00 04 65 9f 75 d8
vt6655 0000:01:05.0: CARDvSetFirstNextTBTT 0x00 00 00 04 65 9f 75 e4
---
 drivers/staging/vt6655/card.c        | 18 ++++++++----------
 drivers/staging/vt6655/card.h        |  2 +-
 drivers/staging/vt6655/device_main.c |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c8372701bf43..d3c47b37ad3b 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -288,7 +288,7 @@ bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
 	u64 local_tsf;
 	u64 qwTSFOffset = 0;
 
-	vt6655_get_current_tsf(priv, &local_tsf);
+	local_tsf = vt6655_get_current_tsf(priv);
 
 	if (qwBSSTimestamp != local_tsf) {
 		qwTSFOffset = CARDqGetTSFOffset(byRxRate, qwBSSTimestamp,
@@ -320,9 +320,9 @@ bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
 bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 			  unsigned short wBeaconInterval)
 {
-	u64 qwNextTBTT = 0;
+	u64 qwNextTBTT;
 
-	vt6655_get_current_tsf(priv, &qwNextTBTT); /* Get Local TSF counter */
+	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
 	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
 
@@ -739,7 +739,7 @@ u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2)
  *
  * Return Value: true if success; otherwise false
  */
-bool vt6655_get_current_tsf(struct vnt_private *priv, u64 *pqwCurrTSF)
+u64 vt6655_get_current_tsf(struct vnt_private *priv)
 {
 	void __iomem *iobase = priv->port_offset;
 	unsigned short ww;
@@ -753,12 +753,10 @@ bool vt6655_get_current_tsf(struct vnt_private *priv, u64 *pqwCurrTSF)
 			break;
 	}
 	if (ww == W_MAX_TIMEOUT)
-		return false;
+		return 0;
 	low = ioread32(iobase + MAC_REG_TSFCNTR);
 	high = ioread32(iobase + MAC_REG_TSFCNTR + 4);
-	*pqwCurrTSF = le64_to_cpu(low + ((u64)high << 32));
-
-	return true;
+	return le64_to_cpu(low + ((u64)high << 32));
 }
 
 /*
@@ -805,9 +803,9 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 			   unsigned short wBeaconInterval)
 {
 	void __iomem *iobase = priv->port_offset;
-	u64 qwNextTBTT = 0;
+	u64 qwNextTBTT;
 
-	vt6655_get_current_tsf(priv, &qwNextTBTT); /* Get Local TSF counter */
+	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
 	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
 	/* Set NextTBTT */
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 340516b329e3..22dc359a6565 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -46,7 +46,7 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 			   unsigned short wBeaconInterval);
 void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 			 unsigned short wBeaconInterval);
-bool vt6655_get_current_tsf(struct vnt_private *priv, u64 *pqwCurrTSF);
+u64 vt6655_get_current_tsf(struct vnt_private *priv);
 u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval);
 u64 CARDqGetTSFOffset(unsigned char byRxRate, u64 qwTSF1, u64 qwTSF2);
 unsigned char CARDbyGetPktType(struct vnt_private *priv);
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index bb8a30eefc74..4f26f5c7e84f 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1603,7 +1603,7 @@ static u64 vnt_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	struct vnt_private *priv = hw->priv;
 	u64 tsf;
 
-	vt6655_get_current_tsf(priv, &tsf);
+	tsf = vt6655_get_current_tsf(priv);
 
 	return tsf;
 }
-- 
2.25.1

