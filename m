Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A0E14884C
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700932; cv=none; b=kDzsKSssIihnTtUm75dwvktV/jM6GufFHhQNTHLCVqJQkiBFaZfo7Aa0QCPnflm2ItCFn0+f5tke8VMiCWqXV6n+sirIgzCvHU+Uw2/1AZUH23GT67v+2HHPGm0gv9l7cGWXljZnDvcxwHetnJkEAxgYlbMw41UkfC1/E/OUnqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700932; c=relaxed/simple;
	bh=e0kFqaLm5bGYI1JkuXE+ytuyr8AfALdhetjH8LPacG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9fJmvyjAowLouQlnpFQJsTd16+//0GFFS8sSJv0t8//VeUno6oaLtFxBgQ/wuhBPOPsW/lffBCZH5xCr/3OSox/LFOfJWbKshd0rs2xnwjijmril6VZYnVhfUrut5KmnyyPlaHBixQy0ovLVZqMvfOAnAJGtkjKi3ClCBOBDug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=TZLXqfL+; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="TZLXqfL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771700930; bh=e0kFqaLm5bGYI1JkuXE+ytuyr8AfALdhetjH8LPacG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TZLXqfL+N+9Z2GY6uTRki+tS82EceHdGhGmbniHLFG1I0EODxHD+dnxGwb3ItP2yC
	 zbmyUNoUg+9GhDzt6jmjEG/fEkVUJEkxXTjV8Pjf5hNcAa2Pz3NyEIikQcSEFZfcQ/
	 wks82/KUQ82kZEdZDiuFG4r18qxpHL/NKpggWmiGixsIWHR1NOE5pbBESyLV5Ue1HR
	 UCIz34IkZ9aWpic6cctGJVjvMn50IQebe+YQygonGBVBQ1f+hXpoZUaEf3GgxrDfi5
	 2TZJCvJAnD8452i+pthRueCUkz8dUZdMB5ZyXAdAvaJZPPikncsV+71Pr+CGdUWa1m
	 slEg/SI282oDA==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id 61D00400D2;
	Sat, 21 Feb 2026 19:08:50 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] staging: rtl8723bs: Remove unused rtw_sprintf macro
Date: Sat, 21 Feb 2026 21:01:34 +0200
Message-ID: <20260221190628.50273-5-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221190628.50273-1-plaes@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused `rtw_sprintf` macro.

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

