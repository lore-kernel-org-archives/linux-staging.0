Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E11D3803E3
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646855; cv=none; b=HEXtBpwP57ilaa+NwURj+r4u7akBIHu7ON1R4WjocUk6HYn1YhCU3Cl0p8+vi8eyJpQbismWdRUQ3wVLnfVbb/WlfNVc241JnQg9xh5/Ohof151/61Xk9PPMdYYs7US7aM8uq9UZXTkNP2Ny+n7cYuw6/uSc7kp0L3z9jsv71lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646855; c=relaxed/simple;
	bh=iMMCHuUNk205M/t3RiDzeqmOCZFDI8xxxCaYom5FDDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JmO1GinHCNSPw6nq3Nrx48rjQpKe4AqJXNoe+HeUm0Hr3EEEgrrjIFBle9/WVmzDbmeMydcm/dGVwj9QRqio8pllvjdfKwi3x/u1NuZglUByZuwdKLaSbcXGSVZRSgzaLtAHK6p3PU5pAkgelVD3InbytoNa1+9+1BKmb0pkPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8cY78at; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8cY78at"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-126ea4b77adso7211829c88.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646854; x=1776251654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2zzxZ7T3OrjLQrZ05KQAgPaC26tt2IBs9Eiz7SOG68=;
        b=s8cY78atMW9QmG4kT7sIyUz9V6elkVSF1H7WfM6k+C3yOKKutfiRzP18Veu6jDPWJF
         FT92J3pALjaTHa2Tm06MBJM87gAuJn8csi+XvKPT3/cfI1XyoR+C0XJg/mZwB7I12C5j
         8lqZVzGqV9vI6a6WnMH/2ZMsllGfzkZoE8iqM/+FntAgdQ0VAdy4bN9q+ITlvDc/HEUR
         nP1eMPZYH23xPqI5qeaz0Jw0gf/+x90fXWLfZjHkAPt1xYVONvGUFqW479gYzfkSbZWG
         PYGdxhAgUFyErijPSIdvLnU4fq7pd/+84Qhet5rO+E6oBWzUH8rd1FONhEnvApsfPtpP
         6hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646854; x=1776251654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2zzxZ7T3OrjLQrZ05KQAgPaC26tt2IBs9Eiz7SOG68=;
        b=jw3u+zCKm/Bf0HBYsUYfM5ny1Bw2Cv4mCxV1PlugIk6G2FispolpltInnOJkZbWFK8
         5agZ1jocotCci5abE6R0DiRZMKW2R6tl1NXvdox1smyKDG955Bj3GhtWa/hDCIMt60Fc
         uMjRiU95KX5Aw5HrCbSdFD3s036eANEO8f+AAm74cLuZDlUlHTlElZUkrCxfX8hIr4oK
         UB2lqHxPgsjPdUnftwEBT4vGDi/bxAEMHWKOLeqgUtaYuHYRYhG0ctzeS92oIEeY2vXZ
         oMpys2nyBWokjdfxIoIQOgw4RDZptPrYOYboT/zWI/VqcVpoHymRcPYA/rVIdGQVSDpE
         8N3A==
X-Forwarded-Encrypted: i=1; AJvYcCX46iPbV0nw7fWazP1Rw04FlH2+1u1dP9AjU9unuIifrj+x4kzmTPI3E6KxjGXfNyvvL3Z9qwy+5sUvELu6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz26tFPfIQyDVSbJk3A3zvun9b6QooDdnJWUDYyth0f9qRk88xn
	BSjBYorMt4T9nm4GEZC8az3Q69NyUytDyxmJKvdIfQxcjGSkmCihJlRL
X-Gm-Gg: AeBDiesK7UrSKi2eyqNYEFE4+BdrvHzMe3PqMV5i7hU53A88leQ4lHM/CQNbKETFM0p
	EoKq9IHbaoLlhTQ0V176wwE9UFLRQNJ/IQMq5fzW9YujiMly388bcFnNLVAFlKh5LNGUnGEVHxm
	mM/+iineNXnZliq+mSBP8BLBvuyDB5Ua9Sr8WvymSBIT1FyRpGPyhn4G96i5OTOitKRZO71BKb7
	a3JGic26sUhw6jtGLqUwNazqnjWk8GYYL0XNLoBrRt+m2DbnRXXyrXHPVKZjjgY1TmEy+n8aiN4
	Ghua25tcHv+SXYXTYpTV2r2Qn+3oane5m9L6dOuyyH4UIDCjzzgKR3q+Kdve9ouPkGfWHmrdu3X
	rhLeylnM2AnvFryok3rQs6yIpL81J2YpbTTuv9Nd6X1PTo046hU+waXBMLjvEhmFpCGQaxYnLCd
	wqpsH+VjZ22v30Nkm19hKd2R+gS6B/q27YzPlXZFgZbzHCUVjbMBAaH9A=
X-Received: by 2002:a05:7022:f30f:b0:12c:43:839b with SMTP id a92af1059eb24-12c00438781mr4755345c88.35.1775646853603;
        Wed, 08 Apr 2026 04:14:13 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:12 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 5/6] staging: rtl8723bs: convert rtw_os_xmit_resource_alloc to return errno
Date: Wed,  8 Apr 2026 11:13:13 +0000
Message-Id: <20260408111314.19329-6-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408111314.19329-1-dennylin0707@gmail.com>
References: <20260408111314.19329-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_os_xmit_resource_alloc() to return 0 on success
and -ENOMEM on failure. Update the callers to check for
non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 249947a7d910..fedfc968057b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -78,12 +78,12 @@ static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf
 	if (alloc_sz > 0) {
 		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
 		if (!pxmitbuf->pallocated_buf)
-			return _FAIL;
+			return -ENOMEM;
 
 		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
@@ -179,10 +179,10 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-		if (res == _FAIL) {
+		if (res) {
 			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
-			if (res == _FAIL)
+			if (res)
 				return _FAIL;
 		}
 
@@ -258,7 +258,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
-		if (res == _FAIL)
+		if (res)
 			return _FAIL;
 
 		pxmitbuf->phead = pxmitbuf->pbuf;
@@ -288,7 +288,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
 							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
 							 true);
-			if (res == _FAIL)
+			if (res)
 				return _FAIL;
 
 			pxmitbuf->phead = pxmitbuf->pbuf;
-- 
2.34.1

