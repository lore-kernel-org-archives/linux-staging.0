Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD51865;
	Thu, 27 Oct 2022 09:06:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id be13so1469352lfb.4;
        Thu, 27 Oct 2022 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUjB/LIeIaF8ms/g2Nbld44QrRlq9IWMpRhgl/Fq6KI=;
        b=ZGJYKQQOLgntzby285FezJsUmL7FrUF/hukJJQ65lTw7VE2COSwHCFsJ7z38tqxWKQ
         nvCsHNF1pMLTsHoRsy0xhJ4ep9wZZMQlmsL6ZpBjsciqIC5JqhcAStIO9vr7uppYBieb
         IPgwvM99ulOAMWzz6DDP88dVzPQadoZycAVX9on4vfLsueyghYwAbuB7NusuFUpSxwo3
         HP89p5h0pCwjL7iPikDcEvjj0r6hhra39H17zDLgs0/tvlBmzS4jJzbn171vpxooYYOX
         HZLtS2hmjav1pCnWfeiqWfFXe5PW4FH4L8xoepwCKjNh6JnE4E6mWH7dB4gc/HgdgLny
         hRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUjB/LIeIaF8ms/g2Nbld44QrRlq9IWMpRhgl/Fq6KI=;
        b=iVd0hvWYQhmgUrZ227UKFg3X6Wpv2PBn0xVkOfSqPwugNCpgfyCy8le16q4DCYjKgq
         8vdoi3XdJQge/gaEPLlL6aQVKfJEN3qUPxfRu00l8cfR6KUDTZpyOV4QhaBo5/Q7upcd
         UxqXm7LpGJmxc+pQvCtzQV7R1shvYWpMHzIV3sRuLE0o3Q1IBBteNh5aojWU9GyC+3Gz
         +T3bcgWFqxq3qZpmErL/clpiAe8Sx+5H2MdRiOTYKeXi/WDkf1YYyzqQffxvmLEzyXMW
         EO1TePTCYqPNZxiIzNhxV9QsrV3Xkk716uY09oFYn3YJGaM72oLY+ZCIIB5Z2ht5NCV6
         dzAg==
X-Gm-Message-State: ACrzQf3gBeIS3R49Bjy/fVRWFySXxqiZhuDXJeebSdC4wXDxSPp6S6/t
	k7c66SepCg3Try087PffXCc=
X-Google-Smtp-Source: AMsMyM7hEnHdVIG4FGGkxWCWOfQrxt6tcfpQlOXhZS0x/MehI+RMklhYsj8gbYqTKEESP4saVH+vbw==
X-Received: by 2002:ac2:5475:0:b0:4a2:4f8f:f01d with SMTP id e21-20020ac25475000000b004a24f8ff01dmr17030324lfn.386.1666861579727;
        Thu, 27 Oct 2022 02:06:19 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id d9-20020a2e96c9000000b0026f9cb6d10fsm153273ljj.45.2022.10.27.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 02:06:19 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v6 6/6] staging: vt6655: refactor code to avoid a line ending in '('
Date: Thu, 27 Oct 2022 09:05:55 +0000
Message-ID: <43693eef6afe24973ed28f8b26e2d5117f5d35f1.1666849707.git.tanjubrunostar0@gmail.com>
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
Message-ID: <20221027090555.NYtXiEtQcuKT46gEvEQuOn0uVt8sk-IJYErtrtSEXhM@z>

join unnecessary split lines to avoid them ending in '('

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

