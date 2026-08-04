Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F41329E5D
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842080; cv=none; b=czqDguaxUUE+igT1F8qSGSTPxPlPErfjJoEFXfkh/cD5d5Gs5UGebd62M3zTnweQnxoLDaBs/zYUYKro7LBF3efuq8OeId9izu5vLxj7SvAeeqn8LX45xWFO5q8kA9TPXT1STJ5jt3lTAOCMohq3vwkr0hPWpdeyGujbvx1VpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842080; c=relaxed/simple;
	bh=QmgCDVnHL3EwQdcjBKl83nw0EXLAAdaxDQ7dV/oMKEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZFI51ychjaOeg3hX8IwJRYzYmbtl0ShPckDXfGpyxFUe4b8PIusezFrOVlSs88hxGs6EnrfPLxcYrvf0mQ0L0MlGIvo7ei4ar3UXT4EAypU2vTtAq2H2rEEWp9dpPTIw0x9KcK4dSVZzc3kX9kDICTBL8jkAW0OsHh7vWSKNT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsoOM8k6; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsoOM8k6"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so3336778a91.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842078; x=1786446878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8RbR7rsdFWNI2hf8UFgabxYhgw53lU+eapKDiTUJbw=;
        b=YsoOM8k6D477TsG1FyE6DlPZ3blTTBZESGz7GTjbRTudpx8QOBIOBEzjD/i69u9vpL
         USYcdV58v8GyeEvLH488UnXvOwxEk9/tesvQrfFMiPilZkbRm2fC0Uqf4WLBdF4jzJZl
         r46v6dlA8ax/dggQWL5O4VoXUMN+yFWQrbKo1fy0a/N9sAQWeL066/syBixyfpWeARaO
         K7cKTUgJg229pHNi6tWEMOc4tLXX7eEecwS87cxNgvHy740++uiGXuoLdBkd18Gy3Xxm
         m+aqvDF1TwqBNpluGUWIySwPXevEOwm4sq3kOggPfRJ8DV/rjrM0ElzPHMlU5qX7ukva
         /8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842078; x=1786446878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8RbR7rsdFWNI2hf8UFgabxYhgw53lU+eapKDiTUJbw=;
        b=ix5YQUtG2uIJwcce94VTBJjrozNXISuKjTyejZc/xmb2XadLk5+v3Vz04U1rAqBKvo
         ZYqrMTST+ZzIiFhwbO/rWgNX5RQLyHfHcXnxqD2gqmEz0gJHE3wFk56UQXzzCOnQ6OoZ
         HfhNzUgPuG75ZsKr7erxveqSTz+WQY5eaEwAKEM28NrP69msLm/tadMOMo7NheFBycUz
         YXUZR06JOP1568zCcf0huy4tTS2Y0h3wkYcSOHz8TiMc1xMPs16oINiz5XsjY/vSnj0n
         zaCfwxK1PRS2NnYQFG8WoeGr1EfabIenfovJs9CmnYcFRNirK4RB3IoGIKYB4g2UWfvR
         q9Pg==
X-Gm-Message-State: AOJu0YxaLxVWJUQZ+p97tQelVmw0nz6gPRTqy+ka0wwAXyUmEXgVFnyB
	YYY32Kd2Tcfvq2g0jrcF0SfOX912SUNtODV1m4MCvwkEPOh1tQuslNg6suJr8y03
X-Gm-Gg: AR+sD10slZtfyVKyvsNUunUbc1D/B36Z7c+8y6WdU2vkX9MgoyQn2LRw4dpiVrG7BK/
	CqnxCeVoadcUb85T14BY+L+tqXPWAJkVx4UFvGHDEKMYgTD85zODZ5424aW2b346LeTAw9EkfpM
	verOsKaTbDdFRbs9zVrXxgQoNbmiIWQrRUz+a5/Z9n1pSqQSPdf3Mu6wGff9H6oqQM52k3csLzo
	TROKGYeppAgXg9dni8pg2+vHu+7+gp48yBooqnYiQoPhqXevnduQK1aZy9iXhBJ7mEslza3Kgt9
	ixw5Ypu9JlYh0kLLEc/U5Kol4VxB+1XaArMnbMKXQh11Fj7/CE0AIjFp9p+aqXPQF8N5GAxzMpt
	9+e0BP69FQa7sHE1DekJK/XtljmsjSwkzNGD4Wu8TXJyJXgzKlEiLOx7eoxnwIZspTVqH+ESnEu
	5R5AFiQhd7JE88UVG5CnzrzuNrj6fAy3ApIeRtpjEUCg2xPJTQGFQfU9lV+uhuVwwm4QQyR64Rw
	lzN9tVtnXbaGdENTw==
X-Received: by 2002:a17:90a:e70f:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38fbc4f84c0mr11870592a91.33.1785842077455;
        Tue, 04 Aug 2026 04:14:37 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca9111b6sm2558473c88.13.2026.08.04.04.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:14:36 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 11:14:17 +0000
Message-ID: <20260804111417.21503-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v4:
- Removed accidental modification of axis-fifo.c which was incorrectly bundled in v2.

 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3..40793aa58d6 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -843,7 +843,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	netif_carrier_off(pnetdev);
 	rtw_netif_stop_queue(pnetdev);
 
-	return (-1);
+	return -1;
 }
 
 int netdev_open(struct net_device *pnetdev)
-- 
2.51.0.windows.1

