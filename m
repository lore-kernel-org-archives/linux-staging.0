Received: from out203-205-251-72.mail.qq.com (out203-205-251-72.mail.qq.com [203.205.251.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1186652
	for <linux-staging@lists.linux.dev>; Wed,  8 May 2024 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.251.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181261; cv=none; b=RoOFoJAio4iGF0ebuRVgbuR5Ghld7gZnb07v5aAzygf4kcHnXH/JacEqSHtib805/z+pQzpLoqXKhgRGK4rW1WvZxQmO3F9MCHr+POcCk2SQrdo4XFCRnGQC2pqIc0/qnDTj5Fg33MPajvUdn51f7EFcwUVEOH3G6Jkl9IOqpV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181261; c=relaxed/simple;
	bh=pVWuYbzUs7Jev4RY7RmHJPW4092hATCc5SdzY5qRSLw=;
	h=Message-ID:From:To:Subject:Date:MIME-Version; b=udsV10CfVYj0l4MfZYuDsbA4XnIWZsoFQHQS8hVZe/SYLX1oLRBCm6qTRuteMXzc79X68hKnCHfrWtyrUNhXZ52GdPoIWEkAQJFNsqGAtNeELpixKcXwhy8lsOaoRZyitjqPIIkAD3NhYltxSf34kctjBba3m2Gf3mSl10Qjwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=yJiroyhW; arc=none smtp.client-ip=203.205.251.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="yJiroyhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1715181243; bh=elRxz6OWhugfzFAIlmwlLj9gRAiGJCPhF4W6JN9Xyhg=;
	h=From:To:Subject:Date;
	b=yJiroyhW4dRFus/60A7z9T3n/4yioFE46vd9ziOU5Z1D1WVDA+IKeVItVz6Fu/4wP
	 46DMDhIysDzIiV70idrvPL56itCqKvHzTJkaUFTbZPcsaAww78TNoRIaGXmYreQMOP
	 cUsiX00T3BRI/X1ov60bISvNPu6cnhr0e44ywjP8=
Received: from pipishuo-OMEN-by-HP-Laptop-16-b0xxx.. ([123.115.148.131])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 375AB210; Wed, 08 May 2024 23:13:53 +0800
X-QQ-mid: xmsmtpt1715181233tkjqblovg
Message-ID: <tencent_1992979C468AF087A1909000C6D0D5E61207@qq.com>
X-QQ-XMAILINFO: MUl6Z5IrFzo7Rxpr5BMoTbyvm829X+fUJdpiyFAfklHaNPjsUL+MRRa88iq6np
	 3dCgOCRp+f1wzZtEYcNcXa6FM6+LOwGTASB1HPAU0OnaQ/YTIAkrP9/I7LPEKwb7KeVwKg44OmYf
	 r61J/cAI+dDoBOx7ilN+jxbQZ1tDWQ8e+Y0g/gZK3s+QcBrxjFjGamqOnddAcKpwgc6fBOwh38mz
	 5uzMJAJmfMHoWD5ROP8p8jgZpCF1oQxjTXNXPY1rXOft+/uPxGLk6HwvEAijQhMHjHlhLxQOmyjf
	 095s3a31xa+OqJPx0a9xJX6OfbBHXgVG66ZPHKx3JlWGCDXfrrRdQljO5TZDDjhFUJywSrg7RK4u
	 6F6MGGcFcirD4eXvzvT2XSRJcSxdXWdRlAK80zgUa4Z/GXi6fjyZQJkiexd2vfYrr9Oj0XO91uF7
	 WBxJEWDszBDeF5GGPWkwAdzhJCBPzhgbx5roJywTUY47CyfCHlKH3C5s0yEx1PAAI8GPCqofqTrr
	 qXecxlbWm0kB7WocpxS4S3Ah1a5IPsr6fiR5FehXWe3vz/PC4oftteA03AikEqsznXwWJgg6CktF
	 DdK4mBrGzobzKhNjkGgzZfLyHY3aTNA7L3+3UFprG9nPkgqfWyoZxQDj5MWjNfEnmea7g9UjZAdM
	 68VJZWjuw4cujoSMppGqKGEBu1NXklINrk88Aqp7KdHKDfkXB3fDh59eq/J7Azha4/o2iYb3+Jx4
	 qZ8iV+GucNO0rMx7sWtxB817jWB+52QD+R6OTiWyCa29yOqMULjUzFvZX1/vQ7jG/Es+ePpDu5En
	 Q5VGh4KNNtDag+IVgDs74I5YKKGsnc1x1bu8g7KQxQ6Q8xuVi2DBLHdJyOjSlRTwbXg3CxSr5+9O
	 FJyT5qtY68xbOargjIpdou8k9H37z/fX5Sp6uDhvXztEGiiDLytJQn+B6Ul7D4AJvAf3qznt01DI
	 pNqKBzaSf3MaybwXggIUHj93jGvziYl/TuCyx7efXP4X/fuY10ZQjHSLfzw3u0PtJlKJeuDZ+fvz
	 P06Gp/Aje/IQruYAn0U6qBRfjhgfzCsb1JibiV0gfMVoGVnp6+8B/KtwQvqcURTnk0zn+7+Bdr8F
	 DF5lNdpfhZXpM4VJvJw7jbvAuKk9rP8bWc5hpGUTkgZnCT7c0WMvu/uyIcg92NEYmo5mYyIrRS9U
	 ciOkc/2yAsioev2Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Chen shuo <1289151713@qq.com>
To: 1289151713@qq.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: remove the r8192E_dev.c's unnecessary brace
Date: Wed,  8 May 2024 23:13:52 +0800
X-OQ-MSGID: <20240508151352.6831-1-1289151713@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a unnecessary brace in r8192E_dev.c.Remove it to shorten
code and improve readability.

Signed-off-by: Chen shuo <1289151713@qq.com>
---
v2:Make "Subject" line more unique.
   Add space after : and driver name in the subject.

 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e3ed709a7674..1862a9899966 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1640,9 +1640,8 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	if (stats->Length < 24)
 		stats->bHwError |= 1;
 
-	if (stats->bHwError) {
+	if (stats->bHwError)
 		return false;
-	}
 
 	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
 	stats->RxBufShift = (pdesc->Shift) & 0x03;
-- 
2.34.1

