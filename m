Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C1EEB3
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779621489; cv=none; b=H40MemQgZIjMEB7J7rkGZx7MypljUKpgoefArcdC+4seT5GrNzfjhiVaI77Ndda/wRYN0pGAvc7QmMn8v+JXKFRRV08s8+Fpy3tMNf4xC0lyR6ggh3iDSHxQkO+lneb/wD/44AAgSe3svIoFAwuCO+Pa6Ie4RnXLgxy6zQW9kbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779621489; c=relaxed/simple;
	bh=cxZ6Wq304qm/pWnLzK9fkzStcdkb6E9GZNbBmLvjVOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHYiQbLDRf+WDNbOdxxOYpeWNNIAUcvQns3hYLaYOi/i/JKtUdlNBUwiWqje7hXJIiFvvG/q6rZVqnW7CzjYbLMgR1peiJxZCxnznmgNrgCQDKZrDC33ay92ww603vLghDMMvobNzl03HBJe4/sVwjW0xQgxX66hI3yf1xS+L2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SleL5Ro7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SleL5Ro7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso4053509a91.3
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 04:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779621487; x=1780226287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78fg6B0e5DE2uoymJD/8Zg5SFHiWgc255NUvHTiMiiM=;
        b=SleL5Ro73ZY+waSGRiy8XvfNbSfZslxmELWTl5194bS4a3qS1B4oD54HoXnLPirrFI
         4P42w9z4OsgU4awLf9NbmXRknkBA3CTFJpB4IjubPzq+8Uyx+uw89WLBcVjeuIRrcLHk
         WC/ylW7ThNtUqZh9QxmfVMbn3DLPC8w+HslG3d7T42CMTvtwHyp0ht/m4uf9evGdI2Ng
         gmUpOKGEIPYD7mcfFdQYwwRnGuCMe1iyGv5iRbqRwWx8zz3D++e06nEu24k7qAIZzbKu
         MGqv6zO9PjwnBh8hrHF4XCBgX6s7V3ypZfrkuuwgkWU+bswvxEPtO4lN3JIDCZcFgnRC
         wnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779621487; x=1780226287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78fg6B0e5DE2uoymJD/8Zg5SFHiWgc255NUvHTiMiiM=;
        b=RHthbq0QeruJx8xexCrw4CPmaWqmkBAZb4SlRHb8DvK53WBjOGWAAworhy0/xGvgIE
         FYWuv/8Y1BKlgNmC61TN8jwHp68WoCcPG8NTDSkTjrT+oZ+nk2JGGSl9bX72W2fKIGhJ
         xAmVxZJY+rU9frSWG8WqI2LMKZth1VOwhEb8E20D0cRixTH5+MLxVpHBx0TjHen9Dr8D
         FNa67uTFG6t+PyjtD2i2sroMmKRGKuySbn7+u6rYYW9C9sxxmySkhMa5qcS6vZ/aeYmT
         YksDT35pN+2MJoHOx07ZwXy1nSfAglxMvwwUf5jeE9qDSxu6XjwPrOjoGy3uZIK/Jj3t
         Z2Lw==
X-Gm-Message-State: AOJu0Yykkp8Y97SIvPHLZP/lwajHNPSNFa/cU8BBsr6AY+IBQQijvcB3
	0kBcWF4j8Faqk4eTB8QJMbCP/nzGDS71Ctf4vDz3W8ezdRyEwfdrJ1Nv
X-Gm-Gg: Acq92OHxOkqandFhi9yNRALlmoEjuqTEfbc4uiJwXp1st1W7tIWpQKMYWQibESf/0Xx
	6npJa7oo9f5YcahaDrr73g46rPCaN7U21mtNlX5k5IaiJ6U+HrIkdxybCKNj5Ccd8fuySO/2UF/
	8KrgW01d2+DmwCq/HfZoe9aHuGs1AjgCdaN/NvfPoiULYpA+jve0wyExBgLQfA0VwxzEKd23asa
	2QHoiKzbecRCpPWXi+5tNjA9q9APjq0tfQ1aAowUwCCQjSWcV1fQxyMy4IyG7JRAm0LW1UIpCUo
	Rr1lXQD6QNE1w2WC4qR4HXRkUYPaJrQUbJDxDq0e5oDkt3xnikhyDqEWzEnhCsUXeUzgDXH9eu3
	siyg4758Z88m/1tVnpl8c8gM030TwkO64LdbjApGfkWT74VqiH7KFk8xZfMzm5eh/AkpM7LLyGZ
	mRxc6UxEUoxdkPKaTepUSA2uqK
X-Received: by 2002:a17:90b:2d44:b0:368:ea0c:1b6f with SMTP id 98e67ed59e1d1-36a6741d7afmr9545592a91.5.1779621487492;
        Sun, 24 May 2026 04:18:07 -0700 (PDT)
Received: from atharv-VM ([103.97.104.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ce6bsm6695261a91.11.2026.05.24.04.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:18:07 -0700 (PDT)
From: Atharv Margur <atharvmargur@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Atharv Margur <atharvmargur@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in odm_HWConfig.c
Date: Sun, 24 May 2026 16:47:36 +0530
Message-ID: <20260524111736.14477-1-atharvmargur@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around a single statement block
to improve readability and conform to kernel coding style.

No functional changes intended.

Signed-off-by: Atharv Margur <atharvmargur@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c88d669cb..171625264 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -236,9 +236,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	if (is_cck_rate) {
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
 	} else {
-		if (rf_rx_num != 0) {
+		if (rf_rx_num != 0)
 			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
 	}
 }
 
-- 
2.53.0

