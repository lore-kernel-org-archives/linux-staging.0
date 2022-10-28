Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E41015C81;
	Fri, 28 Oct 2022 23:26:12 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id j14so10124480ljh.12;
        Fri, 28 Oct 2022 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQe+2hHBmcm3Iek0E2MIyCyrx7Z86fYMUFGwOxoXr6Q=;
        b=ePqdSGl8r9FllmjwNWoh573XDSnzK5I4nCmlEZgthvcPl3/jmS+uN51B35UUNj5mA5
         HEDLMpcgrrnXIPwv+nVDySujRXnKdJF9g/A2/z+5xXf2xfqof6IB7YPPhirTBwspK5rp
         XkF+4EhniTIsTYYripf+Tu+xezvx2TGpj9mBCR8QCjwhC7ZV7tV7UstssQ13nDD21+Ae
         nuW++XfYTYKdl9IGzGJDF4fLMKjvaVR5AXtUKtePoU1f4uIj5pjTs1+DantKZSI/WeqO
         IMRbbH1OvPu2Mqm+QglDWI+oKFVF0nOfdOa4Vf1L8ViVMLEIynbaoBynd4i2HJ8trcB4
         IsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQe+2hHBmcm3Iek0E2MIyCyrx7Z86fYMUFGwOxoXr6Q=;
        b=HeM/6g81oKxueH7+IvzEnKW8xCz+1qDrlIg0zM0RMndMtGVCuz7+hA1r6YZ0FwfSWH
         +JBhmeg5qvAD5ovqVWSBCdTuW8oBy533e4rjC45TD4iqFIozITrMRvngxp1Q1G7gBCWe
         W/JdopK6mb/sHG3c4NzBtlgH0IIRU43s2eBDm9ro+qh90M529AS9qbbyNzdH3QrStiGJ
         QXzGeGGVvPjpJPyVrSvoESIXCo/bU30qVNYGdrpRyAco2N8yIAGCue1xfISVgsxdhtnu
         n2V6fh95892Xa/SsuXstxkCpZPEJVlzNweiePShlBZ+ZfBcTTNvajlExxtyWpsG+JaQi
         JYXw==
X-Gm-Message-State: ACrzQf39ypK/zwpm1qnl/Nb4TYsYxcsm+CTdWdIMdeWM+TyBN0D+pTjz
	lClU+m/MDnV3zskFsVv9Fyg=
X-Google-Smtp-Source: AMsMyM5LWqv2r3+h4McwbMrvVf2OYT2+ybq+d8uGTOBfnHdoFM7as9mEJe8wgtBxk23YuZbKZdW+9w==
X-Received: by 2002:a05:651c:511:b0:26f:dfb2:eeef with SMTP id o17-20020a05651c051100b0026fdfb2eeefmr654174ljp.343.1666999570400;
        Fri, 28 Oct 2022 16:26:10 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a056512202200b0049aa20af00fsm7064lfs.21.2022.10.28.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:26:10 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v9 6/6] staging: vt6655: fix lines of code ending in a '('
Date: Fri, 28 Oct 2022 23:23:27 +0000
Message-Id: <45d10b850cef8ed5db7042311dbe19bcba185396.1666995639.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666995639.git.tanjubrunostar0@gmail.com>
References: <cover.1666995639.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch errors related to lines ending with a '(' 
by joining some lines of code and indenting properly to improve
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

