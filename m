Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609B324B34
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779271; cv=none; b=MGdicrgHSwnd65PqYJsZSqfLkLFb/LR+C8JdeHwdLMF3FSQpK4DYKWOxRv4gna/9YOryKXbju+vPbMtZs7w4CpXAcvOCvlRkv3cLczBQ/VgxM+LVzD4JuQyUrZhF9QhNAtvHWNgytbp98JUesGq1OpZrrnY7RFeKO0gjkSSDCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779271; c=relaxed/simple;
	bh=yTLerNvdtDEosypGJSu4ed3NpQtcBSWTy1A86LSNvhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvj3O4KO/vKNF3bl9fnchCQKa31j/cM3flsSFuBe5BENgmd8nyBuZ62/QSimtWbqYv5rKcM1CKnxF/N0BzVZ/tFClqiXR6+7tZzvvV7v/y5WiIKfwC/8EgXUUNvYQQa1DWRWI31l/amHjgtnnl7u9MKPhyxP5B7RrHdnzm3HXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX7yqOUh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX7yqOUh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso6948895e9.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 01:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779267; x=1768384067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6G1SZVdPaFU6JbEowRplwTM+Q+oRKFBn2SFhoJyO7E=;
        b=IX7yqOUh4h9ArZziMovD/HaS/EZtd6CmmkNQZR1lXzqE8QUKxWLZ5ka/D6E+XEmVFd
         JcXGCNzLn1X0vFEIRPz4i7HBqfN+r81TlOV+8CJP1XXQafGg730NQ1VDJ2ZEcaYoc2eO
         M0ubYpHmIJgSwVPm7kAlKsOyur6FCpdwzxLMgEUN0iXa+MQDBqim0U/3PYvBKWQCbVBb
         2U9MyYpDXaD8Tnb0LrSbwDbD1nB+wPPRc7FzilygTaI5axHAz4OjlnAlP1j0BMPLjRuD
         0qwzsg/u/QtLeItFFq/Tl5i+1WLu7v7fmUusOSp/aklFbye1O50T/I0gkX3JNt4wDTsI
         hIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779267; x=1768384067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6G1SZVdPaFU6JbEowRplwTM+Q+oRKFBn2SFhoJyO7E=;
        b=LO0fpDMKYhPVYqhptUurswBqD7lf3SMurv1qmTh0CRlsgD+xXsnZOK3gK7mdCX2mms
         SV+/kolE1/9xgqRbljixuBxrBi/wglKeFzWA3Tes+H3FkY+9PzNLCsDuGi7kwBo6wLJ7
         6wdw0T0VCye5jbzmARLM/U84zhAAOJ6rI2zd8/1e4pdjmEIY3cFlY4uIMGKpFFHbIV1V
         63EAXVRylF+UilbmSJmbNiS2wOIGz6OWQCBtUH82/+IWi1zUSG5tiZwTS8e8cPaYTWIP
         NPZjWnaWEz1ck4xNGVYxQcu2xbhbZ8Bqp4VOZezKqB3yDE/dFGqoo7Bq/GactF/eGTJf
         9eTw==
X-Forwarded-Encrypted: i=1; AJvYcCXRZShYcwqFuDAeJLXXdDC31nuq0Hq9WlTrY8+kAteUlZ0p49KQYzWv0H3inSAn57hQ6a7YH4fJMRgYSxUj@lists.linux.dev
X-Gm-Message-State: AOJu0YzmEhYfNbu4z4Smr7hdcQAyRTxMe5/uELvRY8ZLiufPa9qFdd1J
	9CV34zm6Tu8mo/GjcyMK/H9Q1Imu8pyX9h0ZCvp2kMSBjl4Lykue+1rqW3+E886/
X-Gm-Gg: AY/fxX60Fhx06Ij6wu8iUI8tEtuAcm1+7+ooboakoDG4oqH3IkCiLYjo6BH0B8UVZAr
	yj80gU/aMHKxWOQrfuVSzSKLRxkXAs5iuT/pSVwPS80HkKenywxWe08C9qHAz13WeeT5fxZrjUF
	sJZd2CRxlUjuqA9WPYwSAZ2GVjOUvIcJ2MuQiVvpOMfovzIIZQcM+88IqozdZtgviPf+NZOZz2i
	coYGj79EBSw31BGftJPeTPvkX33Zys0/lDEYd/Bi02n9JGqEAmGuFHDDGbQqYC5LMOhHqVbM2nU
	JMwKSNOShjRLXuXAIcZdPD3xJrQGrV2Pf8d84auZKRuIBwFjlfde3ETvaIAxUA0lsjTycjooc3X
	NryvriZ61pwF5NSquPezriWCmU1WiK4+DD4JJT2X+zbrsJyS6MJTIyuKgI/9qTcz9/IZ619eqBW
	ejs72XLgD0QogdLuNrvVnoABhF7nMNTE4q/AtENirDcriP4TnLgYsfVgEiviLRj1nlGpEibhrd4
	A35U0gclUJY7czbs8N0q4RJ/gc=
X-Google-Smtp-Source: AGHT+IFjtVVwNmv5YdtnIJKg56YN1n4bSBn1kp4ZsuWAEVIQbEnKsmF/1xSwtDW8jtu/09wGzBV8hQ==
X-Received: by 2002:a05:600c:4fc6:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-47d84b0b320mr18135405e9.1.1767779266984;
        Wed, 07 Jan 2026 01:47:46 -0800 (PST)
Received: from fedora.homenet.telecomitalia.it (host-95-244-124-236.retail.telecomitalia.it. [95.244.124.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a10f7sm7423715e9.18.2026.01.07.01.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:47:46 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove trailing whitespace
Date: Wed,  7 Jan 2026 10:47:13 +0100
Message-ID: <20260107094714.300380-3-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
References: <20260107094714.300380-1-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a trailing whitespace found by checkpatch.pl in rtw_mlme.c
at line 2021.

Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179a..ff4e668f1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.52.0

