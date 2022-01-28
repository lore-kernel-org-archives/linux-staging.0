Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765E22CA0
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 11:54:56 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id m11so9317328edi.13
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SAICPtOKkXNPySvhlzztTjQEPYjaeld5HVh5aAe14Us=;
        b=ELF7zql3+BK+pc8iY8fZsC5TPQXk2u0WWd07ZSkZK0RRnYEwQGCup+X1SnUiOIDQ0p
         TRI0IdyDqg4LsBisPEH1cW6u9qBzSRx2d7xBd+qrJvb649K/y3ac61kQO5kqH28WAlAw
         g0magaqsiYU2edNk5FtohL0Dd1eCB/MHjS2Cp06+OVZooDypF3qg/lx0IKdo39/iVwTp
         sZV5fUpNfMsszxuPKAkb45R8c/0mhB/plSah6CV4mxIjR6qbmX+gZc6xYW5se2ZkMgpJ
         GfY5WgRMyNP11bXHcpB3Cu9WCpQEHu1HfKeJwgJcoHEVQ3keBdaTLtcrUiInXpHTnXPX
         x+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SAICPtOKkXNPySvhlzztTjQEPYjaeld5HVh5aAe14Us=;
        b=oj24lCtX7VZuM6kFRYKOHylxM4LQUZK9SJt1bvcFLhsQg2rVSwm31upolIogd+l+xF
         L9rNrgEy5uuq+wkLFltO+nVfYP3CkcZAOWLh0fgk2poPw1yVCAryNKkFj0Jk4ul1hEv1
         8DmAvlGAr7nI2v8PXf2e+dNEwIjKtFYejmALm94EhKMTyLN+szYkYWm9M/BB1MiYWPp6
         U+xTH0uF+WVh4qMJQ69SuUHxhTEPkoyxcFq3XRcTjTU/xRXtGjuB166dbkWohxDetZw/
         rfeLaa5wLv8fEveoQ1ur29ENcjA6bQvfhqXhXuOnGGR+BrUuSIAN9HVxCp2Z67Pmqkb5
         x+vg==
X-Gm-Message-State: AOAM5307C01Gy0CGQ/DMQamI3YU6Oxd9ubcVuDv6CjGTJpUKGffPBB7h
	HMi43ilEuWI8Zd2PmwumYO0=
X-Google-Smtp-Source: ABdhPJx9fz7Xm+Aui5YR3oZYcZrHhbq6GbrvD4/D0AW7K3PQY5FD/o/jBTnd3hWXVez0nhoGl1o48w==
X-Received: by 2002:a50:ee97:: with SMTP id f23mr7846690edr.31.1643370894856;
        Fri, 28 Jan 2022 03:54:54 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id h20sm12494261eds.9.2022.01.28.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 03:54:54 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: rx_packet_offset and max_recvbuf_sz are write-only
Date: Fri, 28 Jan 2022 12:54:40 +0100
Message-Id: <20220128115445.6606-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128115445.6606-1-straube.linux@gmail.com>
References: <20220128115445.6606-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variables rx_packet_offset and max_recvbuf_sz in
rtw_restructure_ht_ie() are set but never used. Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 4 ----
 drivers/staging/r8188eu/hal/usb_halinit.c  | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 3 files changed, 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 6533a7babb65..094885c80a1a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1901,7 +1901,6 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv		*pqospriv = &pmlmepriv->qospriv;
 	struct ht_priv		*phtpriv = &pmlmepriv->htpriv;
-	u32 rx_packet_offset, max_recvbuf_sz;
 
 	phtpriv->ht_option = false;
 
@@ -1926,9 +1925,6 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 						IEEE80211_HT_CAP_TX_STBC |
 						IEEE80211_HT_CAP_DSSSCCK40);
 
-		GetHalDefVar8188EUsb(padapter, HAL_DEF_RX_PACKET_OFFSET, &rx_packet_offset);
-		GetHalDefVar8188EUsb(padapter, HAL_DEF_MAX_RECVBUF_SZ, &max_recvbuf_sz);
-
 		/*
 		AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
 		AMPDU_para [4:2]:Min MPDU Start Spacing
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index cc8f8c7d0734..d654d2f01c78 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1625,12 +1625,6 @@ u8 GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable
 	case HAL_DEF_DRVINFO_SZ:
 		*((u32 *)pValue) = DRVINFO_SZ;
 		break;
-	case HAL_DEF_MAX_RECVBUF_SZ:
-		*((u32 *)pValue) = MAX_RECVBUF_SZ;
-		break;
-	case HAL_DEF_RX_PACKET_OFFSET:
-		*((u32 *)pValue) = RXDESC_SIZE + DRVINFO_SZ;
-		break;
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)pValue) = haldata->odmpriv.SupportAbility;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6728cb506303..726e60fd7273 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -76,8 +76,6 @@ enum hal_def_variable {
 	HAL_DEF_IS_SUPPORT_ANT_DIV,
 	HAL_DEF_CURRENT_ANTENNA,
 	HAL_DEF_DRVINFO_SZ,
-	HAL_DEF_MAX_RECVBUF_SZ,
-	HAL_DEF_RX_PACKET_OFFSET,
 	HAL_DEF_DBG_DUMP_RXPKT,/* for dbg */
 	HAL_DEF_DBG_DM_FUNC,/* for dbg */
 	HAL_DEF_RA_DECISION_RATE,
-- 
2.34.1

