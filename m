Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73742FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:19:23 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so3693158pjb.2
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=k8zjSgfqxLxlFthhLmpxkp9fckpuIPaxUqjese+DfO0=;
        b=wxXiEk5cfMSn+oebUrmAqIxaxe3uQoavSW8YeWQIpptNjA8WnDUG7VePoKAlmC0X3O
         ExXkJhERYYfGeg2YXpx0++bbi4QYlSbcGAfqPdxo9ev9zPukWzNm7rGwDT3nj1YTuGO0
         CyqCooNqCKOADjpBaIOmx92dSqsKRRtofCEKtqxEOufeykOaCXulsYTxLQdcCkH8rps3
         BFpJEDMY+8rXMy8gq/yV5F5w3DuA8FIlYu1h6gk+HoD9bgalLiAhkl9MiS4C00OwyGhm
         QmLN1FilocmSUpmomQIomX4Ihb9ZzgL98w9OcjN/zsoNcyBAItwWW0jeyqC+3cXiZzko
         9jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k8zjSgfqxLxlFthhLmpxkp9fckpuIPaxUqjese+DfO0=;
        b=DYpIWFWd4GA3YMhG8ALRxhI0awi6lUDtYFg3U3P/WrKU1UUXzHdJRdALvw4u7CdbU7
         TsTnLRzPUB9SZI9/qTohT9+ROYGKScnlsoLuhoq42aHfru/W+Ary7zuNb+FbAymkVl/8
         GHKBRh9dE1fQeA/bzTK8nlwSCsmPsfqIZ1163wDodmvrnEkQkTGANH+6ttolAHcc71Af
         dnaRQGOng6iLZaL9bWZmz0ZuZigUeLPxkKTubjxlHuL3KU1fRlfXm7Omh24s9mtJH1yr
         ud8x8X2ImkHFODYqDT4YWVEXnMzas4nl40qsASv7g1i1G8ofrf7OrOha1EFiIaq1VQPY
         4Cpg==
X-Gm-Message-State: AOAM533wFLOEdNzTbWuj3MJst0Yt3+ohOpeSxDQ0vv/RO+QJhCSHrrNp
	BR8JCa+PhHsovfYSE/ElO2Ky
X-Google-Smtp-Source: ABdhPJy2iC8QxPrIsMllescdd+wISCdojKR/IHdc3CqJD/XKucc1n3UJ6p9YkgMXX9Ve2iyS5UhnHg==
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr12007709pjq.161.1621437563291;
        Wed, 19 May 2021 08:19:23 -0700 (PDT)
Received: from localhost.localdomain ([2402:4000:11ca:dcec:9f88:85c9:3532:e27b])
        by smtp.gmail.com with ESMTPSA id k1sm8804547pfa.30.2021.05.19.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:19:23 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
Subject: [PATCH] Staging: greybus: fix open parenthesis issue in gbphy.c
Date: Wed, 19 May 2021 20:48:51 +0530
Message-Id: <20210519151851.26006-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fix "Alignment should match open parenthesis" checkpatch error.

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

