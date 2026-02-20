Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F63451BA
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604219; cv=none; b=uYpaewhy7cYzEcFFAcxHfK5VATW6CZnN3Bl2i+jM1zKgMsOH7UQdz0+90hZf+b8ijM8bN1m6y4C9sHT71MN7rg8nwa09kw4njNY/npYZ7Z4QeP4J4bSIDQk5KOVH5XD0oDG6zACf2fFDz5ltHWWMpNgLpYUBeGd5EKDoKcLlCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604219; c=relaxed/simple;
	bh=fRa+9EGxWRIylA1IcHZpdl+M8QWSK/oku7jcD9pKEoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLBoBp8MwPoySviraGXCPCDvq/xhMJcwa+38gJg/eemdhem6WEY/jICRvIWrSvHDmMaPCPv0iwb32EzyX7aPv0dnXa5ZSvvhY4zX74SyJA4C+eqQ7RK+z9J3Lv1dwJXR7YETjs25q4sw+lbmfs67LxOPXYf2kCg0i16FE46AZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=KVLaVTXx; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="KVLaVTXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604215; bh=fRa+9EGxWRIylA1IcHZpdl+M8QWSK/oku7jcD9pKEoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KVLaVTXxIDNVuF8FQPm4xNDI/ufoQSZ+uJjjxEtFeGnDEAjUM3tvG/EXVoWwxnIi2
	 Jj6kAkfw/iP5gFbGuDnCiogO4on5KcSnpRR3Oi5S6rRC3hEbUMYva7OsnTIcLU3rto
	 0aCW46bRC6qo7fRWiYrBfGZ161/2AcXODeGw97VB5dI3kRg5v9uYSpNfQSWakrmFX5
	 +NY1YAACqCcaBUxsQmW3uaRVP93ck69B3ON0SanZmJbJA8iygIT+7IsoDBS3WU8geL
	 P0QLIoRLZO5SwOzlHV3uODufmDvGaCxVene66VFS9UupFsbgcZZKPK/zZ5M9+xW5Cr
	 i641MRXz37nBQ==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 47DAB40602;
	Fri, 20 Feb 2026 16:16:55 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8723bs: Remove unused rtw_sprintf macro
Date: Fri, 20 Feb 2026 18:15:15 +0200
Message-ID: <20260220161611.2398915-5-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index d6710e5835f0..cf75760d364a 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -85,10 +85,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.53.0

