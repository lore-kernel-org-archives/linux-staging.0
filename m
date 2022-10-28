Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814E1FA8;
	Fri, 28 Oct 2022 06:40:11 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id g12so6767710lfh.3;
        Thu, 27 Oct 2022 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12SvF3m9yP7YwQVdd6wLC8qgaOMohgTgyWxZ/jOVajE=;
        b=lyAR21ScA6lUjwBqBlAadxnuefkILJm98jOftbXupRrbH/DZlTK1pHvM3z7NxUqteM
         9Y4DdIadlVfuG2cpxEmgGsszD56PcXsHoUR40XfG03u7k25I7J1QBmrPk8Ch6+LrJ4Hg
         rW0ryV8uFRn8cBSzv+olMVNRmrcwHRA+OtqYe5oX2c9YbH/kvbcynIDcsjkAAp0iAhsd
         AY+sinRpSDRN69Qb5pBzyxQ1xZT3TLEKP4GVDGbEpgDdW5bxOG0rUIhJXKh+7YpFOu+O
         xMc7geFFU8Rcr+GgBQw+U3o7WE726DNm3iudv9IHSWcmLkOlvTSmS80E171aELNK6tCF
         6Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12SvF3m9yP7YwQVdd6wLC8qgaOMohgTgyWxZ/jOVajE=;
        b=Pmkc0jvOV4tBR4UsHKdfQUZPsIuM87XoAccYCZuerOwc1EpddAwCYZH1ZCEFn2pkVJ
         TIKNo9I0aIUwHYhP9dI3dLT0vn82X8NIJ88hZhPkR71QW3qPFP/yPqCW1DAIUIHtzFbN
         2LCFNfgTnyTd0DVU7M3WxSiMov5NAdAPe/GQkNM0+ErBXH8EJXCQG/beE4d+OVMp6/2l
         h/TG0L0Y8PkO82BthFZaDXFNzWPczTG/YOlAafCj7FiH2ffDxgUKAqLbZoFsVprMoiaY
         UMgrSqIVxxHrUblcevmbzUDktfn4Fbq2V0y6dtTxV5RmuDujZOFM0nsQWtXT1YCqjRkY
         jVdw==
X-Gm-Message-State: ACrzQf0vdRtnE/TxrqLaZ15+3fojnRPdXbiHgHEF4lO2DuE39ds5iaiR
	NjOJphruI0AtCHRM/U+iCS8=
X-Google-Smtp-Source: AMsMyM6SO0Czbq+S+c1zHsLPwUuNarrco+f5qSJLel1/AHDnH6hkxY6q26Z/6ORtNOrpfZz61OSpzw==
X-Received: by 2002:ac2:4f03:0:b0:4af:f894:6801 with SMTP id k3-20020ac24f03000000b004aff8946801mr2483555lfr.377.1666939209343;
        Thu, 27 Oct 2022 23:40:09 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id t7-20020a05651c204700b0026dced9840dsm498509ljo.61.2022.10.27.23.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 23:40:09 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v7 5/6] staging: vt6655: split long lines of code in the file
Date: Fri, 28 Oct 2022 06:39:28 +0000
Message-ID: <71c411a68c9c54b20e7fa687f736acac50b33b5e.1666849707.git.tanjubrunostar0@gmail.com>
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
Message-ID: <20221028063928.GHTH0AV7LAboWfEhsCTNB4A1ORDY3Ax_VKLDeqjGRE8@z>

increase code visibility by splitting  long lines of code in the file

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 86 +++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 475526b73e1a..6a4fcb16b674 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1102,44 +1102,59 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 		if (byFBOption == AUTO_FB_NONE) {
 			if (bRTS) {/* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_rts));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
-							cbMICHDR + sizeof(struct vnt_rts_g));
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_rts) +
+						      cbMICHDR + sizeof(struct vnt_rts_g));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
 							cbMICHDR + sizeof(struct vnt_rts_g) +
 							sizeof(struct vnt_tx_datahead_g);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
+				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize +
+						  sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-						sizeof(struct vnt_rrv_time_cts) + cbMICHDR + sizeof(struct vnt_cts));
+						      sizeof(struct vnt_rrv_time_cts) + cbMICHDR +
+						      sizeof(struct vnt_cts));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
-							cbMICHDR + sizeof(struct vnt_cts) + sizeof(struct vnt_tx_datahead_g);
+							cbMICHDR + sizeof(struct vnt_cts) +
+							sizeof(struct vnt_tx_datahead_g);
 			}
 		} else {
 			/* Auto Fall Back */
 			if (bRTS) {/* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
-				pvRTS = (void *) (pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_rts));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_rts) +
 					cbMICHDR + sizeof(struct vnt_rts_g_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
-					cbMICHDR + sizeof(struct vnt_rts_g_fb) + sizeof(struct vnt_tx_datahead_g_fb);
+					cbMICHDR + sizeof(struct vnt_rts_g_fb) +
+					sizeof(struct vnt_tx_datahead_g_fb);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
-				pvTxDataHd = (void  *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
+				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
+				pvTxDataHd = (void  *)(pbyTxBufferAddr + wTxBufSize +
+						       sizeof(struct vnt_rrv_time_cts) +
 					cbMICHDR + sizeof(struct vnt_cts_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
-					cbMICHDR + sizeof(struct vnt_cts_fb) + sizeof(struct vnt_tx_datahead_g_fb);
+					cbMICHDR + sizeof(struct vnt_cts_fb) +
+					sizeof(struct vnt_tx_datahead_g_fb);
 			}
 		} /* Auto Fall Back */
 	} else {/* 802.11a/b packet */
@@ -1147,19 +1162,25 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 		if (byFBOption == AUTO_FB_NONE) {
 			if (bRTS) {
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				pvCTS = NULL;
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-					sizeof(struct vnt_rrv_time_ab) + cbMICHDR + sizeof(struct vnt_rts_ab));
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR +
+						      sizeof(struct vnt_rts_ab));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
-					cbMICHDR + sizeof(struct vnt_rts_ab) + sizeof(struct vnt_tx_datahead_ab);
+					cbMICHDR + sizeof(struct vnt_rts_ab) +
+					sizeof(struct vnt_tx_datahead_ab);
 			} else { /* RTS_needless, need MICHDR */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
 				pvRTS = NULL;
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_tx_datahead_ab);
 			}
@@ -1167,19 +1188,25 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 			/* Auto Fall Back */
 			if (bRTS) { /* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				pvCTS = NULL;
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-					sizeof(struct vnt_rrv_time_ab) + cbMICHDR + sizeof(struct vnt_rts_a_fb));
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR +
+						      sizeof(struct vnt_rts_a_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
-					cbMICHDR + sizeof(struct vnt_rts_a_fb) + sizeof(struct vnt_tx_datahead_a_fb);
+					cbMICHDR + sizeof(struct vnt_rts_a_fb) +
+					sizeof(struct vnt_tx_datahead_a_fb);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
 				pvRTS = NULL;
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_tx_datahead_a_fb);
 			}
@@ -1195,7 +1222,8 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 			       cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
 	/* Fill DataHead */
 	uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, cbFrameSize, uDMAIdx, bNeedACK,
-				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate, is_pspoll);
+				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate,
+				    is_pspoll);
 
 	hdr->duration_id = uDuration;
 
-- 
2.34.1

