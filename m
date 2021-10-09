Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E92C83
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 06:01:00 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id s16so9984252pfk.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 23:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=C9X3+JbpAnm1664JqZK4rRwcWBLzpjufr2U1bouWSmk=;
        b=FTTAtN3DeEC4upmCz/vszJPmcjicDqXFKELIJgrzO7JVhy5N45E69h2lQm199jlEDU
         KrBZY3jLaEi2EzWTHOg/BKGvlbq4L5u0UNRrlYDFG0ja4dkObshzQG/nNQLWg755hIMx
         QxWg1OruTArVOLMLHMCbYc15jiabuEZXxyzmpLF90/EoGlypomvimx5Kxkow57bxslWJ
         o2InJdlHmGU9zPcyfd4mbpZmK8a6pHzF/OxXBzBWYyC01EDpPLXmF1gjXvxQFypOyheb
         0oIClNY9E+Ng4UzpfGxCw0i4bjPlzlKaDFv/FCYCHvpyxf1t7Dc3yE2+RK54Dqoj4nmd
         DmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=C9X3+JbpAnm1664JqZK4rRwcWBLzpjufr2U1bouWSmk=;
        b=0p1/LZelmpPwyaNniUKFTP3W/QYlg8DlbszgNA5eN97QlQm0R74jqnABVWe8a0WwGq
         YjYL7W7Mca5B3Ct4pW+Ugs1EQs3NueTaN5DCIzbZjF/+7cKXZ/qdUsbBmuHnwTn221yO
         IDfU81yDd0cnoiYnEXVVpKAnL8RsOXx+R9J5/sQAOaO6RQgzb2RTtxz4ECkHa9o20xW/
         jp9wcrioEuSkKoydb64SN7OEOA6xfHZJOgAciQaFkUJYvSWqMJ9XQq/SMm09FM6M5g58
         jdyr9x7Dy41CZsY5SQ62+oICG3V/ruVygWX5GAst4uMJs/X557sf2Q3u5cSLS/XCY3OZ
         6dnA==
X-Gm-Message-State: AOAM5325FtOJ9F4hwRxdmuHEXm4PMPIkVWet8RJhIkilXGiSNZjBj1gQ
	nb3s9jkSPHVbWFFOFYBgivk=
X-Google-Smtp-Source: ABdhPJwSCln2RNPMu0VQ2AflnAWkyAXMRmS5nSs0u78nnEg6Nw3wb3rLKn5qs9VPpADtvJAlVq8yyQ==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr8261555pgh.190.1633759260137;
        Fri, 08 Oct 2021 23:01:00 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id s14sm1011264pfg.50.2021.10.08.23.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 23:00:59 -0700 (PDT)
Date: Sat, 9 Oct 2021 11:30:53 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, deborahbrouwer3563@gmail.com,
	hdegoede@redhat.com, marcocesati@gmail.com,
	saurav.girepunje@gmail.com, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: simplify the if condition
Message-ID: <YWEwFf0YMi4W1xKN@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

if psta is NULL, function is returning with fail. On next if condition
again checking if psta is not a NULL. Remove multiple if condition check.

Function is already using goto exit statement to exit.Replace multiple
return with goto exit statement.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 61 ++++++++++-------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 34505b35a7f3..4e4a1bed882b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -932,49 +932,40 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 		/* TODO: fill HT Control Field */

 		/* Update Seq Num will be handled by f/w */
-		{
-			struct sta_info *psta;
-
-			psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
-			if (pattrib->psta != psta)
-				return _FAIL;
-
-			if (!psta)
-				return _FAIL;
+		struct sta_info *psta;

-			if (!(psta->state & _FW_LINKED))
-				return _FAIL;
+		psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
+		if (!psta || pattrib->psta != psta || !(psta->state & _FW_LINKED))
+			res = _FAIL;
+			goto exit;

-			if (psta) {
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
-				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
+		psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
+		psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+		pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];

-				SetSeqNum(hdr, pattrib->seqnum);
+		SetSeqNum(hdr, pattrib->seqnum);

-				/* check if enable ampdu */
-				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
-					if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
-						pattrib->ampdu_en = true;
+		/* check if enable ampdu */
+		if (pattrib->ht_en && psta->htpriv.ampdu_enable)
+			if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
+				pattrib->ampdu_en = true;

-				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
-					u16 tx_seq;
+		/* re-check if enable ampdu by BA_starting_seqctrl */
+		if (pattrib->ampdu_en == true) {
+			u16 tx_seq;

-					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
+			tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];

-					/* check BA_starting_seqctrl */
-					if (SN_LESS(pattrib->seqnum, tx_seq)) {
-						pattrib->ampdu_en = false;/* AGG BK */
-					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+			/* check BA_starting_seqctrl */
+			if (SN_LESS(pattrib->seqnum, tx_seq)) {
+				pattrib->ampdu_en = false;/* AGG BK */
+			} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
+				psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;

-						pattrib->ampdu_en = true;/* AGG EN */
-					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
-						pattrib->ampdu_en = true;/* AGG EN */
-					}
-				}
+				pattrib->ampdu_en = true;/* AGG EN */
+			} else {
+				psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+				pattrib->ampdu_en = true;/* AGG EN */
 			}
 		}
 	}
--
2.32.0

