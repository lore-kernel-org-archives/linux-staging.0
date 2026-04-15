Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8E33F580
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246399; cv=none; b=KeKa24zsoawhAd2jng+MEAj6X2W1EXpUa9UDk3vmCYIH1JxCIaBt1iF182vkMPNMJKo/PMZ0bkqqI7Jvu5dfUsYv+/1jHd1vnW0NuR+Jq1gdDde8BaVNW8D9I9C+ict5bqZKe0f3i1CixqDcSxNKN3r5MrLxPVm/pJ2LLBI8rh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246399; c=relaxed/simple;
	bh=Z2lRbePXb/WkTbD0C7QUi/a02dwEcYPjuzTeV4XTjEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aa1qAp4ntAd51e3f1UlO0wBpsNGP1QnfrhBBEl+A5lAi0X7OJMNW+2MVR82IHAm5kztB1wp6YH4dMgY2NEKrXbQasz96MFCpAzvCx2FPeK+Uqr2tBpvGGAatWSBuRKiwo0f1xTUiuXMIxDGgArF0aM7Jt/BTsXW4JeThO2CVwBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhrX0khw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhrX0khw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so1088352966b.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776246395; x=1776851195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqRzq0kk7QUDv7Zgb0cPFlnME2nNgpszREhEUniJWOk=;
        b=JhrX0khwliaGGe6tOK0i9bYvUBqDU9qyHYq97iOxtL49lwrKUihguqiMKpyAi2mcyW
         tSxc/YwG6NZynmwRuvoNnl82AYEcz9OUmBQXhwN+S5NnDQuVCqRgPc9QQO3sUqvhXdY1
         vj7QQySf841/J8o33RtrY99Zcqt37qWH0nuc+SxVV4tVoOSFcHE5MXJcHw8OzG9YDWfi
         xFxFK/V9GTlHL7W8+zxf9yxV9GtmSxQUVk50fCugt8uWpKysnjqdywU/rSV/eSL1Iqcb
         1YNn8FDMEdqSLyK8pie4zZ9jqYZzzFZuoeWFIzGpbl12Y8f7H/Y5xMB+seQvYZ4cwm02
         vFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246395; x=1776851195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqRzq0kk7QUDv7Zgb0cPFlnME2nNgpszREhEUniJWOk=;
        b=jP07yvdr6j9QIZHnKUqIcRGU2gJ4Gu9t9HcmlZ7faCauLIAAAT+QvZDIzzk8li7u25
         oY01dwenRfaKqoasaR14uVCBMRGRs6X6jPiQfYTNvYu06xJIJSLcYXrVE6PsJ+dm9uon
         vt2oQvTDpBZLBznMgtdU6UJd3Nni/54HrM8nvNat4xcunC54785pa6LjBLodmHxCqEIw
         44VB3wr96bAYptQXG8rRKi5lKijXlvwGCSNbJ/OKAG7dyLMoLt3DMgC9aVclm9O7srFX
         vFNPrDwPQTjiILonKKo7VvnXG+MdZDmmRoIPzP845KFDZeVntpmSybDLIAnYS93a6Fvm
         iBWA==
X-Gm-Message-State: AOJu0YwQSHSNUJGQ5Kv9uj3KaQllrL6qknluMdATQrAQ7/N/r+Zd4hm5
	6wbDQ7/W0fRUBzx52XM2wMaO7RDUTEO2/vCiMtglGwyT4BJgh4kpJHbM
X-Gm-Gg: AeBDietfU/8wg9k3blShNtTpLq+HbEql8qsNdCBBM/udT7yS9S4OBD+SKlK/Cu/0Xhk
	heam0occXD2UN9m+xk9/BRUNyUpnOw9cn59zh21Xk+ityaFdeGi3g8rbY9a7P2T8ebuIaChjKD6
	p6wLi/xUmOENlTLi2BsDwIaU3XVPGhKEu0qylHA/gC4IKas++a23ltu3YuhPj+w7GowGT54YZyI
	e5PGR2gS57MBJt99ZSpAD1UHc1Kql+uJz4DEuCdyTnHkQbG6BfCmUPdY2vLzjwPUquduHA5ifKZ
	0TiBE5golzYbLhyj35BmJBVUiD0+H+o4BHQtviD3T/gqonOkKy6nVi1naY0Xi/9kieR6SP+CYcW
	O0zC0ijf6CRCaatnEjPKTNXdl0nx5lhq6PSHZEYTGpk+fXI30OW0d189ACkRK4I6kxZsgvGwsh3
	EE8PflqRXCsbzjwCxAksf6YFXcgXQkm83mRquhBE07aVi/w6ib99t9bTzeRH2t9djya+JnidzN8
	6VXQSL4kAQL4r2Pr3z1Isy7PXQshtXXF5B9/+FH6jlL0zWpWXmCvXLlM+6W0Y2E/8G9ESZXSECE
	9bN3Nc7mGiJpeWbQ
X-Received: by 2002:a17:907:c80f:b0:b9c:9da7:9107 with SMTP id a640c23a62f3a-b9d7267ec77mr1325324166b.41.1776246394992;
        Wed, 15 Apr 2026 02:46:34 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c4e57sm39310166b.47.2026.04.15.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:46:34 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v6 1/2] staging: rtl8723bs: fix heap overflow in OnAuthClient shared key path
Date: Wed, 15 Apr 2026 11:45:04 +0200
Message-ID: <20260415094505.1115208-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_ie() returns the raw IE length from the received frame, which
can be up to 255. This length is used directly in memcpy() into
chg_txt[128] with no bounds check, allowing a heap overflow of up to
127 bytes when a rogue AP sends an Auth seq=2 frame with a Challenge
Text IE longer than 128 bytes.

IEEE 802.11 mandates the Challenge Text element carries exactly 128
bytes of challenge data. Reject any element whose length field does not
match sizeof(pmlmeinfo->chg_txt) (128).

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Cc: hansg@kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Apologies for the version numbering confusion across previous iterations.

Changes in v6:
- Add hansg@kernel.org to Cc (original driver author; accidentally
  omitted from the v5 series)
- Patch content unchanged from initial submission

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..90f27665667a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -891,7 +891,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
-			if (!p)
+			if (!p || len != sizeof(pmlmeinfo->chg_txt))
 				goto authclnt_fail;
 
 			memcpy(pmlmeinfo->chg_txt, p + 2, len);
-- 
2.53.0

