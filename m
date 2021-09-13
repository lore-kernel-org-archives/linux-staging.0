Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A265F3FC4
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 13:04:25 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id j13so14245802edv.13
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V69rkmBV3GQTLfHYSfkRm46ouFvvTB8dc9rFkPdH+N4=;
        b=hzIISs98X3O28GPVPgGG3S2iQKBJ1TSBHBqC277SM2ipl/ou8I+hafduL8CJBBp+zH
         2tmw5+S6LnaHgspzzI8GgtNkir2isdn99yVcEsI+Fd3t5sYySPtMI2h5Te+FFFKmIJrQ
         2t9PUO+KGKJsXPnCGXOxH0JmE/k+P7cfzkQHkC4MQuf/HKVE8UCg+a3KgmeOOIQNB52O
         dYeHbzf4UfmH/2PShMW/CfpNZEkxXwJElGs2E0XW05ImA1xOi6dmkZVJKUPpRDJMqe1p
         plIn3j+qGvpEo3a8sq5EuVaJ53i5ks1b43N3ecwyBzPA5Wd2VlVkLxJiYq5CUF9MvQVA
         ORwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V69rkmBV3GQTLfHYSfkRm46ouFvvTB8dc9rFkPdH+N4=;
        b=qHyTmiEVIVBOxlABloqabColPY2G/vjAuBO5xitK9atB2kDQcfyMUFjGbYWeY+GlZP
         VXW3mJqJ4Zk9YelzSJV36YeQfb3dFhpVhfAhuAasBExch4pWmB6vSYR9m5AxqWSWRWEI
         SmI2oBCE+hqcQNG/fBTV1ur4pjNI4smnKkx6Ts7H4oMypL1kjrZIhvccKtQEasB8EoJG
         cWByb1p99jMaABRP3+ygwQRSNJt3EhRJEBty2VkJ1mtvRGsui0jAS4LA9KsQyCswZ5xr
         7UAJzGuIIGw4CPEmdUj6sd3ikD65/pAEKfrCduE2lm4cBSjhe9tHbN0eN/U9q6nRWpvF
         TW5Q==
X-Gm-Message-State: AOAM532NK0nzGC89Ep1gCJWZPcSoVvlCx99OEKfat/nZn3U8ZT1EIwqn
	1/7VO9YUflyWP4lDNIxcMwyjQaaQ9Uc=
X-Google-Smtp-Source: ABdhPJxcVQQ0dSffVIoSF53GEszp5OQOx8RTomDzzVpofor24GI78fPOuE+UX9tEGTlMIVr1z0fXow==
X-Received: by 2002:a05:6402:5215:: with SMTP id s21mr13172804edd.236.1631538264036;
        Mon, 13 Sep 2021 06:04:24 -0700 (PDT)
Received: from agape ([5.171.73.21])
        by smtp.gmail.com with ESMTPSA id by26sm1922554edb.69.2021.09.13.06.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:04:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH] staging: rtl8723bs: protect sleepq_len access by sleep_q.lock
Date: Mon, 13 Sep 2021 15:03:46 +0200
Message-Id: <20210913130346.2390-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

protect sleepq_len access by sleep_q.lock and move
pxmitpriv->lock after sleep_q.lock release.

This fixes and completes a lockdep warning silencing
done in a prevoius commit where accesses to sleep_q
related fields were protected by sleep_q.lock instead
of pxmitpriv->lock.

Note that sleep_q.lock is already taken inside
rtw_free_xmitframe_queue so we just wrap sleepq_len
access.

Moved pxmitpriv->lock after sleep_q.lock release to
avoid locks nesting.

Fixes: 78a1614a81f0 ("staging: rtl8723bs: remove possible deadlock when disconnect")
Reported-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bf090f3b1db6..c98918e02afe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -294,10 +294,12 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 	/* list_del_init(&psta->wakeup_list); */
 
-	spin_lock_bh(&pxmitpriv->lock);
-
 	rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
+	spin_lock_bh(&psta->sleep_q.lock);
 	psta->sleepq_len = 0;
+	spin_unlock_bh(&psta->sleep_q.lock);
+
+	spin_lock_bh(&pxmitpriv->lock);
 
 	/* vo */
 	/* spin_lock_bh(&(pxmitpriv->vo_pending.lock)); */
-- 
2.20.1

