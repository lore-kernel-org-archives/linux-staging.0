Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EFF24CEFD;
	Thu,  3 Apr 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686877; cv=none; b=BkfTM5K41nlopxEnnrlDnfl+Ab+1MrrXESGnByN+j4xLQY0ntCUzbSBdMKJdNAe6X0xhuDZsKRZvnVAd1kA0Wm0xzB7rq8TlKZyriHtCHbtALVKf55FCSaM+aLgGeLaOxIqOkYxN1fto/bYtjTNlj8VHi+oNlSGHEeF+EqFnsis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686877; c=relaxed/simple;
	bh=TppPfz48Zffja+0eAECqj/ufQLq2W2xqDiyamIDS1nk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eCNXXg7R4YpUeIWe+G12NPzFSR+JjUqeKznbqr+lGv7/s6YM5Uz5j4TL7ktw/Yh1vw4gF+YO2PJvxI1t1r9A/De1jHgFdcJrePzXERbPeeppYMNMvXWei77wpVaK8B74uI0E8SK8OYNQkCC9Y0Gn1vpVwindY6uvmiUfihKBjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrqZD3uB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrqZD3uB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso4083715e9.3;
        Thu, 03 Apr 2025 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686873; x=1744291673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYfbRwZUzQz04jJUerlZh/Bqaam70D9SFCg8UAJdhY0=;
        b=FrqZD3uBeHLdzHW887IFhFCwKGzf+TahcViv9oYil3UDAjH5p+SRgRDjUYhJ0pbZq0
         Km/GNxHyLhSbtJz5VrWToN7Vil1FopA324DuVRJIfDE2YttJeJvgK1UQbLJy6lMqWbDn
         VhN3IuRobpIOActS/smhMSLAL/XU2rEE+lOBzrZAyVPrNc9YKZjv4KrVgWA3GsW1A5cb
         adkuD1Hm7kBfxN1Yy4jeFDrIzDcSdGJRKG5k0VyJASPaOSor9fXXnJwOHxx6iaBjGxAg
         VeWYprD9xY7pvHwqDuL4vsHhxUoegmpt6JP5wxIDoHgQKdT86Oul4F0/KQhZMO6KtIGr
         HxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686873; x=1744291673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYfbRwZUzQz04jJUerlZh/Bqaam70D9SFCg8UAJdhY0=;
        b=mmcAyV3W5vBszJxokaYQs4GC+KVhdzsEYfQ8lSH39PNwfSsX+hYp20mnXHj5Ay/rwu
         JEgiGLlmCT5ylYA+nqVZENN1n5gCiH0EoSY8EscfWqnv/6UUoPSbGIE4FRrLJMgtu/5Z
         jXT8v1KELYDOhuKtpwJJMr0C4zq7QfTHqM8soPcA5mrdMmXdbbnfnRYeh/H3NXuvxU/w
         iPHFxT2unapOyPqigvFS0CcPmM8NQZ3uwK0qBshk+4LF3VcfAAAzGV9Fu+NUhVIj3wjo
         bW6YrRYrCJMXg5SqiqC03Z1+8lJqsB/bGUb6Ah4gB22wDjq+0TGM6W6IZF88sVzCttps
         CRFw==
X-Forwarded-Encrypted: i=1; AJvYcCW3xDEMiRTOW8t1FRWo2yVjQtRKLyHtM4vPueJ23QXKG3eGPCV6QdqGoD31bT7wwy9l5zJ4WMm42NxGry3N@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4g8u8vD33h49UF0BH6jM4wMzvI2KSOKiithZDhY4oWUEyZGzJ
	jbA86ENOFi/VFyI+uc6AlHjNLAH4pzDZ8Wn7qFKhiecH+QH08fUMT8fYRHAv1co=
X-Gm-Gg: ASbGncuywnSvGrDKYWkp3WNH8QuS7gmPToublVKFpIH/F7oKu56tdHYC0lZITLmPE4A
	L0FMXRuY/xnE55SEt/cqjzCYBO7RtY8GiqOvN473O8vdUnVq14Lx/gzrALSkWnI8eU1Dpef6gjQ
	Fj64wNL5CpX8E8HQ7FEFHqfYHUstY+S5TW+he1Ct7IBDUaqoJIbwtaq0nhjvnBc9OyYNedNuQXW
	fkPE+q4MwQvALUiqZq+NoVG9xe4xWlZ6QHYsrKa1rEzLCPfrwjLOrnB1sEN2+5+Vgt2TXqb/auM
	G8qFbqc7ZutcdxQtogBk2mSM3v/mmJAML32MyrbfQ8U=
X-Google-Smtp-Source: AGHT+IG2whMe7p+lHvWAbm/G2Q6XIeZ+yTcqJqi0mfB5DqR5mC79MruKtdqNX9IV4WY/5SQ7zodhcw==
X-Received: by 2002:a05:600c:16d4:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43ec40eeec7mr15115695e9.7.1743686873298;
        Thu, 03 Apr 2025 06:27:53 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm18242925e9.25.2025.04.03.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:53 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Thu,  3 Apr 2025 14:26:43 +0100
Message-Id: <1325d06f5a4eb18eb52eb20d5af89207504c46b6.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743685415.git.abrahamadekunle50@gmail.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
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

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
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

