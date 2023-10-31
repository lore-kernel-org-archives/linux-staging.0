Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463DD507
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLj/DwT+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc0e78ec92so32328545ad.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730491; x=1699335291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p28HpRJ0uHM3u6HlKt1DCOmKGbpUgNk8pFmoEPtkATw=;
        b=KLj/DwT+F4E4TxoKe1lmnfU4U7G1K1oC7iVYjPF0pq/9CLCzRk2NjaLEAgm3FFtiV8
         dNehDecNyh/hvtOB4BX+ipKtsCcGelPYJvvgUNI5aE9lVbGCpADh2zzkoMnODzkiiVQ7
         +C2HBypwpzENX6WEefUtZ6P/yBUESR4/ZDz7CQws3lIoLGNE4RY1pW1e3M+9iIHC0HQ5
         iRdTxs5iD37ty/udo6jw8DEORL+E2ARSd0PupG8uPZcMY6G/boWwy68yvZ4a+tbJt+iI
         1SupkZpzDeoqi/hIzyC9UYOubwG3pQEqFLg5p6WfcH3jYclyOCSwxGICdkkSQHO7NbqY
         RJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730491; x=1699335291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p28HpRJ0uHM3u6HlKt1DCOmKGbpUgNk8pFmoEPtkATw=;
        b=rMqR7sGw7ig7wjJpdH/WEpek1A1XBvr+MfE/N81PQ5mLa5A+x/eFm+uM+jtHGw+385
         tcHwpAL8oQrYRHheLRZWRoh1pc2GLn11A3ic0Kc1qIGr8T9AWJCKICGrc+E+fp/e3jr+
         InkuTcXgMZVmOZLODK31D66fB3p7PBpU1gkO5uD/1/QiXh95M/MUB0ZaGmKFmyPoB2uw
         /QbOeLjnMvnjQvLSrZWbQeUE3XDysq2E1iLKHQNeP4yIAXsRHuhkjEigKEzvVyNZGLl7
         8Z6BA2bw75WjcPBic7SnYOdHsLw2poCFOGvq0WtcHxbW6UlKXQX7ktsVCok4JUt0tsBY
         8lZg==
X-Gm-Message-State: AOJu0YwaA4SVTyIAE2qz+rQZCqHyhY0yQpCRNBxMRgObnLVKZAfkyMs2
	IMI2kgV2LVqgByY1bCqMmgA=
X-Google-Smtp-Source: AGHT+IE1b72lCFy8rRt0QaqY4nBA1jDtfPcq+rCVkRoLUN6ke3E8xqHKFYnJb3c31TrlflWF0+FlNg==
X-Received: by 2002:a17:902:f34d:b0:1c9:d0a0:ee88 with SMTP id q13-20020a170902f34d00b001c9d0a0ee88mr7802008ple.62.1698730491447;
        Mon, 30 Oct 2023 22:34:51 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:51 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 05/11] staging: vt6655: Type encoding info dropped from variable name "wBeaconInterval"
Date: Tue, 31 Oct 2023 11:04:28 +0530
Message-Id: <a8aa6227fb8dadfdebb0a6ab74cff9730358c765.1698730318.git.opensource206@gmail.com>
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

variable name "wBeaconInterval" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c   | 26 +++++++++++++-------------
 drivers/staging/vt6655/card.h   |  8 ++++----
 drivers/staging/vt6655/device.h |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index bfd02a869d64..c18cbf0aad75 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -314,24 +314,24 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Parameters:
  *  In:
  *      priv         - The adapter to be set.
- *      wBeaconInterval - Beacon Interval
+ *      beacon_interval - Beacon Interval
  *  Out:
  *      none
  *
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short wBeaconInterval)
+			  unsigned short beacon_interval)
 {
 	u64 qwNextTBTT;
 
 	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
-	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
+	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, beacon_interval);
 
 	/* set HW beacon interval */
-	iowrite16(wBeaconInterval, priv->port_offset + MAC_REG_BI);
-	priv->wBeaconInterval = wBeaconInterval;
+	iowrite16(beacon_interval, priv->port_offset + MAC_REG_BI);
+	priv->beacon_interval = beacon_interval;
 	/* Set NextTBTT */
 	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
 	iowrite32((u32)qwNextTBTT, priv->port_offset + MAC_REG_NEXTTBTT);
@@ -764,11 +764,11 @@ u64 vt6655_get_current_tsf(struct vnt_private *priv)
  *
  * Return Value: TSF value of next Beacon
  */
-u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval)
+u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short beacon_interval)
 {
 	u32 beacon_int;
 
-	beacon_int = wBeaconInterval * 1024;
+	beacon_int = beacon_interval * 1024;
 	if (beacon_int) {
 		do_div(qwTSF, beacon_int);
 		qwTSF += 1;
@@ -785,21 +785,21 @@ u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval)
  * Parameters:
  *  In:
  *      iobase          - IO Base
- *      wBeaconInterval - Beacon Interval
+ *      beacon_interval - Beacon Interval
  *  Out:
  *      none
  *
  * Return Value: none
  */
 void CARDvSetFirstNextTBTT(struct vnt_private *priv,
-			   unsigned short wBeaconInterval)
+			   unsigned short beacon_interval)
 {
 	void __iomem *iobase = priv->port_offset;
 	u64 qwNextTBTT;
 
 	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
-	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
+	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, beacon_interval);
 	/* Set NextTBTT */
 	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
 	iowrite32((u32)qwNextTBTT, iobase + MAC_REG_NEXTTBTT);
@@ -815,18 +815,18 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
  *  In:
  *      priv         - The adapter to be set
  *      qwTSF           - Current TSF counter
- *      wBeaconInterval - Beacon Interval
+ *      beacon_interval - Beacon Interval
  *  Out:
  *      none
  *
  * Return Value: none
  */
 void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
-			 unsigned short wBeaconInterval)
+			 unsigned short beacon_interval)
 {
 	void __iomem *iobase = priv->port_offset;
 
-	qwTSF = CARDqGetNextTBTT(qwTSF, wBeaconInterval);
+	qwTSF = CARDqGetNextTBTT(qwTSF, beacon_interval);
 	/* Set NextTBTT */
 	qwTSF =  le64_to_cpu(qwTSF);
 	iowrite32((u32)qwTSF, iobase + MAC_REG_NEXTTBTT);
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index f84e4190a2ac..1758a95f3ab0 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -43,11 +43,11 @@ void card_set_rspinf(struct vnt_private *priv, u8 bb_type);
 void CARDvUpdateBasicTopRate(struct vnt_private *priv);
 bool CARDbIsOFDMinBasicRate(struct vnt_private *priv);
 void CARDvSetFirstNextTBTT(struct vnt_private *priv,
-			   unsigned short wBeaconInterval);
+			   unsigned short beacon_interval);
 void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
-			 unsigned short wBeaconInterval);
+			 unsigned short beacon_interval);
 u64 vt6655_get_current_tsf(struct vnt_private *priv);
-u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short wBeaconInterval);
+u64 CARDqGetNextTBTT(u64 qwTSF, unsigned short beacon_interval);
 u64 card_get_tsf_offset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
 unsigned char card_get_pkt_type(struct vnt_private *priv);
 void CARDvSafeResetTx(struct vnt_private *priv);
@@ -57,6 +57,6 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 		    u64 bss_timestamp);
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short wBeaconInterval);
+			  unsigned short beacon_interval);
 
 #endif /* __CARD_H__ */
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index d9ee0b7401fe..fadbfccf42de 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -281,7 +281,7 @@ struct vnt_private {
 
 	unsigned char abyEEPROM[EEP_MAX_CONTEXT_SIZE]; /* unsigned long alignment */
 
-	unsigned short wBeaconInterval;
+	unsigned short beacon_interval;
 	u16 wake_up_count;
 
 	struct work_struct interrupt_work;
-- 
2.34.1

