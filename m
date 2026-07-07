Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737E1438496
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444519; cv=none; b=sAzZNcwNVq2kqlvDKAjhHiDhzeJ3usQ0m8u2mmXZGXgW5yxj893bBkfo5lQM4NiL84R2Uywo36RliSukAx7VX/IpyZv8RbXy7FJt8kYygdsA2NJmChQZLP3eMUdZ7CSgswr/uf05MVBbLzn4te8233VoptTVWO2VMPBC+Myw8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444519; c=relaxed/simple;
	bh=1hHmLZZGdNKWFltNa5JNf1v5Jt9GEOnvgn4l8pn75fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0nGtIPPzGA7ztRW0mlJpRySTh93t1wbshHCr5Tg9/gwrm7dwsDiS8JNLhR3bYBIohDQw4DrXlNFWrdRlkTa6VZui57VhxFpQe0klK0zacflvL1YHj7HJMp4bg0TuoUrSomq05pnNnQ79zjuLwVsZQtPkGbpaY7/AtkF7D+56pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=RBHWj63A; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="RBHWj63A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=04
	FABgYz5PuYR8VbXFNxuhJrJIL+saKD3q5PFZrp9+w=; b=RBHWj63AiVvvK/F0ku
	Evgy6KgSGZ5d2C2twFWNGF088dE08plkNEqmqqrN827JEqYaggM7pKSdN8Z4jzY5
	Fgiug/3eXWxs6+XJyt1lKq8mgXqZHUBIBhHLkqLxUzUTrKDKUjdav9/9Lhf4C+r9
	abzlnD37V5aZb7XxgZqAE+dIs=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz8cMNE1qRiRvCw--.53372S7;
	Wed, 08 Jul 2026 01:15:00 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v2 5/5] staging: rtl8723bs: simplify boolean comparison in send_beacon
Date: Wed,  8 Jul 2026 01:14:50 +0800
Message-Id: <20260707171450.70997-6-coolbeaner@126.com>
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
X-CM-TRANSID:_____wDnz8cMNE1qRiRvCw--.53372S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyftFyxAr45Gw48CrW8Crg_yoWDGFc_W3
	97tws7JrsYyF9FyF4DAF4rAryFga18Zw4vya1DK3yrZrW8uF93Z3s7Xry7WFy3WanIyFyv
	yw40yr1F9F18WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREsqXJUUUUU==
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBlhQAB2pNNBT0igAA38

Simplify the boolean comparison in the do-while loop condition within
send_beacon() by using the logical NOT (!) operator instead of an explicit
comparison with false.

No functional change.

Signed-off-by: Jinke Wu <coolbeaner@126.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 3a1ff22a8a75..ade7b42abc97 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3687,7 +3687,7 @@ unsigned int send_beacon(struct adapter *padapter)
 			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll % 10) != 0 && false == bxmitok &&
+		} while ((poll % 10) != 0 && !bxmitok &&
 			 !padapter->bSurpriseRemoved &&
 			 !padapter->bDriverStopped);
 
-- 
2.34.1

