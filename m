Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A02C82
	for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 04:22:11 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso9385457pjm.4
        for <linux-staging@lists.linux.dev>; Tue, 11 Jan 2022 20:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o7osdo2BrmjDyjcS9PkvYkntr2CZq4Fce8zzeRAMN9w=;
        b=MJRkHySPt6R9biKhtWIETa/mGGma9zDhgdKwaT3b2KtzBOoHr89RLeRwj914ky+cLZ
         gPJ2xB5zpFBs65WuPawhtY2f4wweQRDrfu7YiarMdj0n9gk8EhMc5gukRpdomHgEFmfs
         T+4j4KsnUXWKIeAQukVuPH+gM+Y3s10tFmz5QS/1aejjJsB1bpAhf+CiGtwY5COF3ZoB
         4wwJ/WDtSnyzgRDxKzhtCzwcVx20BHmjryPeNhjOakrEIutXqM7t9cOrMzGJ0VAx3+E4
         ZF8K/zJsBy1/7Uq0JU2sZZ6MswnmQJO3l/yBfOe/HUmW5gvnmscB71vnoT4DaEq994/q
         is5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o7osdo2BrmjDyjcS9PkvYkntr2CZq4Fce8zzeRAMN9w=;
        b=XIlOtFOUjifwTs1k1q3JnFta+ovK2MR3O/lM8rmyQI60gL/FtRZyCUMIegb+nwXaCK
         9l6NyqpoKTsOlM0Z70apO9KKZnhsUy5Lv/9Q83kPKCnn2Mwzcjc5fnp+sWFW9LuyFS6j
         TCPfB/J//WgZS5WxbAOYpmTfo9ur2LYs0jZvde7ACYIHBO9i3d6UsMxGoSwYpJwav58o
         Vzz+UVFSm++MxDuOLGsjqrNXTAeQmKchLY4jiYPeFmyUmrgNQECWuCRtAkRbDFmhJZUw
         a9rcHnZ5GPM4Hn2cDYkudwIEbsjYzfF5ik4ttH3Ny5VGDT943dG4zwtYi3HJfutpvu3l
         uGLA==
X-Gm-Message-State: AOAM532NVPbuk55XsbaMxgiHPJwJscqQKxIkmxfT/W2NHZUh6v7mULjx
	tp6yJmOuKl3ErFARZqBvlWc=
X-Google-Smtp-Source: ABdhPJxwgjM4wHLTKFa51oNax5zFELQWraXlDGN1SnqWlEvcRwhlxE0SSqLjxv5NWGsVtrk5UP4haQ==
X-Received: by 2002:a63:5007:: with SMTP id e7mr6729952pgb.295.1641961330772;
        Tue, 11 Jan 2022 20:22:10 -0800 (PST)
Received: from localhost.localdomain ([115.99.137.58])
        by smtp.gmail.com with ESMTPSA id t207sm11237747pfc.205.2022.01.11.20.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 20:22:10 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [PATCH  2/4] Staging: rtl8723bs: Interchanging comparison expression operands
Date: Wed, 12 Jan 2022 09:51:59 +0530
Message-Id: <20220112042201.5056-3-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112042201.5056-1-jagathjog1996@gmail.com>
References: <20220112042201.5056-1-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix following checkpatch.pl warning by placing constant on rignt side of
comparison
WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ac731415f733..fcecee824797 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1554,7 +1554,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.17.1

