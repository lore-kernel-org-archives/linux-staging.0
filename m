Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB8B1119A;
	Sat,  5 Apr 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859321; cv=none; b=nd6AeFBZpfS1xQi/Riym8W4Gqz/ahFZ9EbacjNViprORaWpowS91uYAabHvu1MR5M78gSdcOxyVW7qw49KdzkkShZkLigI7hjfccSSXGzT+AtnyXKefYUZU/jad6eelCw6AuSGabaBW2Jz2Q0GzV7RAHX8HdrRgT+Mq6XG7giuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859321; c=relaxed/simple;
	bh=AcXfO0TA7CuyZGUY7wAR0A6TkpZyJhEUtb1u7nKFghg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIe1cY+9ulKbO2o6TQF78luOYpx1+hsPKHkP1La2kySCEZss11OpNwtwxUl0XRP9MCPeMkECKLmfxahdq6Is7wxH35e7lQAsc8pf3EyTOMP7hbKaxcu+J2xqh3DzkB2c7aGUmNZ4GCa9Vd53VN+B/WmDd4IrzoffuHQa7ndNgu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjCO8Hs6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjCO8Hs6"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab78e6edb99so424769166b.2;
        Sat, 05 Apr 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743859317; x=1744464117; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1GAF1aPCvVcJSW85GNnW6pXEVSfQN39zL3/eF/KMRk=;
        b=CjCO8Hs6wkxML3B+X7ZM0yZvNDHI0Yy0Gc+4Mr36rCH4oGY2EZFBp8vDAc4l0qgCrM
         hfXXPEDjo4O2tsuC5+sesBqsIFMqd9Z64mKlIHPkUMt48SvL/YWdsWE0OLAWxve7M/B8
         LtQdL0gAWc8Sc3x3bSOK7qSa4kcUpNidumGjJ7o781GrMKUUaKkDdqipHnfaWqLaYNwa
         GUzukxK7cBUw//kX1i38F0io1V4MUjpZe2yWa22herquOBI1qHKWWVEt81JRqxGCRtEL
         v+TDYixlcsrkyuShAqMaWYfro7QlaSzNmWMPvrfcbqSK1gY/CpEIgyH+o/NxIACTX3xy
         0IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743859317; x=1744464117;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1GAF1aPCvVcJSW85GNnW6pXEVSfQN39zL3/eF/KMRk=;
        b=ZAQestncakG/65q4DDevu3CxjrYpBnxUzqA7no507iHkgtrLSMd0q1e2QhWzVCOVUE
         AEYPGc/7OAcqOFTLLY5/m1UqhrnJkIKWzLN7/ncIMR3VLoPR02UUNMThwh3IdD5HYuB6
         PR3uRGh1iM47N8yKvZRVZ5pkJR+o3Y8u/OTR+szk9Yy+Xu5tMuGh4dij/uUk39IEQr97
         3xjiYw3NOAbxC1CWMDBB5wygUwgoY9geQtQtiISzsYaJ18vWArrKZm9xNe8UUf3GKGBN
         K8tVJs0ih4+y+OTJSwDjpwsIgzIk8k/kq22HCfmSVE6hUfYxsIdwAcufy2Ej3nkKysQW
         VNGg==
X-Forwarded-Encrypted: i=1; AJvYcCW95x4jDXZRY4aLEDse4JS6SBEOFoHsD3qn9vMxufXFRC/PKNjCehyzDL9gFgWF55CUgMPLUepVzYU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz9zw1NjjKhMw/2Q2YRLSJZqo7mLH5hZdL0Ro3op7yUVO2HpRd
	rwoH/UgbLXrQqA/bRR7HiXyRVhpCd7zFZtkSWtU7ig4JqBOnBowp
X-Gm-Gg: ASbGncuQNcLbrh2XD7yaALmLXw/1eqkMB64xbZgO4Ctoo1o7A4s9CpFQPHeB+hItFaq
	xSRH04iPTt5xXl9hu0q3Mh0dV0xQzCtEhcEQzxqKwoTCfjMbXLC3KsaEMLyTzoT0EUyVw9vxIP7
	p9qXvVlicygzKMRaGTbhMNirpd2yaIizmF/y8cZawzLHKassxfrY0lCy5YJV+tcyAMpFOuJoL8z
	sWQA8aDhKsFdtEgbd+37mibGCd6hpLAchGjNdHqcnHEkDeyi35DBKb0OM6iPKA65/UvSXM60vLw
	9+HIshVXOZrWtJrTZSfu13jkNvILc8QHvYKzDMs9F309I8HEaA==
X-Google-Smtp-Source: AGHT+IEuJ1jCs5lLbeZPk7dMSX7AGKDeD1AsWwl/QLtrHRYxpxUMnE17PiDNTeDM7alfgQo1hpW+oA==
X-Received: by 2002:a17:907:f1c1:b0:ac7:edfb:5210 with SMTP id a640c23a62f3a-ac7edfb536dmr165647266b.20.1743859316998;
        Sat, 05 Apr 2025 06:21:56 -0700 (PDT)
Received: from HP-650 ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe996f5sm427498966b.64.2025.04.05.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:21:56 -0700 (PDT)
Date: Sat, 5 Apr 2025 14:21:42 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <Z/EuZuvGyQ9QBl6z@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned to NULL.

Remove unnecessary duplicate NULL tests on the same value
that has previously been tested.

Found by Coccinelle.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changed in v4:
	- Separated initially integrated suggested change
	 "use modulo % 4096 over & 0xfff" to a different patch.
Changes in v3:
	- Changed other cases to use modulo (% 4096) over (& 0xofff).
	- Modified commit message to reflect these changes.
Changes in v2:
	- Dropped patch files for media drivers from patchset as it is
	  not meant for outreachy applicants.
	- Added full-stop aign to text in commit message.
	- Made code more readable by adding a line break.
	- Changed cases to use modulo (% 4096) over (& 0xfff).
Changes in v1
	- Patch for drivers/staging/media/av7110/sp8870.c and
	- drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
	  is split into two different patches in the patchset for use by the different
	  driver maintainers.
	- Added subject title for each of the separated patches.
	- Patch 1: Removed unnecessary curly braces {} initially inserted.
	- Patch 2: Unnecessary {} was also removed for v1.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 56 +++++++++----------
 2 files changed, 28 insertions(+), 30 deletions(-)

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
index 026061b464f7..f817cab2f831 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,35 +941,33 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
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
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+
+					pattrib->ampdu_en = true;/* AGG EN */
+				} else {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+					pattrib->ampdu_en = true;/* AGG EN */
 				}
 			}
 		}
-- 
2.34.1

