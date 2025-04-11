Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E0281347;
	Fri, 11 Apr 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400487; cv=none; b=ha0ht3rWVDX7sQsEA43TlsWYoljE/Gg+sI/ikNJI5NEkO/3Kibwdkw+ElAO3zRQh05v+xSgGo5K0VbcwaiYykw7s4oeLROusNYRLrsP84Mtf9mFNvJ6c9eDMnAi8I9UDRo3wEpD8K1KaWa+Q7N6nxdvtjxFGRa7k7VBB611iKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400487; c=relaxed/simple;
	bh=DxkK3p7GrM5By5DQbHXpcXd6g3kGREUwSwYkgTkB/7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMBwRl7/NRTIIvN4z/65zby+ae0bZXLht5KsBnjV06JPYjRadfLoPmjHtSxyWw8fkcb5Dz2iwTDQBGlotPiKi8OWR7tH/knSPZYOTgHNdOGoK5a7Gh1ZHXEeqEVrfdyc0znUYJHERQRw3uaOToU6kGTRdaXS+D16VLYR2uZx4ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxIyP9Sy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxIyP9Sy"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso4197249a12.0;
        Fri, 11 Apr 2025 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400484; x=1745005284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdfbOR1zA1/kD6+1UpkaIMBm10oYcWCdLqCqPrs+E94=;
        b=VxIyP9Sy/ZtLfMhSE05dmOfO7EXNhap6AIwZbN8wb0s/jCvRzvFvJ1X/QgBTfbPlAl
         4wx831g2CYl5JHfdThKkpu20fq+cWJwhwz5jgVVOAAa+uZWySqlqzv/f4ygcNxp5ellK
         b6umtCziZgr4sVAE6Bd4/C4LgqX5pLHg/N/g7AHQGj9KSlI9u+NUh4BrtdI7DB3IU9y2
         BWLH3vyD0tCl4UGDJgBM3qjVHRGnPcwHvPg4apEHis4uJwYCr8on+Qyl1LGz5s37fjnv
         mZQNUvYmS0eZ2uQMjvYxyr8c30yIOVMl9ys2xqCBnGUA0WTg+HDXR6O53J4tiLWq2qfx
         +JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400484; x=1745005284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdfbOR1zA1/kD6+1UpkaIMBm10oYcWCdLqCqPrs+E94=;
        b=pGukeKCAWEyNDHlCcNl7R5zDrNIMxuCWg83PRMtPa1TLU80E60YaPuELJRt2cn3DBV
         ji++wwRrAtd64E/K7ScLrUy90ca7zZQEEbp5spjhA+uDUURLRBKSejDIiMTbQZTEFsOM
         JFKDwp1wMEWp2l5qXntLBbsL6cDmj7CXxJnS/nAuoRjxwtA8qOD6V5gvvQWLD0l7gzvT
         3mYGE1RyCkIERP9ngS6RLeSkdEtVijJ1+2mUz0jSIZL7UFV/bjKhtGTH41f1UW0bq/GU
         y3ePbE5IG1qb3QF0zUJa7fZiy4jEcbb0iFA6FbKYlk4f0Xsi4HDfRrPbV8/nV1vflXj6
         ITtA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+0yEe23XTd/cu1FvirSa/QQjsW8AQGp6Muh4aVUJeT3TdTFcIVKK3Xv+t59iLJLu4DahY2E+ssPnJrrM@lists.linux.dev
X-Gm-Message-State: AOJu0YwS9VPFVRa87REMdKJeVvUmJ59/ynkNfW9NKhR5K0DeEcoaFWvn
	n00e6Ql10VFMsV9uf8uYX2iv0tpi530AvFpiEqrWUDIzT/pmIfaw
X-Gm-Gg: ASbGnct3waFzdgt/fQPvSoUSwDJMnMSToxMPCEkllzO2Drb/CABD83BP2f0S6cENz++
	avGh8XgBNgyusFn0sQzSnwOIarLYZdIHDymDNcMYkpmOc8lLcU+Lmxe68EDl/bLh6PZRaVHSct7
	D76pJi+hTT1mWwsiv1G22xJkednquicsjxFADBMUzjXhGmfNlK9gCpOTUqWuO3VYQ9f1Ci3ku7q
	3TYfEa63fP1w2SfytUJFPW9K5TCTlqffGEC8FSQ6N0UGIOM9wvxDhRxaPEL5SxW5fZGw6Mnhq3o
	6oUX5WEC7dRJDgEW905F+udr7FMHfZdl+GLTBKivlZuSSg==
X-Google-Smtp-Source: AGHT+IEvllGzLay4ZKzFchDIqRhxdPXE6p7ZIVrNDdvHdaszU9NSSxcJ5ArAQnSIdgUuAJ78j4JQMw==
X-Received: by 2002:a05:6402:40d5:b0:5e0:8c55:536 with SMTP id 4fb4d7f45d1cf-5f36f52517amr3626159a12.4.1744400483912;
        Fri, 11 Apr 2025 12:41:23 -0700 (PDT)
Received: from ubuntu ([105.112.122.132])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef5653bsm1434995a12.20.2025.04.11.12.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:41:23 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v10 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Fri, 11 Apr 2025 19:40:24 +0000
Message-Id: <e8d515539ba560961003eae15d301d03e6cdd17d.1744399612.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744399612.git.abrahamadekunle50@gmail.com>
References: <cover.1744399612.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `& 0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation `% 4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the
sequence number cycles through a range of 4096 values.
It also makes the code robust against potential changes of the 4096
upper limit, especially when it becomes a non power-of-2 value while
the AND(&) works solely for power-of-2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Found by Coccinelle.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..f712ea0cabee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3511,7 +3511,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			/* if ((psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address)) != NULL) */
 			psta = rtw_get_stainfo(pstapriv, raddr);
 			if (psta) {
-				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07]&0xfff) + 1;
+				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07] % 4096u) + 1;
 
 				psta->BA_starting_seqctrl[status & 0x07] = start_seq;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a389ba5ecc6f..25411cc5c738 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1641,7 +1641,7 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	struct dvobj_priv *psdpriv = padapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u8 wsize = preorder_ctrl->wsize_b;
-	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) & 0xFFF;/*  4096; */
+	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) % 4096u;
 
 	/*  Rx Reorder initialize condition. */
 	if (preorder_ctrl->indicate_seq == 0xFFFF)
@@ -1657,7 +1657,7 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	/*  2. Incoming SeqNum is larger than the WinEnd => Window shift N */
 	/*  */
 	if (SN_EQUAL(seq_num, preorder_ctrl->indicate_seq)) {
-		preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) & 0xFFF;
+		preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
 
 	} else if (SN_LESS(wend, seq_num)) {
 		/*  boundary situation, when seq_num cross 0xFFF */
@@ -1772,7 +1772,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			list_del_init(&(prframe->u.hdr.list));
 
 			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
-				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) & 0xFFF;
+				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
 
 			/* Set this as a lock to make sure that only one thread is indicating packet. */
 			/* pTS->RxIndicateState = RXTS_INDICATE_PROCESSING; */
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 5def2467f42b..76f25ab6a779 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -964,12 +964,12 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(tx_seq + 1) & 0xfff;
+							(tx_seq + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(pattrib->seqnum + 1) & 0xfff;
+							(pattrib->seqnum + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
-- 
2.34.1

