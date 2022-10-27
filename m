Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D741865;
	Thu, 27 Oct 2022 09:06:16 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id bs14so1380474ljb.9;
        Thu, 27 Oct 2022 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46gEeRIQbyBaOftvUK/4NBHpzmpC/hatrUfA28IOgcA=;
        b=F8KUt8zK/mvH2b+AJYmMZya64Qi4noe+cE++aCDT7Up4BCT8eyyfTUReU7G2uIf64D
         bLyrljuajL4CUnhxSaDjezyIfMQWdC1W1V140NyP5aPPVT2nmtUE/tPaayBk1ZiICVq+
         FG462C9x8vaADL8fAFmLcciDDqZ9UE/FMn/fsG8cneUkmmZKQ+QdECGlQY9RDtgDQAsv
         L4gEVrh1XnYFspXaT5Yj05Qs2DdwRSZzHyXQS+nLOPfDzbaIcboBDZG50LMIgt8seopM
         btnzI/KoWQWbBNXsRkAHSj0LzQkfKHHkrv0ZZPeS1z0uUpCMnvJqF+h0GtfYzSXxfUcN
         kneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46gEeRIQbyBaOftvUK/4NBHpzmpC/hatrUfA28IOgcA=;
        b=iL0ML2RYQxVblb7UgqE67r8xHo81BSWij09nUjnaQxqOEXEMifayyScHtftr/RDUHb
         gdN/ijjKyOYGmR97tFLBgZPF7y2t6TAetHuq6m7ycBVQ4+9U67A/DKyQn1cP0VJgsMaa
         Jh95Q3g/xfnW78Z09qh003bDlUKh+1K/kLvi+FkG+qh4S5U6qQMOw2coZlJdyNGWYDuu
         EoP9C3LnbNIbYNH/umrTnvD1uIL4h+1H2laaADDwZLpW55L5vGVLQ2qrcv9kO5lA/29Y
         GBRTQNxXWGqexke3fa1cP8/FY2nQdOpXnNLBL15qKTgjQ/SGb345jo52EYSiP23rEuL9
         CoCg==
X-Gm-Message-State: ACrzQf0e/JGQ4F2r4simiUq1Z2PX1muaG37OP/+6DHeCvRfOOCAB5D8D
	lhsHhxK0w/LaMP+yADYv7Uw=
X-Google-Smtp-Source: AMsMyM7sqfzCGv4vFaNffOUF9/eT5lyahpbPSZS7gTzQU9Cj0aB7XLBMW/n8HTjVbfzh73i6iPUjQA==
X-Received: by 2002:a05:651c:1a0b:b0:26f:e07e:4eaa with SMTP id by11-20020a05651c1a0b00b0026fe07e4eaamr17165359ljb.29.1666861574533;
        Thu, 27 Oct 2022 02:06:14 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id d9-20020a2e96c9000000b0026f9cb6d10fsm153273ljj.45.2022.10.27.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 02:06:14 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v6 5/6] staging: vt6655: refactor code in the rest of the file
Date: Thu, 27 Oct 2022 09:05:54 +0000
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
Message-ID: <20221027090554.EFuFAt4f9rsvH3I_m-AmRzOBB2k2dvcr7DWZYa0XWlM@z>

refactor long lines of code in the rest of the file

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

