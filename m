Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EEA70
	for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 15:22:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso236159pjp.5
        for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmsXrQ0WMFUOjfSaSqjTHvp41i7ydFz3EWx9LYdOZfc=;
        b=NW4/3amg0ZRvKo+SF981NcJlVQQB4mFSwlUKCPOGAySdm3uOIAEw2TL7DwScMVkC8Z
         5+PY3Ig+6Xe8PzpyXUzklUZ/wJH05xZqE7EL/4QUq1l4bs9XtP0rVlDGD+wr1o62ENS1
         hQOb42avrhohRh/52F47tqVZb8NmzBjd+wQZ/Ts3DAeg74kPW78E3XAiwqXhzPyhUTXy
         +Hktnh8XvXk+xOxsvJbXtW+ir/9Kp9R0AJtu6+ZBnsRBsebswCXYLy2Cb3Djtd+km4me
         4oVPtLRuCYEy1m5qE9CxTM5KhnH3fg459H2iQ6NWOKY7sSPwkRXvBq6cjW/8KGE12gRV
         y1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmsXrQ0WMFUOjfSaSqjTHvp41i7ydFz3EWx9LYdOZfc=;
        b=p1y6Q+4HQKYi9+jsGBBN7Lt3F+fRDcxH8WTSQHkOgRsFHPNGzZGa7mjUgVL7I8CsnX
         TFwwzv2akGIrAtbaIrz4o50GBr270Vyh5mAuMIp7BkBSEgKGWaXCqktpX5/arz0x6AL0
         qccuKWnUoMgV3p5v3tw41YNqSsbWQvYMM6wme/GiMewGXDe/unUxdyFB9yiF8n9VNAjM
         xFdQGq35hcBBXX/al4II4/K8gekk9b9chDbWL9KEygMbvZpuDhM1p5IKgjBn4ZveFYat
         t/f4sD2CCjZ5K35YD0xDzbR5RXjqlcHBAZ21Ati365ubNVZEQOs9C+oxKuyyp+e+v/cp
         g4iw==
X-Gm-Message-State: AOAM533WOI3UNQ8tJ3lCimLU36t89K4ASvd37NUt6A6xF61f3ZNYpKoZ
	tSSaGAWc6IvsUC01H5IKFsk=
X-Google-Smtp-Source: ABdhPJy0QoJdRNi49a6OBOJ0bydiMRyzMa7tvWU0X0+DGJdOgdCdI8VkwGG5iiar16SXHxcm930YUw==
X-Received: by 2002:a17:90a:5202:: with SMTP id v2mr22129959pjh.169.1624893765882;
        Mon, 28 Jun 2021 08:22:45 -0700 (PDT)
Received: from localhost ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id h9sm15323713pgn.57.2021.06.28.08.22.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jun 2021 08:22:45 -0700 (PDT)
From: Xiangyang Zhang <xyz.sun.ok@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xyz.sun.ok@gmail.com
Subject: [PATCH] staging: rtl8723bs: Fix a resource leak in sd_int_dpc
Date: Mon, 28 Jun 2021 23:22:39 +0800
Message-Id: <20210628152239.5475-1-xyz.sun.ok@gmail.com>
X-Mailer: git-send-email 2.19.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "c2h_evt" variable is not freed when function call
"c2h_evt_read_88xx" failed

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Xiangyang Zhang <xyz.sun.ok@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 2dd251ce177e..a545832a468e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -909,6 +909,8 @@ void sd_int_dpc(struct adapter *adapter)
 				} else {
 					rtw_c2h_wk_cmd(adapter, (u8 *)c2h_evt);
 				}
+			} else {
+				kfree(c2h_evt);
 			}
 		} else {
 			/* Error handling for malloc fail */
-- 
2.19.1

