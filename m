Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF85CA3;
	Thu, 20 Oct 2022 18:29:37 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b18so431608ljr.13;
        Thu, 20 Oct 2022 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4maC1ewmpW31x1+/ZutwiTXSSsedpc4aQ1ME2Ogiqcg=;
        b=FtxqJzLcXR1FeOlPf31YZrXtpSELfV5HY8UxhQLD+IFg9R7+253X+DwOTXu1QbcLKO
         67zNMbCDnboKIimUUOZJIuhs2589aPmTbbkHjQ5MM7eTQjsT8ffuHeLN4h/AHh45dFQl
         /SQIdkchNXSpG7c1f0uv6wPy3Iq7taKXoNw301HRRXe4YpxqlKjvVQggBCokxUshVuj/
         4uVwWo2whzcv2CLp+URaqMPG+Mzwb0owY5AhTXkL6aBYQzByL66d8y2eN8zBbFwKF9tA
         RTZM1W7U7nc1j4Mz8vTOsUI75KG9gdfxrOJFzCZLPs4R0TyAvuNsPFiH9cZKOP86J/Vd
         JXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4maC1ewmpW31x1+/ZutwiTXSSsedpc4aQ1ME2Ogiqcg=;
        b=55TRXVQ7V7OjUY+U0sxME48OrSjlum+3QbIoCMpsrwJf1QGZp0pf4owNxTIdRWEZJg
         Mqau4gRQsNNL958pq5tD+Ld3QiGH75nCTWEK4r0/K76Id2cnaaxJbhy/cY/W7gjCR3Gu
         LTUUrUC7IaMlifIWkP+B1s/qkVzh0/FJsLzGES0uzzKbGfUBlGoG9Ec7Pb4WaVRY1zo2
         VxqQ3bevFCAIG5MYuquCq6tvOWsd3VHzOcVQ1+Vbkhmd4ugY61h3hu5y8CZTxxd6noYW
         YchDruK4kBYKsH0JBYF4tBAKcCOJ5mM+PLNnyB6KZ3mg/m5IoM+nWMT81jMtfOJqF1SL
         rsCQ==
X-Gm-Message-State: ACrzQf23sMKtK0M6r87ORxAxhS8bztBGSUbHLRI0KV1vTxpHG9vtEYI/
	xXwesxI3pVzQeBVBk2/AFII=
X-Google-Smtp-Source: AMsMyM7obNymL36cxtLecuiPiPZRdathMnjWLsSvyKUT8oF3LeCTzUlLQ9KFzqo5Eo4+Ek81V3MSLg==
X-Received: by 2002:a2e:3310:0:b0:26e:61d7:870b with SMTP id d16-20020a2e3310000000b0026e61d7870bmr5673224ljc.88.1666290575680;
        Thu, 20 Oct 2022 11:29:35 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id h10-20020a0565123c8a00b00497a3e11608sm2797216lfv.303.2022.10.20.11.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 11:29:35 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: forest@alittletooquiet.net
Cc: greg@kroah.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 1/6] staging: vt6655: fix lines ending in a '('
Date: Thu, 20 Oct 2022 18:27:41 +0000
Message-Id: <46a2791fc89f4dc299162418ab304ab821e494fa.1666288416.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666288416.git.tanjubrunostar0@gmail.com>
References: <cover.1666288416.git.tanjubrunostar0@gmail.com>
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

