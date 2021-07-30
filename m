Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5270
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D1AB61054;
	Fri, 30 Jul 2021 09:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637092;
	bh=rIqgBNLr9kMtaYlxZk7uApvhtTEhqiH9K45BzDFlnWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0I0GX766fLRpRRaR3Kr7ffUbe2LJ10Pj0eMS/T15zO9q1hxhwjfJ/aGdMui++lVJ
	 jHs0ZU2QVQOQ0yRpFpLAAmXYuBXYF/ZdbJNc+nxEdFvK3aYnAYBDZ+A8DgTHlXYagr
	 KeRsPzBa51v5rEjzQOmPPQUwqnzTmOo4RG2+jDg4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 11/12] staging: r8188eu: remove rtw_usb_bulk_msg() macro
Date: Fri, 30 Jul 2021 11:24:16 +0200
Message-Id: <20210730092417.1014392-11-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=939; h=from:subject; bh=rIqgBNLr9kMtaYlxZk7uApvhtTEhqiH9K45BzDFlnWU=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx29L/WtYD5mprdfdSkf+1ufwzK1HyKWBM4PjwlTXHnS guF9RywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEykcC7DgjOaC1jUUo6H/JKQWqb2g1 VpS8qyNIZ5OjddavM/RmzxL/+T/0uIa9GRh5eqAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

No one is using this wrapper macro, so just remove it as it is
pointless.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/include/usb_ops.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 9e60b3a9a02a..d5b31e31b62d 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -25,9 +25,6 @@ enum {
 			    value, index, data, size, timeout_ms)	\
 	usb_control_msg((dev), (pipe), (request), (requesttype), (value),\
 			(index), (data), (size), (timeout_ms))
-#define rtw_usb_bulk_msg(usb_dev, pipe, data, len, actual_length, timeout_ms) \
-	usb_bulk_msg((usb_dev), (pipe), (data), (len),			\
-		     (actual_length), (timeout_ms))
 #include <usb_ops_linux.h>
 
 void rtl8188eu_set_hw_type(struct adapter *padapter);
-- 
2.32.0

