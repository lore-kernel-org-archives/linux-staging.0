Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBCB72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:37:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l38-20020a05600c1d2600b0030d80c3667aso1945670wms.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eui2f6xiYAJe7Go/+jIeHmtQh5FPkhPyZFMuoXCPPAU=;
        b=lYEH8PNC1nNFdMr0lNdlph0+qzNXFQwEWemaPl5UigmQIFzn/r2jABQ2kya4fs5HQ7
         YiDg7kQOxylBUkJqzrTXNlO4buLcsc5SNZZnQMRfVfeIc8IwaYGpE37OE4CjVGS+/qLG
         hQNdmdtkwwMu0CpSYofCCqa1xW1Z6nbgND0Keu/ylT5mvU8cDD60EkyNkYYJUWVYzXvu
         IIUUfyoUFavVK/lMy9WaizLr8MN63NWxTF8YGD/7ZrfCLPRQYWOVFCf2zE9+Z3fAZFlm
         QbTI6C5V2HvKFnGmmBpBjV5CaEqaxiXDcyBQyRFIJrz2W20VEJEXsSS7he9Ytc6A9CQ+
         vzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eui2f6xiYAJe7Go/+jIeHmtQh5FPkhPyZFMuoXCPPAU=;
        b=YJyQzChl9QC6mY9ysILtr3FejRuPPIeiSut/Xw4lQlX2JY1SAbLnN/TYNRd7szrj+L
         HHJ0XRr+1RZvK12wiQb+VjyKmDnIgUww2ADBfq38yqSF1bVqHHkxsX3JZP1ucCj8V22B
         /+gS3khqU6lN6fUqcdsMFNKHIu7xXoi3Er8TUXvPWEgIfpUl0WwSQyuj13xQFpn4WaOI
         lvF91abS2o4323tOHcIJwikguDeGhpcKSWHXC7DyN5e03goV2rgd0J/sz/m4+njgr1Tz
         j7++7P3PA8pUGiLXYUr0gtQSppKcoWccN//rDTyuCc/JyXHuE+I3V7amxuWriOpJnh6Z
         UUxw==
X-Gm-Message-State: AOAM532icSFBQJhIcV1Jts6WKHXGdelLvJUOL8jS9+ZTb5FvusYmeNf5
	F2yqrrNBVjbXSt36bIqIeeU=
X-Google-Smtp-Source: ABdhPJyKDRC+PEhSoUitlfKsltRa8lT737H0DlQHF6xtZLpwdaz0tVTUhU2ITlrqEqQcwyvX1eFcNw==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr12589021wmi.69.1634895474182;
        Fri, 22 Oct 2021 02:37:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id r15sm1643602wru.9.2021.10.22.02.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:37:53 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 4/5] staging: vt6655: Rename `uChannel` variable
Date: Fri, 22 Oct 2021 10:37:17 +0100
Message-Id: <09881aacf6b399e3bce2de658133553c78c5b1ab.1634826774.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1634826774.git.karolinadrobnik@gmail.com>
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop Hungarian notation in `uChannel` variable in
`RFvWriteWakeProgSyn` function. Change it to use snake case.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <uChannel>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 18 +++++++++---------
 drivers/staging/vt6655/rf.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index a30ffacf720a..0dd91b0433f6 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -670,14 +670,14 @@ bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType,
  * Parameters:
  *  In:
  *      iobase      - I/O base address
- *      uChannel    - channel number
+ *      channel     - channel number
  *      bySleepCnt  - SleepProgSyn count
  *
  * Return Value: None.
  *
  */
 bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
-			 u16 uChannel)
+			 u16 channel)
 {
 	void __iomem *iobase = priv->port_offset;
 	int i;
@@ -689,7 +689,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 	case RF_AIROHA:
 	case RF_AL2230S:
 
-		if (uChannel > CB_MAX_CHANNEL_24G)
+		if (channel > CB_MAX_CHANNEL_24G)
 			return false;
 
 		 /* Init Reg + Channel Reg (2) */
@@ -701,9 +701,9 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
 			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable0[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable1[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -714,7 +714,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
-		if (uChannel <= CB_MAX_CHANNEL_24G) {
+		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
 				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTable[i]);
 		} else {
@@ -722,11 +722,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTableAMode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable0[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable1[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable1[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable2[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index d499aed45c9f..d3f2b8dd6afc 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -60,7 +60,7 @@
 bool IFRFbWriteEmbedded(struct vnt_private *priv, unsigned long dwData);
 bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType, u16 byChannel);
 bool RFbInit(struct vnt_private *priv);
-bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType, u16 uChannel);
+bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType, u16 channel);
 bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16 uCH);
 bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 		    unsigned int rate);
-- 
2.30.2

