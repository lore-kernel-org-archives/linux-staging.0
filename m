Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4122FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:12:11 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso3575931pjb.5
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
        b=fDqCDfJ54DtEaGdhd7sYWeGzt4g5NM1DIHv1VGG6R9KY3pCiA1TAMdlKwjMhGrUW2N
         qOPoXyUogAHhL6SxtjlanPeoWbzotuyDUU3DpwdBpor7gvyw8Kj4E6nK2h2nP29tGEua
         vM0ijpVrIhjmzHxQVq6+6a4jxUKihNrLATb/gkTaJubJwhP45QA8jxYHTQfU2lxtVxZ4
         oGp4y/zam6vB7FXyyOyM+ce6FzpeUA7S46S9VDMJpUL4viM/xz58Hk5Ib/hygwTXc1mW
         +oHmWmTbMIC2mHrZIdV4/eWvP+zb4gJi/vvLf84f40r2TOog30aKjvCgNVU54Dr3VYHb
         Xcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
        b=OYegSlnEkOaTmVk0od1tnMVpHTOFDNTXfboPe4bXoQJAvf14uDGzps9CV6ys6oRbGa
         4vMAGnRV1ObKjl7fYkul598wVqYtdsiggIGunUW/A3k8MWsfCScGO03j+fNerNpH8y2S
         tip1VYmi3BUZnTOh+7O0Kz5cmHY1MaOA4cyt4qOzH3WZ9PR9hJ08mAXG+Upb2DPWAt5V
         axZfBVMm/6C2O/K52Bcov//TfzKoBgZU4+t9+MbO5u0FGkHLpn2V/we9LyEvaKXw/9ai
         vycPQ7tbUuKTi1FE3NKE0wE8LyoVAmGxatZp2v+VGa34YXJvIlqYyXvpjhWR4lgr4KRX
         VRGw==
X-Gm-Message-State: AOAM532sJNuB2vP6O7Z2h6Xc4zDyc+wAElJgAFQjkU1jbSU7zac/io32
	BZztpENQXv4EttE9bGYeqcht
X-Google-Smtp-Source: ABdhPJwWWRjTit2FSgkPlyWC4e1fX4x3syhQE7l//ZKhD0H6Ai90FQWeppLVuJOiu5iuWP7Lfp15rQ==
X-Received: by 2002:a17:90a:d24f:: with SMTP id o15mr11834852pjw.83.1621437130579;
        Wed, 19 May 2021 08:12:10 -0700 (PDT)
Received: from localhost.localdomain ([2402:4000:11ca:dcec:9f88:85c9:3532:e27b])
        by smtp.gmail.com with ESMTPSA id c195sm6414618pfb.144.2021.05.19.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:12:10 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: ash15.sulaiman@gmil.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: greybus: fix open parenthesis issue in gbphy.c
Date: Wed, 19 May 2021 20:41:51 +0530
Message-Id: <20210519151151.25667-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fix "Alignment should match open parenthesis" checkpatch
 error.

Signed-off-by: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
---
 drivers/staging/greybus/gbphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 9fc5c47be9bd..13d319860da5 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -27,7 +27,7 @@ struct gbphy_host {
 static DEFINE_IDA(gbphy_id);
 
 static ssize_t protocol_id_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+				struct device_attribute *attr, char *buf)
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
@@ -221,7 +221,7 @@ void gb_gbphy_deregister_driver(struct gbphy_driver *driver)
 EXPORT_SYMBOL_GPL(gb_gbphy_deregister_driver);
 
 static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
-				struct greybus_descriptor_cport *cport_desc)
+						struct greybus_descriptor_cport *cport_desc)
 {
 	struct gbphy_device *gbphy_dev;
 	int retval;
-- 
2.17.1

