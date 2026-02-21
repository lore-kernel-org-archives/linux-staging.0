Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC52566E9
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700886; cv=none; b=nEF1SzzsJ1dlOTM94972+7XvI+mpt7bjerIRNkc7GO/94yFtK3/P5AIBkwW9OoOz48DsRAcs5y07uu3iJ/uY5AxMHU2r7rd9SrRurxQ5dsvkOVDKAWBXKb+sgxff682lADfT/PksrcoBNtfnsqHz1OrJOF/BWn6uXqF+SZ96XfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700886; c=relaxed/simple;
	bh=6JhWdVA671Zleucf7kEbXOLunhtJI/thjqtR51/ky0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=es5CJc1DnINwiOMa1CDs5XPpRWh1VbSE0635qtCahMmPPllcWuBFwpQFen9Y1QJetuoDejO9EGSarTk78r7Rqds2nyc4irgqg/kbKanDrLaN0a3EZw3FwPd5/w6NUg9WWXQvsnIJMRhEJFlHdeh0kTq+8yovyQosJg77FKnbjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=EPFh4QMW; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="EPFh4QMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771700883; bh=6JhWdVA671Zleucf7kEbXOLunhtJI/thjqtR51/ky0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPFh4QMWkTtJJelDgiEQSXqi+z3fe6AP4cbXpM2maEulWgCC2zY6AEDqho1fpW4f/
	 kpgDeMjb3jJMCmIgHdox/Z1hQBxIhbkM4ypUNR4X+k1pcjYaKPhtpt9XJ1GQsjHShk
	 q5Wshrp0D/lDU8oCj66lTA4FC28YOkHMPFm4zxXIxj5/zf3p5sZvFJlMaI0E2drChc
	 vg11F5EQi29c7u0UqJGdvlVSUtZaddowOPyMzi7HHHtRyDaeZLrW6sn5K7ut0SWhzn
	 xaGsZYLJ8V29svzUwQ5YO90fIdkYWfZMSaboxopKa+O4PMcDK9KZe/fo+Fl6Eycndt
	 bR7/X8eMoQa1g==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id D3E6F400D2;
	Sat, 21 Feb 2026 19:08:02 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] staging: rtl8723bs: Remove unused BIT32..BIT36 definitions
Date: Sat, 21 Feb 2026 21:01:32 +0200
Message-ID: <20260221190628.50273-3-plaes@plaes.org>
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

BIT32..BIT36 seem to be not used anywhere.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 404f81756b27..f7b647db1a75 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -46,11 +46,6 @@
 #define BIT29	0x20000000
 #define BIT30	0x40000000
 #define BIT31	0x80000000
-#define BIT32	0x0100000000
-#define BIT33	0x0200000000
-#define BIT34	0x0400000000
-#define BIT35	0x0800000000
-#define BIT36	0x1000000000
 
 extern int RTW_STATUS_CODE(int error_code);
 
-- 
2.53.0

