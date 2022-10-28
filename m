Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF053209;
	Fri, 28 Oct 2022 17:41:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id r14so9463422lfm.2;
        Fri, 28 Oct 2022 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEOapcrR5Veb7GbTiYOEkCV8uEMgF6llwclPcWMWYnY=;
        b=WwpzTb+iSq6Qsli6fJJxH5RQUDLYQyiO/o/MYSY7N6z6Jgy7MnZDUMas5mg81ALVRU
         U9T+vGeMiZ9roVRA2qpTydAQIdk1t3tDGdzk9YwOlbQeoD0kTTQh4t9LEDoNMx0uPYUh
         Vblgj/rFbI49KtSCueFoLBsrw8IVvjT3ZndLVhm3vVKyjMlTei/GDb+Cz3CGMz+IC2fp
         NemWWWwFPvEbcIEKDuQs/UI5ENn0OH0zOgeEYOkVuuPThVMmaT+m1G58U4z/3PUgaf7q
         1lV10rq4luUROPgOkU5Xx4CNlewTfleno1ZSAKecNSfrCFK3sttSgyBc2HjEVgGNboCQ
         kPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEOapcrR5Veb7GbTiYOEkCV8uEMgF6llwclPcWMWYnY=;
        b=W8ZJuE23c4Gr29NL/EkTjmgcItKRE36VppQgQGISV5oxAX/sbYi1OGCXOqM1YJ9Dpy
         VHCqmGHLAJ/TDepVB3JlDDt5ckYQZ7wfOyA/MxITxPEaNiFjynDzJ9jgDvENY0UHwlOH
         W9dPOPldGOZS+ibn7kfXmqiJcmqahDfl3tfcQnuHyaeXCfIp4T9XuYgr5wSmU0v62anN
         wEa8ncayNdZuLRyutopIX7f1ZjO7F0s4v3Zd0zWiJ22MCVjaeQ2mY3c2q5RZB9T30/1c
         sM7GH0kZqSJKE5qodR3rwrIYGBorTEyn/8o8HwWDeesxNySUXlEO98/cqHMcZi0Z9/+Q
         RzNA==
X-Gm-Message-State: ACrzQf39EGRZN5mLuTwpi6cDa0Rdl/18Yg2TpWdBFOrYBwSntSr1X8IA
	zWnrpHM6QQpdnf6VXD3vH7Nc5PAhREyskA==
X-Google-Smtp-Source: AMsMyM747L5KEH03pFOFU1iKA7oJhO99+AfcwLCrcR1oGZdD9jQGbBCHe3gO74b5rWsGQv8HY23AUw==
X-Received: by 2002:ac2:4a6f:0:b0:4b0:1e5a:9287 with SMTP id q15-20020ac24a6f000000b004b01e5a9287mr203825lfp.156.1666978881713;
        Fri, 28 Oct 2022 10:41:21 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2eb622000000b0026dfdcbccdasm725322ljn.14.2022.10.28.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:41:21 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v8 6/6] staging: vt6655: fix lines of code ending in a '('
Date: Fri, 28 Oct 2022 17:40:58 +0000
Message-Id: <45d10b850cef8ed5db7042311dbe19bcba185396.1666978292.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666978292.git.tanjubrunostar0@gmail.com>
References: <cover.1666978292.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch errors related to lines ending with a '(' by
joining some lines of code and indenting properly to increase
visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 6a4fcb16b674..d585435520b3 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1118,7 +1118,7 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize +
+				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize +
 						  sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_cts) + cbMICHDR +
@@ -1296,10 +1296,8 @@ static void vnt_fill_txkey(struct ieee80211_hdr *hdr, u8 *key_buffer,
 		ether_addr_copy(mic_hdr->addr2, hdr->addr2);
 		ether_addr_copy(mic_hdr->addr3, hdr->addr3);
 
-		mic_hdr->frame_control = cpu_to_le16(
-			le16_to_cpu(hdr->frame_control) & 0xc78f);
-		mic_hdr->seq_ctrl = cpu_to_le16(
-				le16_to_cpu(hdr->seq_ctrl) & 0xf);
+		mic_hdr->frame_control = cpu_to_le16(le16_to_cpu(hdr->frame_control) & 0xc78f);
+		mic_hdr->seq_ctrl = cpu_to_le16(le16_to_cpu(hdr->seq_ctrl) & 0xf);
 
 		if (ieee80211_has_a4(hdr->frame_control))
 			ether_addr_copy(mic_hdr->addr4, hdr->addr4);
@@ -1470,9 +1468,9 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 		/* Get Duration and TimeStampOff */
 		short_head->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B,
-				    frame_size, PK_TYPE_11A, current_rate,
-				    false, 0, 0, 1, AUTO_FB_NONE));
+			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B, frame_size,
+							    PK_TYPE_11A, current_rate, false,
+							    0, 0, 1, AUTO_FB_NONE));
 
 		short_head->time_stamp_off =
 				vnt_time_stamp_off(priv, current_rate);
@@ -1486,9 +1484,9 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 		/* Get Duration and TimeStampOff */
 		short_head->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B,
-				    frame_size, PK_TYPE_11B, current_rate,
-				    false, 0, 0, 1, AUTO_FB_NONE));
+			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B, frame_size,
+							    PK_TYPE_11B, current_rate, false,
+							    0, 0, 1, AUTO_FB_NONE));
 
 		short_head->time_stamp_off =
 			vnt_time_stamp_off(priv, current_rate);
-- 
2.34.1

