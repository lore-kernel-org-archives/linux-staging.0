Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8934457B1
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513177; cv=none; b=F8NI5l3rLgIeqFDi1OYlXOyLes0Ad9u3hyweKjkHCK4QT4uEamgFd1YRXdNyFgnvvpTxyxlQi0wK27+4FmfD/zA10No0gOFpmAQ+xDo01jEdXLc4aHr3z3AqrGDSPCgUaHs68B/6+QZAfrpIxcVjyglJePCoecWinxF7uNXAuW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513177; c=relaxed/simple;
	bh=7fYmSEJo0qt1KsiBzseFp7MKWs4c6z76dKmxrU1GCBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5iqSlLI1mLPOMuYyGwecQItNdOhiWcjwx20iitEEt1QAlLgVpCST0qcOYlT1xaOnV5o/r3Sh/t9wxTkjv0Ye9lz8T08eNn4dU4Aq+OJdQ80BP3rL7s1XbK34RsX1/LqimVTDscwQckHtF8WKdMK3hCf3ShYsL+YW9tmpvz4dFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC1kTkz8; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC1kTkz8"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381c69ad0d9so567049a91.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785513172; x=1786117972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U/K3yrZZAsmjUNPPmafsMwvP5MWR/doyv5T2RcThE4=;
        b=bC1kTkz8DAiFs6Z8zHuDDDO4+tucCSMCLO0h9zIcLnzKLIEGWfbegZYJotbgcVYMiH
         Sb5Po62cgQdAxonVb8Qjqiss5+X53WONhg+wp+DdRP37Snzx1Rvij8cfuKO0mFcSmVim
         mw+f6OWwY/MT95xoXcSnotyY2xiMkdET7UpVll1WiX3GFzzrsRVNxkz9UERdg4KCPrtR
         rWYC/I5pSm+rEqwvHGNLOgg8nHaiFYzCajoUGeIR3HvWnIYE+TXDJP0S3n3q5WJDkgwQ
         8JPfPNYOU3GA/3D0Zh8C7zN5PirDXaRjwMBOiVAFV6T4S38Fr7SS7I9/dmbGe/xr4ZhW
         UUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513172; x=1786117972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/U/K3yrZZAsmjUNPPmafsMwvP5MWR/doyv5T2RcThE4=;
        b=BCJHeJuMpZxPo6WCtTMADfgPsxhxKa35xVS2N6p39+Bx+UcBkCEdXT8OH331NmT/sM
         qdpQ8fwX1oeZnv/kPkxG7siDi5phJ5xuRySWsFd5Qh8btFs1nRl4o9tKQpiWw1g3P67w
         yCwgS2WrgTclkekayoH+JLBtW5JTFuxS0mmPIsl1LfIscy8150hSKYPFKJ742l5hHeOA
         xKef1udlp2Ay9J73ic8juDKzSZnV/xFJ73qew4hkZBqdTFodAkASquBRmfl3TBIk8Hmb
         WbkEpNBPb1dSvnNVNFPDVfYI68/ISheC482RKCRiR5UV6tC7iYDpftE5Klcx4Z2W9HBe
         5HYA==
X-Gm-Message-State: AOJu0YydhKkQS51WsOrYdu+2uVJ4KbS2551QR2I0W9c2MhlEFvE/NIAU
	qlpVXtgNbgAtBQ3aCb6ByLBgN/J0xSGzrk6QmEdRJyXm4llTI9KkmnSn
X-Gm-Gg: AR+sD11uzItwJe+dWCMIjfmRNJnZxTFv1tEwY8PBgrvGjD+3LVq82NLcigMVZV5y+gF
	/iasbW9QsCisZ4INJq/3VylS1tTfuWDPUSyBU1+8kboQEHdo7irLYuAJZJ391TnbTKEM+ZwE+bw
	AwTT/ZdnN2WKFzukGwvQHBVifM9u0NAzWH0NoJAxaTkZgZXEcL3Nuq5Wfnp1EA81/CIctmtLOjC
	RXfpboR1cwHUZ80aow75V0iVF8so6t/muAyQR3+9RfRZhcAvwwIfXNrSm/btvB9m8wqZ8NlR5DZ
	2vL7QQH98WAfvnNe/gMGASL0VkOB+XwbW+bJt11yK5aD++CJ/NZSGprTlTlzrWV4HZB2Vi3zg5n
	et/baFn6GEl/OjAbZmcb+6XrMXxTNTMPkUN6gEYvNvMvfRqpSsYw4nvQMP5WckIVOAIzMxKGb48
	YZuE6gKM1iSOzOQNFc24aZygqQqIc822UZjdkGcd5jUq8n8Sp0aX7R5hBrRHgrcve1trgkKSrI2
	hI2Ywbb0U217uwLHPPIom1Rr1NcVAc=
X-Received: by 2002:a05:6a20:3ca2:b0:3c3:9aff:7a46 with SMTP id adf61e73a8af0-3c92a5d35b9mr351193637.32.1785513172303;
        Fri, 31 Jul 2026 08:52:52 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm7669604eec.7.2026.07.31.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:52:52 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: make dump_mgntframe_and_wait() return void
Date: Fri, 31 Jul 2026 15:52:28 +0000
Message-ID: <20260731155228.22526-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731155228.22526-1-dennylin0707@gmail.com>
References: <20260731155228.22526-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of dump_mgntframe_and_wait() is ignored by all current
callers.

Keep using the return value of rtw_hal_mgnt_xmit() to determine whether
to wait for completion. Make dump_mgntframe_and_wait() return void
because no caller uses its return value.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c   | 17 ++++-------------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h    |  2 +-
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0027f9333738..ae760e9c655a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1971,9 +1971,8 @@ void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	rtw_hal_mgnt_xmit(padapter, pmgntframe);
 }
 
-s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)
+void dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)
 {
-	s32 ret = _FAIL;
 	unsigned long irqL;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
@@ -1983,26 +1982,18 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 		padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
-		return ret;
+		return;
 	}
 
 	rtw_sctx_init(&sctx, timeout_ms);
 	pxmitbuf->sctx = &sctx;
 
-	ret = rtw_hal_mgnt_xmit(padapter, pmgntframe);
-	if (ret)
-		ret = _FAIL;
-	else
-		ret = _SUCCESS;
-
-	if (ret == _SUCCESS)
-		ret = rtw_sctx_wait(&sctx);
+	if (!rtw_hal_mgnt_xmit(padapter, pmgntframe))
+		rtw_sctx_wait(&sctx);
 
 	spin_lock_irqsave(&pxmitpriv->lock_sctx, irqL);
 	pxmitbuf->sctx = NULL;
 	spin_unlock_irqrestore(&pxmitpriv->lock_sctx, irqL);
-
-	return ret;
 }
 
 s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmgntframe)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0c2bd51b6bc2..73b89832d27a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -533,7 +533,7 @@ void update_mgnt_tx_rate(struct adapter *padapter, u8 rate);
 void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattrib);
 void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe);
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe);
-s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms);
+void dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms);
 s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmgntframe);
 
 void issue_beacon(struct adapter *padapter, int timeout_ms);
-- 
2.43.0

