Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820C22144C9
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990955; cv=none; b=VbV2Ur4FqVsymvwmYiwwp/RO6SUDLG2HyH9yvo5Kw2qPStvOiGlArZSaNOFKDt1T90tpeqddBXmJRb83cA/TAVsH2MmLUXEBiU/XEgZPQtqlqyCrOVAQGKgYMj8FTNcHtSTly8cDanFWzppDyCMTxPbXtlu/AdVIwuTSCe6nBF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990955; c=relaxed/simple;
	bh=XN+T+IkvJggXj9Swo5iUj1qdDIdgJXo1aU/u1V5AHVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G+VAx20EJ5XvyNkS/9+AQ+s8RSVoYe0Z5qnfKm81arq/tgyW2310mXCu0s7wfj0uxPGRgxIAdQM3cAizaGI+CefCyNIVRX7F0zjVWv0yLz7vv42Ufr1u/gFmBd4rkrA+2YAyw0ssGxWIAPNdaivuCtuXIVntPvGX1UkVyIJ0TL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfePZ3fV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfePZ3fV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2130621f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990952; x=1745595752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htSaQaI4/FFCqvjkgCzgCrUNDaBh6027eu+lTuEGohA=;
        b=CfePZ3fVhoABoZxOJqccfrPzvDd/gjJVFZlx2PiA/cSl/p84gLel90x2O17qIi3Cb+
         zhgElMrXYs9GJhJThbsp8PW0bJaMfwjphNW8uQWOFKDYyk8bijAldX+QtOWCrhz0lPLP
         4ezZ1TGFUIBQWmrAfKF+++sFk6shAqs3dlx7OrFryiJgokBz5WZ6gVy6+Tx4+cz8+00T
         aq1FExDTGgl+L5K/ErmdOGYbmQZSvxqxUB69skHAsf4zgEownzNYejqjqaGxbFdi5vN6
         1mDJ+A5x33QTqksGMVJTcs6dhkpqjy+JPUIiM2agKhD8lXFraHsYq+tFOaBypH0ahEW7
         lOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990952; x=1745595752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htSaQaI4/FFCqvjkgCzgCrUNDaBh6027eu+lTuEGohA=;
        b=RWvgDwUFLYr1LpmuhGWKke2//Y+XcQHBw+gUQyBQSHYlu6Fyu9opdh5Jcigt7WyEys
         1WIeoEbcs8LgjW8f5FYhAAKFluz8/efgITwaRORGAjBrOxt0NbMDEM4FEM5PKSbGAW9o
         DMHdqENw3Epa2MWO0euHNWApoc0jZcsguPLclJJFOwq8edV6haRmq6VILLGSUVCa2JPi
         vdgB69dWoOlcAj5eXRltBcAlJoGwJLFtBAFNfkL/+4yqSWSDpgtgjxKJhXMmtESKUPvI
         9Zkji4ALyydLEpnurKU3YlVIrdLqzXkI+E8BWFxce/75aIg+b3Ga7lNOBSZzDTInYcSy
         DAow==
X-Forwarded-Encrypted: i=1; AJvYcCXkDr5NYDzBu/m3nWUlnAZRiIbiBG6BmenG0s4bnqaIKN7ZnkyIKa0jkGEDVvW6FBvPACiViWHT7mm5gpfS@lists.linux.dev
X-Gm-Message-State: AOJu0Yza9Pik2+bn9/rPn5d4ZTmjw4xLuKNLsY6wiSpldDmS9DdL5t5g
	rUrwSxkohnTUG94iO8arj6MLMfpDW0VpDJLFMEsp1xITeniHzfby
X-Gm-Gg: ASbGncusp1+nJC0IRWGZ8U0d4d/kGmaz4dRz6QY653wS6jvuqFlHSL+EqeBOonXL+s3
	H4pP4jhoIFdUYWpG3RePKg+aF3gkzDzEAO4O/wtSPR/FnGcDgJ3dW+JTVIKbIZ4m2e/M9D/Oja8
	zkE3qrQfCOfUxVFXDyyo59HEmKbm20CQ4VGk/ljcbyHdhUb5ntPmwjsaPccwtXVWefEJt7+x4ne
	/5+nMNNPuoP0yhij6g4gBSw4b6f6ofX5MxqIh1gm5rwo/NChiBLlD3hnptG5RXfAnxl8j+WQiLr
	+Z51UfY6EGAdzrZhTh+bUQwOO3YL4SuE66CdSw==
X-Google-Smtp-Source: AGHT+IETyRTaWZw7ZEo4TVrhWkWANh2w+Mm+nar+iKlLayes4bAJB8t7DodCE4kIrI3378ClobRYKQ==
X-Received: by 2002:a05:6000:2582:b0:39d:8e61:b6eb with SMTP id ffacd0b85a97d-39ef89b5f2bmr3570563f8f.1.1744990951674;
        Fri, 18 Apr 2025 08:42:31 -0700 (PDT)
Received: from ubuntu ([102.88.77.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd5fsm26850155e9.22.2025.04.18.08.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:42:31 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 2/2] staging: rtl8723bs: Prevent duplicate NULL tests on psta pointer
Date: Fri, 18 Apr 2025 15:41:57 +0000
Message-Id: <4fb8314f1ca4c273a1f2c2f648c7993d7708224c.1744990405.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744990405.git.abrahamadekunle50@gmail.com>
References: <cover.1744990405.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The psta pointer had previously been tested for NULL after initialization,
as seen in the code below:

		psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
		...
                if (!psta)
			return _FAIL;
This makes a second NULL test on psta unnecessary.

Remove the second NULL test on psta to avoid redundancy in code.

Found by Cocinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 62 +++++++++++------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026d58b4bd7f..e933ccda1b39 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,38 +941,36 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!(psta->state & _FW_LINKED))
 				return _FAIL;
 
-			if (psta) {
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
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
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(tx_seq + 1) % 4096u;
-
-						pattrib->ampdu_en = true;/* AGG EN */
-					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(pattrib->seqnum + 1) % 4096u;
-
-						pattrib->ampdu_en = true;/* AGG EN */
-					}
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
+			psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
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
+						(tx_seq + 1) % 4096u;
+
+					pattrib->ampdu_en = true;/* AGG EN */
+				} else {
+					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+						(pattrib->seqnum + 1) % 4096u;
+
+					pattrib->ampdu_en = true;/* AGG EN */
 				}
 			}
 		}
-- 
2.34.1

