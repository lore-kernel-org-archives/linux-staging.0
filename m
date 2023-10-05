Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A2726E11
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lcCQ8V9L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB82C116A4;
	Thu,  5 Oct 2023 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514328;
	bh=AiYYMA+NHBeWDMz0RJeTj9dCfxc0pBpMecEskqVefGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcCQ8V9LlcSBGrW0NZctP7uRITYQmNVj6qin6uL/yCqmpr4oliqpI5HmUEK+9YF/x
	 J/TP6/3T+4qjBRTj+atu15R+CjHISSwUsjcUUPNBnb8U9FQQVTodnwYUWAX51Wf4YP
	 VtTPy+Vhhh8Bc4Eww4qNELhXKiuN3DY8cBtHYI4I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Subject: [PATCH 3/3] staging: greybus: fw-management: make fw_mgmt_class constant
Date: Thu,  5 Oct 2023 15:58:36 +0200
Message-ID: <2023100534-catty-moodiness-099e@gregkh>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>
References: <2023100533-broadband-hunk-9e91@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=AiYYMA+NHBeWDMz0RJeTj9dCfxc0pBpMecEskqVefGY=; b=owGbwMvMwCRo6H6F97bub03G02pJDKlyB7l4gji/rr/28Y2vzu/Z3eHcPA2MupufTGAymJ8U+ P3k+0S2jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIQQvDgo0Xn37b2aF7R1um J+jE5m1cFmVX7jDM09tcn/jyyuPL97RfHCz9mxp/+N9+RQA=
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
 drivers/staging/greybus/fw-management.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index cd9141e4b794..93137a3c4907 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -55,7 +55,10 @@ struct fw_mgmt {
  */
 #define NUM_MINORS		U8_MAX
 
-static struct class *fw_mgmt_class;
+static const struct class fw_mgmt_class = {
+	.name = "gb_fw_mgmt",
+};
+
 static dev_t fw_mgmt_dev_num;
 static DEFINE_IDA(fw_mgmt_minors_map);
 static LIST_HEAD(fw_mgmt_list);
@@ -629,7 +632,7 @@ int gb_fw_mgmt_connection_init(struct gb_connection *connection)
 		goto err_remove_ida;
 
 	/* Add a soft link to the previously added char-dev within the bundle */
-	fw_mgmt->class_device = device_create(fw_mgmt_class, fw_mgmt->parent,
+	fw_mgmt->class_device = device_create(&fw_mgmt_class, fw_mgmt->parent,
 					      fw_mgmt->dev_num, NULL,
 					      "gb-fw-mgmt-%d", minor);
 	if (IS_ERR(fw_mgmt->class_device)) {
@@ -664,7 +667,7 @@ void gb_fw_mgmt_connection_exit(struct gb_connection *connection)
 
 	fw_mgmt = gb_connection_get_data(connection);
 
-	device_destroy(fw_mgmt_class, fw_mgmt->dev_num);
+	device_destroy(&fw_mgmt_class, fw_mgmt->dev_num);
 	cdev_del(&fw_mgmt->cdev);
 	ida_simple_remove(&fw_mgmt_minors_map, MINOR(fw_mgmt->dev_num));
 
@@ -696,9 +699,9 @@ int fw_mgmt_init(void)
 {
 	int ret;
 
-	fw_mgmt_class = class_create("gb_fw_mgmt");
-	if (IS_ERR(fw_mgmt_class))
-		return PTR_ERR(fw_mgmt_class);
+	ret = class_register(&fw_mgmt_class);
+	if (ret)
+		return ret;
 
 	ret = alloc_chrdev_region(&fw_mgmt_dev_num, 0, NUM_MINORS,
 				  "gb_fw_mgmt");
@@ -708,13 +711,13 @@ int fw_mgmt_init(void)
 	return 0;
 
 err_remove_class:
-	class_destroy(fw_mgmt_class);
+	class_unregister(&fw_mgmt_class);
 	return ret;
 }
 
 void fw_mgmt_exit(void)
 {
 	unregister_chrdev_region(fw_mgmt_dev_num, NUM_MINORS);
-	class_destroy(fw_mgmt_class);
+	class_unregister(&fw_mgmt_class);
 	ida_destroy(&fw_mgmt_minors_map);
 }
-- 
2.42.0

