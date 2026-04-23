Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82A30FC27
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969772; cv=none; b=L2GFPGg6Geam+KCvwDg4fgM3RR+2j+0eyRPUzngrB+b5WNOs6IpEbBuwV7HaKQQoH1JR9YHCIPhbaoAmakou3RqVj8IV2JeMEtyZJpF/NCbjVtO6rtp9P3eIlAGRagUfTfyhxuR8VIu/6S7y5dLdhoBzio2TuQFyUUpSk/u5/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969772; c=relaxed/simple;
	bh=zLXo5y0asuv5QaUFDj9H08TMRdTblXZe1alffyCQdhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngMCEldJmBGq1pEwz0x5g6Mh/vFjnvU9G1DiCExMvqaF0oepB92bOYuiGqFLEkU6bEIab9oH6pFNMtADVx1ifjVnqPuG86Li7/Da8GhoAAJwtH1cmWBshfRbr743qHlFjZTR853oz23ZM8JzM5v7zeWO0r4l7YUalAN5aQe7vW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7AdTiKL; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7AdTiKL"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2de831d2b20so5564757eec.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776969770; x=1777574570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=klBsuL/TOIBLJxguURv7JfsyEtm1wUkaVHrKVeSc1OU=;
        b=Z7AdTiKLYPvvgnr1LWxKMmfqRoFaqKBg4qVR5gdGc9Lo3LVQEzuAgzJp7eywkLgEl4
         2j3KwQta+O/QWN+P44f2oTWw9eBZzaJKS1c+CehCr8qQyOEaFqMqUKwvTQi8ca2lDjqj
         o+9Udz2C/a0EiE2HfBxo91IqkpkDLd//8eh9rO+tiZ1jhYx8H6OoLw0zJPf3+FEBBwGw
         UJi6uoha8/mD5dROFCIJl7YYCcD42fYEOudG0yQESWEot7n5wIXxP+UDD5V5a1ua3SdW
         XDOlQ2SCRnKIm49uEYr3Uj5+fFz81nADlmDaMg6VzImwfy8ApMlIbtQLu8OJfxNu48S1
         pC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969770; x=1777574570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klBsuL/TOIBLJxguURv7JfsyEtm1wUkaVHrKVeSc1OU=;
        b=qiiufeEI8cQSEQ0rTucYlr4jt6kos55aE93WJJRpL/B653IF1Nkb0L3QOVpFvTGmH2
         VOKizvL2+Jz57O/0dM0Vky6zIZHFntP60xiDepgc3+UBLZqjTGR75RynEA5eLiNi0iyp
         GXfPmGPPxLzQSnZNSUv0E0TGy33MYo3ygaQCSgjpkqy7h6JXTyYRk5YMB/z6PwMwUmU1
         ZfjDzJ2UAx3bSJe/JYnLqlC6EkX2t6Riv5XlPN9MPcagufZaVZAHlaZQk8jpbkqkncxo
         FI567bD+SNTdW/ExrGcREwoZr6FhKLWbXQlWzI7B/R7MLItFdTpbaEOWOzLrUMS5LLux
         KpIw==
X-Gm-Message-State: AOJu0YyT9ErlzqSPcVG2J0XiR28MwlF238ZG880qk7C1IrLn5ILr83R6
	8gguyiyJ5/MTVCq0xhHbyQM5joNzi8xbhmm5+XKl3N1fspDnLejp3mTEimTQbEASrQ4=
X-Gm-Gg: AeBDietNDDZHVZnb8xhrhsSFnf52uz7qBzpEzPSSsN73F6g/3TGPpm6dYHy4bmUBUuF
	OkURlxLTBERUER4FHIrBOWMVeONAfW+SzfeUTrOEb1XF6eZql54+p54O/imPOfyAgyo3qsw62p2
	2Ap8IKgRSfxBox1hx8xJMxgPqLh/6O5CNiaJ0IiSsC6886l/uMkcbq4CgLkbrH1xcOnFh9TfGoR
	wQGwCQ0gYNiN7vp4U46j76O2a2LSiRyuN2oXJVvQVXTUVHCU5lCLPW0j33hsnIKcw417YhqstKV
	G2rpQJdkrTpD84UEPdCMIiefJuZIZjQ2yc8aD3FpxDruaA1TuqmyvBM4Kg5cPsk2GDzBDuGZnPb
	BA8E289UlZh7IwPsgK9+dMbS1PVywxZ5xCXO8yJpDx0XnJVO7GCSBaMfQ2DYr58aBOfTnFr0MUk
	VOzbv+XuVIqBPJK5qUSqU2qvY9AXv7xwCk4LhF9EyY2yWbRb95rYS0FniiyKlwsNAZlvFeY9nQj
	crtV9jJLfnzKXz4jNZS/OED/KHQa1Vuibh9lGU=
X-Received: by 2002:a05:7301:1693:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2e4786460dfmr13520330eec.14.1776969769755;
        Thu, 23 Apr 2026 11:42:49 -0700 (PDT)
Received: from localhost.localdomain (wifi-eduroam-143-106-58-44.wifi.unicamp.br. [143.106.58.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm29636169eec.3.2026.04.23.11.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:42:49 -0700 (PDT)
From: mgcvale <miguelcvalealt@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	mgcvale <miguelcvalealt@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace NULL comparison with NOT operator
Date: Thu, 23 Apr 2026 15:42:02 -0300
Message-ID: <20260423184219.827694-1-miguelcvalealt@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "Comparison to NULL could be written
"!psta"" in ioctl_cfg80211.c:2432

Signed-off-by: mgcvale <miguelcvalealt@gmail.com>

---
Hey, this is my first patch, so I appreciate any feedback.
Thanks!
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..8ae3adecafd9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
-	if (psta == NULL) {
+	if (!psta) {
 		ret = -ENOENT;
 		goto exit;
 	}
-- 
2.52.0

