Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5A366DDA
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579785; cv=none; b=Wj1EFDFkhu0Z8CmVeq/9lGykATb0XexRkHUbayRLSTMoWM4FKUm2bptMdGLWsqosVBud/4wRej6AUkQQH0NKOzx4RgSosBaZnO3H63dqPX8L6rc1msPeJXX1JPZVe4Ir3Mpfi8qHNWVLmUCSh/SGjPmIPFgulZUO+ydeq2eFQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579785; c=relaxed/simple;
	bh=dIC4krnhUbkkUTBT5VgRHl5pz/XzEGJ/15AuoRa2dtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nr8xB2tg2dWwk6DEaBipCXqro3Z57WygqsuK73nACtGT2/8l9NyMyo7u85H0zNHtgD0e50TRixwuCvFzRz3GrnH3o1SVh7OAFgyVz1O2LRvi4boVNUrf9RTrhZWbIPXPWKh1jgVH/IQYMRB9DZVnVnmgQjz78FXGfawTIX609B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4Lzv/SD; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Lzv/SD"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-502a98c66f7so4110631cf.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 08:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579780; x=1769184580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJHIHFCiKGtN3Vz2QBYWaPoM/6QimaGuLC01u9SsN5Q=;
        b=S4Lzv/SDJOY7RLwCgV3ZAlJ+g3nXeDhW+sR1p9Z2ICoJq6YrAbR1r2bPOLNtkZTLtI
         1VxePeKpY8MpyZMfuXDS6K+fuB5j3yaaeEmMl6f8RfT4U8/1lfaQUeIz+YVkRoOy9IRe
         Z8OrKC+NZS170WR6uSMxWsHprVnNrbY+6WpqPA2QxCB3K/3bIqqxAH2PHZ5mpAldiVA1
         i+O/mthpJshKX3XoMxnspswW45H24UuW2Np2z4D/I7csq4gymQhKTl+R+9FEwWyOg108
         EioX4TatPrPoYaERBn5BNyASKKv4z/YisfvzaaJz1C10xWAKCQc2/UjhYmzcTtAGAydJ
         W2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579780; x=1769184580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJHIHFCiKGtN3Vz2QBYWaPoM/6QimaGuLC01u9SsN5Q=;
        b=SsKoeTxrWFJuGWl+E8LL9QNQz7npiZitXaPiNFHa0A1cYsi5un95XuUI2pVMHTRHls
         5TzBVxeG1/3IAgMUmUCjUTCAB+wwuMiQk/EsXfsIXOSaxnlIt+EmWspRC838pKYRPZoS
         F3Jhh6Is7cQ+8HGHdV7h++IDft/iIFT/dH56adiu5dztUP8uRWGXARC8QNXpCdyKIyoe
         oYkCCwkHbhgK2MqrDBL63WLh2evup+Pxa0jEmIeapiIOHrJAa0NEqkQD9gVs2uBdzg84
         lhH14fal2wB5efXzt8jOew8gjy5Le1SxU7s8JGQYzjtAINyRpA1h76o/mv6EMCf7+5Sb
         OjbQ==
X-Gm-Message-State: AOJu0YyqG8WUCU+8O9IS3rsd0o9jmNbgZTCDQOX1y24gCWslyS+qM8gP
	LNuolWs3N6WNGFO5sDP2uISZ7TWoxf6Hb5Jz9YyON53CUYenYUwEm6wl
X-Gm-Gg: AY/fxX6CvgebjSTzFJ0B05WhIMI7CGKKdRehtNqrDHUeqItN+zuINiBIVkx9M8gGGhA
	lWXEZ9qWaQhQyPG49b6HvoFh+pdlk1Rl8vTC96eiWf25NtHk1O8Qf6hifcJY674TTvqr7RB/Yau
	/9ISqX8aqEe3mcCH774GNrERhmR7wVo0AOEmmN7bEMwDH889wPdmMWDoxXou/J19doekjOfDmqL
	uTVdZS1DBlYnFeTlWQmHvxA8EUWqtzm9pfXiV4xVL9bTv8ji9m33o/Fue0vxHpSsnY7CoWr6A6x
	O5lFLecZzJPmvht7Gi2G8Q8mDGT2a0O0QKqDppRvSxov6BJELOgyHsHG5yCd0nxKqV9fsbTkuz3
	v9E0JwKR0igh9CAO+yq1YzVpgsV1lYnl562LlIChMQXtwjKx0a45ZiSivgndW5aIO4dFldOa+8t
	sWTDlzdy+dTOO4maIgQQOJUnU2
X-Received: by 2002:ac8:5ac2:0:b0:4f4:c104:9519 with SMTP id d75a77b69052e-502a17520a6mr47984181cf.42.1768579779492;
        Fri, 16 Jan 2026 08:09:39 -0800 (PST)
Received: from localhost ([132.216.195.103])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm23009621cf.14.2026.01.16.08.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:09:39 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: replace ternary comparison with min_t()
Date: Fri, 16 Jan 2026 11:08:50 -0500
Message-ID: <20260116160914.88069-4-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116160914.88069-1-william.hansen.baird@gmail.com>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary comparison for setting copy_len with the min_t() function
from linux/minmax.h.
Change is purely cosmetic, however makes the line easier to read without having to reason
about logic.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8e41eb61448f..842e95e1eaec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4,6 +4,7 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include <linux/minmax.h>
 #include <drv_types.h>
 #include <rtw_wifi_regd.h>
 #include <hal_btcoex.h>
@@ -1024,13 +1025,11 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 			pstat->flags |= WLAN_STA_WPS;
 			copy_len = 0;
 		} else {
-			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
+			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len+2);
 		}
 
-
 		if (copy_len > 0)
 			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
-
 	}
 
 	return WLAN_STATUS_SUCCESS;
-- 
2.52.0

