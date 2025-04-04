Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A571F94C;
	Fri,  4 Apr 2025 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725038; cv=none; b=PNi12Prv+UG3pzJB8WMqmg2KhVDvHFGoNDjUFkPdYE00vw+xWX50sGjvgEhjXsZgvm96YSzrnOMJtx4NfRhGCi7bmkcHPV01FaBwtqC9n9Kr/57i7TRqIsB5+hgXsiPKiQLTGBauQQuKrZPcJccP1Ve5RooFERfbLGxjGzYSwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725038; c=relaxed/simple;
	bh=m2F57u8l9CcfwoMZCeX23UViyjA9E828q9pBgxiHLoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N32DlhNBRLpL9z5RCSUvmPDBybG7nn3Gx3gxXuI5kDtjYqkEbJiR9DQLSYgWcgJNpdiL+/buutgW7AjuISjnG7eS9gYrRbjx24zIPGjzeZqf0yWt8/KWkvdwP1eOesDIMriswezOsETljW44zpuNbrTK7KQpM4QAFI6qQad1oHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lONeSfJ9; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lONeSfJ9"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so25287516d6.0;
        Thu, 03 Apr 2025 17:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743725035; x=1744329835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy2OXo7NzZVl72EfjvZRrLBB8/XSbfcP58qqUv52zsY=;
        b=lONeSfJ9DsKkS3c+PizjvTy9Oy49htsJNzW/yGa7zdVEUUSK2TvRFP7quQI5pKEIzC
         XCSvlUHXk1CSCUKW1wt5VVTyttCtP+KpoliS+nuqUdcz29Vkdx9YRFNuhgrgYo+/FGPU
         6IEBooTnUkeDl975sR5XE887rwyeBnp5yMjtWGr+h/OsnT4qR1Jka3mHkImHyDVGVume
         e/+Ir/EWORShc1dzW/pD6mn6fp4ObckhhW75MRanZljbMECJ+jy6/BWRFC9SpyHi+DsA
         8X/6fR9N0bx3kGXgJrIWyw25lflMWLO12M9Y6bbtKy3mDWyQPshM0N7oQa3sBqRexPIa
         bnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743725035; x=1744329835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy2OXo7NzZVl72EfjvZRrLBB8/XSbfcP58qqUv52zsY=;
        b=SKDVYqCXD3eLtqnQw1/q0MqOrlrowR6BTuaz3BDNPAQvM2t3/FiWzFqXDGd+B0SfUf
         /MMnjT81v7bu8TWHx84PnGagLLdgBBgYKzHk+83DFEAu5NF/wP4Bi7h5dWduQ5eSRnnO
         OsYuz03dhBq17dmmXkIakIqLA4mJ1uODGOuJ9W2UCmJ5npATOrGnHnNDpuBPUH9iCAj8
         VuJkY/w7haK6ovZm6uSv1ccEqlBVIu/zG9yeejILncl2HgYqd7+3EMtmsT7YNFMm4c/t
         SrJBrn+nmAvueOX2lpQowOLHAGbjaSzd3FjGPTVAjO7af+lBbe0HRLR2CCg64HRFgovb
         pD+g==
X-Forwarded-Encrypted: i=1; AJvYcCVXMj815ex22LN7pJz0BsWBo2lHLj2YKVZ2CH52LjrzSbPRbEi+imnIPq1xLyVWb1H2QgPzj14njCLUdYI2@lists.linux.dev
X-Gm-Message-State: AOJu0YxXEMZKXdmsEPzlnKWHABjh2/K0snsAIkfzKNyuLeNxaYGPySEj
	yD6dnwElObwDpvOADMSdsnzjw56J7YldC4D8fyABOc3QHpcSkZds
X-Gm-Gg: ASbGncvSYZEr86jsAqsgKTojSzfoj4P1Suu4onXzMpFrKCyeKPneBTEVENnzhoxgACD
	pXh8FkSIcTQ8pt6SOUJ544C5hy1af6sUkI+yx7NplRxXs2pX7+BcUe7odHg7NtgivPTjs7inAks
	7ts53zthH/bKochlJF+ljl8eArTiDkr+QHppzPPoVEVnP2IMuYJ3UDOc7AUNGnBCoHS4NPIl+/p
	ayd+2kwLe/swGl9oBA2Rn/bBxsqxtW36hEJj2pEooA1DxLum2K483CHqmyqcf4kfeLWA/kBMn8Q
	oa2WSoF5h+Fim0PN+/XegYavm7EAUHIFPDPHpSNAijpVj3/T
X-Google-Smtp-Source: AGHT+IH0lE+f7I3vQYedfhF/yT+vf/DVVALZOAfOgkWOKX9NEf+lzxOG9vAyjG9SLtREfHZmKjQFug==
X-Received: by 2002:a05:6214:5086:b0:6ea:d604:9e4f with SMTP id 6a1803df08f44-6ef0bfc8138mr83897806d6.19.1743725035304;
        Thu, 03 Apr 2025 17:03:55 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea59acasm138884885a.75.2025.04.03.17.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 17:03:55 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Fri,  4 Apr 2025 01:02:20 +0100
Message-Id: <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743723590.git.abrahamadekunle50@gmail.com>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
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
index 026061b464f7..ae268dda4c4d 100644
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
+						(tx_seq + 1) & 0xfff;
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

