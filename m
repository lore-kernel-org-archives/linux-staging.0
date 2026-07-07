Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9FC438466
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444521; cv=none; b=UVVKnSXy9mAB2mnH70lXKGFPKuVPNKVVaPB1FwmtFANi3WEIwxfeGAVbFv1UNHK94IQC4F54Rhfgnd6Hdq5MCJaSAaO6PWEORzgsExAswrOT+6Z/YJ481yJ0OwfIakRFvbGp2q+l8z1vxFlxTJ04iF5saaraJjQn7d5iS8Ro118=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444521; c=relaxed/simple;
	bh=2cU7g/IXMw1lZNbRtGgQKOHPnfpcEZkPG7O32ECxpyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGbXrULsfHsC/X/8OZP0v2tTIydhnPKmglPgO0LEDXa7rR339dHgVcwnLKpCeYOpITph9HcPSc8aguSf1zapM+MEP+LqIouHQq1FNSSqt9gIGhTFiL5Hjy9RuUgnK60UP3NXNrjbGaLiKjv3TthNXbGD5SdHxjzMj0m66J1+UMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=lxcCHjgm; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="lxcCHjgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7b
	GL40G6Ev/bxYxf6YZnuLhJpfYy4Ml91hq9KS3Jw4E=; b=lxcCHjgmKfCLOG5d7h
	W1QGl79y5zQFE1T+SBlzqGm5sC1fNi8z/bzMHHMQuOui9vR8Sz7TzNVyArN1RHp1
	UF7wb8MhbqBXI8X7WXAB0tm0rNJM1kHWVIFsHaUJs/7q5YACEUWDKLEcFp3RYwtm
	KBR+Bh8SHbUlLTY/oA3U+/n9o=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz8cMNE1qRiRvCw--.53372S5;
	Wed, 08 Jul 2026 01:14:59 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v2 3/5] staging: rtl8723bs: split nested assignment in OnAssocRsp
Date: Wed,  8 Jul 2026 01:14:48 +0800
Message-Id: <20260707171450.70997-4-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707171450.70997-1-coolbeaner@126.com>
References: <20260707171450.70997-1-coolbeaner@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz8cMNE1qRiRvCw--.53372S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyfuw1xKrWrAr1UKFWfKrg_yoWkZFg_Cw
	s7Xws7tFWUAFnakF4UJF4FvrWY93W5Zw4ktF1qqrW3Zr4I9a43X34kXrWakw15Ja15JrZ7
	Cw10yr1Fkr1IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZa93UUUUU==
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBlhP+BmpNNBP0iAAA3B

Split a nested assignment statement into two separate lines in
OnAssocRsp() to improve code readability and conform to Linux kernel
coding style guidelines.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e317d776e2d9..4283844be615 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1366,7 +1366,8 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	pmlmeinfo->slotTime = (pmlmeinfo->capability & BIT(10)) ? 9 : 20;
 
 	/* AID */
-	res = pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) & 0x3fff);
+	pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) & 0x3fff);
+	res = pmlmeinfo->aid;
 
 	/* following are moved to join event callback function */
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
-- 
2.34.1

