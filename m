Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98A266D0
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V2p1hDhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52EEC43142;
	Thu,  5 Oct 2023 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514320;
	bh=5pLx0oV6bg6h2ZrtEPu2Hn5oOoMFTmfUpUEMcaBhv+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2p1hDhNf/h8zw4v3DVF9FkdwMg8Zai0AvvpOf6zl6cAvMGLEnG2C3kJ1Pcg4cMh0
	 CVJoBGxwyXXULQuaiuFNr+sUtJqK7otsLII7covBEu3tWQX9exB8NpY4ytvpsYtevU
	 eSJx+a+hcirGFtWg83gRzJW3vt+blGerh6PCca2o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Subject: [PATCH 2/3] staging: greybus: authentication: make cap_class constant
Date: Thu,  5 Oct 2023 15:58:35 +0200
Message-ID: <2023100534-showoff-alright-6c95@gregkh>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>
References: <2023100533-broadband-hunk-9e91@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=5pLx0oV6bg6h2ZrtEPu2Hn5oOoMFTmfUpUEMcaBhv+g=; b=owGbwMvMwCRo6H6F97bub03G02pJDKlyB7n2RddOaQudZy9QdP3BpG3GR5a513/qfyJ7xPTZn /hH+y+c7YhlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJsOswLDj9Q1bJ/+TVPYLz o54GWQb1CJRvAYo21XEwR0Ssn8TzJK45Zn4p45FAL1EA
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
 drivers/staging/greybus/authentication.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 7e01790a4659..b67315641d18 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -36,7 +36,10 @@ struct gb_cap {
 	dev_t			dev_num;
 };
 
-static struct class *cap_class;
+static const struct class cap_class = {
+	.name = "gb_authenticate",
+};
+
 static dev_t cap_dev_num;
 static DEFINE_IDA(cap_minors_map);
 static LIST_HEAD(cap_list);
@@ -336,7 +339,7 @@ int gb_cap_connection_init(struct gb_connection *connection)
 		goto err_remove_ida;
 
 	/* Add a soft link to the previously added char-dev within the bundle */
-	cap->class_device = device_create(cap_class, cap->parent, cap->dev_num,
+	cap->class_device = device_create(&cap_class, cap->parent, cap->dev_num,
 					  NULL, "gb-authenticate-%d", minor);
 	if (IS_ERR(cap->class_device)) {
 		ret = PTR_ERR(cap->class_device);
@@ -370,7 +373,7 @@ void gb_cap_connection_exit(struct gb_connection *connection)
 
 	cap = gb_connection_get_data(connection);
 
-	device_destroy(cap_class, cap->dev_num);
+	device_destroy(&cap_class, cap->dev_num);
 	cdev_del(&cap->cdev);
 	ida_simple_remove(&cap_minors_map, MINOR(cap->dev_num));
 
@@ -402,9 +405,9 @@ int cap_init(void)
 {
 	int ret;
 
-	cap_class = class_create("gb_authenticate");
-	if (IS_ERR(cap_class))
-		return PTR_ERR(cap_class);
+	ret = class_register(&cap_class);
+	if (ret)
+		return ret;
 
 	ret = alloc_chrdev_region(&cap_dev_num, 0, NUM_MINORS,
 				  "gb_authenticate");
@@ -414,13 +417,13 @@ int cap_init(void)
 	return 0;
 
 err_remove_class:
-	class_destroy(cap_class);
+	class_unregister(&cap_class);
 	return ret;
 }
 
 void cap_exit(void)
 {
 	unregister_chrdev_region(cap_dev_num, NUM_MINORS);
-	class_destroy(cap_class);
+	class_unregister(&cap_class);
 	ida_destroy(&cap_minors_map);
 }
-- 
2.42.0

