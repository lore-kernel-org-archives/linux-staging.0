Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BC2FB6
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 23:45:05 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r6so25930541wrt.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaU8XvMDlRzppvPtqeG4HzfqaAslqIfkw75F7ePCAxM=;
        b=fOAT4e12iv7XULPraUmdJLFCrJ7LxIkc+A9vCqfUGQHKenq/pZw1m6SvnMlievU7HP
         FUuHUBc+ydMTkRegEr9at/wZX42tCyctCEeE6E19nERUIeFau3rWp5p+FcQCnZ9FrR7u
         HecVqwtFegBx6gDoOmQFxcjomSwAyh7d2oY5a/OwVL0RuB+vJyRHj6SZUmfbPt43Cz05
         g9dWlV7/1hxzlQYcc6KbNqrCNuYOgEVAe9od6XoJbIvaZknqlLvx9pF6fsCsUR1JH3r/
         0EWHHUYf+KOagZj8SXvcNzPJW8ixaOtsPzC+XhEjkKEGSVfASqdCO9fmz81ojqTbdndG
         UkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaU8XvMDlRzppvPtqeG4HzfqaAslqIfkw75F7ePCAxM=;
        b=sdTwbyK2UoVPbUsyVgdcv/ZhAFFsGcpIHOSIgb5ZFNWgIJnZw6CNb2brSpzj+sf08T
         IYJVMSh7fa5bIfeMaFRnxfxPZ3lDGVRGgNkf9/2mihkAy5gwo8DMcr7madDYM8sQwRW7
         bOr/rjIeGFKDW5eAKy32TtTKYhm3KZ7QVoQ+Hd8yZHkDqXEK/BYXQY+i/FhRolzUB7Gq
         pAylV+2Kpgq7Lu8Oa4k6INDW794ewCPPzk2wIbPSoDJLrvubrzmrnhzYuf48qcS5zK2y
         FR8/nptc5tR95q4KaUcGpcdZwvOmD97oAb4dXbSJWyc8DeSGF9X3tTCjye+jfgwVO3L/
         ZZIg==
X-Gm-Message-State: AOAM530l0xupvNE2p6rgB62ITohjelaB5k7z01Vkft8skpu9i8Pvd4FS
	5/A4kZYHtLPgPkdZulqS8kGmpkSQbkDQjnRx
X-Google-Smtp-Source: ABdhPJzYbuWmIuYNmerimksAlMiWnMkhNA51joyTg1+ODwl8ufEIyUYhQUa25ijMVMzTPYS3gDDDMA==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr528141wrx.65.1629157503656;
        Mon, 16 Aug 2021 16:45:03 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id w11sm291521wrr.48.2021.08.16.16.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:45:03 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: r8188eu: remove set but unused variable from rtl8188e_Add_RateATid
Date: Tue, 17 Aug 2021 00:44:57 +0100
Message-Id: <20210816234459.132239-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816234459.132239-1-phil@philpotter.co.uk>
References: <20210816234459.132239-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variable init_rate from the rtl8188e_Add_RateATid
function in hal/rtl8188eu_cmd.c, as this fixes a kernel test robot
warning. Removing the call to get_highest_rate_idx has no side effects
here so is safe.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 6cbda9ab6e3f..4302054c6c83 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -155,7 +155,7 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 {
 	struct hal_data_8188e *haldata = GET_HAL_DATA(pAdapter);
 
-	u8 macid, init_rate, raid, shortGIrate = false;
+	u8 macid, raid, shortGIrate = false;
 
 	macid = arg&0x1f;
 
@@ -167,13 +167,8 @@ void rtl8188e_Add_RateATid(struct adapter *pAdapter, u32 bitmap, u8 arg, u8 rssi
 
 	bitmap |= ((raid<<28)&0xf0000000);
 
-	init_rate = get_highest_rate_idx(bitmap&0x0fffffff)&0x3f;
-
 	shortGIrate = (arg&BIT(5)) ? true : false;
 
-	if (shortGIrate)
-		init_rate |= BIT(6);
-
 	raid = (bitmap>>28) & 0x0f;
 
 	bitmap &= 0x0fffffff;
-- 
2.31.1

