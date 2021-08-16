Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F6B6D22
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o1-20020a05600c5101b02902e676fe1f04so210247wms.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c1dKHIJTq4qxeAvZPGI2tveZiuONxwwZ+x27EuMD30E=;
        b=UYrTbe03kvNj/3F9ZbRjZk8wjR7Oic/teWAhTcJtnnec7czBAurDiDV9uT3ZHXci2r
         IjVhVCwDUQ9uHOsBeR82nuW6jOHMFcGLj9UszglG0wDp5c/Rh46heUXsUDS750PC2vCL
         ShPwh/qss6SAO30iy5IaqnEVBwFt51EiVJNzcYzQwAgHQwBptAVUtYmEYBh2rtLYPOzs
         QOWmeH9neDUcyAWbBSmZlho/f1p9dKnl4VlBHzd684O7IWo6WiG/dx8Zjha40r2V+z4O
         +GIgyw/4RPH7777hqXUSCDUCiWOllVc0kpoB+ywXR+Y6fZER62XylQhEHGNHsmraRndU
         x6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c1dKHIJTq4qxeAvZPGI2tveZiuONxwwZ+x27EuMD30E=;
        b=odke/rbSVewyeUe5DlnX4qPdESUe3iGJT+cpo1zs+jfO8RsJT8wEb1d4OifnT/UCTd
         u99TP6sEfqXP9acEv7R1CDqTdR8W6VFtp6HxzxtW3jI4ukQtliDvgDm/l9eayf9Z93dI
         RCrYWEjJ8JN4KTESAxJaYZepz5AJ72pSgLX7RZ0KjvkyMEBkm12mWOu6oWTu8nhv8D2E
         PUeJudWWJ7K/FOImiZy9VHnkp+DAy4kNri31wWPrEAx2W478ksHqSWoO2XMI8MC7hOQI
         RTXFqhVEMCuOuOk9XYwHnE/peWP2wHZTW9gBGEv8w+H3puIw8G+N9Nrc8V+wpcgwLJ6T
         tmLQ==
X-Gm-Message-State: AOAM530VS96mquRn0CmhG69OuLQxFCxeXv5m5mjFFHVTTUs/J6uOPtLM
	vayOlbhcs9TijFqI6E9zN9M=
X-Google-Smtp-Source: ABdhPJz8ymQEzKlbZgSlCQH3JMUty5s84PXDrgEwBgGi3QZegb7eqXlMAqqcNIXxWW8gycHb2bEuNw==
X-Received: by 2002:a05:600c:3b08:: with SMTP id m8mr12268927wms.32.1629129574597;
        Mon, 16 Aug 2021 08:59:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/23] staging: r8188eu: clean up spacing style issues in core/rtw_mp.c
Date: Mon, 16 Aug 2021 17:58:07 +0200
Message-Id: <20210816155818.24005-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up spacing style issues in core/rtw_mp.c reported by checkpatch.

CHECK: spaces preferred around that ...
WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index 8de6af042156..8c044d3bb61a 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -595,7 +595,7 @@ static int mp_xmit_packet_thread(void *context)
 			}
 		}
 
-		memcpy((u8 *)(pxmitframe->buf_addr+TXDESC_OFFSET), pmptx->buf, pmptx->write_size);
+		memcpy((u8 *)(pxmitframe->buf_addr + TXDESC_OFFSET), pmptx->buf, pmptx->write_size);
 		memcpy(&pxmitframe->attrib, &pmptx->attrib, sizeof(struct pkt_attrib));
 
 		dump_mpframe(padapter, pxmitframe);
@@ -698,7 +698,7 @@ void SetPacketTx(struct adapter *padapter)
 	/*  offset 8 */
 	/*  offset 12 */
 
-	desc->txdw3 |= cpu_to_le32((pattrib->seqnum<<16)&0x0fff0000);
+	desc->txdw3 |= cpu_to_le32((pattrib->seqnum << 16) & 0x0fff0000);
 
 	/*  offset 16 */
 	desc->txdw4 |= cpu_to_le32(HW_SSN);
@@ -882,7 +882,7 @@ u32 mp_query_psd(struct adapter *pAdapter, u8 *data)
 	i = psd_start;
 	while (i < psd_stop) {
 		if (i >= psd_pts) {
-			psd_data = rtw_GetPSDData(pAdapter, i-psd_pts);
+			psd_data = rtw_GetPSDData(pAdapter, i - psd_pts);
 		} else {
 			psd_data = rtw_GetPSDData(pAdapter, i);
 		}
@@ -891,7 +891,7 @@ u32 mp_query_psd(struct adapter *pAdapter, u8 *data)
 	}
 
 	msleep(100);
-	return strlen(data)+1;
+	return strlen(data) + 1;
 }
 
 void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
@@ -964,7 +964,7 @@ void _rtw_mp_xmit_priv(struct xmit_priv *pxmitpriv)
 	;
 }
 
-void Hal_ProSetCrystalCap (struct adapter *pAdapter, u32 CrystalCapVal)
+void Hal_ProSetCrystalCap(struct adapter *pAdapter, u32 CrystalCapVal)
 {
 	CrystalCapVal = CrystalCapVal & 0x3F;
 
-- 
2.32.0

