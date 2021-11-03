Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F212C80
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 20:55:24 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id o12so2251167qtv.4
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PnC8Q/2hoId1m9hye9rp84tP4YYq89c/x16u1wHuFM=;
        b=coZ8JfwSG3GzHVU4ftmoZzUwikxLz7kRRIsY/NSkxWpBDwf9umPhlzj9jeGnC5Fxjf
         VbuiHUs7rf9/17kIDW3Xlk2D39CMuY3pQrBA+JEB7XjHQv+lVtvvCzDQipUL6pjVPy0y
         u8hLyeJWjpp7SGf3GYvrt3UzWyLi4b+45lnVOOVEGpIGr9TR9lUE6tFDTN3+Mz9Niw8j
         MgQfXM2Psik2BBQfi8yfJbLEDgYFljZIocTVNmN40dI03VKnocDl0f8zI4rTPiYUjKXt
         MSt/3Bt9FSo74YZ10HhVCIiTJCj+jiU8f2WGHfkHEAVXRfTUTv3znhT0XxoIGzgfsUJG
         uoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PnC8Q/2hoId1m9hye9rp84tP4YYq89c/x16u1wHuFM=;
        b=Qfmn0+dCLqfbqL0FvDXpVT+ZNkTgE+3mtwqhuEfXkqC0kwnOXYMybHfwjs/X9vVDej
         S9DUC35kY/XZMdiOkUHE7VlLyMUcfBRDAyIVmxxfMyRpVvILHVUl/3By7mk1nzm+bOQE
         Y6QSRsiyPBn4ylnyd9Dm80GQU1fTkWVQ4UvaQLInAnE09iIkIDu3ppbRiTUsjaC0ELhU
         /as6ETOU127TY3KWI8Yh6L9gI39D7vJENbPOXK7GCH/H/eZPmqgB0472M6sKfnmO1ezK
         LN2av5GWzdJ4CqbZCr3i5YuXjdyCwZcQiw+N7fH155mCZ72vdX07fm5/+PbJjvzJo4UJ
         xo2Q==
X-Gm-Message-State: AOAM530WYWRl+Qqn0kPpHKteP00elbRh0HqKnEj7OO9Mj+DNUfKrBwQE
	6hSQubXr6uDBb0yQPRYW/lOxipKAYDU=
X-Google-Smtp-Source: ABdhPJzmGY76D2AYuzQyRhmhDk6RJ559tQNn2R+hS02sjgGYrKeO87zmYNMaOdpAUlqxul+Bol9VSg==
X-Received: by 2002:a05:622a:40f:: with SMTP id n15mr8184521qtx.159.1635972923124;
        Wed, 03 Nov 2021 13:55:23 -0700 (PDT)
Received: from localhost.localdomain ([181.23.84.1])
        by smtp.gmail.com with ESMTPSA id s7sm2423588qta.3.2021.11.03.13.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 13:55:22 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH] staging: vchiq_core: remove superfluous static_assert statement
Date: Wed,  3 Nov 2021 17:51:34 -0300
Message-Id: <20211103205132.33178-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.34.0.rc0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing the BITSET_T typedef in commit d8a364820e01 ("staging:
vchiq_core: get rid of typedef") the static_assert statement becomes superfluous
as now we are checking if the size of the u32 type is 4 bytes. Hence, just
remove the static_assert statement.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 53a98949b294..55abaf02a196 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,8 +74,6 @@
 	((fourcc) >>  8) & 0xff, \
 	(fourcc) & 0xff
 
-static_assert((sizeof(u32) * 8) == 32);
-
 #define BITSET_SIZE(b)        ((b + 31) >> 5)
 #define BITSET_WORD(b)        (b >> 5)
 #define BITSET_BIT(b)         (1 << (b & 31))
-- 
2.34.0.rc0

