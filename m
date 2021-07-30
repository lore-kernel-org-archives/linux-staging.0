Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCFF70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05D176101C;
	Fri, 30 Jul 2021 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637071;
	bh=wN0YssmsDD+8t9LGB4ZfKefb6bahUkz0D9M0WltK1pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1eh9bUUfLD5R2wrFTm3Kef6ma3c1Rru3BP9xSMHG41E7EQ1Et2IxuRlFLNpGqNdfi
	 n27n+INumq4waVScuIuCTsTif1p7dBhMyMawZYqUZFHeHqRWoE3Ll7THzFSTb11X7e
	 fdN0box5r0ELGYjGmYSQrctGSVTKuVokCzBUOOO8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/12] staging: r8188eu: remove include/h2clbk.h
Date: Fri, 30 Jul 2021 11:24:09 +0200
Message-Id: <20210730092417.1014392-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; h=from:subject; bh=wN0YssmsDD+8t9LGB4ZfKefb6bahUkz0D9M0WltK1pw=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx2eKMudDN+wNaHr6one8ItpBdlVFULhOW9Xtv1TYrpf eb+9I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACYiIcWwYP2PrbV6bS1fTp80mJUn/C p9e03QSYbZ7L/3bp/S+uHTlyWnL9mb3f907dWNzwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

No one uses this file, so remove it from the tree.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/include/h2clbk.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/h2clbk.h

diff --git a/drivers/staging/r8188eu/include/h2clbk.h b/drivers/staging/r8188eu/include/h2clbk.h
deleted file mode 100644
index 412b611760b3..000000000000
--- a/drivers/staging/r8188eu/include/h2clbk.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#define _H2CLBK_H_
-
-#include <rtl8711_spec.h>
-#include <TypeDef.h>
-
-void _lbk_cmd(struct adapter *adapter);
-
-void _lbk_rsp(struct adapter *adapter);
-
-void _lbk_evt(IN struct adapter *adapter);
-
-void h2c_event_callback(unsigned char *dev, unsigned char *pbuf);
-- 
2.32.0

