Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62798270EB5
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969692; cv=none; b=i2eVR6CvDTzLPAM8FhvfZSqxL7/y1kJgmhrmLQ56k2FvEtE2yl4AybFuXeARpGZ/DED2PF2b9BmYHYj684jOWe7hZkh4hMW6384/jRz9RKjGygS+1SmwdJnL1X5Jgj+hoNzAfNQGGwRGRTwkbxoBiRIQBUKPjXhz9BxP6J8ez3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969692; c=relaxed/simple;
	bh=DxkK3p7GrM5By5DQbHXpcXd6g3kGREUwSwYkgTkB/7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r2H5Cm7KMQ+kNOA+mm2zjsIoO+okWPm48tSt+FzCPyFvPRcmUbtmBiANBcwBS9zR6LUfapmVrWXhTBRWfgadKuybXvNDqeqTrNI1gxnnIro3ZznIqUnG8pbki9elcZJiS0rlIzwyMUTXUrbcShfgw35x0XG+BPWjPuMwiySEe2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak/ZqxEl; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak/ZqxEl"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c0e135e953so175091685a.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744969689; x=1745574489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdfbOR1zA1/kD6+1UpkaIMBm10oYcWCdLqCqPrs+E94=;
        b=ak/ZqxEl/koVWJWkmSmifPZ8LoEPM9GP5RES/pwyRIz9COPM2QTCskxdymcx6TApfW
         cddKyQaCZUmIYmGCpzn8WqKvuf3HL0dGAHTQxXgrM9Uj5HsQdtvnKeaQczf/WGBRldwZ
         rU/7ip+L1vqSVhH0Wn2zlvmAhN1um7ZKZH1WnRA9emmq0uvO5GjAiGF1hlxbvVcMtgug
         BDw76f7RVMTvUjsFD0jmDjJWH8I6neb9bLff3VrTiv0H/dxjJfZf8AejG5glmUOYWMhR
         kBnTCsdVruE9+6FHBNv8iYoaW7XxAPCrLEEZ4lq6sPRwUgaB1bMt6IN9T4Y1oWZuvBCj
         iRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969689; x=1745574489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdfbOR1zA1/kD6+1UpkaIMBm10oYcWCdLqCqPrs+E94=;
        b=V6GDzqOJaAzZf3H83YcUhONfFiYLC+kLVONNHkX4Hycb916Il1Sq5lB/cWApYBEBQK
         XAVAGX3Avy0m2WtRBe2QhNski1OyTlc6wIREBcOoSajPIw/Rffyo1Da2usG2OlLmJh5V
         wv0fUZHjwTSGHF1bmdk5/VKq03H7HOY3wY6eLjVEcKUOoirlSLiGflizSgNBtobGftPr
         LmtWm1ug11HftFMkPKzTxE6a444kpDhWp4wuLgKbcBRiyuN8umL/lahcYJ/0DTEECdko
         8b0dcEN5+YDF7gb6f01hlLDSI1/j+eug6LQWELg/KEMYa4KsNmnxCiHjE7GAxG1YIHoz
         C1MQ==
X-Gm-Message-State: AOJu0YzyGpH2UBx/NUwOVTBJHeHvxRGRrOMjHK0NnfU/6H3PK93wTgYN
	x3Xppzfx9/D28cmLd6z0OA+xmStB+jL/A6nFE0wVJfKlwSu25UhX
X-Gm-Gg: ASbGncsjwNEnNs4GzlWocve18yVQETyfv8CXwn/pOY5qcDA7ZsqPvLFAR9LlVUfC13z
	hT/zbMqd+cNdKFyTMEp1kSfF6A3jz4bpwsj3ma2JdExEFBMSoDXJggJLJXF326f9KFvp2EtV5pF
	Z1ykJSi+AKFw5AK8DcPoIL9aCYX19yva2KV9cp/mBCxEOn3x9CQb7tgSR9jB+TBo1/aTUVQJ1UV
	1rhyRLlP8ZBH6MigBzJOApN2ToP5JQAMog3G5UaDswZTyqPYU4sbtdZDnLJOWPH8iJdRDcVN18z
	WvksPiFkiNoOTO/rJ+4PmtcBBNpSrWXtCDW1+6YofPNKfw==
X-Google-Smtp-Source: AGHT+IGfDWujQP8zgljeuaFYveIZbjDANUu9Vn0oRVR1ib7/4VrrKoASaIFj4bYOGe4hyjEaG2DYKg==
X-Received: by 2002:a05:6214:212e:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6f2c469a93bmr42563876d6.38.1744969689295;
        Fri, 18 Apr 2025 02:48:09 -0700 (PDT)
Received: from ubuntu ([105.112.229.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcf9asm8797386d6.84.2025.04.18.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:48:09 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v11 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Fri, 18 Apr 2025 09:47:55 +0000
Message-Id: <e8d515539ba560961003eae15d301d03e6cdd17d.1744966511.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744966511.git.abrahamadekunle50@gmail.com>
References: <cover.1744966511.git.abrahamadekunle50@gmail.com>
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

