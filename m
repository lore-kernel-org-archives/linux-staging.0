Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A45CA3;
	Thu, 20 Oct 2022 18:29:52 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b18so432738ljr.13;
        Thu, 20 Oct 2022 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RswLkUQZgOX210lwrclExJv9Imy6Jbq5VPuyg8KfHoM=;
        b=ky4WgJ2sV1PKnE8V5sQnBnftORIfi49y4SjH4oUyu15+Z1iit3HvxuvXusNDPpkC/P
         9d1d+8xdpZqzETTAoyoa5f9T2h7q+hFRwgvYnXJtNyh14QkZ6hLaki+k9bcSOsWR6oBh
         RMOMdLpKGbwWdpN0mIyTy1cNFDY4pfsF1IeM5IZP+uZxr/dincFH1s8x6EQ7Bt/PZz3F
         UZcIiJjlojYVBxPXAyC7Xljk771vVl5yfBf6PFncSz6y4qr1FzSE3TXZXSrBC6V4f3ZS
         zEVKicD4gUs5YRhi6DX6X63eyFOaex+IQhBDBVQvqCAC3+8nWZRg1SuzCDMl5rw4trh/
         oZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RswLkUQZgOX210lwrclExJv9Imy6Jbq5VPuyg8KfHoM=;
        b=UnWOoklpWjdDeNzETdFypPnZAQ/DwyKq/seCQcEZ3HYrkyxo/D5+xwVaPTEtsIXdVI
         WtjwAprJma1amILLV3RR1LjLlQZvTGP9F8dx2DmUp+QdCmMlS9p9BLcKIqSgrbSduFer
         hYWxuGRQkpxV18ZA4oBscVw/tBtf6maZgtYmLJBXAd+zRHdiBly9e5xTUuBptYpJxsk/
         RXz29i4h0Hgl34i5uXOXmuprlDE32UpISJQapQczT8byiYoN1CE87bTF0IGOL+rKZUiK
         wEMl8gDQf4QjpWyngzRgiodPGJrrSeRfuY0x5UUFUAX72LX4cGCVPCjPacSXT6qQOY7I
         vDPg==
X-Gm-Message-State: ACrzQf22u5UxGvRx4k0ac86BpQbOoJ37ma+M8W76c9F1rAIkZloGj5gv
	GgKtFsIJIpMf5ZdmzFbzk3FSPzABTwChsegA
X-Google-Smtp-Source: AMsMyM5HGU+/pes5W2kxsVEOQOmXCwax5PtNMYm1egRpzn5Dy8X2bInzQVHGLH2Y8GyAV92LNrl3vw==
X-Received: by 2002:a2e:b0c3:0:b0:26e:6617:ed08 with SMTP id g3-20020a2eb0c3000000b0026e6617ed08mr5135924ljl.120.1666290592079;
        Thu, 20 Oct 2022 11:29:52 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id h10-20020a0565123c8a00b00497a3e11608sm2797216lfv.303.2022.10.20.11.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 11:29:51 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: forest@alittletooquiet.net
Cc: greg@kroah.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3] staging: vt6655: Fix Lines should not end with a '('
Date: Thu, 20 Oct 2022 18:27:47 +0000
Message-Id: <20221020182948.14982-1-tanjubrunostar0@gmail.com>
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

Code style warnings reported by checkpatch.
Improve the layout of a function header:
Put the first parameter immediately after the '(' and align the other
parameters underneath it.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>

---
v2: put static and void on the same line and adjusted the indentation as
suggested by Greg KH
---
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

