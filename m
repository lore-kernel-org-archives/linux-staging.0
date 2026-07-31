Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D082E1F0E
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481595; cv=none; b=JKd5M/noOt2xGLOLcvcRrsIvljcqouvX+FPmiw01WYGeaN87jzC6m24J9oLTYtprlZn0xMm5a6nxUWfeR3RJ/zePfOst6lzkEhWphhtXIkp2z9eF2KN+9ms3vDvPK2N9o1PfgUa7yHxNZ95rtMdmErIFiyPj8h+OSq6UYZW/g0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481595; c=relaxed/simple;
	bh=kgH+Unk5jFkTbBsM5Q2SSn1BubqFz43+w/4uwL0fHis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/KRwQEhpJeHNk4suWRpUZZlSQYUoyC+zxEho1X4DWaERH4NACW9MNlVjFDGgNOrmR4I+gnPZzSIr+Hu5GAJMzX1qrMIsNHvHli2z7p9G+NYCGpV/fU31lpoeUY896k5HNdpELvxZwBW6LuzLuPq0cgm9X81W/r3lNgS/KRlhxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctC00kJU; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctC00kJU"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cabe9335f1so2988215ad.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785481593; x=1786086393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfHEkC18UILYbYSRhqGinmN4Aeu2njCcFmZPfPXNvtQ=;
        b=ctC00kJULpMHILhNwhUX+2gIO9bU8tmsR7N3d4i713bPmRcUulgUoWZJjxzhbpEAJT
         R0qrouNfUfE7dvkCHr/woB/pvWihJ1SugONAIQzHKFbSBHABhr/SF1GpP8MKy/zQP0kU
         +56b/EZ54Jij3boA2Wn7cd9q05fS5J7a69HbljyslLazWexem6d6srIGfBnOG4JkrvdT
         337G9HtAULQL89Bz7C+2X7fbSwFvgRIlIUDq/pK0OA9LYDC+tco2BJ+j8wi7qv6Q+AnT
         m7QvisXB1uguHAM7qUrX7iABHZ1OsI6VOXeC2LptmNDW20ITr2E0atm3KGWNXNYWnLGK
         +AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481593; x=1786086393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfHEkC18UILYbYSRhqGinmN4Aeu2njCcFmZPfPXNvtQ=;
        b=pRF3YSPsx7quJ0Qd9C9pCrxtoK70qslPF+1EPacxDQUAzX8dOACUh7RlB2XBvHT+dD
         QQKODb7VSWU1xPAtUMXjp5Q6kLWEofIJ3cPpK+Maoscm+/0aE1LKvj2Hh9FrZhJOqqN+
         7D5JAChYvH96HcUnCy3b70Xrt86tbhDlUctYdMVWbuntpdvCaJUSE3cFDBY/zrsJ+VGH
         weuiAc/iRFgUfX8vKscLR30ZsFbmiSLIfLEELHE1cUVRBLILYUuDQaT0UkVeIo2Js2El
         Vv6fuL+rF8hI47lU8OlHoWU3criXLM2QGwf3mqUtLKWK3xxanqCfoi8gZRz/CFlRZDFJ
         9DBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp88JhZo2fNd55MumxeVmlGF/L0+eq5WDGdO+3bS11M0IA+oKnAFk4YD6rL7eefjYf4JXNYW8iE8WAQVO2y@lists.linux.dev
X-Gm-Message-State: AOJu0YyrWUuw+gTTcNzINgMImkO/FZLFsrN9f4qrjYm0DmfKp488+gGP
	GE8KWEBk5f+xH/OHOAzlfSL41dB3At7WbwaCKzB69p6PPKJ22X9VFh59
X-Gm-Gg: AR+sD10j9CLJw0oNdcuTDuqqECU4Z6rIb4GFunhwAaCgO8GjrDd11pczp1cB/MXSltM
	c1+fHEqHNHMktUYQ5FFKjsCRV7ckkMOhtzO9SU44YH4J+hlLtZ2zF6WULrvwR/1Na+Ik2DxjMiG
	BogqeSP6w5c/HE6cYSej0ZTLgxAVNRUKiJL+wNdsijXHVzDCggPqmp2+ZrBxd4Hbatl1VqAj1oq
	xfKol9PWCFb/E79br/dDHrUohwaB1yWyAWbw3N/L/KVG8qX9dp4iBHIl5GZWN02FQ04P3fk6LLP
	6y+8QAuG4F+VhEddptxMh0IBq6E1bkpm/nodnCLlK1MRIhvNc+kf1cRfS2Ux4n9DonEfEA9NVKz
	hqcgjVsr2C9dq6Y0MJueaFnq5Xoo4pCJG/4jGPNXZZ0IppAXJiWIyHwIHTQklYv4GEumzgLXQSA
	urHEfEExdtDEt1LjsNGgq4GoKZqHd5fO3hBCOTBWJShxJMvMT+FyTVWTXXhSS8R/mdxCDtylm/O
	3QBKuNXVnvOZ5/XOHf7
X-Received: by 2002:a17:903:1211:b0:2ca:5970:732d with SMTP id d9443c01a7336-2d046ebb185mr10052965ad.41.1785481592613;
        Fri, 31 Jul 2026 00:06:32 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm2589587eec.7.2026.07.31.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:06:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: convert dump mgnt path to errno
Date: Fri, 31 Jul 2026 07:05:46 +0000
Message-ID: <20260731070546.20959-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731070546.20959-1-dennylin0707@gmail.com>
References: <20260731070546.20959-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert dump_mgntframe_and_wait() to return errno-style values and
update its declaration in rtw_mlme_ext.h.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 13 ++++---------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0027f9333738..da74184fd07e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1971,9 +1971,9 @@ void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	rtw_hal_mgnt_xmit(padapter, pmgntframe);
 }
 
-s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)
+int dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)
 {
-	s32 ret = _FAIL;
+	int ret;
 	unsigned long irqL;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
@@ -1983,19 +1983,14 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 		padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
-		return ret;
+		return -ENODEV;
 	}
 
 	rtw_sctx_init(&sctx, timeout_ms);
 	pxmitbuf->sctx = &sctx;
 
 	ret = rtw_hal_mgnt_xmit(padapter, pmgntframe);
-	if (ret)
-		ret = _FAIL;
-	else
-		ret = _SUCCESS;
-
-	if (ret == _SUCCESS)
+	if (!ret)
 		ret = rtw_sctx_wait(&sctx);
 
 	spin_lock_irqsave(&pxmitpriv->lock_sctx, irqL);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0c2bd51b6bc2..c2993e442d80 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -533,7 +533,7 @@ void update_mgnt_tx_rate(struct adapter *padapter, u8 rate);
 void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattrib);
 void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe);
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe);
-s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms);
+int dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms);
 s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmgntframe);
 
 void issue_beacon(struct adapter *padapter, int timeout_ms);
-- 
2.43.0

