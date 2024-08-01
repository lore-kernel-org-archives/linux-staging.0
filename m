Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFAC13D607
	for <linux-staging@lists.linux.dev>; Thu,  1 Aug 2024 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527528; cv=none; b=g/ZAyFyqodLJi2n2CCUdUNrIYXvLiCalf9MQLvOFZUwvWwboQNuSnl8tGtAfpQUUNqTEX4YG2YyLi4xwm1EpmI8m+TZOXrAXy0UTazTMyLd8h1TBm89FYA5rIwUNt/dGD9Z7DKXFyQvzelX1Indb+x7A9Gf9YQ4vwXkZPt+Rnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527528; c=relaxed/simple;
	bh=y/lj7vBeNf0zFhIlANE7wwYSi3TRQBUY7ACxJkAWiQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=em9i9gKpX82G/iCxGH3S6bQfhjX1DKjBRseRaDF+MAtI0xkxycSZUPN5uBnz+dEuOH3VzNGM/Ro+v+3XWWkit3rIyrIXa4FUyqG6TNAtEnTpPZA678RhqEgOYXZwkdAuaARw9/gryyI9UZMT2H2lXo1bM92gifTo471qScsY2So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIxd+O9R; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIxd+O9R"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cfec641429so517717a91.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Aug 2024 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722527526; x=1723132326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WK6z8bBp4HaVQ4gSLs/GzN2vxB5I+xvIw+ZJcc3qJM=;
        b=KIxd+O9Rxi6hrd5nWiylMvLjWlsQFHd3sUDJrrlqAQsQoWHkFNiXavib57vravXGQd
         /MQBQpzayojPj/v5NGqwOcfcSHUuPweY7YqqcN9sDyzpZZJvxhTmcbskLYKpGXz7eALS
         Z4KDCRKXkzJserbgm3UzLuiCSz3ntF/qMVEAkVAnN9tE6SfKNwA2FW8UaaZ7qyUj7pQ0
         gs7ckpPDFADyd8BXiogtBh5HvYtfdGy97tGh5dqO434vLgIJL3676ToDN3AYhVAsJKS9
         qdF033dQhntzlSEwf8tH7uRvynKsOq5cOxNDvqnsLFHL9qU6whD/q0hw/csfyheubzp5
         R8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527526; x=1723132326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WK6z8bBp4HaVQ4gSLs/GzN2vxB5I+xvIw+ZJcc3qJM=;
        b=Z+axLVraLy5ZA/eI9GW8cSX3NFdpCBqUA82yX68g+nmqqrrfkM0O7tU3l5v7+p2mtk
         RbvIxkeW3iafSr0CN6r52+F+jAys0p+UC2uVafNZsO6h7+S86GjGgO2NsZgAUDgZx57f
         nVfHg+fQQu8S7lYBVj8mqmYqO70KaZT9EYXr/+MMIbZvXFbwHgJJ6H3W75a4ARdKxfmI
         lLwY3toXABFT3jvd/OKU/S2qc+rXHORHH3MGLICzG9f3AJSwvnREtiX9uG9+A8FQANqt
         dZoWBvkfhuGLpjd1IZPDLCXFpk3lGcxW9S0g1vgriEkjS+G7hidgu5iAKc9vZ1AiakIS
         MyjA==
X-Gm-Message-State: AOJu0YymhkYjI5pSGappo2hK0BrZk9iQLFZa1i51iriGXp1DD7aOb9Ee
	tiWaCVuuKmTgGiKVcKIAC70Iz5EhyIegg5Lsyu2Wo0cw6vuo1X1t4ReeZ30IHD0=
X-Google-Smtp-Source: AGHT+IEIbp/uvYLet050nvRtxKTJyYdiGQ3L05uMZKwP9rmpMifIJRZRJg+VPTmyeEu2Wix4XSuVQQ==
X-Received: by 2002:a17:90b:109:b0:2cb:5134:562a with SMTP id 98e67ed59e1d1-2cff93c4bfcmr872553a91.7.1722527525843;
        Thu, 01 Aug 2024 08:52:05 -0700 (PDT)
Received: from VSUS.11svbebsuybebf4lhlhk4eftnc.syx.internal.cloudapp.net ([20.39.190.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffb0cc3e7sm75034a91.26.2024.08.01.08.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:52:05 -0700 (PDT)
From: jiwonaid0@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jiwonaid0@gmail.com
Subject: [PATCH net-next] staging: rtl8723bs: Delete unnecessary braces for single statement blocks
Date: Thu,  1 Aug 2024 15:51:38 +0000
Message-ID: <20240801155138.25531-1-jiwonaid0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiwon Kim <jiwonaid0@gmail.com>

Deleted braces {} for single statement blocks.

Addressed scripts/checkpatch.pl warning.

Signed-off-by: Jiwon Kim <jiwonaid0@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 1eeabfffd6d2..e0736707a211 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -144,9 +144,8 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 		psta = list_entry(plist, struct sta_info, asoc_list);
 
 		stainfo_offset = rtw_stainfo_offset(pstapriv, psta);
-		if (stainfo_offset_valid(stainfo_offset)) {
+		if (stainfo_offset_valid(stainfo_offset))
 			chk_alive_list[chk_alive_num++] = stainfo_offset;
-		}
 	}
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
-- 
2.43.0

