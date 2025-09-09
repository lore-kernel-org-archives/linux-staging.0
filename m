Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10031A262A
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 05:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=157.107.129.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396022; cv=pass; b=FA7xpem7NEDEJfmH8HvX1b3kUc5Ayw+UKHMkRTbVqx5QixEEcE7/3MeBX7NiA/mUkGkMhOz/UANR0rkavExMvi8xbiUjnrHLVX8f0VllVYWxtd319rewhwZI4aK9nWHbIIb0u06R5nzxIUH/f3DQcWBvTxibWT/0CKpLoOHUwXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396022; c=relaxed/simple;
	bh=g2YjWgnEDAPDkMVwhEAlivpVT9esL8m9WJFfyOpzF5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7Zc5MISjjhVRxrtM6wT5WaBeMmqjBGXosPQmcnbm95tv5kqaBGF4bms/VXTURvkSwqaN4xvoLr3ECdfUpEGhPJqzSOitugyn9fu0ukRwXQwfhqg4I28bumKzp0U4VHaNyKyLi0Mqz4k+nxYxd37K/2T8NbYxJ8nkhPk8A0JqKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=UBOE+4tL; arc=pass smtp.client-ip=157.107.129.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="UBOE+4tL"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id BF59610A2494E;
	Tue,  9 Sep 2025 14:33:37 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ps_dpWxw7Eid; Tue,  9 Sep 2025 14:33:34 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 0DAF410A2494C; Tue,  9 Sep 2025 14:33:34 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1757396014;
	cv=none; b=gCdd91+ilEOnEXShT963uhex8KXSpsJyjauFH3K3UI6u/JPuz7q0gCBiVzsSrRzwWRcOubFekBAdyJU2KRUmDL0GUkNPp1En6gXEy4Bm324m/2+/VoXCrLmvTjkyadLjipjJc90/SIj9o1RCsKCnyNMbRJ72WnMqkBrgWQwExA4=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1757396014; c=relaxed/relaxed;
	bh=g2YjWgnEDAPDkMVwhEAlivpVT9esL8m9WJFfyOpzF5w=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=jLRGhG/b7ZLx5iW+7mREeyvSZzWe8mxTDyxH0i3NU75QCcekaQzMKU3JdlchsQDckWFtiUx1bS30/WKF+o9SJLTRd4t3GRmbdW+9fvHooHY0nR4uZbYnUbe9ZcENNsfaI9vFezneP4rcb5sN1/X93EiEVvx+ZExd+MNdEcxzrEI=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 0DAF410A2494C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1757396014;
	bh=g2YjWgnEDAPDkMVwhEAlivpVT9esL8m9WJFfyOpzF5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBOE+4tL1XoMi8E61VVOvY2/zJSk2KvbptRWJUlZ4aZp8FABVwU+29cFIFWOYjrlb
	 WVMK1BhWJjUqEd1ip4IxKCMkG+ZbBCsFW48TOsVEctiS5qvParY0ZlgHOO/zc+qvc/
	 vxhgAtPD2oBpGHyh64+eBBz270tOAubUYrwyzpbA=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: gregkh@linuxfoundation.org,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2 1/2] staging: rtl8723bs: rtw_efuse.h: simplify copyright banner
Date: Tue,  9 Sep 2025 14:33:26 +0900
Message-ID: <20250909053327.140763-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250909035804.129904-1-weibu@redadmin.org>
References: <20250909035804.129904-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Replace the banner-style copyright comment with a single-line comment.
No functional changes.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/stagin=
g/rtl8723bs/include/rtw_efuse.h
index 669565fa1c69..ac7d6ef454c3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -1,9 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*************************************************************************=
*****
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- *************************************************************************=
*****/
+/* Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved. */
+
 #ifndef __RTW_EFUSE_H__
 #define __RTW_EFUSE_H__
=20
--=20
2.47.3

