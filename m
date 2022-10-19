Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8F7E;
	Wed, 19 Oct 2022 16:05:09 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id h8so22785834lja.11;
        Wed, 19 Oct 2022 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YCDHsYWcIY96mUtSqodHKe31qpMLaWDuKz478pSr00=;
        b=KHhsVmAmNGZintp/YIDAd4pSn0E5e4hSFuGvoY3fG+1VV7PhE59oWENJD8FG30TEEr
         0ilGqC28Ik/psjVonwjvg6NUDSasG8ZN0rYkQepcXQrRdA1IfXqweE6Oc9Z7ZlD2s4WS
         XNZUohjsBfohMb9ulzAdIq+6ukXKwPMby4m5bpGY43zRnf7RSCvK3lrX4U3Gcj+2I2bw
         V+heCQ3Huv6aFh6iRdVogsawozkdU0dKgJh9KhUgVsoLAr5P0oO7CzHtUiMS8aT7NDmR
         5GSfkUadveG1N/RNPalqsJPUwO9rI4cetSRu7q+suD6YvwYLCPSRdlxEjkmEda/Tl2ZG
         IRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YCDHsYWcIY96mUtSqodHKe31qpMLaWDuKz478pSr00=;
        b=k/taKLqlWwlEEJCMF/WF+4pBOdB5aXdlsHyJ1GYTpqk0qJV3h03F9I/6NCf7zi+P0M
         hFlDMqvTKNHmj/2QsU7bDTFgOL8cDUW9r0XsYJyY5YXe9hp9tG+7QPuAV7cBs5itHH1D
         3P7MFuS+evmBiDeJ4oqyx8l7W9i04Py2dcrdny4IyHvEdKhgGlbhQxL8Z7vitBfl89Ul
         XDIa5jPc8vn4ewPqcwtJLut44xTsAsoImM9W+N89Qt8FTT6XDb+r3PtIJRB+NaWarz6N
         4i+t7Y8hBM8Xz6nRMExvpWzo7Mx5kLZKNQOFkxJ7P4QjDj80IFc3G4TPAO5yU7otPuF7
         F40Q==
X-Gm-Message-State: ACrzQf0CJ+E8C3vB2Bk4L54h+6JINBOgHaxsmRUWQwzrUxLFsP6Eyky/
	WIGR81R4L2STk1CyV04wFF3y4vkTjjpntQ==
X-Google-Smtp-Source: AMsMyM6fO5UYQBYujCKvc6CqltqY94UNh41cSyMFXrGhpAbyftVmOEivr9+vv8IHfUrxjlCqIyuwKA==
X-Received: by 2002:a05:651c:88e:b0:26d:dd92:73e7 with SMTP id d14-20020a05651c088e00b0026ddd9273e7mr3094859ljq.503.1666195507195;
        Wed, 19 Oct 2022 09:05:07 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b0049876c1bb24sm2337411lfr.225.2022.10.19.09.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 09:05:06 -0700 (PDT)
Date: Wed, 19 Oct 2022 16:05:06 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <Y1AgMjTsmy3C5qcK@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
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
 drivers/staging/vt6655/rxtx.c | 44 ++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 5bdb5176772c..ff855def0bd5 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -87,33 +87,29 @@ static const unsigned short wFB_Opt1[2][5] = {
 /*---------------------  Static Functions  --------------------------*/
 static
 void
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
+s_vFillRTSHead(struct vnt_private *pDevice,
+		unsigned char byPktType,
+		void *pvRTS,
+		unsigned int	cbFrameLength,
+		bool bNeedAck,
+		bool bDisCRC,
+		struct ieee80211_hdr *hdr,
+		unsigned short wCurrentRate,
+		unsigned char byFBOption);
 
 static
 void
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
+s_vGenerateTxParameter(struct vnt_private *pDevice,
+		unsigned char byPktType,
+		struct vnt_tx_fifo_head *,
+		void *pvRrvTime,
+		void *pvRTS,
+		void *pvCTS,
+		unsigned int	cbFrameSize,
+		bool bNeedACK,
+		unsigned int	uDMAIdx,
+		void *psEthHeader,
+		unsigned short wCurrentRate);
 
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
-- 
2.34.1

