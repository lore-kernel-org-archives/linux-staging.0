Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BC70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 15:35:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C744161208;
	Wed, 21 Jul 2021 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626881753;
	bh=aBhwRnD9XtaSII/i65BOdQGdvKUZuaG2pZMtFEP2L+c=;
	h=From:To:Cc:Subject:Date:From;
	b=dVZ+KRlxoTD2dpe1fPZHbVzym9aevejR5wjrIfdgudun+KNN8b50nOY3dcKjyIOiZ
	 qzF6J7EGO2LZ3W4qTssPHT0TgqMMvCgJI0RSjM8hSgoV21pFqSqnjwdCpMVhrPL/05
	 UhzRgw8FjdSnNCp/+LNNRZbPqHYFZER7bcYfoOdKKBdfB7RvWRG+7ZZA7KLf8YeK5Z
	 irWvxyIec89lHVo7BevloDphSC1IkHRzgKGJ6Cm2djv3JW5Ui8va0cuzUn5mvIwLKk
	 bwOpBVCjq/0FknCsRRl7ds1h8OOuSaEiLVwdWEu8GV4OITCbNfocSqOYgFYF8q/5ob
	 aody9MHUnRYQA==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: select CONFIG_CRYPTO_LIB_ARC4
Date: Wed, 21 Jul 2021 17:35:44 +0200
Message-Id: <20210721153550.3624490-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The other rtlwifi drivers already have this, but r8723bs
was converted to the generic implementation without adding
the select:

ERROR: modpost: "arc4_crypt" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!
ERROR: modpost: "arc4_setkey" [drivers/staging/rtl8723bs/r8723bs.ko] undefined!

Fixes: 1b11e893eda0 ("staging: rtl8723bs: replace private arc4 encryption with in-kernel one")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/rtl8723bs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
index a88467334dac..7eae820eae3b 100644
--- a/drivers/staging/rtl8723bs/Kconfig
+++ b/drivers/staging/rtl8723bs/Kconfig
@@ -5,6 +5,7 @@ config RTL8723BS
 	depends on m
 	select WIRELESS_EXT
 	select WEXT_PRIV
+	select CRYPTO_LIB_ARC4
 	help
 	This option enables support for RTL8723BS SDIO drivers, such as
 	the wifi found on the 1st gen Intel Compute Stick, the CHIP
-- 
2.29.2

