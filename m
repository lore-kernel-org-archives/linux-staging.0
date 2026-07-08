Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7941CB3A
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523401; cv=none; b=ZORJGyTdPK94lycPgXRYztDTjUPqZJ9I6yKzVc6vkGhkQhaUbPccBGH8V/PAIbyB0vjXy6yIjma6mAx+r7q9lqtNSFGIrzcnVVd4JCTRN3UoSm0qlvUKXidf8E1fTMFlUeEr9CFVhNk4NK7Bmx7zOUIHUlDNY5EPCyK22XeOb/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523401; c=relaxed/simple;
	bh=A7Zt6cpnDKZT6wcq1Fqz5u6uT9L0m2W1+YXHj0cwjrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ub2BD2DBlrSoWKwm2T0TSU8yvhZjL24ebq+wWVzPlgwKFSGCK1uLuI+UlqdCAkBqG7A8v0TZFKPJ7SJ+Pt+1IF/iFgKcWmuknuqwB1aykIEgdjBYztIsLolHuZ51/mJwpntVy03ml091Nr0L/5OcwJ3IK5UWo4TQgRE0oykTLuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=CSr997Xd; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="CSr997Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gF
	eCce6TfaC0eDlNjWakIPQzpeyrPvtxIWnj/HSJMBc=; b=CSr997XdlPx+tbGmj0
	iTM5EVC7Yilsl9q/vyGir9JGvLhi8X698qt8mI6HsI3IYX7mIw1p7Oz9ulaKFkel
	iK2dTzqkofShvWMaToWz2EQ7SdQgwlaInCOFHEqPxcvR/6EcIqpFDL2cimFKS/PZ
	A1sIS2FmqTsaulh9d8lzv7Wxw=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz2MqaE5qmk9uCg--.53577S5;
	Wed, 08 Jul 2026 23:09:38 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v3 3/5] staging: rtl8723bs: split nested assignment in OnAssocRsp
Date: Wed,  8 Jul 2026 23:09:26 +0800
Message-Id: <20260708150928.74065-4-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708150928.74065-1-coolbeaner@126.com>
References: <20260708150928.74065-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PykvCgDnz2MqaE5qmk9uCg--.53577S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyfuw1xKrWrAr1UKFWfKrg_yoWkZFg_uw
	s7Xwn7KFWUAFna9F47Jr4FvrWYg3W8Zw4vqF1qqrW3Zr4I9a43X34kXrWakw15Ja1UJrZ7
	Cw10yr1Fkr1IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUGXd5UUUUU==
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBlxJUW2pOaDIY3AAA3w

Split a nested assignment statement into two separate lines in
OnAssocRsp() to improve code readability and conform to Linux kernel
coding style guidelines.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 2b706f1abd4f..5ea42f054249 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1369,7 +1369,8 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	pmlmeinfo->slotTime = (pmlmeinfo->capability & BIT(10)) ? 9 : 20;
 
 	/* AID */
-	res = pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) & 0x3fff);
+	pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) & 0x3fff);
+	res = pmlmeinfo->aid;
 
 	/* following are moved to join event callback function */
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
-- 
2.34.1

