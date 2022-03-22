Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E5A31
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 08:39:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id a17so19715173edm.9
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X99bYtMPXK/lUQRyXYEMc82PYA/a9iPeIbyvT5Yw/Y4=;
        b=kjzsyGVFO7n/ps8vT3T+52rxTOI3jY2t4UGftFX6Dtm8CrsMtWfqW64D0NbY1KpUuR
         jdxGVxIa88gbx79Sk52K8S8NW2HRlfKnjYPVqvF8NYUPt+I3CEtqMyxVhYYuW5W+vm37
         TgSCx1X8nvHFVASN7iSujEpSLkonNCyxDyUi30caOnYTIo1WWoHgKoxRviJpAVa1TdH8
         hh3/+J3r2akg4O/LDR7iHSIDypgp6iGeiX68pb4XD8EPB7vNijFw/2YUo4+Zg7RKIjua
         1ZvETy+DeS/IcM+O3CUR+AOnxe7HaBuGeZTcyfp6U+MzK7FS9MVRGwc0WOFqu8N7y6dE
         Ny6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X99bYtMPXK/lUQRyXYEMc82PYA/a9iPeIbyvT5Yw/Y4=;
        b=oY/YsKpGKjpY1WQpXwpRxLJWaO9azS0aXfK/XP4teOk1WOzNCvypEDjOFTn3fdND2M
         FC816tqX/HySEbRlQUBDkg0LP5qlGxhZWoSnmfpLW2GgVwgIlma31DODdfSR/TQaay4z
         c9vSIN376gjyvMgiokMDAn6VZAJxebZRXUcKp0L7Q/WeSQ9ekfQEXaQ5QucUpwumr+Yo
         KHWh/zKbrM9YLKy0UTHlII9Qx6APanSFMQeMtkP9CQfrDvOxMBva+AzeJUTdqeUzmi78
         Pt34u1TRssbvQ+DevNDzZd9xlCygxCD6bmrbVUhcUdi7H/cpA2UyMX7yuyQzYTPxCN3i
         Ew5w==
X-Gm-Message-State: AOAM530wyypJnj+Yh41QZE0/wQfdX89DUVj2MBOCUJmEef1kDD7YpJKu
	iUyAtuSML0V+fjVQNjIx838=
X-Google-Smtp-Source: ABdhPJxXDtRJWchyCbVOGD2wwIGmi4wLssoOiyYgO2VoKtkzls9TLlTHQKUP8kctT6dQwoJcuefSAA==
X-Received: by 2002:a05:6402:280f:b0:419:4c6f:a91b with SMTP id h15-20020a056402280f00b004194c6fa91bmr6438066ede.84.1647938342706;
        Tue, 22 Mar 2022 01:39:02 -0700 (PDT)
Received: from localhost.localdomain (host-79-37-100-169.retail.telecomitalia.it. [79.37.100.169])
        by smtp.gmail.com with ESMTPSA id do8-20020a170906c10800b006dfe4d1edc6sm3631131ejc.61.2022.03.22.01.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 01:39:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: unisys: Properly test debugfs_create_dir() return values
Date: Tue, 22 Mar 2022 09:38:58 +0100
Message-Id: <20220322083858.16887-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_create_dir() returns a pointers to a dentry objects. On failures
it returns errors. Currently the values returned to visornic_probe()
seem to be tested for being equal to NULL in case of failures.

Properly test with "if (IS_ERR())" and then assign the correct error 
value to the "err" variable.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/unisys/visornic/visornic_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index 643432458105..58d03f3d3173 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -1922,11 +1922,11 @@ static int visornic_probe(struct visor_device *dev)
 	/* create debug/sysfs directories */
 	devdata->eth_debugfs_dir = debugfs_create_dir(netdev->name,
 						      visornic_debugfs_dir);
-	if (!devdata->eth_debugfs_dir) {
+	if (IS_ERR(devdata->eth_debugfs_dir)) {
 		dev_err(&dev->device,
 			"%s debugfs_create_dir %s failed\n",
 			__func__, netdev->name);
-		err = -ENOMEM;
+		err = PTR_ERR(devdata->eth_debugfs_dir);
 		goto cleanup_register_netdev;
 	}
 
-- 
2.34.1

