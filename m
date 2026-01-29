Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A619248F7C
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710578; cv=none; b=ulOjrU5U29IZbu+lvzxg/iyN/no766zer1hKkt7q3E0EKRAM9JthCpKyy2ojmQMXqS9VWkzIWRNXnNrtk4hOdqm9s1tzYE3n6WD20HJfqeDYFs+qyVXM+3fZsYRzbpPqXF7+RIzqFmLDIQFo0aJJDZsfZgUaP92f2E8XVdnkJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710578; c=relaxed/simple;
	bh=CZJy9AwA4Sgm4gCqYXz1Hym00u0mLZnP0zXpIppJ/CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkCf4O6unCpsYjiY8vaJ6aYPLyDqaSsY+xyCqNITw6pXKMLnOTAbsLGu9TuBePm1d+oecFkMx1rjtlFlBzqT+2NvEV3i95xG6vlQVR9gvzQto1PxzB7xMPGTgyC9/fvlt7cVI47qT1lkWng/86cDgm21zm8cjBCpG8vZwDfcQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbhwNT3c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbhwNT3c"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so10254245e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 10:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769710572; x=1770315372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA8jrJdAQr2ZBByq5plnySgC50OA+uorsxCy1149Tlc=;
        b=GbhwNT3cV9VNWbIqVBPc0lenbtek9Jn2TI1Py7QvNkLp6cd8dZkWSOxdY1G+xAxsy0
         iCvoF5s19E6hN+aUWq4/X3xwXl6hc6iG7VuF+i4p0nIWQE6/lzsG+AJNqw6u2PXsPUoN
         lzahYjifb7LNzm8wtRc65jUeyYPY01X4n4PvVYSJAfOzICXRpF2hsEhHVESGZSe2bYbh
         EoNtpYMg4HYpi0dQs6kWTqaWZuQzVCnSP/O6afTxxpDh3gsxLed9FUUqSP7I4K/nqjvL
         Um06kmQJlLy9016uZ2+nIm3EkuDMZ6OTt/1vMj00kYjpCDg4UczJMaAIy0ykV2bEJxkz
         yoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710572; x=1770315372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XA8jrJdAQr2ZBByq5plnySgC50OA+uorsxCy1149Tlc=;
        b=O+YQm/v02BxSGTZvudMk12IiUcfSpAHEPfuBTR0x5mpkbTQKRkoMXghw2IX1x5Muf8
         Yr5e6jL2ZHO/fgj3UDEzfkGVEoHfngUn+E/ajUe4j/bNjm+6CWe93MoBFYtvMx0UOe/3
         AVkwWftM/KkAsdm0yHfRHA6mN3+h69EzgRAmqgXYSr5pGhEJSn3upvTcx/pRxAfa1qkX
         MGRsKz9qXa5z2nTGiN8DCMaillA2eKyLnpfC8HMWJI/hVfle7lsyaGU0hw+7EJargQw+
         olU6/oYx/h9AuND6D68hpfRr+jWL8pNO+GuVHzkbbCUiydAAbaiP+vFQnyh/s+MCC9CB
         nviw==
X-Forwarded-Encrypted: i=1; AJvYcCUfB/4h07rD84gpdx3RKicOwP5v+coMYndlw1Rh9uJSYnovgj5GjehOFip3kjMB16/9eG5LX1MTkhelpGBc@lists.linux.dev
X-Gm-Message-State: AOJu0YzfizOj2KXFXNuOIypEy+KKUqjFtfly3dbgBUFsuemMWSBYpMp9
	s5RSYBFYFj8MatVryjV8tfkDaWBmcO3XwEarminTrpmYZNNU11dv/1U=
X-Gm-Gg: AZuq6aLNv4wXSvsw+tPL8gORbX5oC8YXAZXKh1IANOAIhCGkP75nEji2eWHeGTqgx05
	ZcKXPR6ZC4pYqN9URLlfY42/UHCL1sxL5ZYnv4E7A7crPIO62XeItVgnrV9Z4BWOtljzniJ9oZb
	yn7VWAzZY6OK9bvKYjRTFHxjYOK2KLcH8SHoQoWUwj8XwZNfjQtAKUoEgn1MSZRlHkNZbyzrwg4
	VXyrj/YiHTDDnlzDPGctx3rWc+EIYa1hT6TWGjxK/e0S6roz/tpCUqm47c/3YfiD8Q11gzuyeUH
	KuqYSAmhN7zFs0rV2Giqq/aU1XUNQze1mkO+kUZsk4uBnHQb8o6ohi3YH6S+KWbL16KiPC+MoUx
	TYwKUQ2Uid97X/fJt0bRnr3F8mkE6/g+UDue9V0MIWw0RvgfCpSpaTrlLozUZaChUk8i1MpAUhb
	bPTFUdeIqiN+s=
X-Received: by 2002:a05:600c:6214:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-482db4973c7mr354435e9.37.1769710571836;
        Thu, 29 Jan 2026 10:16:11 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm136578725e9.8.2026.01.29.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:16:11 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v4 4/5] staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
Date: Thu, 29 Jan 2026 19:15:40 +0100
Message-ID: <20260129181541.72066-5-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129181541.72066-1-lukagejak5@gmail.com>
References: <20260129181541.72066-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual hex-printing loop with the standard
kernel '%*ph' format string. This simplifies
the code and uses modern logging practices.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7dfc2678924e..5e79a720710f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2071,7 +2071,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
 	uint	len;
-	u8 *buff, *p, i;
+	u8 *buff, *p;
 	union iwreq_data wrqu;
 
 	buff = NULL;
@@ -2087,8 +2087,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

