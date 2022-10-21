Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF97E;
	Fri, 21 Oct 2022 09:25:52 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id r14so4140105lfm.2;
        Fri, 21 Oct 2022 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2MVCCy2Kj88bAGrrwyous+SY2zFdp50BJwaTNbSgJs=;
        b=e1Ug2fbqBV828vW2hp81OZQM8ZZrtqzFoCgUtgF1WPGaTyc+HKq4vG6c/GhnbLHqs/
         G34p+YJXUqnyngkTTPuvqC3bVytW4N/GYy4OyczPzpg+BBUlNFmJwrqC4xICbSIJdGVq
         oTLTLNJXWuZlKtpB3+ZcBBceSmeXnnTjQCghJpJqk+BztA39iGgHGgeYr1Ypb5DonO0A
         JWnPCiGhpyQg5gtS4ywgKcQRgr3cLDK3m/cZ6jrod8s+I6nZbZX3XkZxrYocUebwMO1v
         RZBtWS7qIZ1PY9GrYy4RBUurwv1D8cznf9ihBC01AYjnLx2RhjAL4LG31co9eZKB1iQg
         m15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2MVCCy2Kj88bAGrrwyous+SY2zFdp50BJwaTNbSgJs=;
        b=LzZoVFbDu8PCb8vDtROpVudwmyIb4UatEEJ5CJdi/PshF8Wif/yeh94Kiv//0r1Xgb
         Qit6gtYnN6+DvzCpuxzWZ9UmQ2PVQ9aU7hGz5OrbLlIpncaTV3Zda+xo84ivfhwcVxF1
         miS+Ol/QHWmbEArsXejQKJ9BdoQMEfb53Apl5DLTnm4VcWv/FEmXajGwfJyOu9gY7AbV
         8DbPRUfc8E7gEJ7uWJxW4vD3ch1TvHB5SfK7QzgNxN/XRmfz5YZoCBWQjosKSSzuodaE
         oqisMe7DmiBLa5egJELfoJR9tvTVfvkzaHBVGeln5wc1+bt3PnH2oh6PyOfGsIdUHpT4
         5HUg==
X-Gm-Message-State: ACrzQf3joWWBgBCwXsfJtzlW7aCrlsz0Sxybc60WWEvmm7p2KSloEPx7
	OOx2v4NBzXS+R6As6lDzOMLakskaS4UEjL39
X-Google-Smtp-Source: AMsMyM4+5YCd0Luf4TS2xNZ0ncMzTartBJCb60IU0qioV9xKWdxD8sActTvNkZmCQGyb5TZ9G5oWjA==
X-Received: by 2002:ac2:44c1:0:b0:4a6:113f:ab60 with SMTP id d1-20020ac244c1000000b004a6113fab60mr4222002lfm.475.1666344349940;
        Fri, 21 Oct 2022 02:25:49 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id n13-20020ac2490d000000b0049b8c0571e5sm3091491lfi.113.2022.10.21.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:25:49 -0700 (PDT)
Date: Fri, 21 Oct 2022 09:25:48 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v4] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <Y1JlnJ/UpBgm9XEC@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Code style warnings reported by checkpatch.
Improve the layout of a function header:
Put the first parameter immediately after the '(' and align the other
parameters underneath it.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>

---
v2: put static and void on the same line and adjusted the indentation as
suggested by Greg KH
---
v3: Reformat the code by inserting tabs and white space as recommended
by Nam Cao and Julia Lawall
---
v4: final version of this patch

 drivers/staging/vt6655/rxtx.c | 78 +++++++++++++++--------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 5bdb5176772c..1e5036121665 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -85,35 +85,27 @@ static const unsigned short wFB_Opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int	cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-);
-
-static
-void
-s_vGenerateTxParameter(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	struct vnt_tx_fifo_head *,
-	void *pvRrvTime,
-	void *pvRTS,
-	void *pvCTS,
-	unsigned int	cbFrameSize,
-	bool bNeedACK,
-	unsigned int	uDMAIdx,
-	void *psEthHeader,
-	unsigned short wCurrentRate
-);
+static void s_vFillRTSHead(struct vnt_private *pDevice,
+			   unsigned char byPktType,
+			   void *pvRTS,
+			   unsigned int	cbFrameLength,
+			   bool bNeedAck,
+			   bool bDisCRC,
+			   struct ieee80211_hdr *hdr,
+			   unsigned short wCurrentRate,
+			   unsigned char byFBOption);
+
+static void s_vGenerateTxParameter(struct vnt_private *pDevice,
+				   unsigned char byPktType,
+				   struct vnt_tx_fifo_head *,
+				   void *pvRrvTime,
+				   void *pvRTS,
+				   void *pvCTS,
+				   unsigned int	cbFrameSize,
+				   bool bNeedACK,
+				   unsigned int	uDMAIdx,
+				   void *psEthHeader,
+				   unsigned short wCurrentRate);
 
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
@@ -121,22 +113,18 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 		  unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
 		  unsigned int uNodeIndex);
 
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
-);
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
+			      bool is_pspoll);
 
 /*---------------------  Export Variables  --------------------------*/
 
-- 
2.34.1

