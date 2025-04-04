Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA519ABD8;
	Fri,  4 Apr 2025 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756694; cv=none; b=oAV3/D/riNKi4/J5ykGl2J4CUlrWrwICqqsBhWPE4JCxAJUSkrouXxZDZyNwc79NcNOFDprmShr2MtBNqo22ZeLFyOFcChQf9YO4cGYFsnKiXlCNhtqI1Dk6pODwm8jdA+QgNryUQk7LuilfYpLp3G1yFAEsIkX+VQlbH5Vyvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756694; c=relaxed/simple;
	bh=zEAYc6CUru9160TwzSAfQDtqLP2BDdJuSBYJBKA88TY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HYPwjrBSgWeg3PwJFR1KUqQ1mUBLO0PnkPwGvQsat/5LhwmN6aymEK5wyBgr4MrooOURoQTdPYbTNN71PRZ/HTD5WkfSNAeL8ayadhqGQnefQ2taa2w6A/9bgg1guv0agENbHVVP/2leAEpXfSOmcvaMGocmKxYmC4iDTT0REjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcuiYku0; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcuiYku0"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso3481175a12.0;
        Fri, 04 Apr 2025 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756691; x=1744361491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez4cJVuEZuHb/3XDGnXvrUc45BD7UNtT/aBP82N7MgE=;
        b=lcuiYku0NuadPlN6xIhIGSN7UpEE+9Cw3di1CSLstuEqzY4V4DY+EC1Dr8vaQjKmwk
         80/7y9dD2OLhmly8C4lv1uEAblAPpOufhykplI/ghYFCstyMDe3IQGaIj8dWICd/t6h2
         bnBuZR1GlLckpCCKtGfG+SQdiXnvnryar5R6WB3suke8GwjRUHBPjxKGRCO4OorFp7ZO
         LJXXmEs0MdhFXuMc1HN/hGH/wmunNnRYZyw8i1dAyg6G3NWlGDJI1KvRj8lyrb4ujH11
         NgJZrhJ4dLh/WrT8hOgPQp8NozIvVaX/zZyM0AXvNnAjOc07DDG4qNHPdolyI1aCPPso
         LKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756691; x=1744361491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez4cJVuEZuHb/3XDGnXvrUc45BD7UNtT/aBP82N7MgE=;
        b=Nej479DXGnh49YfJuzyVHXGhGkYkLAbUXcGwvRqC0fD6af+RknSpbxGyBx7/AHs3zn
         rxtuy8plnN7PZWz1bamn7Yf+e8Qi0qt2mQSF1B8JCcph1vPuk9kjOEx7iUfi5phdCEMx
         rOQu0PTcksLOuFD8GyVIg9gMhX/xeroyF2kOWLzBPgVgAKH7EEB2DXjFzainxXuM1ArJ
         HJcGbdsl0zq5ME4YrTdg8wqMXEu1/oUDQc3qm7LzcABqvpMYsrx++bj3kiU2Hdrj7BHU
         UeDGMxLU4XRAh+by+3ahmYn+NqOScNrNcYGEKubdadtkK8YM9yqdfLj4B+nu6ntaFeXX
         3uzg==
X-Forwarded-Encrypted: i=1; AJvYcCVYPgpUMUVbn8sE9LHfvJUqZC0oXU0GWltUixYJ3OJS6xcxiyZPgd/yxOYEDOn1vFoxFz+ChrQIeJ3N5z9Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzTfTsCyxiYec8ArWb7okRheBObwlvHxcPCiRUDQ58Idn9WgAUl
	m2y7xTbHm4O4N65R/DKoHy4pHSr+PnSRs8ff6AiDPLedrSeJVy2Xp+qNJgG1
X-Gm-Gg: ASbGncsiYb8W0LgbQpgqXk8BbkDPhDCswHaVISl0dq+ZoFvRlgN+pUGJq2LPM7B2O5h
	jX7EyZLb9Ds22ixB71NEV1IGG0cz36Hq72lO6RuFF0NaCmPBd8Gw4W/GLmjOcypqiHkLgVDiibs
	A8f/oHgp4jAUQhYxN/bZcl5Om49iMKS2ldNKm35Pozzzh3gsk9kM4nmJ2IX/7fACasn/lRMqxE3
	aKZ5hafa7DMYUZGdCQ5KdknBYu7y8GTLENb6MgV+8mO2nZ0fjKEAa2rdlvPyz2WEeaY0yfLE3iy
	HHE2YIm/O9RPzfX5V2l2h6CEhOlMep6wsReYCCqsd9dw8XBS
X-Google-Smtp-Source: AGHT+IGUtrs7aTeX3HSO70dnd3bxe+iIXgEVPYaAB49NmSVLfuqhqySvhJDzCvnXs4FV15RvyNLNzg==
X-Received: by 2002:a05:6402:2811:b0:5e5:e836:71f3 with SMTP id 4fb4d7f45d1cf-5f0b4702134mr1805964a12.29.1743756690391;
        Fri, 04 Apr 2025 01:51:30 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084eecsm1954680a12.57.2025.04.04.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:51:30 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v4 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Fri,  4 Apr 2025 09:50:21 +0100
Message-Id: <6852a0c603010345d646a9d1bba06631ee5c5cbd.1743755621.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743755621.git.abrahamadekunle50@gmail.com>
References: <cover.1743755621.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

While at it, convert '& 0xfff' cases to use modulo operator and
decimal number to make the upper limit visible and clear what the
semantic of it is.

Found by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 58 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90966b7034ab..675226535cd1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026061b464f7..bb806f00f931 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,35 +941,35 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!(psta->state & _FW_LINKED))
 				return _FAIL;
 
-			if (psta) {
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
-				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
-
-				SetSeqNum(hdr, pattrib->seqnum);
-
-				/* check if enable ampdu */
-				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
-					if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
-						pattrib->ampdu_en = true;
-
-				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
-					u16 tx_seq;
-
-					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
-
-					/* check BA_starting_seqctrl */
-					if (SN_LESS(pattrib->seqnum, tx_seq)) {
-						pattrib->ampdu_en = false;/* AGG BK */
-					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
-
-						pattrib->ampdu_en = true;/* AGG EN */
-					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
-						pattrib->ampdu_en = true;/* AGG EN */
-					}
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+			pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
+
+			SetSeqNum(hdr, pattrib->seqnum);
+
+			/* check if enable ampdu */
+			if (pattrib->ht_en && psta->htpriv.ampdu_enable)
+				if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
+					pattrib->ampdu_en = true;
+
+			/* re-check if enable ampdu by BA_starting_seqctrl */
+			if (pattrib->ampdu_en == true) {
+				u16 tx_seq;
+
+				tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
+
+				/* check BA_starting_seqctrl */
+				if (SN_LESS(pattrib->seqnum, tx_seq)) {
+					pattrib->ampdu_en = false;/* AGG BK */
+				} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+						(tx_seq + 1) % 4096;
+
+					pattrib->ampdu_en = true;/* AGG EN */
+				} else {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+						(pattrib->seqnum + 1) % 4096;
+					pattrib->ampdu_en = true;/* AGG EN */
 				}
 			}
 		}
-- 
2.34.1

