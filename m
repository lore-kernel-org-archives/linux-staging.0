Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047BF34A76F
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009725; cv=none; b=My8n6ywDEPyk6VQdPlev/ACv9dwC2Sza9QZjLNN2mj1wSGQq/u7MVwLS3cA+xplUZORChQ9Ax5cM+lNLZoVA40FjckcMpS3/VpOZgMYXZON0MhkYJOGqDwQ6/w/IRhxVIgKW7ZGzRtD1XQ16IfSqDJhzMOXSw1PTfp27Qcvk+RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009725; c=relaxed/simple;
	bh=lZBtyq64hJnmVu3FKK1cTYdfo1QixPwTPdf3OdmWE4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NohmOU609eJaEybGiAXbQzkpMrpVDf9NMT30GcLzkBEy9pEkQUO+HWGJ2wchEug6L4tbjQW76l4WQqDbamrsVN7UWtd86jF+gmY39Y9j1XwyRfWSMXxxQguNu/aCSrKBm4xKrbDp5OFdUe1A2iIZVdmr1pFsp2qb8S5dIHN04WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezXtcr4j; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezXtcr4j"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso770551a91.1
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 02:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779009723; x=1779614523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YosR3fjDwhYTMETNu90RW2qw+Xz9jk90+6rozOLNRQ=;
        b=ezXtcr4jcY159XSkON78cpe5OadJ2RNF9Vhgj1OFYwboDcADaqP/5ZoW+xLzoq8T3r
         mLxzo8zBmN68TcX2jh4ZiYzsf4r7K2nAfx+2pZ1hp9FW0zaZIrGtMWVZgkgTEfZSajs8
         jwN2vljVwDJbJXt7rfnFsZ5x6LoAxAuf7gJrIcxk7uLiIshQG87atm+GGOe3BUeHdFE/
         RNSn/ebZXg9HyDXe9s7onkGwYEQ+IRmETmR8ajKeC8wGd7voyOXSoXHr8BTMUxmHLdPQ
         qoCUKt3P8gNdOVyiFvelUg1FtWnA683XCcBbW/9B/VTQ8zgwwHnHTyW/0Mv4Z59URsUy
         n9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779009723; x=1779614523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YosR3fjDwhYTMETNu90RW2qw+Xz9jk90+6rozOLNRQ=;
        b=fHZVqpAZN0Z4XaACWZFr7UKHC2T4oV0+Mh16jJf5wwmQnfzgP7nShn79KFKz06gopt
         w2OJIMR2Ir5076D+IQvpGqIo2y60ScuM1nxoraN3yaBxfUGrNpr57HzdIQM8hx/Rc9Mn
         mo/Y+uibR+c/WMMUYo/zYsBd4hd1vtrcep/TM9kf6nUkkNStL5tBEBkkRLeyDy0Y1cEe
         onEBx1NgLA9cajUyrgHAVRGynHgd1B/6zC8kS5GOnoP/ir4PtbhDJr2DFPFOCqzKBEca
         rybBQFmou0XsMtrqsCrdYDwfaOo0M1YCaHixF0oFW1rdE2fyq1sKrdnSBdoxyOMriv4N
         h0Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8x6UHcYQkTqLeIxD1RdCAotrdEP+fq77L1mk9Obmp7sYbXAeIKw+IK2VX/UXkCeH/WtN0FanBVB4hlKrYK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+WIWJdhPYg4BPYZfYBpMGKKXTcuuJX68i5+ccwv9ZgEhqOySv
	6dLEcdxDaeHlo6nju7ozW1hmgXTLxGVTyuE1DbtDWRWT52fTz0Rfl1B6
X-Gm-Gg: Acq92OEmG5Up4Rd+SwZSauC9Ws5ckazA7ab3hSs6LrxKL5ksEEpmZ/+ldz6VgkZaYgB
	TX0PefH9VBCZ2nR+SuJieWQJiXpDokNkj9bkGiEp2r546sKFpz70wp/d9H3kWNSIEdrdUSLCrcT
	RGeGUZZi8UI56/62ErlS34V6gNPZ5vq3tnmnB7kqEqO3o7uRhsHarXeOU/NYts2s0scqt2pXPXY
	+elH8TnA8D8edLtbrXVr/2a5ROq9Dg8OF2OwWjUstC5xm1prrkcQdWgNsrwRRUm8qUBdDIHM5en
	U6fxgnMNVTIzToJ7MnapvXh4ptTerrUvXXjWjnFakOgOovh7iebBDd2vdLq3o6j+/meFY7Nlgz8
	wPd8RiRe3XXu4ytx1e/Qm9UH/yRsl13iDHKG7ScKSZX3ir2kIXDpRxHR6xKVl64wNfze6YHQV6C
	TYOqpRncuJDRkNdDE4HoukNSNKSUCU6YSI7oqyZEey
X-Received: by 2002:a17:90b:58e4:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-369511320aemr7634689a91.0.1779009723299;
        Sun, 17 May 2026 02:22:03 -0700 (PDT)
Received: from localhost.localdomain ([106.0.57.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517aa6f8sm9430327a91.11.2026.05.17.02.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 02:22:03 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	dennylin0707@gmail.com,
	khushalchitturi@gmail.com,
	nikolayof23@gmail.com,
	khomenkov@mailbox.org,
	s9430939@naver.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sajal Gupta <sajal2005gupta@gmail.com>
Subject: [PATCH] staging: rtl8723bs: split multiple assignments in rtw_xmit.c
Date: Sun, 17 May 2026 14:51:20 +0530
Message-ID: <20260517092141.9518-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split multiple assignments into separate statements to comply
with kernel coding style. Fixes the checkpatch warnings:
"multiple assignments should be avoided"

Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 458e471535ad..e30c99eeee89 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -185,7 +185,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMITBUF_SZ;
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->ptail;
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
 
@@ -260,7 +261,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMIT_EXTBUF_SZ;
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->ptail;
 
 		list_add_tail(&pxmitbuf->list,
 			      &pxmitpriv->free_xmit_extbuf_queue.queue);
@@ -290,7 +292,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->phead = pxmitbuf->pbuf;
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
 			pxmitbuf->len = 0;
-			pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+			pxmitbuf->ptail = pxmitbuf->phead;
+			pxmitbuf->pdata = pxmitbuf->ptail;
 			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ;
 		}
 	}
@@ -1231,7 +1234,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	u8 MME[_MME_IE_LENGTH_];
 	u32 ori_len;
 
-	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
+	pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
+	mem_start = pframe;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
@@ -1483,7 +1487,8 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 		pxmitbuf->priv_data = NULL;
 
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->ptail;
 		pxmitbuf->agg_num = 0;
 		pxmitbuf->pg_num = 0;
 
-- 
2.54.0

