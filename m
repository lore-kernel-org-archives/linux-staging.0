Received: from cvsmtppost20.nm.naver.com (cvsmtppost20.nm.naver.com [114.111.35.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828B2C0287
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 05:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768887651; cv=none; b=isHcOXg+PX2mCbOoj+RL4dmiu8MWp9T1PidKmW/QftAHjtkvlg2Hz1sW78wfrulTYZTV7vD64H8aOPGs/YfDDeuwJfE6yRAYy3nh94sPRtNJXLdR2clt6RaGhtLaCOwJ1oYE4YrzCgIkzTWI6q9pPUo2fSUBhJyqMzgiVxnO4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768887651; c=relaxed/simple;
	bh=mFat8b3S4nmSl7ZI/ZrQXFO3AtoC5Uw8s372ruyWoBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umMJI+5GcBytjTVhXDwwtzB1IINr5H8q4U6Jk48NdmHXCBi8QmWj4tVbHNg7AlAEURN+le6QiTKII2QCzyJJfwMOS7P8uMKtjoLeEL6VjDNvHQCdiB50l5zQLsW4p6u/kzMC21lQ58dNxL2oTxLdGZmg8jr9kRFZrDNDhb+OaKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=xgcK2Ngl; arc=none smtp.client-ip=114.111.35.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="xgcK2Ngl"
Received: from cvsendbo032.nm ([10.112.24.43])
  by cvsmtppost20.nm.naver.com with ESMTP id eZtCgJg+QoGxHnUoKARBnQ
  for <linux-staging@lists.linux.dev>;
  Tue, 20 Jan 2026 05:40:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768887640; bh=mFat8b3S4nmSl7ZI/ZrQXFO3AtoC5Uw8s372ruyWoBo=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=xgcK2NglMDon23XD7B/sxrXrq5gxMZC+fnar6snd49MWuNGCZJI39yYbuwEOS/GnI
	 xK/IqPlaT7VHYuIJqcTRUvNou76HXSNELJV7V6AnRKvSUzVkpUJP8oBEeZUu1tkwM8
	 VoY3/21C0sipCl8wOklwwZpwCIcU8H2TjE+0C8Tqeo2biqgW/iXgV7R72zElUw3iI9
	 vgILWiDOKrXbf//qRtKS9u6BdxY8uPnJQzJSMzKzPielJYSmdXdiY4WmO+pkSmGrC4
	 JoQLSNAzNoEnCkO+4pB2bU/CMNR9DVFxmzkAndxxgyL2SMWNtAc05HYkwDQoU1KeC4
	 3xe6y9OX575ZA==
X-Session-ID: CyWSssRyRuOEihYnKS+jxg
X-Works-Send-Opt: E/YqjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AqY9aA2rFqJZ+HmlKqU9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp004.nm.naver.com with ESMTP id CyWSssRyRuOEihYnKS+jxg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Jan 2026 05:40:39 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH] staging: rtl8723bs: use kzalloc directly in _rtw_zmalloc
Date: Tue, 20 Jan 2026 14:40:36 +0900
Message-ID: <20260120054036.3783680-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc + memset with kzalloc for simpler and cleaner code.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..be46132a533a 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -24,12 +24,7 @@ void *_rtw_malloc(u32 sz)
 
 void *_rtw_zmalloc(u32 sz)
 {
-	void *pbuf = _rtw_malloc(sz);
-
-	if (pbuf)
-		memset(pbuf, 0, sz);
-
-	return pbuf;
+	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
 }
 
 inline struct sk_buff *_rtw_skb_alloc(u32 sz)
-- 
2.43.0

