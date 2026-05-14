Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41F39A058
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753248; cv=none; b=N7ElY1XDosI/WaAeRpHACMsGV06sQ5jnS3qcojxTJUnnR5YauarSFgVV06RLRa4asHsNOHGndqL8qmkQAfMVXTYKLbsQJKzpRM3Ndl2NPqmPjsodjXGZVa+KbNMriKS8shrmKRALoMuyy10gdJWAsgqFmRZ7BTDWa3bCFn+ou80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753248; c=relaxed/simple;
	bh=OwRd3NUTkaAoh8Y+r/wsJsf4AWa/FLJ5AAP/ykOV6ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JDDVIjQiPjRqeOxTTNl3SmYUTusKRFCcXQkyNu4JC3picWZf82E+ID/S/klY/uWoIidDr/d5Hvpm8krSnKjcxtQmr1RchOtsK7wYBOJWariQcPlxP+wgsHHgwVEixCTRvAeAk1ML6Ohc3ELHLUZTznV7b2uYh98PQqwYlAHSuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/NKyIF7; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/NKyIF7"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c19d23b19so12967244c88.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778753246; x=1779358046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhH4QN2V6pideai/krprs3/7h/AE1I4RG4vdBuW1XJg=;
        b=C/NKyIF79v4koPTcxnOEiYHrqZ+lnHlJVvs/YTHBRXVKUObnRkkET4bPPF0jNfxp0k
         ovy9Es4q/OfLoVaOfYK3VoWrB203oyBtUR0PBBa/EXF30GSafUv2aNxT5EK1HoQSLgpc
         DyGGLjrUt7mqYqQzPSirgJMWx3Sb/oehHCghQLJxGac/IyjKAnRiWvRW8W+cnBzimUK+
         2UhnEl2Dq0RyrYhlCTat3gf7pV4K7QI1gO7jldBtUAQEcOyXtsEzWVGQa/XSDdX35+gO
         IOMMTEse1Zffd9Uc6I3/0Fa089mg5q0+W8rQiE0xcyqOBRg/N7M/l3I90vPf01N8G/jf
         iTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753246; x=1779358046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KhH4QN2V6pideai/krprs3/7h/AE1I4RG4vdBuW1XJg=;
        b=Fgp4T1v93bdcASO6vGUWqy9l000ULEjdSyB9W2wDHcniEfFNsjH4siPZmKiI4F0VwU
         W6c6O10PVnzEkGxdmgzsgna3kaoZlIUgmixO/H34r6f8WxXk66NfMUpFAJsQ9fId1dOy
         1PkOk4tfUZvcgqrWDt6tpiVIIU5ZdlSMndAjYrex3D+6TXaI0S5/sMv1BGHxpi2rZV2V
         Ih9fizHG2qeUB+HkHffo4I0QRqJ4snQ0sXpWG2yafC0fTXH8O1APVOHOcWdYc19edXqR
         ZiFwhkx3cpp22sRHNSrOjYhLlKBeutebGztzuVGQ9UtQOyHBM1o8iG7D308PLR9yP30b
         RI1A==
X-Forwarded-Encrypted: i=1; AFNElJ8aVdrVQTIalosJqEqftj1Wv215oGmRML7+ZpLfI0YGNbM+3CiM+/5jiKA+S3B76tEzcxLko5mN1bFf6hDq@lists.linux.dev
X-Gm-Message-State: AOJu0YxBdTUW1CThJVWUgKJx/jreeOqayh8dM30JgNGZGbw8D87Hzwh0
	tnIXEUgfwErLXk8mFFobjFQMZTmNFGEfm67fQC1/vuCA/1pcPfl0+0CeE56T9IQ9m1Y=
X-Gm-Gg: Acq92OE23HmGorlK0ACBrRB7c+1WJGJKqlH34oSxrZvO4Wa3Azo/c+4R2Z99pgZq4MS
	4aRC3aNkex05FXkE73vCWe3qexbf0QHh18NZyX2NlJdLlY31QLPIKmdN4FAIacSEGdsfkSkaiFr
	G2bEc4Fi/L9Gz322hkydrp9wkgKyp3wOdpjDy/3MQ/VNmL3njDtLlcrWs3ALsydznf6KLevKO0t
	XSWupRK1KqE6JcBTbXKXtyZr6/4Qs7JNKw9gvbLrjOAOlpQaI1Y6wdJO9dt6+9IXyW6Ud9ebG4z
	buGcpeg7r6SqOLunpbMJxN0e1v8D7oi1lfb5IEZCy0sl0UUPpbCDDOlcnqJlZLcL7mXVf2wW+Se
	chyXmPUQukf9kxqdZuBvJAnaV3CG9OBx2Tg83Tia5rdgWf8wV0Sys4RIDhVjwVzUKOPhYJVjUql
	LvoFqPGJKZ2yQi46c32wgzUs9j7vGtXoDE6SFMsDZVPS4IRp2AfVwB+xc=
X-Received: by 2002:a05:7022:459a:b0:132:1e01:2d7d with SMTP id a92af1059eb24-1349a6f91cfmr3919417c88.5.1778753246265;
        Thu, 14 May 2026 03:07:26 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm3757921c88.3.2026.05.14.03.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:07:25 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 3/5] staging: rtl8723bs: convert rtw_xmit_classifier to return errno
Date: Thu, 14 May 2026 10:07:06 +0000
Message-Id: <20260514100708.25031-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514100708.25031-1-dennylin0707@gmail.com>
References: <20260514100708.25031-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_xmit_classifier() to return 0 on success and
negative error codes on failure.

Update the caller to check for non-zero return values and
preserve the existing _FAIL/_SUCCESS semantics.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b3953bdedb04..80f3dfaf793d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1825,7 +1825,7 @@ void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pfram
  * Will enqueue pxmitframe to the proper queue,
  * and indicate it to xx_pending list.....
  */
-static s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
+static int rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	u8 ac_index;
 	struct sta_info *psta;
@@ -1835,13 +1835,13 @@ static s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmi
 
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
-		return _FAIL;
+		return -ENODEV;
 
 	if (!psta)
-		return _FAIL;
+		return -EINVAL;
 
 	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
+		return -ENETDOWN;
 
 	ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
 
@@ -1852,12 +1852,15 @@ static s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmi
 	ptxservq->qcnt++;
 	phwxmits[ac_index].accnt++;
 
-	return _SUCCESS;
+	return 0;
 }
 
 s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	if (rtw_xmit_classifier(padapter, pxmitframe) == _FAIL)
+	int res;
+
+	res = rtw_xmit_classifier(padapter, pxmitframe);
+	if (res)
 		return _FAIL;
 
 	return _SUCCESS;
-- 
2.34.1

