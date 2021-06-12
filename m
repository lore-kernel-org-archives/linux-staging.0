Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22446173
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 18:19:49 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id l3so11288318qvl.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f9oAAhhR1hjmXaKhdSjE/z7oNVThq6q341+U+T0q1uo=;
        b=Iglrcm9IzKV2LkOwmVFFysbDdMVJBMOrlqfQTj5omAgGxNlaxbRHY/LhArTMz5nXu0
         FBCHQxn3aal/atB5lXZCoZUmCUHSnnJlRqiWQTn8C1klf8I8ZGQR8LBIzMbzIoDXAgYl
         OX81MIpQYNmJvYPnmqlOtolRXjCX6d5C7qHhsg17sdb4oqsFbNQzr9Wui4qeOwGEF1N2
         pJDWn76NbRC20TqSzkuCgVGNjp4BFL2AMRL2aS7Sp+3bqhRpLParWAj/1NlZrYRT7TKz
         IEzkOzg1PxKZH4npoazBCNO0GAx0W6Vqve/yYMRFuAKTSlEr5LzBEdDkK6N3WWbXfJTr
         l9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f9oAAhhR1hjmXaKhdSjE/z7oNVThq6q341+U+T0q1uo=;
        b=mqSbviq3QttBW+lm83vScEYfMiu6A2NWcB0Pzw9ZU5cJrbI6kVHk+lm+7MLCJdKPu0
         iup5zCKiHluzMZJCJF6NAD+0ihsXJGuo/87dyqYhXw6psxDkzFqPgQVIUdoDjItfiYi8
         mdSujmYeXR3e695aLmAhEfKWu4LXtSjFES0vFpvl8M7jFsA1Z6/WTnYbewIxjQbR0vfc
         /X8bX72u9K2Fk5vzxQpyZb4t4Ywg8Dr9wlgLcBmcp7EVCZ7Xu2uSvfMC9LOaPVyeIWUA
         p+UbXJtIvO23WiLKEImdjm+vrNP2MJ9MbkbhAzqrRg9jSGnIBq9XpQSMO9+efT3PAdHN
         eZPw==
X-Gm-Message-State: AOAM5319R0ubIIQKGb7IEG4PZ6X0Pre0PNWWHe1+Gpu6u032KQoahwlW
	IUm/5aL5gG3RT6Y7n9Xnwu9Z0Q==
X-Google-Smtp-Source: ABdhPJwDsAO48aJ4fsqd0ev7co262nUg8lkBnrElWZfMrkKQyei+WKlDndkG/wYFoQEJOUkGmceTJA==
X-Received: by 2002:ad4:566f:: with SMTP id bm15mr10873676qvb.54.1623521988258;
        Sat, 12 Jun 2021 11:19:48 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id 7sm6966045qtu.38.2021.06.12.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 11:19:47 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	dan.carpenter@oracle.com,
	gustavoars@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: remove HW_DEF_ODM_DBG_FLAG enum value
Date: Sat, 12 Jun 2021 19:19:42 +0100
Message-Id: <20210612181942.33817-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove HW_DEF_ODM_DBG_FLAG definition from the hal_def_variable enum
in include/hal_intf.h, and remove its usage from the switch statement
in rtw_hal_get_def_var inside hal/usb_halinit.c - this is dead code
and no longer used, now that ODM_RT_TRACE and include/odm_debug.h
have been removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c  | 2 --
 drivers/staging/rtl8188eu/include/hal_intf.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 3e7f184ed39a..e3f3868b0b65 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -1850,8 +1850,6 @@ u8 rtw_hal_get_def_var(struct adapter *Adapter, enum hal_def_variable eVariable,
 			}
 		}
 		break;
-	case HW_DEF_ODM_DBG_FLAG:
-		break;
 	case HAL_DEF_DBG_DUMP_RXPKT:
 		*((u8 *)pValue) = haldata->bDumpRxPkt;
 		break;
diff --git a/drivers/staging/rtl8188eu/include/hal_intf.h b/drivers/staging/rtl8188eu/include/hal_intf.h
index 39df30599a5d..2e3e933781eb 100644
--- a/drivers/staging/rtl8188eu/include/hal_intf.h
+++ b/drivers/staging/rtl8188eu/include/hal_intf.h
@@ -117,7 +117,6 @@ enum hal_def_variable {
 	HW_DEF_RA_INFO_DUMP,
 	HAL_DEF_DBG_DUMP_TXPKT,
 	HW_DEF_FA_CNT_DUMP,
-	HW_DEF_ODM_DBG_FLAG,
 };
 
 enum hal_odm_variable {
-- 
2.30.2

