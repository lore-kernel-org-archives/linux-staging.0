Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54E36920D
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926361; cv=none; b=fa0KmxQ9SY0OztOE7ckCqkyGS1LwX8r1vFSNYZYIWdyBNE45ejlgEdzHiGoJ8d47RXdIIiFrKtmim9bFF3wPynzSSXgdv3atoHeMCWrtmRKF6YFSz3KKBSTafgEAyso9cJ1pVbtu9YcqBbg/wQ7YQJR6iPCjl9PW9GeAcv5lxFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926361; c=relaxed/simple;
	bh=N9HLizXXiFAvZaaWH1ui6wNm8m+fAkUVUXVihRy1fBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5BXGZyN7V1SweJlprluEAFs5geUsD7EAcYOIUqjsTpM5Wo26Bqrtyf2QrWKMr8J9K6aMYqaH4P+0JB2NGfucvfYEbMYeWZ7FIeRODFz2NuSdA488DDbG0C5okidai0z+l7d04PQaBXBUmR6GrKTVOhyjFZN1+TUIkVCBbSR0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv604YSS; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv604YSS"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3810f0aba07so1656791a91.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926357; x=1784531157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFy8a5KYcxfhVgWB2o9ncTF1rCZKKEFMUuyrfhVpuV4=;
        b=lv604YSS8z789KxwPto/qyxyBpksHVIvAeRqLPCFBfsPUIPmFMyCCgu2TTsgn2oMZ4
         By0POB9vjT89al21iFtmGnHth9ZmZFbGf7sW3S6rB29LA//n05fzPhj6qsiG8LuaidL2
         wgGinA4ATmD9tFLp0znJzz1fRQB33nFgmYahBRnYZUfKLNRuzNdsXZav/7H9vh4gUQ6p
         ft+QrQ8p4rgzVMak+4bUEwaP4UMHxtNMv/ycw3q3DTIwyM9iDHuE1VC4Me7laltQMilU
         Bt8tQXwKypngAp9Soo0lADX/fyp0zfvvz3u22NK4qh5YwDwooCwAYKN7ng8rQGPHzLl6
         qNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926357; x=1784531157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFy8a5KYcxfhVgWB2o9ncTF1rCZKKEFMUuyrfhVpuV4=;
        b=S+vdhVei3E2cy4tRGRpo6HNIUwwMjlL4J+D2+qudg7pwc4oge1QqXjqp8ZvExWTXtS
         Ckc6t7D3FpJXPdYs++vRwGxmAzHu58JvtVpVd137x3Yr7j/B48OoueHnMtpSkrb6DGxk
         BGMht26IyTCKLVs8w/K4TenvAgXRdwb2O9ti1rrkVnzm9FTHJquYCZw1TJQ+/FDrbPTE
         lXRLCNjPYUkfGi6j5i1xabg1P8T/24Fxf3niAq7l34JO/DPvbUKkWYyaVyMeKnZjoDUy
         eXyn+5G4TQZ6Dp638PHpbEEjXMbVcKylfuqAGA8PyfQh2z/gAiCp0sl5if9gTAGhSAfV
         Szaw==
X-Forwarded-Encrypted: i=1; AHgh+Rrlbl0KZ0qhtXWAhOT5X1Vy0MK5/iiYS10c3ASq9npbrxYzxTL+I4HeG6BrahV986V5MizevhUTMvrnN3mv@lists.linux.dev
X-Gm-Message-State: AOJu0YwYO7xJbvFqUpuoI8+P510FuguyoyClHlQgxI+Ww4e4ArIYVkCg
	DZlzZUjS6ik+BpBXnQ4iOThwuTSl3r17qv4+zSroRYlHW6DquQcFUB1a
X-Gm-Gg: AfdE7cljT3HaS1qrSKdImzXYf5waNuSNLquSUV/OtBHEBxEk8bTCLTz2wqLZgwaPbKZ
	znxCimLpGVehE5U5xRMrtByCFKcqWp6a5psNTxvHgLszPnGq16ewgmc7JqhpPreshobkw7XDaCB
	fyMZ80fIioWW2Jt2G4rm6N+cuHFcGveHN9bmdesOz1I4hhmxYNoEmzYlidgjFwAUnuc2ionUA1Z
	rKYXbP+IKOEMSBXqocS5gCn2wel4HXlWhUI4Zc6mUMMt3Oc3ztdiTKXNM8FY6pd1+3tHIJvQwnX
	615NvVucZq7n+QSWVsoxXLH5cQ7OY/qQri3AYFJjm7iN+bgoZcwevsYmLPbOlgA8dsPQ25/lcs+
	1/l51iOlwg6nFxKjLQrBt4Nif9j+0lPPoq32bOpF5mrUcgG+Vz4JuhiW+0v3GHXIDiK0HhdCPmF
	vsA4mNANvXMdvXuAS9RqqJLILPSFgmICD8Jl61pdXmjge4
X-Received: by 2002:a17:90b:17c9:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38dc77e8853mr7597465a91.43.1783926356989;
        Mon, 13 Jul 2026 00:05:56 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm33971943eec.28.2026.07.13.00.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:05:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: convert xmitframe_addmic() to return errno
Date: Mon, 13 Jul 2026 07:05:35 +0000
Message-ID: <20260713070537.15903-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713070537.15903-1-dennylin0707@gmail.com>
References: <20260713070537.15903-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert xmitframe_addmic() to return 0 on success and
a negative errno on failure.

Update the immediate caller to handle errno return values
while preserving the existing _SUCCESS/_FAIL semantics.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 98b886732646..07e413f4dbdb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -797,7 +797,7 @@ static int update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	return 0;
 }
 
-static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
+static int xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	signed int			curfragnum, length;
 	u8 *pframe, *payload, mic[8];
@@ -820,12 +820,12 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 			if (bmcst) {
 				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey, null_key, 16))
-					return _FAIL;
+					return -EINVAL;
 				/* start to calculate the mic code */
 				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
 			} else {
 				if (!memcmp(&pattrib->dot11tkiptxmickey.skey[0], null_key, 16))
-					return _FAIL;
+					return -EINVAL;
 				/* start to calculate the mic code */
 				rtw_secmicsetkey(&micdata, &pattrib->dot11tkiptxmickey.skey[0]);
 			}
@@ -876,7 +876,7 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 			pattrib->last_txcmdsz += 8;
 			}
 	}
-	return _SUCCESS;
+	return 0;
 }
 
 static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
@@ -1175,7 +1175,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		memcpy(mem_start, pbuf_start + hw_hdr_offset, pattrib->hdrlen);
 	}
 
-	if (xmitframe_addmic(padapter, pxmitframe) == _FAIL) {
+	ret = xmitframe_addmic(padapter, pxmitframe);
+	if (ret) {
 		res = _FAIL;
 		goto exit;
 	}
-- 
2.43.0

