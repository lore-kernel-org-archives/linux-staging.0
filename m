Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264753C37
	for <linux-staging@lists.linux.dev>; Tue,  4 Oct 2022 15:09:48 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r13so298014wrj.11
        for <linux-staging@lists.linux.dev>; Tue, 04 Oct 2022 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=701Ck6g0QIE4xfCqkzTh43wU8sP3WgE0ebhz4dRse7I=;
        b=NGxUdAlmvvXWbf3Csp+CZ4s5zWfCS7LroYp3XrCNtoPNjOY86HinhBRq9Yd/izp9wo
         +8XexC/kRU80vPXel1zYMeIRk7MPkI+BmzuaOd9dSrf/k2/y/kcj2qgnbw1j8yZ1pUsp
         2sOmFT51r/ZrsF/zJJ/LgHEuw33Oyas0z5llkZIzpybFZogz+pHgChgl1K+gAKeVfQyn
         iI2z+t3n0pISsDomkATFyjgTg3UrVztALvZEXc5qr1o51pSh0mwdtkH32KdUplMW/PTq
         5V2mCOnRk+D62xyU0zX7/zymS7qz2lE7v2ejSG5vnI1aNAdzd900CbTvzLl8wZv8j3td
         eZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=701Ck6g0QIE4xfCqkzTh43wU8sP3WgE0ebhz4dRse7I=;
        b=wbE0JCrEoizFgU1weK2SnNtLgQQoWN6DXs46U/fBEJiIBxkTTzcBM212u1XVGXF2Fy
         qCcWBswX/lofhmpvam9dI/7K6WRpPFugpqz9RcauE4+E3Ez3HYpUtB71bvGRHXmb8J4e
         uHseU0zAlvDyMODRlHvkLSsGSDQ3EHISTyC5sMKfJpIDQc5jY0k36s5U+6J54Qzh8HsF
         RdiO3pHF9gC6JE4ZrVPujB3LQfrMQgmiLcN5z54Q5z0u0hSba5dHCEloyk7bBULtMAHP
         RDQIgxFlrbm+sRYWJ9W5WySuZDOcLt7/8/cVPq5LBgrch06gh5w3x8Yi6holYTC/kf7p
         Qasw==
X-Gm-Message-State: ACrzQf3ErGgn7RjSLMYD4Qqf3Ahm33Ux7Kp+gdkkUVXZfFf/Hx/Jynzg
	u54+bi0WzVybGNtaIdKUNzY=
X-Google-Smtp-Source: AMsMyM79kJkKnS9UZ7s/T5VFKVsgAHzLaUMWBOgve1YQihaYLsMCgz+9SgHaZ5aqsceJ02e3rc06KQ==
X-Received: by 2002:a5d:64c2:0:b0:22e:41b0:42ca with SMTP id f2-20020a5d64c2000000b0022e41b042camr5546530wri.411.1664896186238;
        Tue, 04 Oct 2022 08:09:46 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c2cb200b003b51a4c61aasm20434812wmc.40.2022.10.04.08.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:09:45 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: Fix spelling mistake athros -> Atheros and fix grammer
Date: Tue,  4 Oct 2022 16:09:44 +0100
Message-Id: <20221004150944.148157-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spellig mistake, correct it and fix capital letter on the
proper noun. Also fix the grammar.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index b58e75932ecd..f142d0986990 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -1806,7 +1806,7 @@ int ieee80211_parse_info_param(struct ieee80211_device *ieee,
 				info_element->data[0] == 0x00 &&
 				info_element->data[1] == 0x13 &&
 				info_element->data[2] == 0x74)) {
-				netdev_dbg(ieee->dev, "========> athros AP is exist\n");
+				netdev_dbg(ieee->dev, "========> Atheros AP exists\n");
 				network->atheros_cap_exist = true;
 			} else
 				network->atheros_cap_exist = false;
-- 
2.37.1

