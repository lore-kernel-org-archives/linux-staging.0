Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA76F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:13 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a7so29080940ejs.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WIwg6fry+Umqo+Of4e5vr2qOPugGJzkkuRXJAWKwcs8=;
        b=LnDias1Jrm476BZXUhqFrqUw+jR4kzh0BITGbU7vsBbI9wNSzW5wXQA6SUQv98ZVLu
         oxRV/n7Ol+wfkx35GtIwA7tpyBESL0/3o42x7U58H3n0VdOUNwxIe33yPrPPR7uNqpB7
         vj08hzOITknwFAWtCJRBFkQ6T7aiWP81LWS6R5ao29S96Lq9D7276eictPHx7u0MTL2R
         TODZK4q55PhLz1YkVxK3Tj9BUA3PUlKRIMPhtE2g8zBK+DEtUaIcn+d+LhYnu2864m7a
         TPQwAp5kl25PIAoi6CxIBzO53ZTn28tqnZQXTwwD0akHpwDx3E5vEzHnmnK0VEpdXn2Y
         7kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIwg6fry+Umqo+Of4e5vr2qOPugGJzkkuRXJAWKwcs8=;
        b=aOhmlIwTfZylCpuzcsnVqTd0Pcqeb3E+NsKXDZCepMygl3hpRMyHSvfgo9CTJmMvvj
         nI8o2aE8hAOIDBNw08kD7dZG5/D0lahk18oLQ05bVQoXQQQcb3DceBn/ZxckVccZajPf
         /RYIl+IFLZvEoYRizm3GBnY/hm/ZNPXNaXeYCeCR65OokCtRhbQFO9hBjh6knOzEaXR7
         bqUuWAswF7TC45tMG4I+OFc5iWNBdcNELNyR5lnRg+ao0I2RpNpg58ljk5ZiujXGYYiK
         FzTMVQizzwjTWVEDKu2aZ0kV6Zxqsa15vu+SR5JNEjD069ebtbCnh7ZygzT0Cd0fknRw
         75vA==
X-Gm-Message-State: AOAM531T9Acwl9vNoY3dWQ7uv1iJQy6FNTl5K/z2XqjDmyn8j+x7TCQg
	mFkjI6z61s3W0gAC22B9PjtCoOP5VMDlag==
X-Google-Smtp-Source: ABdhPJzNOhMRAlA6+jn0HJT9bO1TjK3UQqzfs+BEuaO/7OVy0zQooaugRIkY9C8BFjLReoepNA56fQ==
X-Received: by 2002:a17:906:5d06:: with SMTP id g6mr2597650ejt.216.1617183672320;
        Wed, 31 Mar 2021 02:41:12 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id gn3sm829140ejc.2.2021.03.31.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 32/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in os_dep/mlme_linux.c
Date: Wed, 31 Mar 2021 11:40:00 +0200
Message-Id: <5653acfb5c93ae5c0dc0ef47434603db5a291cf3.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index ba4d3789a41e..bda0c34f2086 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -145,11 +145,11 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	u8 *buff, *p, i;
 	union iwreq_data wrqu;
 
-	RT_TRACE(_module_mlme_osdep_c_, _drv_info_, ("+rtw_report_sec_ie, authmode =%d\n", authmode));
+	pr_info("%s+%s, authmode =%d\n", DRIVER_PREFIX, __func__, authmode);
 
 	buff = NULL;
 	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
-		RT_TRACE(_module_mlme_osdep_c_, _drv_info_, ("rtw_report_sec_ie, authmode =%d\n", authmode));
+		pr_info("%s %s, authmode =%d\n", DRIVER_PREFIX, __func__, authmode);
 
 		buff = rtw_zmalloc(IW_CUSTOM_MAX);
 		if (NULL == buff) {
-- 
2.20.1

