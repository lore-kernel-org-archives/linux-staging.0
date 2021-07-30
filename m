Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1670
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E79461055;
	Fri, 30 Jul 2021 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637087;
	bh=IBsuGeJZTyBFwqwFPN/dxE0btB7w1zdSatVUJhcY++E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xjVkxVm9vSlYO9EUaSa27SC69IsBH7cWYM8/cpxMasvlZOx1spenPl2tD99+A1DZP
	 99Tet2hC6tWB+BezZn8tuA+zkvOzfou5H0m8Cx5qnYGiA5TiHyYbLmF9nnSp39zKMH
	 D89OjdTMbFM53OkAwnPMvdcmUgu05SmtqxOZG5cI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 10/12] staging: r8188eu: remove include/nic_spec.h
Date: Fri, 30 Jul 2021 11:24:15 +0200
Message-Id: <20210730092417.1014392-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; h=from:subject; bh=IBsuGeJZTyBFwqwFPN/dxE0btB7w1zdSatVUJhcY++E=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx1TrVcavs9KWtrEtT/7ruNf2fubXNc7Ttp+R/af0zcj z+pHHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARHi+GeWqMMxT3TWsofZixmEGNT+ cU40LFVIa54mt+rnb7dVp8XeeVwrvM7/Sy15nPAQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

No one was including this file, so just remove it.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/include/nic_spec.h | 24 ----------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/nic_spec.h

diff --git a/drivers/staging/r8188eu/include/nic_spec.h b/drivers/staging/r8188eu/include/nic_spec.h
deleted file mode 100644
index 77e865398fd1..000000000000
--- a/drivers/staging/r8188eu/include/nic_spec.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __NIC_SPEC_H__
-#define __NIC_SPEC_H__
-
-#define RTL8711_MCTRL_		(0x20000)
-#define RTL8711_UART_		(0x30000)
-#define RTL8711_TIMER_		(0x40000)
-#define RTL8711_FINT_		(0x50000)
-#define RTL8711_HINT_		(0x50000)
-#define RTL8711_GPIO_		(0x60000)
-#define RTL8711_WLANCTRL_	(0x200000)
-#define RTL8711_WLANFF_		(0xe00000)
-#define RTL8711_HCICTRL_	(0x600000)
-#define RTL8711_SYSCFG_		(0x620000)
-#define RTL8711_SYSCTRL_	(0x620000)
-#define RTL8711_MCCTRL_		(0x020000)
-
-#include <rtl8711_regdef.h>
-
-#include <rtl8711_bitdef.h>
-
-#endif /*  __RTL8711_SPEC_H__ */
-- 
2.32.0

