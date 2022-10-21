Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1867B;
	Fri, 21 Oct 2022 10:33:53 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id j23so3087917lji.8;
        Fri, 21 Oct 2022 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4maC1ewmpW31x1+/ZutwiTXSSsedpc4aQ1ME2Ogiqcg=;
        b=oXKd4wDB4DD/B7gLaHv7Sl4KmCGo/s7JNBHPkGWeTn1KXyppLpoDNeyh81FZ/S+KBP
         iHnLMTZfX8VFAlqzAqRCa+qdkQASbBnPF/BxeE7Axd/8k2/8QkRl5RmrE2seoIDqtyYS
         NkhUtf092/lbBTYj1NbLpvEjvtuBgm/MtFqxJsr2jbesiph08v7Glk/k4bqludHQPoGC
         6yrTdWsSohuuwLSzGFaw7V8UDNhl2DQbIAR6p86fnmmQgk3PcbNARsUdnWp3BvxJU7gP
         u9UDbwEGnzikWQg/QLSEN7GdlzlXFTAr6ranmxWm1ElSdAuK0cEEqIZucl9IuMNs2q13
         /kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4maC1ewmpW31x1+/ZutwiTXSSsedpc4aQ1ME2Ogiqcg=;
        b=lIUz6NBfUt4+FxgAM1tR3xs8csj0f/93nPJiKG2+DXghP+46uT7qxUcBJdb2YiOER9
         f4z0Ajh7xX7rzLZ42W4NXgkrx24BFqFgyIJNFvh7zGz5wJX7+zl3HfbwHp10ixnznfBu
         bTNNvzDFoUbhc57xqdy1L9BbSfzpspg6Hb4b3DncZRJG8yi8qFI5CRLPV+K+ko9V8KQM
         rw5ygLLMY0YBirhiEKX8+EEUT2JuCrsvqgkbt4A6knHFmUC5KjspRVwcgpjg8kIb3Xph
         yJfjq1MeOzUjiSzCdPsRH2vZpxRpCSj4nFZCjI1FSJveMiaFK9Vo6brFTG0h5M2jZbBP
         DZ6A==
X-Gm-Message-State: ACrzQf1pp9k0wEDloTaKRQc0xU4JQpuTXqo/mR+u+RFNbS1S8yO5oUJb
	V4aPdeeTMjAtc2kLz/lYyZ1zMFiMbdLHruV8
X-Google-Smtp-Source: AMsMyM7tyMGhsnti5re4I6goAYWh+zTKgi7x8tPhewD5vJDAWHiTUUClRaEByQxniJVU8Bs00LR/cQ==
X-Received: by 2002:a2e:4c12:0:b0:26e:8e13:9378 with SMTP id z18-20020a2e4c12000000b0026e8e139378mr6358920lja.336.1666348431661;
        Fri, 21 Oct 2022 03:33:51 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id u12-20020ac258cc000000b00492d7a7b4e3sm3119775lfo.4.2022.10.21.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:33:51 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v2 1/6] staging: vt6655: fix lines ending in a '('
Date: Fri, 21 Oct 2022 10:33:05 +0000
Message-Id: <46a2791fc89f4dc299162418ab304ab821e494fa.1666347511.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666347511.git.tanjubrunostar0@gmail.com>
References: <cover.1666347511.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix serveral checkpatch errors related to lines ending with a '(' by
refactoring the code lines

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 149 ++++++++++++++--------------------
 1 file changed, 63 insertions(+), 86 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1e5036121665..f9d0b00d7cff 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -141,13 +141,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
  */
 static
 unsigned int
-s_uGetTxRsvTime(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	unsigned int cbFrameLength,
-	unsigned short wRate,
-	bool bNeedAck
-)
+s_uGetTxRsvTime(struct vnt_private *pDevice,
+		unsigned char byPktType,
+		unsigned int cbFrameLength,
+		unsigned short wRate,
+		bool bNeedAck)
 {
 	unsigned int uDataTime, uAckTime;
 
@@ -215,19 +213,16 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
 
 /* byFreqType 0: 5GHz, 1:2.4Ghz */
 static
-unsigned int
-s_uGetDataDuration(
-	struct vnt_private *pDevice,
-	unsigned char byDurType,
-	unsigned int cbFrameLength,
-	unsigned char byPktType,
-	unsigned short wRate,
-	bool bNeedAck,
-	unsigned int uFragIdx,
-	unsigned int cbLastFragmentSize,
-	unsigned int uMACfragNum,
-	unsigned char byFBOption
-)
+unsigned int s_uGetDataDuration(struct vnt_private *pDevice,
+				unsigned char byDurType,
+				unsigned int cbFrameLength,
+				unsigned char byPktType,
+				unsigned short wRate,
+				bool bNeedAck,
+				unsigned int uFragIdx,
+				unsigned int cbLastFragmentSize,
+				unsigned int uMACfragNum,
+				unsigned char byFBOption)
 {
 	bool bLastFrag = false;
 	unsigned int uAckTime = 0, uNextPktTime = 0, len;
@@ -316,17 +311,13 @@ s_uGetDataDuration(
 }
 
 /* byFreqType: 0=>5GHZ 1=>2.4GHZ */
-static
-__le16
-s_uGetRTSCTSDuration(
-	struct vnt_private *pDevice,
-	unsigned char byDurType,
-	unsigned int cbFrameLength,
-	unsigned char byPktType,
-	unsigned short wRate,
-	bool bNeedAck,
-	unsigned char byFBOption
-)
+static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
+				   unsigned char byDurType,
+				   unsigned int cbFrameLength,
+				   unsigned char byPktType,
+				   unsigned short wRate,
+				   bool bNeedAck,
+				   unsigned char byFBOption)
 {
 	unsigned int uCTSTime = 0, uDurTime = 0;
 
@@ -409,22 +400,18 @@ s_uGetRTSCTSDuration(
 	return cpu_to_le16((u16)uDurTime);
 }
 
-static
-__le16
-s_uFillDataHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pTxDataHead,
-	unsigned int cbFrameLength,
-	unsigned int uDMAIdx,
-	bool bNeedAck,
-	unsigned int uFragIdx,
-	unsigned int cbLastFragmentSize,
-	unsigned int uMACfragNum,
-	unsigned char byFBOption,
-	unsigned short wCurrentRate,
-	bool is_pspoll
-)
+static __le16 s_uFillDataHead(struct vnt_private *pDevice,
+			      unsigned char byPktType,
+			      void *pTxDataHead,
+			      unsigned int cbFrameLength,
+			      unsigned int uDMAIdx,
+			      bool bNeedAck,
+			      unsigned int uFragIdx,
+			      unsigned int cbLastFragmentSize,
+			      unsigned int uMACfragNum,
+			      unsigned char byFBOption,
+			      unsigned short wCurrentRate,
+			      bool is_pspoll)
 {
 	struct vnt_tx_datahead_ab *buf = pTxDataHead;
 
@@ -555,19 +542,15 @@ s_uFillDataHead(
 	return buf->duration;
 }
 
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void s_vFillRTSHead(struct vnt_private *pDevice,
+			   unsigned char byPktType,
+			   void *pvRTS,
+			   unsigned int cbFrameLength,
+			   bool bNeedAck,
+			   bool bDisCRC,
+			   struct ieee80211_hdr *hdr,
+			   unsigned short wCurrentRate,
+			   unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
@@ -752,17 +735,15 @@ s_vFillRTSHead(
 
 static
 void
-s_vFillCTSHead(
-	struct vnt_private *pDevice,
-	unsigned int uDMAIdx,
-	unsigned char byPktType,
-	void *pvCTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+s_vFillCTSHead(struct vnt_private *pDevice,
+	       unsigned int uDMAIdx,
+	       unsigned char byPktType,
+	       void *pvCTS,
+	       unsigned int cbFrameLength,
+	       bool bNeedAck,
+	       bool bDisCRC,
+	       unsigned short wCurrentRate,
+	       unsigned char byFBOption)
 {
 	unsigned int uCTSFrameLen = 14;
 
@@ -868,21 +849,17 @@ s_vFillCTSHead(
  -
  * unsigned int cbFrameSize, Hdr+Payload+FCS
  */
-static
-void
-s_vGenerateTxParameter(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	struct vnt_tx_fifo_head *tx_buffer_head,
-	void *pvRrvTime,
-	void *pvRTS,
-	void *pvCTS,
-	unsigned int cbFrameSize,
-	bool bNeedACK,
-	unsigned int uDMAIdx,
-	void *psEthHeader,
-	unsigned short wCurrentRate
-)
+static void s_vGenerateTxParameter(struct vnt_private *pDevice,
+				   unsigned char byPktType,
+				   struct vnt_tx_fifo_head *tx_buffer_head,
+				   void *pvRrvTime,
+				   void *pvRTS,
+				   void *pvCTS,
+				   unsigned int cbFrameSize,
+				   bool bNeedACK,
+				   unsigned int uDMAIdx,
+				   void *psEthHeader,
+				   unsigned short wCurrentRate)
 {
 	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
 	bool bDisCRC = false;
-- 
2.34.1

