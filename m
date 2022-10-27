Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41F1866;
	Thu, 27 Oct 2022 08:59:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id z24so1387774ljn.4;
        Thu, 27 Oct 2022 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUjB/LIeIaF8ms/g2Nbld44QrRlq9IWMpRhgl/Fq6KI=;
        b=mN+1LIDT5vDMW/ShpLbbDHpC+fiaS9l3nCxioAbusITEXCAtPf0+N2AZPmOL0jGYV9
         rQu1BaAIAPnRSkNUZ59WFz9B641SKJIrpFCndQsU2zCKw83/doKOG4ekf+Y0ITxWN9s6
         XnOZ6f/wxkdcGRTFcEkvRcGyXO8zDcemSaxysgxOFLHFZNDYLwqzBGLqVFeTHcDAZ1Kn
         4JsPM74P6YbrJF3iKfxGc85DCI2yYAhyS0DPaG4BHp+Cz4oPCq4vO9N4cDpuWRWgDFI5
         /ah++J+zQhX6Mcv6/Co46F/adIzsNn3KE+aKpRN9px98EOfDjHnhbFjKu/7Ol93oGag7
         xthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUjB/LIeIaF8ms/g2Nbld44QrRlq9IWMpRhgl/Fq6KI=;
        b=htQGc4+nMYW4Ydd7NCTfbTDs/5H560lPcta5YDD1f5FbM2bfQcCi0WMYNhSXsuJUU+
         UnDz6dnqGltKksM7wq5Y8iAA1Sh8uKoEjMpzxY81zUfBcbbyI3ThAdEeEkXoA7cKf17U
         15scIlgwHD7uV4QnxcoNQgDiDjZySK9HFVZBY2iH8ug1zWI5/DSo2TTLynOml3sOIAdj
         oEujreBneGDZ1S9sXgIDUYZC5rkyPLSpFrpvA8a+dPC793uvuUeGdYodljRZUfrwXEYS
         DCR+NYKMWC8zE4N96J8s/M6sfb+I3zA/u5cSqySoFcvgSFm1EKzrurTGIS+lOjKFILLZ
         sdqg==
X-Gm-Message-State: ACrzQf0WZVny6yxYQVL66Vfkm8pRJZTnRsJwCe5THlFVtplTtnToiDBv
	kGgrq3kTkMo2YQzB2A+JA94=
X-Google-Smtp-Source: AMsMyM4O6OnRs6NBwdf82JkF9Yf4ck1Fjz7SURZ/X8gXAfue/gtLJ5n0I1CZMjEvceLRWYng2Xi9xw==
X-Received: by 2002:a2e:8e28:0:b0:277:11fe:f9b5 with SMTP id r8-20020a2e8e28000000b0027711fef9b5mr6026403ljk.463.1666861186512;
        Thu, 27 Oct 2022 01:59:46 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id m3-20020a056512114300b004a050ddc4ecsm109892lfg.125.2022.10.27.01.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:59:46 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v5 6/6] staging: vt6655: refactor code to avoid a line ending in '('
Date: Thu, 27 Oct 2022 08:59:08 +0000
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
Message-ID: <20221027085908.Qv23YoKKoCk5YmAoM2j0_I5PaZMpMuFDQJF6-5J-kzU@z>

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

