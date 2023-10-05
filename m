Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CD266D0
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ptJJPyqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F81C43140;
	Thu,  5 Oct 2023 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514323;
	bh=DBqd7AkU7DoctJZB0I+61/B9KY1iQe4pE42vmDX0AyY=;
	h=From:To:Cc:Subject:Date:From;
	b=ptJJPyqoL9jyG92VOx03xz1lMgofmxd2qO7NZ8CcbYm5yNHCMf8nWXbX/MjZZ1/p0
	 7dYNC3pAj83a8hqUQHTLGOLoB+ip6enJbnbZM79ZLo1YtvXMZm2jG5NBCQ1qJfejBe
	 F7TPvYBuxM+c6NXSTgjSJ1oJnleIeZ4gWTTe+nTM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Subject: [PATCH 1/3] staging: greybus: raw: make raw_class constant
Date: Thu,  5 Oct 2023 15:58:34 +0200
Message-ID: <2023100533-broadband-hunk-9e91@gregkh>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2583; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=DBqd7AkU7DoctJZB0I+61/B9KY1iQe4pE42vmDX0AyY=; b=owGbwMvMwCRo6H6F97bub03G02pJDKlyBzlZa/er/6s6eWmpSMDJU2W7Z85/pXy59zTHbqslV bfNsqU9O2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiNswM87Ofh/TaBruIr7LQ 6cre27FAw1iyimF+Wvd11YCnUT+1bhxWe2Ouuybf7cl+AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Now that the driver core allows for struct class to be in read-only
memory, making all 'class' structures to be declared at build time
placing them into read-only memory, instead of having to be dynamically
allocated at load time.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/raw.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 8bca8cb12cc6..a00978c8e1d2 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -32,7 +32,10 @@ struct raw_data {
 	u8 data[];
 };
 
-static struct class *raw_class;
+static const struct class raw_class = {
+	.name = "gb_raw",
+};
+
 static int raw_major;
 static const struct file_operations raw_fops;
 static DEFINE_IDA(minors);
@@ -195,7 +198,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	if (retval)
 		goto error_connection_disable;
 
-	raw->device = device_create(raw_class, &connection->bundle->dev,
+	raw->device = device_create(&raw_class, &connection->bundle->dev,
 				    raw->dev, raw, "gb!raw%d", minor);
 	if (IS_ERR(raw->device)) {
 		retval = PTR_ERR(raw->device);
@@ -229,7 +232,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *temp;
 
 	// FIXME - handle removing a connection when the char device node is open.
-	device_destroy(raw_class, raw->dev);
+	device_destroy(&raw_class, raw->dev);
 	cdev_del(&raw->cdev);
 	gb_connection_disable(connection);
 	ida_simple_remove(&minors, MINOR(raw->dev));
@@ -340,11 +343,9 @@ static int raw_init(void)
 	dev_t dev;
 	int retval;
 
-	raw_class = class_create("gb_raw");
-	if (IS_ERR(raw_class)) {
-		retval = PTR_ERR(raw_class);
+	retval = class_register(&raw_class);
+	if (retval)
 		goto error_class;
-	}
 
 	retval = alloc_chrdev_region(&dev, 0, NUM_MINORS, "gb_raw");
 	if (retval < 0)
@@ -361,7 +362,7 @@ static int raw_init(void)
 error_gb:
 	unregister_chrdev_region(dev, NUM_MINORS);
 error_chrdev:
-	class_destroy(raw_class);
+	class_unregister(&raw_class);
 error_class:
 	return retval;
 }
@@ -371,7 +372,7 @@ static void __exit raw_exit(void)
 {
 	greybus_deregister(&gb_raw_driver);
 	unregister_chrdev_region(MKDEV(raw_major, 0), NUM_MINORS);
-	class_destroy(raw_class);
+	class_unregister(&raw_class);
 	ida_destroy(&minors);
 }
 module_exit(raw_exit);
-- 
2.42.0

