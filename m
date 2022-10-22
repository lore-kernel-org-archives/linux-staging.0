Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD237C;
	Sat, 22 Oct 2022 07:06:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id g7so8741114lfv.5;
        Sat, 22 Oct 2022 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4maC1ewmpW31x1+/ZutwiTXSSsedpc4aQ1ME2Ogiqcg=;
        b=jjxDV72HaiWcEUJCW06k9mJBVN5H6X/Aths+c3EBdFIBlrt3Bf+FfS4Z1/12AfQUZy
         Ap30xeYUHVL8jHCGmoUNnEDePlLL+FojmVbXpCM3sFtA6pH6j5yIZ0sV9TXI5UkkvvEB
         64eVqysV9GN9eTJUEN4HAxEXlga+5dAmITIV3XBbLUP9/QYpXMgvIin0MHjtCOaLoZ3z
         VUHPFt9MiEy4JufBg9JmqN04ao5/u0K1edtoE7mrBNpqOVPCG0Fdhb6Mbh3TXEAn1vMm
         +e9dEFlGoU/HYyFiLFQesma90kTI9qf8vOc0UArXfQcJnHWuXxcDYV2wyiCq4jJcyXqy
         TAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4maC1ewmpW31x1+/ZutwiTXSSsedpc4aQ1ME2Ogiqcg=;
        b=8AToHr2u9VgsK9vZaEyOV/o9xbGmnShf6MKf6Afc5Gu3IrGvDBVHXrfL9xw91EAGEr
         JMOeVGd98VVFwMUdG84KQ/V5oEDRgCSHxxOaz/CiFFVo7hKz6IXenvQ91lGUbJ71ONLg
         jr21WQ+WJxRj/1Sj+sgpsMdvfoN+j/UBhSdiftq4UU6JrWIKUvhVVjyxEneR510M4VOV
         VAXA8GIfyK9vy4QrBfGJbRIDYCFeiuL8c8Y4ysgEchmPH9L7/tR49HYd/th7KgekiQJd
         kKxuu5MB5cmdD8psz7/r6g+Vw1ZcEO0c3usVAi7OZGtVXi7iuEO41hICfQhgl4oix3o+
         GinA==
X-Gm-Message-State: ACrzQf0Qv/rrAVbgDVKr3FtyxOjZ02mHl8gZsbmn65c6QTGX5lsJan/T
	u7dcrc8uPmAqR2QX+g5chVJgsnPk6Bo59/4r
X-Google-Smtp-Source: AMsMyM6dBV4osBfec7LziKg54FEX6hrZcnfpZDYeW13Gbs0USaCoakMtOybJOnJI2MZ/mXb8d0ER5A==
X-Received: by 2002:ac2:47e1:0:b0:4a2:40e5:781a with SMTP id b1-20020ac247e1000000b004a240e5781amr7805580lfp.335.1666422393414;
        Sat, 22 Oct 2022 00:06:33 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s5-20020a2e1505000000b00276d2537921sm390404ljd.59.2022.10.22.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 00:06:33 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 1/6] staging: vt6655: fix lines ending in a '('
Date: Sat, 22 Oct 2022 07:06:07 +0000
Message-Id: <20221022070612.13009-2-tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
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

