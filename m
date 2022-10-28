Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD181C37;
	Fri, 28 Oct 2022 06:39:53 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id u11so7160051ljk.6;
        Thu, 27 Oct 2022 23:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27pePNIj19CQbJnYskEFw7IGPoxaQe9Wni6AF7YBIV8=;
        b=c1KzihwCC9EspRvZADyV2umuUDdsoX+mAr1CwubEXK4phpzgEht4xdyCNMHC8NJC13
         Y9c4b4WuwgkkSufo9HY7wZxQbl2Odevke2cyHQiMjeevsRpLCBuUHbuO3mFG2hIpwVSR
         d+3/2JEOQr8GVoACiEB9BpL4YcWcCidp+MjSMnhwLkR3OOn3/6MrP0T4YDvV83cblcQ+
         ih/i2b0NEYpbdr0cGbIzCnqfzbS9DeYoPSpq0N/aHcOOS6Onk31eNlRiVC+EQoxP4a/j
         1SvQADwgtlKevsNDILLG5mDUokcMQ9Ok6JVinfXgYVkyI3/8dUGxcT1rESFAyd7VesQu
         /Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27pePNIj19CQbJnYskEFw7IGPoxaQe9Wni6AF7YBIV8=;
        b=jYGWBWuGEmZ0hwEBlHOQJYa+I7OyMg+JN1GuGWVg+bRIYFtqZ4DLNsEzbKaPwez+zu
         JV2QRUbMJ9iRlqe2P8ycQlbtJK69AEafspT8gxzAN71838nGz82eXqIIsxXaPg29vqtO
         UI8b3mUqk8T4yXCnSrk8OCvRuMo5hXbhIoRVW5aH4pY54hZzpWD7tlv6cQuCemwprBwG
         dWG15gE/9WU543AmUGBzJTHJRrhSirGRXKNHaBvnfJHgNX8oRfB3Fo+XbtLF9hAPXoqV
         2+9DNl9PL71MShBecPIUsAHxEFIUb9hU/B8XWXcBTh5gVfl1XOmYkmg+h2o/38barl2z
         tQvw==
X-Gm-Message-State: ACrzQf3q+0M4mYrDjKyq7qZ/ofV0XK+Agb54VyMMDMAup7XvfX8eXq9B
	sUg6RLgL08j+0W6pn1Pj2N0=
X-Google-Smtp-Source: AMsMyM7fImXcCFKVsaxICEM+2wTgP5jvmwEWgMz0gMD1Tgo6MGBiA/3rKJ97tmBrzx56XzzSLJem7Q==
X-Received: by 2002:a2e:7005:0:b0:277:1cfb:95c6 with SMTP id l5-20020a2e7005000000b002771cfb95c6mr6116242ljc.146.1666939191597;
        Thu, 27 Oct 2022 23:39:51 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id t7-20020a05651c204700b0026dced9840dsm498509ljo.61.2022.10.27.23.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 23:39:51 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v7 1/6] staging: vt6655: fix lines of code ending in a '('
Date: Fri, 28 Oct 2022 06:39:24 +0000
Message-ID: <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666849707.git.tanjubrunostar0@gmail.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20221028063924.AYLcsI45gm4T8vAYiMj6ASWE1fWGp_BRBg_8xbuFjMo@z>

fix several checkpatch errors related to lines ending with a '(' by
joining splitted lines of code and indenting properly to increase
visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 165 ++++++++++++++--------------------
 1 file changed, 69 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1e5036121665..7eb7c6eb5cf0 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -139,15 +139,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
  * PK_TYPE_11GB    2
  * PK_TYPE_11GA    3
  */
-static
-unsigned int
-s_uGetTxRsvTime(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	unsigned int cbFrameLength,
-	unsigned short wRate,
-	bool bNeedAck
-)
+static unsigned int s_uGetTxRsvTime(struct vnt_private *pDevice,
+				    unsigned char byPktType,
+				    unsigned int cbFrameLength,
+				    unsigned short wRate,
+				    bool bNeedAck)
 {
 	unsigned int uDataTime, uAckTime;
 
@@ -214,20 +210,16 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
 }
 
 /* byFreqType 0: 5GHz, 1:2.4Ghz */
-static
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
+static unsigned int s_uGetDataDuration(struct vnt_private *pDevice,
+				       unsigned char byDurType,
+				       unsigned int cbFrameLength,
+				       unsigned char byPktType,
+				       unsigned short wRate,
+				       bool bNeedAck,
+				       unsigned int uFragIdx,
+				       unsigned int cbLastFragmentSize,
+				       unsigned int uMACfragNum,
+				       unsigned char byFBOption)
 {
 	bool bLastFrag = false;
 	unsigned int uAckTime = 0, uNextPktTime = 0, len;
@@ -316,17 +308,13 @@ s_uGetDataDuration(
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
 
@@ -409,22 +397,18 @@ s_uGetRTSCTSDuration(
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
 
@@ -555,19 +539,15 @@ s_uFillDataHead(
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
 
@@ -750,19 +730,15 @@ s_vFillRTSHead(
 	}
 }
 
-static
-void
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
+static void s_vFillCTSHead(struct vnt_private *pDevice,
+			   unsigned int uDMAIdx,
+			   unsigned char byPktType,
+			   void *pvCTS,
+			   unsigned int cbFrameLength,
+			   bool bNeedAck,
+			   bool bDisCRC,
+			   unsigned short wCurrentRate,
+			   unsigned char byFBOption)
 {
 	unsigned int uCTSFrameLen = 14;
 
@@ -868,21 +844,17 @@ s_vFillCTSHead(
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
@@ -954,11 +926,12 @@ s_vGenerateTxParameter(
 	}
 }
 
-static unsigned int
-s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
-		  unsigned char *pbyTxBufferAddr,
-		  unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
-		  unsigned int is_pspoll)
+static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
+				      unsigned char byPktType,
+				      unsigned char *pbyTxBufferAddr,
+				      unsigned int uDMAIdx,
+				      struct vnt_tx_desc *pHeadTD,
+				      unsigned int is_pspoll)
 {
 	struct vnt_td_info *td_info = pHeadTD->td_info;
 	struct sk_buff *skb = td_info->skb;
-- 
2.34.1

