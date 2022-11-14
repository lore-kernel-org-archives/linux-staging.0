Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5070079FB;
	Mon, 14 Nov 2022 18:29:29 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id g12so20751730lfh.3;
        Mon, 14 Nov 2022 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFdoRLFi7JhrraRn7c45wb3bzWJSqovAGo3bjhp7fyI=;
        b=liFrItsGHqZP/eACX5yenPbHtuAo4/hvIHDLAvGPjBQWPP8vZ6QudAW28PsZIYpU5w
         Msx1qh5y7W+69zUV6LV99T13e9TtmYZCxZYwkC0SBSWBZZKudvQklEIdw0fN4hHtSgba
         bRcrACytvTbaJgrybCqEJsttaJKTmajYyFinLXR07RKrwl0tLqWo8reEO1vckuSawGnU
         o4Yhg4R1mBgZKW+O9ce2KAQITkqwTLIidXlBqrjDqW9Cw8cxQt3c9KeR/JDr0SIuwxnd
         rzuzlecSbpVGjXaYOnIQh0trAZ4GhuEc8uFCCd1rh7IwDjgQq3h8/FVEOcj7Dz0WInfx
         EI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFdoRLFi7JhrraRn7c45wb3bzWJSqovAGo3bjhp7fyI=;
        b=sg8/c3N1n49aPCcIT8jcQG3yz170Gr+Z8CHgIj/SE4IXfd1j9K+3rlXc3s8/jy1I3L
         Bso8dLBN70zR71VbigJFQRvmDZSSgXgRFfNEkcmPGYtLXiOpjMfov2gs1eLH+rpCA+Rq
         pXslcZKFn7oqf5T5/Fpxnv4O2RFYMG7sNpCmWFvWXAjDnMfLB7JbD37qy7c6qGHpMppJ
         fRG+FhvSeJVqcoTS/B7VviT8UbRgg2BD9JDedxiFcyuAFyPxoc2ePdpgJGDOYAg8stRY
         68kKw/gw1mvR/E5BVMvTTzVcwuhWepzZOCE0QSgSHH60EBj8jWWHAHbH7lRPprIwP3zH
         nQ+g==
X-Gm-Message-State: ANoB5pmZ/i8IvBMDX0ZJS0lGa0kjQP61qHKZ3qMC9UbD/aihxG74FWwi
	OWHcpdKuoIybTLdyot4uEHXRfRAGnJw=
X-Google-Smtp-Source: AA0mqf5Oo3qS4ToojASW5acw1NaJsgT72mgCWKl8J2Ko8PxkoQTl6af74XpNFuxBBMvloHZfBfOG7g==
X-Received: by 2002:a05:6512:1398:b0:497:456d:890 with SMTP id p24-20020a056512139800b00497456d0890mr4126440lfa.687.1668450566908;
        Mon, 14 Nov 2022 10:29:26 -0800 (PST)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e545a000000b0027718ee951dsm2123739ljd.37.2022.11.14.10.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 10:29:26 -0800 (PST)
Date: Mon, 14 Nov 2022 18:29:25 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v3] staging: vt6655: change the function name s_vFillRTSHead
Message-ID: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the use of Hungarian notation, which is not used in the Linux
kernel. Reported by checkpatch
Add indentation to the affected function to follow the Linux kernel
coding style. This improves visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
v2: corrected confusing changlog message on this patch
v3: removed unnecessary function prototype

 drivers/staging/vt6655/rxtx.c | 40 ++++++++++++-----------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 31ae99b3cb35..715b323cd2a8 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -23,7 +23,7 @@
  *      s_uGetTxRsvTime- get frame reserved time
  *      s_vFillCTSHead- fulfill CTS ctl header
  *      s_vFillFragParameter- Set fragment ctl parameter.
- *      s_vFillRTSHead- fulfill RTS ctl header
+ *      fill_rts_header- fulfill RTS ctl header
  *      s_vFillTxKey- fulfill tx encrypt key
  *      s_vSWencryption- Software encrypt header
  *      vDMA0_tx_80211- tx 802.11 frame via dma0
@@ -85,16 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static void s_vFillRTSHead(struct vnt_private *pDevice,
-			   unsigned char byPktType,
-			   void *pvRTS,
-			   unsigned int	cbFrameLength,
-			   bool bNeedAck,
-			   bool bDisCRC,
-			   struct ieee80211_hdr *hdr,
-			   unsigned short wCurrentRate,
-			   unsigned char byFBOption);
-
 static void s_vGenerateTxParameter(struct vnt_private *pDevice,
 				   unsigned char byPktType,
 				   struct vnt_tx_fifo_head *,
@@ -555,19 +545,15 @@ s_uFillDataHead(
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
+static void fill_rts_header(struct vnt_private *pDevice,
+			    unsigned char byPktType,
+			    void *pvRTS,
+			    unsigned int cbFrameLength,
+			    bool bNeedAck,
+			    bool bDisCRC,
+			    struct ieee80211_hdr *hdr,
+			    unsigned short wCurrentRate,
+			    unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
@@ -912,7 +898,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
 
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pvRrvTime;
 
@@ -931,7 +917,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
@@ -945,7 +931,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-- 
2.34.1

