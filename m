Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390D7ED;
	Mon, 24 Oct 2022 10:02:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id b8so5373828ljf.0;
        Mon, 24 Oct 2022 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iA9FQCCsPWBm44+xNI1z9eJC+PJ5gHzpB5ZmyGrAxc=;
        b=XDBNBbxdKWh0EVFDGI5K4frRn+oGJcAKRXe+TScQcSof4fGle1DMbjSpUYRu7LSGCZ
         63rq4+i+m6rqoTJYliOCDdzZmevlvMHxImfH1AcMSONia1mY3VwYaYeB5lll1hhI1tT6
         EbY4KTU7MORtTX/t1+Vt66nhDcuJivo7MfRsz2m6qKyty8wNhB0HuLAG+tgIQo6V6nvc
         KBS7gGHbhh3T71ByTmIDqnd0vbFBRY53RkdEnu53eqOj7nCkv2ad7aLbRjQKMeQB/qiz
         BNcPe3NMpwfA/OMx04+WWQAbAvLZx7fGwEHRGjz3UUUoJk5EPDu5HOv0Tg5JDorwb41k
         PG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iA9FQCCsPWBm44+xNI1z9eJC+PJ5gHzpB5ZmyGrAxc=;
        b=OaU5/x0MwqBMpOevHgLxyyerj4ry0ZUnqnO5DawkNbYDZg8WFWeDQBhX/zc+BSyByD
         PRglpJat8+zNsli2ewhKJFPfIQKyczJDw9fU4jLO6AXWLAvQ6scmPyG8aToulxkWUmry
         HmYbCn5fc4l9YFjGHNMIe5lq/NCvzrAZnEtptKoFIVMjBp848+vZSWd2zIqfiT8YguHJ
         rOwxYmL/uBEWUEbGeDlMUQTGNrK0VH2gtbBGL08cgpbNydL1dzYjZe/mcyd1QFhBJfcM
         DsZt1VjbRuD+gNAbGchWzkOadhRmQCy67lRdpbQJuETHG8KpK0Cs/7DZBYlLDrkhFDbR
         MyBQ==
X-Gm-Message-State: ACrzQf1JwmFLVTF0e5oYtFTKG5fNwMguHhT9s5Lsq2xtGqMqZ1cIEIo4
	iZdocOltqB6TFp8v0A2N4Xw=
X-Google-Smtp-Source: AMsMyM7mQyoGwYaC2Td8eGoZAZ97Y8w/TgD49TekIG8hHPeX3xUIslyytmp0BynLNx9PQIbC5x/o1A==
X-Received: by 2002:a2e:924a:0:b0:26e:4cbf:544a with SMTP id v10-20020a2e924a000000b0026e4cbf544amr12468463ljg.471.1666605726954;
        Mon, 24 Oct 2022 03:02:06 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s9-20020a2eb629000000b0026dfbdfc1ddsm4896832ljn.11.2022.10.24.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 03:02:06 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v4 1/6] staging: vt6655: fix lines ending in a '('
Date: Mon, 24 Oct 2022 10:01:47 +0000
Message-Id: <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666605225.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666605225.git.tanjubrunostar0@gmail.com>
References: <cover.1666605225.git.tanjubrunostar0@gmail.com>
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

