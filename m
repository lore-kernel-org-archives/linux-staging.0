Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514316FB9
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286387; cv=none; b=O7YGMPHlZGoTNQwqL8GVnKVWr0SLwpa8HPsuz999CQhmaJbXmd2rB6qcEanUH8kEq78a4puwMDfSKa6cBnpdr67GFENm4rNO4cYGhyXAOSi6rYiJcG0XuGFzykkR7/Yt0Su9lh2KNserz8TKdcD8f+rTw3EiU2ReBSF5mloTFNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286387; c=relaxed/simple;
	bh=ih7XMXQALCvjm8plUarj8ViVVaJzTWpexWos7fRy9t8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=llu9oIYkzY5q1W3T0efQ0j7zvDp4IcGeAvvC3XWnkJPqZKgdFKzkYsxwvj3J2vHwkPNbY0HJTb7f/phirmqzCwvcKICD650FaM7HGzbviy8j/DAhic9ZV+6kbiQ1Q2TT3gMBJYd7aJgLb++v6qmOgnWFUxBl/ckmz9efcxjvg98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bn44CXy1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bn44CXy1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d3ba4e6ad9so35067a91.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286385; x=1724891185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ySssmJ41V2INbrn0iqR/C781hHKt3ltF0YIyWsfJgY=;
        b=bn44CXy1etRanZs3+ETSCNlm0PHAABIeK3pLzwUhYQcqhhTI/BmtpkAV68BghEdsi/
         rSZVKhFJWT4hawKWM5pDbtW4cgPoClVelDf9JtzYmgyZpt9SFU7bg9LGCOdgKWJ3KW/o
         WspgphP39reDfKtG7HBTd/2y7QrRysz+ek8po6tQKqdt/a5dsIxFXS7bddZkeDDYKydr
         H1JDP9b2DMRM0Vp3y3YPSJN45A5HvwttKgnPxF1Z0CXZctq89TCTv1G+DMEAWkuIQNpM
         HAELNXGrHOAx3q17cKIM8+JTowEE1JCBASNe9oFKLm4sj2CvBU+AH4nMFH2Wuf4r9PwD
         txUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286385; x=1724891185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ySssmJ41V2INbrn0iqR/C781hHKt3ltF0YIyWsfJgY=;
        b=aoyWi1DVkqbxcYqtIo4gz4PJO512u7Qu9EcI8KnIyBE24/tXdgu0OR0jSCb5YCnFIS
         Sxlyjle361Ep9y/zq1rGNvvbzKlH8JgMG7RGCTt95GAWYXMN0QDm4E4dDjTRWC+EMygc
         09xq2himWcSMwJw081bjkOgjYLlMG3gpyvM1F7aYWE0kF9l0aMdGyvh3oy4MbHrtZyoU
         1O0+O2prbfzlLQjJMZ2aO/fyWiwVaoXu3MyB0W1OjlrmQZwNbVB24slsTB9hYElUQQz+
         Kqrdn9VmlVLQ4CSib+QaXuIyZxWV7slEPyaad/xJRpoWskPDoZWWe9ctXaEztdZqXFAY
         hn6w==
X-Gm-Message-State: AOJu0Yz7I6GWaqW+AB2i/zAX5q+wx2wewb2Iuq0OsicEBZZVEKDfXDhX
	Z6vIItiU8mUDyf3d0pBD9/pvpTmOWkNPH5ZnuPXOtSNhn4ziC6xqplhkOcr3
X-Google-Smtp-Source: AGHT+IFyvhyHxU7tZd4t3B9/RQvMxzUmc5SQihqwxcYd3x5yBILtzMyQDl71W68Yc6CjzQ/QX7lVAQ==
X-Received: by 2002:a17:902:f0d1:b0:202:41cb:7d73 with SMTP id d9443c01a7336-203681b4bd6mr25185815ad.11.1724286385199;
        Wed, 21 Aug 2024 17:26:25 -0700 (PDT)
Received: from archlinux.. ([138.94.103.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560f569sm1647975ad.220.2024.08.21.17.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:26:24 -0700 (PDT)
From: Christian S Lima <christiansantoslima21@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: fix parenthesis alignment
Date: Wed, 21 Aug 2024 21:26:12 -0300
Message-ID: <20240822002620.63732-1-christiansantoslima21@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix line 1326 in order to silence warning
CHECK: Alignment should match open parenthesis

Signed-off-by: Christian S Lima <christiansantoslima21@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..fcef0def7148 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1322,8 +1322,7 @@ static void _rtl92e_query_rxphystatus(
 
 	if (is_cck_rate) {
 		pstats->SignalStrength = precord_stats->SignalStrength =
-					 _rtl92e_signal_scale_mapping(priv,
-					 (long)pwdb_all);
+					 _rtl92e_signal_scale_mapping(priv, (long)pwdb_all);
 
 	} else {
 		if (rf_rx_num != 0)
-- 
2.46.0

