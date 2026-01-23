Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E2354AF5
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162337; cv=none; b=FJJgrTwEoYHePaydKJQfv3ws+zlb4ehPzJc9Jd0NP6MTcR/GT2UAa83YEtsbPNtj+90R2031bQdDwjYCCSpfvypmXf4p6g33wZYbFdoku79YZ+i0IoiRqyqvdZA4kN9pgnGrSfl9f2ab2VReumsdi6WtHTy893SgNSFQLGxkeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162337; c=relaxed/simple;
	bh=KdNLRkw9MXL6d5nMWdkiRZMWkJric39ghbr2UylUDEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOK/+/g35NvQtpdlfE+agAaJ7+Ea34nrbDN4HcZ2Fm85xn+agBQl5Yxnnf9SuNwBbZEziaJ+WcZNSC9tOU1eSy/gOorrxKllwgNefhHi302wZv5OYorkM1joeIM9vGsxvDfhXMLVIMeLAAIxDwqgSd37Nr+la4O/iAZaT6QK7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hymF5x4H; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hymF5x4H"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81345800791so1442088b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 01:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162323; x=1769767123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhQmLwopz4+2NgChpiCiZqfhz0j7tFgKBCw4Sy+KIWw=;
        b=hymF5x4HUhWvrgrrsy2qzL/I1ItAm9qh4pCkEuYNRT2AoMdq4lPAgVe8I3GVVsxSBH
         9d39qrQSm9lYKpxbGWEDYLj5IbmzrH//VX1rXIky63+SgvGHrJGuyEqP7MFT1veEAPLJ
         lRN5ray6POT5eEZUG9wanrNG4clJhGg5+rgKVTPnU5KN8tGltmrHTO0Dd1ytVuU9KCRR
         PnUVNw4kYRlCMApcJiC7A2vieUXErAdRArrR+3kP4hUfb7W6Wel5k9P1GQ15B+0S/+uu
         n5GZDsL2wzsewc5sHp+5xsXONCFd0FL7etT+6uR3BOXtGd5upbWVCX4mr5ZTMkNCcJ3u
         //pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162323; x=1769767123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhQmLwopz4+2NgChpiCiZqfhz0j7tFgKBCw4Sy+KIWw=;
        b=BqfEchpnyiCQibdjX4pPoCq1qMfhliAC/sEKDuZwk1cIMH3xydEP73P+nVGpR7CPuB
         fvM1w04UfEd7ZmfPTzK+zxZoZ2c9fBfNa6bwbYHQgWd+LMwIPLvNSnMHfSEFlzWnxPDs
         SbovnwcTcNcfsDoyP31TvL/LnlNFdU/cuPUnlhkouTUf8p0lcKbJ7XAOfBYLP6WnDiFx
         IHnFn15iArCt5A2BZ3CeyLbymZFSS8InjyYrxzHc23OtpZeVJN7Qse4h0t2SZOTu24It
         rB+HIuFD4vB6ZX3lTzGj50ZCMbqrbuz/AXk9+jo08TzTv2ch5hdcU+DXiybhNbJsf46i
         PpXA==
X-Forwarded-Encrypted: i=1; AJvYcCXYyQjsJ0Dg5pv7eecKY3wrM2Ykrajl0CI/SjVkra7P6Zx5+unlzwKwNXn0/0Kd38GafoyXAMFgVZl3w5jj@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7+FyOCLHgjar5BdpdonA7lV/ShBek+p+MWnZ+GMuMy16uA9ga
	YtygckRFwGA6tsEpYZm8qH+7711+574D6eoRVWggVa9OHh+g6V6/vK6df0pa8Qszk4U=
X-Gm-Gg: AZuq6aJk6gAlUMUHsvZcfaGher/2NZdUpJJWE71akWqbiHevPoBdxqM4ZA1elMS8NjY
	3jaZLyR7FN/kZVR3g8kvbv53edwWosZN77WV6SMhnZnzkaouDLdi2VbRk+cuXxc5g1HKdL8Eq3B
	hIwMLadq2FiwXketR549K64fsDeTlURQUJyrqvsHrbrSh9K8jrp4c/ZVZMVjFqbWfb7EpaYwYt1
	EmXIEVCGFpq+qOgWzFeAxzsA6pwyew4ARs/PDGie66OtO8BnnMTD2HvD8LfAooecJWR4ItUztyX
	CMC2CiPkrGTgJQxiu7NGKi4euwfiV2bAuSViaZUYGJq3FqmPcRmZzAXdg5hZS3K022ymVBIgm0b
	sVtHMuViq750bN39U9sqmbDnYvgGMrANQw8gz3pvMFDR/IfNXYtcHwcv8FjIFoAVEhV3jwy/daQ
	mQsgseZINiwfYiGA2E4I2ESEHcrUIx84Il4VOJDtI2HzA=
X-Received: by 2002:a05:6a21:3287:b0:38d:ebdc:3546 with SMTP id adf61e73a8af0-38e6f6aaa92mr2511061637.6.1769162323188;
        Fri, 23 Jan 2026 01:58:43 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a412944sm1564838a12.24.2026.01.23.01.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:58:42 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove redundant else after break
Date: Fri, 23 Jan 2026 01:57:33 -0800
Message-ID: <20260123095733.49301-3-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123095733.49301-1-tehsiu.huang@gmail.com>
References: <aXM34ZGQ4Q2dsRxk@stanley.mountain>
 <20260123095733.49301-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In _rtw_join_timeout_handler(), an else statement followed a break
in the previous logic. Removing this else reduces the indentation
level of the following code and makes the function easier to read,
while maintaining the original logic by ensuring that disconnect
indication is still called when roaming fails.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ed754fdbfe7a..ac47b2a4f65f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1559,12 +1559,10 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 				do_join_r = rtw_do_join(adapter);
 				if (do_join_r != _SUCCESS)
 					continue;
-
-				break;
-			} else {
-				rtw_indicate_disconnect(adapter);
 				break;
 			}
+			rtw_indicate_disconnect(adapter);
+			break;
 		}
 
 	} else {
-- 
2.43.0

