Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED171
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 18:19:56 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id g18so8818220pfr.2
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=PW4uVNBA3mRHR7tGnDQy6S2ZgHL0fGnS5upoxeLAFS4=;
        b=LAgQL50DJZ6I9DmMa17MmOp5E9BA+o10kFJrra9ikHEiPJnl7hP3KDysdkzJPCxdO7
         DNZHH5mef9Uw1FEq/YgnMwDZSXtkBpurEZy40MAUAE7qhAJnlJnsb7eP20CsDOCoFlnp
         ghGpALsJQ/OuaPCQTkNbDnZfxhiFVZ6pCJbVUb1ZNKi/KgrEPysh+ylJBmltbEFGwF2q
         K5ru/1URHJN6RxsMaNI+py45qPI0/J/fk7PTJA2ziWIDGsMD/cuuSgd+R7oMoxChfN6i
         o0ebko7Wmxl1fqf6WZFguy6+GD++rzI0D0k2kMz4GLL40VcRGZE9SAcjuFlgE4XUttmr
         mjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PW4uVNBA3mRHR7tGnDQy6S2ZgHL0fGnS5upoxeLAFS4=;
        b=tps4uovFAN8xrWItYp7cekSwdDp0ATyG/Mns76kQv3gKJhk20V2UTsVIknkHPnVkNa
         SDsvAoBoZrDGzbf3xnTR0ATbLVRFN3rnWIEWKMvb7sQ7oZdmTe1G7vhTm4fKbjaqWao5
         dRG/OM4gTHEw8Qv10IVk8fwyktdK+jzOlGu4uKEteA6DXgCOH/yj1PeX2lUeviRtc35O
         ztmlA2CAVbWoby76BncAtWBafZTcA2C+KXPQb65mc8u0dpsbbYS1758PX2LuVYbGlMYz
         jp8HU1DKDFxJw9MdckKXX+6kNpFa4LfvfUEjgEL+DJd7x3gzNYlGJ9ICUqX3XH4lbqbv
         zh9A==
X-Gm-Message-State: AOAM5317bixue+1KMshyoBF+3JcvdM7QFcbYZ7rhMmN5Hw6HPR4NmZNb
	3yIbNLEMMHdHkm3lko35Ad2L
X-Google-Smtp-Source: ABdhPJwXcf9yyVLYIrdBHqNyMJx+0WlY19enz6Kx/vmPzEP/3lG3o6ZWg/PgjWn9idU+8IRKMq/cXg==
X-Received: by 2002:a63:5218:: with SMTP id g24mr384869pgb.309.1621448395848;
        Wed, 19 May 2021 11:19:55 -0700 (PDT)
Received: from localhost.localdomain ([2402:4000:11c7:ee12:ddf7:464f:3770:cc69])
        by smtp.gmail.com with ESMTPSA id 205sm78211pfc.201.2021.05.19.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:19:55 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
Subject: [PATCH V2] Staging: greybus: fix open parenthesis error in gbphy.c
Date: Wed, 19 May 2021 23:49:38 +0530
Message-Id: <20210519181938.30813-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This patch fix "Alignment should match open parenthesis" checkpatch error.

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

