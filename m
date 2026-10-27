Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111014;
	b=kaYfvqVlPT/bJtNOulSCgBYa166IDuSOcY4YfZwnmD5hEzxvt4tDt6kvzFQ8ayX9WUMg
	 fVhhGwSKYo98MXu/t+gE1PR2FJ+/ohxgA5oQhNA2F8Ybuv7yqw1ARJ4e3KNyqvMuPYMnO
	 rFwwGVIt5XP9W3WXBgkEd92gToESkLiAmPyPgBd7714GPFL37XYyx2XfIHpKHu/AM4WaO
	 m9tFlhEaYEVFJvXA8VCaOl0pj1e7+tRBW0VFtho8gOiCCgfuwFgGxEdgfkkJKrNWarfkJ
	 qqAEEk+TfTEm+84QStJ1LmB6hq4dENjlqg/GO3R7CBXNYDurDnDpMQf5TWip0HoD0WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111014;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BuIlLwMd2FMVO0k1lyniVsasMmiDEzVa6CkIfR/Asag=;
	b=wrWj3DUlIEdFW+WFfwjgcvzZsAFPklDfi7k2vppPX6N9aSYJgNqHWFf9O5AqWHmR2GL+
	 Ei48ZA48nvsjkUMa/uRC0q3VvYYM9xO07FlmzuckATSUgBor+2jAdAN8nhPzg+3GrZlbX
	 g6VlFGkxtvUy3kuUAr1MBPgm8SOjBikh7QI5+U+UMNpwzfQoSHMsaVCfcmkZotEPHsj9/
	 5cjau9fce0gH3om7n/BQEJsMudk3V1aHNo7LeA28lWCGAcUFscepmzCAtiVNDyF/RRY9m
	 vz2tHUSqNAO0wC5axHQ02H1fbOFysFgC4APpfkCL/Jv3ka1/2AjWSbX3UdFF+nlM/yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FmRMfUvS;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E4860A262A
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 14:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E4860A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FmRMfUvS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Bu
	IlLwMd2FMVO0k1lyniVsasMmiDEzVa6CkIfR/Asag=; b=FmRMfUvSHAZ5PIOqSY
	Gn4Tsp6t1pa/bZznDvD1UIimArcauK3vVR4XBisWfJ8N68OWDWi3haBAb+vBgTwB
	81P0c0k8P1Mqxqq7RKayYFffqdJtchAuDbgn/xaTeBsXAGQ6OwM/7nODpLtLLoxz
	wHFxQ7lt74h0NdXENxHyJ8TTU=
Received: from iZbp142fio164970eurit1Z.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDn3o7Cs+BqSuuRCQ--.48315S2;
	Tue, 27 Oct 2026 22:22:59 +0800 (CST)
From: linfordWu <linfordwu@163.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linfordWu <linfordwu@163.com>
Subject: [PATCH] staging: greybus: fix loopback Kconfig help
Date: Tue, 27 Oct 2026 22:22:58 +0800
Message-ID: <20261027142258.1720002-1-linfordwu@163.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDn3o7Cs+BqSuuRCQ--.48315S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWxKFWUAw4UZryrtF43ZFb_yoWfKFX_ua
	sYqr1xAr9YkryIkayIqFs5ZryI9a1qqrWku3Z0yrZxXr13A347X34DW3Z8JF48Wa15Gry3
	urWkZFnIyr17AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_5Ef5UUUUU==
X-CM-SenderInfo: xolqw0pugz3qqrwthudrp/xtbC8QPvj2rgs8P2lQAA3L

The loopback driver help text describes the debug log class and names
gb-log.ko. Update it to describe the loopback class and the actual
module name, gb-loopback.ko.

Signed-off-by: linfordWu <linfordwu@163.com>
---
 drivers/staging/greybus/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index e1d7ffdf4..3ff475500 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -75,10 +75,10 @@ config GREYBUS_LOOPBACK
 	tristate "Greybus Loopback Class driver"
 	help
 	  Select this option if you have a device that follows the
-	  Greybus Debug Log Class specification.
+	  Greybus Loopback Class specification.
 
 	  To compile this code as a module, chose M here: the module
-	  will be called gb-log.ko
+	  will be called gb-loopback.ko
 
 config GREYBUS_POWER
 	tristate "Greybus Powersupply Class driver"
-- 
2.43.0

