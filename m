Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638729446
	for <linux-staging@lists.linux.dev>; Fri,  3 Mar 2023 21:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D56C4339B;
	Fri,  3 Mar 2023 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677879850;
	bh=mdXaVsMHHRpVXUk+uZ9EYwJv98Vwf3VmgKDN7QRilxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFcj8iR3gmq70U/upFVd59ZrsN+bHOgG75prKIJOabL9JJ6KKkmso8rjo5n43zxEb
	 zs8RpAuHctnl/zqBz7WkgyeWOoZRQQozh1PaBXKdSlIll0FEnYr89eR+PQTcPaSEr/
	 DjL6Kk/5gQtb5teNcRfiTXUfYiAdRSBBoxoCa5E8OkJK/8339bM8pZdWDPVNv/U4Bo
	 BUmxe3Fvqt7FRhH6tpbw6RMIzr1ZN9fHvC0bs2WVEVS9R8L6tl3qspBofOk+6T7RM8
	 k64bPnP205sULm40EmSBtLM+Nfjw2bbPxo0PbyBJNtZykctfeCq+dhS0eJDatkEioW
	 l6S1vyJ+/Rfmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Sidong Yang <realwakka@gmail.com>,
	Liu Shixin <liushixin2@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 25/60] staging: pi433: fix memory leak with using debugfs_lookup()
Date: Fri,  3 Mar 2023 16:42:39 -0500
Message-Id: <20230303214315.1447666-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214315.1447666-1-sashal@kernel.org>
References: <20230303214315.1447666-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 2f36e789e540df6a9fbf471b3a2ba62a8b361586 ]

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  To make things simpler, just
call debugfs_lookup_and_remove() instead which handles all of the logic
at once.  This requires saving off the root directory dentry to make
creation of individual device subdirectories easier.

Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>
Cc: Sidong Yang <realwakka@gmail.com>
Cc: Liu Shixin <liushixin2@huawei.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Link: https://lore.kernel.org/r/20230202141138.2291946-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/pi433/pi433_if.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index d4e06a3929f3d..b59f6a4cb611a 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -55,6 +55,7 @@
 static dev_t pi433_dev;
 static DEFINE_IDR(pi433_idr);
 static DEFINE_MUTEX(minor_lock); /* Protect idr accesses */
+static struct dentry *root_dir;	/* debugfs root directory for the driver */
 
 static struct class *pi433_class; /* mainly for udev to create /dev/pi433 */
 
@@ -1306,8 +1307,7 @@ static int pi433_probe(struct spi_device *spi)
 	/* spi setup */
 	spi_set_drvdata(spi, device);
 
-	entry = debugfs_create_dir(dev_name(device->dev),
-				   debugfs_lookup(KBUILD_MODNAME, NULL));
+	entry = debugfs_create_dir(dev_name(device->dev), root_dir);
 	debugfs_create_file("regs", 0400, entry, device, &pi433_debugfs_regs_fops);
 
 	return 0;
@@ -1333,9 +1333,8 @@ static int pi433_probe(struct spi_device *spi)
 static void pi433_remove(struct spi_device *spi)
 {
 	struct pi433_device	*device = spi_get_drvdata(spi);
-	struct dentry *mod_entry = debugfs_lookup(KBUILD_MODNAME, NULL);
 
-	debugfs_remove(debugfs_lookup(dev_name(device->dev), mod_entry));
+	debugfs_lookup_and_remove(dev_name(device->dev), root_dir);
 
 	/* free GPIOs */
 	free_gpio(device);
@@ -1408,7 +1407,7 @@ static int __init pi433_init(void)
 		return PTR_ERR(pi433_class);
 	}
 
-	debugfs_create_dir(KBUILD_MODNAME, NULL);
+	root_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
 
 	status = spi_register_driver(&pi433_spi_driver);
 	if (status < 0) {
@@ -1427,7 +1426,7 @@ static void __exit pi433_exit(void)
 	spi_unregister_driver(&pi433_spi_driver);
 	class_destroy(pi433_class);
 	unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
-	debugfs_remove_recursive(debugfs_lookup(KBUILD_MODNAME, NULL));
+	debugfs_remove(root_dir);
 }
 module_exit(pi433_exit);
 
-- 
2.39.2

