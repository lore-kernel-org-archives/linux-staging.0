Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB82B3C3422
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738636; cv=none; b=gkRU+92UnasAZPD7YAhlm37GJByCz9IvhVMe03cLyuAyZthkmA/TvKT76vT6/2OMw04Af86vf+hOph/PAkj1bnhvmAfzrpkTQht3pxcyu5/0EFy4MXygk9eCTHJlo3WD7HarSgLWPJ/OVT42RK4EE/t3uiDghrMAeGDgheOYXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738636; c=relaxed/simple;
	bh=OwRd3NUTkaAoh8Y+r/wsJsf4AWa/FLJ5AAP/ykOV6ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KRX6o9Tjq+WJTU4TzyzBDu0e5Pyfei3FwTLYqVwSpwBPNJoEAdS8/fFdy5jc1FcwT41zwHqBbo+AJ2MXZASxiJwmB6IfYT3sTWZqTwN/afG3KjpCD7ODi6rT9SWhEVQC2NTdNj5ozGoMCzx9jQnm1kYzndkysVSV1Vn2QgUtHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZApqWVRR; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZApqWVRR"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2c15849aa2cso10259147eec.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 23:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778738635; x=1779343435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhH4QN2V6pideai/krprs3/7h/AE1I4RG4vdBuW1XJg=;
        b=ZApqWVRRS59TmvU8TeLUkR41Bn/byDhQoFEA5Pv66MGJGtkGSWJ1W7Nw5jMjNkSTfm
         HVUglpQfJBF3/qY3t7RrmbQtmLgeitNevnUNd0G7YcojY+thdgzHKkAb2ZswJOwXRlIC
         K0Je7HkSECOVhTZOc6JIUi2YiN5shZLuAYjqX8fp2UUkkUkG+IXU9/wTC6M0J/l8LjPM
         Lef0uuk6RdRc7Xd32lyXE2JFaMrvKb/0Wt5n0bWzpPaEIM0bR/AkeE1hVRO3XqN0bI0n
         gYLpClSUAfrOdNDhnUiT82NEsrUvZhZwFdY1tb9I3cWcRu5c2XMmEFkMhhBp5UcX1BPH
         nULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738635; x=1779343435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KhH4QN2V6pideai/krprs3/7h/AE1I4RG4vdBuW1XJg=;
        b=V6m9RF67UntawzDhiOVDn1GEUhzYi7i7dgFeNSM9JzOeCDVyLb3yql44qcd5TAmSlZ
         BtrW1ErP7grAdbASKaOY/U5ZudjYhWJpy+Rob+WNtsFLEkYvejjLA5B6+tXlyMJBRkhB
         oo6Btg6ncmtbsYBXftHVIEB33Hd1c+WPLuvJu9XjvJY/fmyDvP5e6D+/CI/97JvlqkHB
         NA3x0ibzIvPFpGzuAhPQse0g4X53ctINlJxHGRW/wrYyC371I/eTDrf72O4DoWT3grsX
         5vad785zzosHAxBr825lmTmSyBma4FNM+9xlMnj+oi5pfkmvDbttg7p3+hzdB57upSfl
         pN0g==
X-Forwarded-Encrypted: i=1; AFNElJ/k33xM2JB0TYoYT7fTDXF3LCSsNYpxmrASQZRYjvnwMyZEN2KbME0yJtcG5AX4KwGIjK9US1+KkiduYrYX@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0fsAu6gljaxdxTwdlo5NhMsgeTtm16jqWXu1w6pwH7rJeKGNs
	lS6nt1c/KvblzRxUKpV8Mj1+ETAMp6C3rbshOEgHu9xMFGYPhG5XHalw
X-Gm-Gg: Acq92OHGXd1SCIbgQAd37Y0GIPS7WzErtfxC+KhZ/rRYxuzawcWSP/wZqpSqryfgZ4p
	oycxMbLx4NdiKXooUM4y/NxWHJ+rVCs8I5MDgwDJktPwXvFUYGkhePxNCWVDgercSwHx3xinLpA
	svBG+anFyBARlPFyR+TKztEsg63sEQyimCX5w68Gz93Ml5RvrtLKo1gfHG+53qGVnacXHGMQ1xc
	LH7n464dA8KWOwmBdy9vZLc6G01IO8KgZoLvlMGxDhQef2kH+Bx537z94zfr61mTcZjUkCfq3f1
	BRGVITYhLOtVPoM41Di/tbcZ70b+btppcAt3J7X9VbPvN6gy9bbFAnHM3QUtyvzj8CBmt29z7xa
	LNmlLhhspGFqADhc8Ft62dCNJDB14JSJYRoV5V/g/4vWggCFwEnp2FMwDL7U0mfqIgVaHDl+M9S
	VyDMHZ5/o1CU3mmTYL1xdgbKM7Gr4UvbZMcJhTxCXPyfZ3m8MFDTvBBN8=
X-Received: by 2002:a05:7301:d09:b0:2e6:e916:70ff with SMTP id 5a478bee46e88-30119395696mr3467614eec.28.1778738634773;
        Wed, 13 May 2026 23:03:54 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm2034772eec.15.2026.05.13.23.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:03:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: convert rtw_xmit_classifier to return errno
Date: Thu, 14 May 2026 06:03:21 +0000
Message-Id: <20260514060323.24895-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514060323.24895-1-dennylin0707@gmail.com>
References: <20260514060323.24895-1-dennylin0707@gmail.com>
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

