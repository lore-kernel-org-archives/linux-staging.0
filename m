Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816497B;
	Thu, 31 Mar 2022 06:41:22 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id h1so27031688edj.1;
        Wed, 30 Mar 2022 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vRVZfZhek/ld27PxqrvAQx7maxQWJQLXz5r4N00GOvw=;
        b=Xi15f2aQFwUqwT9TRfxb1qLZvAF/UDB1Tt0O9qg5coX6j0xbBItJGn1yVFfRp2bGWs
         CyISIlUzkJxbvKCdz+xyfNlp4GXb9ZaA2NELq4JW91qbOeZTPzWd4iZY6XL9JPC9P+1t
         +TIQoHlEn5SxgLYrk4/UK4irrscHYYlOJOv5Fjm61PDQyTpJfOLjJ3VcMc2kAxBwETUO
         xa8EE6m9WBm2PqMFCF6SMxNdalTNQzljyMoUOC/4BLfWqfeqjmyvoKfgHh2MtKAbJH9N
         UWRqJLBk+Nvrn8+5LValSaXCvoxz9R0Usfvuhx3gKu9XNZI/16lDqDAdL6APKiLxTOZF
         V9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vRVZfZhek/ld27PxqrvAQx7maxQWJQLXz5r4N00GOvw=;
        b=U3vRRQDG3I7mbelprMMnHXD6d+ilpORUSJ6+tzbdoD9W69kk80alYw2JrWzS6Fj4gU
         ENYwQPoMLlDTSMR1UISEwlBTw96JqyC9xO77Y2vimlip4/GiQsLyFUIZKncer0l9RvLp
         mcFWTZIvNk+OL/DSHZuVJCZpfsBoBBT5NkuOJ87WpkXeaH72SsT+9mk3GpCA9EifIuhp
         RDW2M7PYqpypubscektagrt7GtEx5wPdBiXWjWz6MveMwRSdoinD1Ba+RPHcR4vLkmda
         5ezIYyd7i5fWcM+BgEynk3rrFMpS91gVBEZd/4RO9hqz4oFA+EAp2CZeT+H5vrxJi9GZ
         3vkg==
X-Gm-Message-State: AOAM531YGrPAyC/lamuwUS8h8UFjZZHRomsmDRC8lT5GEtMDWnhEAXwu
	0sVmCMBw26Jrb9BI7NloZHE=
X-Google-Smtp-Source: ABdhPJzhFtKO5Fs8WACAacp4q9R9a24cKA+TW99SvZ81BfLY1EtflbXpMX6JRr/ibKETH7Zt2DpGMw==
X-Received: by 2002:aa7:d58e:0:b0:419:c121:ea33 with SMTP id r14-20020aa7d58e000000b00419c121ea33mr14939013edq.256.1648708880560;
        Wed, 30 Mar 2022 23:41:20 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id eq7-20020a056402298700b00419d8d46a8asm5368593edb.39.2022.03.30.23.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 23:41:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: unisys: Remove "struct dentry *eth_debugfs_dir"
Date: Thu, 31 Mar 2022 08:41:15 +0200
Message-Id: <20220331064115.29345-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need for "struct dentry *eth_debugfs_dir" which is used for
debug / sysfs directories. Therefore, remove this "struct dentry" and
everything related (i.e., creation, test, removal).

As a side effect of this change, the code has no more need of the
"cleanup_register_netdev" label, which can also be removed.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/unisys/visornic/visornic_main.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index 643432458105..bb7ec492503e 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -103,7 +103,6 @@ struct chanstat {
  * @server_down:                    IOPART is down.
  * @server_change_state:            Processing SERVER_CHANGESTATE msg.
  * @going_away:                     device is being torn down.
- * @struct *eth_debugfs_dir:
  * @interrupts_rcvd:
  * @interrupts_notme:
  * @interrupts_disabled:
@@ -157,7 +156,6 @@ struct visornic_devdata {
 	bool server_down;
 	bool server_change_state;
 	bool going_away;
-	struct dentry *eth_debugfs_dir;
 	u64 interrupts_rcvd;
 	u64 interrupts_notme;
 	u64 interrupts_disabled;
@@ -1919,24 +1917,10 @@ static int visornic_probe(struct visor_device *dev)
 		goto cleanup_napi_add;
 	}
 
-	/* create debug/sysfs directories */
-	devdata->eth_debugfs_dir = debugfs_create_dir(netdev->name,
-						      visornic_debugfs_dir);
-	if (!devdata->eth_debugfs_dir) {
-		dev_err(&dev->device,
-			"%s debugfs_create_dir %s failed\n",
-			__func__, netdev->name);
-		err = -ENOMEM;
-		goto cleanup_register_netdev;
-	}
-
 	dev_info(&dev->device, "%s success netdev=%s\n",
 		 __func__, netdev->name);
 	return 0;
 
-cleanup_register_netdev:
-	unregister_netdev(netdev);
-
 cleanup_napi_add:
 	visorbus_disable_channel_interrupts(dev);
 	netif_napi_del(&devdata->napi);
@@ -2002,7 +1986,6 @@ static void visornic_remove(struct visor_device *dev)
 	/* going_away prevents new items being added to the workqueues */
 	cancel_work_sync(&devdata->timeout_reset);
 
-	debugfs_remove_recursive(devdata->eth_debugfs_dir);
 	/* this will call visornic_close() */
 	unregister_netdev(netdev);
 
-- 
2.34.1

