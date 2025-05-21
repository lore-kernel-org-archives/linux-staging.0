Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1851E260C
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839218; cv=none; b=XsIhe9UD7KWxUl1ntE9Ge4Jg8C/f4mD6F70clw4PUF+oKNSVuFgcbsVrtZOwRDTQzz/xoblLBtkI2TDTeuiGPXcgxpeHjuHQCwzh6UAfaUbzjNLLlf86vjN2mzjGqxg12BODaEmg9IZM5hIBDH91QhXXIvyOCMl2GyvffztGXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839218; c=relaxed/simple;
	bh=C5kWGx5/UvloHX/UveK5EsEsK6H8CdTbyCupJ/mkOmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Se1MZn8DzTyOVo0T35Vkkw6FXug+VFqaqhDvSdbxfZRBwFVc7Bo7z/zSD09FxPl4lwVE6MgO6ApSawuOc9quX0/Jl3HiJ/4qDkOWa605PMgK3G0VwOMfsZtWSjwFQr2QOFE036X/KxMt3XuH5Uae468NC7qeM3Rckajili6YHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pr7Ldbl3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pr7Ldbl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8D9C4CEE4;
	Wed, 21 May 2025 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747839218;
	bh=C5kWGx5/UvloHX/UveK5EsEsK6H8CdTbyCupJ/mkOmw=;
	h=From:To:Cc:Subject:Date:From;
	b=Pr7Ldbl3/+x9ok5E2gsFHbPGw0dLWzkX5V+mebIVkq31aQe0TLZwfGYXOR5YcNVMt
	 ZuYcuXMqaZtou7+vJ3XWdSiwJYUn7DbWg+J2JFEToZEqBFEVL+HXUBF4mcyglh65ik
	 3a8sII+Yi3LUUJiOAcLsMRW91EwldQs9VwXr9iwI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: vme: vme_user: fix up const issue in vme_bus_match()
Date: Wed, 21 May 2025 16:53:33 +0200
Message-ID: <2025052132-giddiness-slain-5ba1@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=C5kWGx5/UvloHX/UveK5EsEsK6H8CdTbyCupJ/mkOmw=; b=kA0DAAIRMUfUDdst+ykByyZiAGgt6Oygq6l+QDM4YpqyUCTzZRvDG8ujag3VQwmd2y/r9U1JG ohdBAARAgAdFiEE9LYMxb94wiFKMT3LMUfUDdst+ykFAmgt6OwACgkQMUfUDdst+yle9wCgjQte 8QbNj33GJ4wa0rsFO6xrz+AAoLbL4bPOpJSWcKjLvY3wrD8CK/L8
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

vme_bus_match takes a const pointer and casts it away with
container_of() which is generally not a good idea.  Fix this up by
properly marking the output as const.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 42304c9f83a2..57eb9d227819 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1925,7 +1925,7 @@ EXPORT_SYMBOL(vme_unregister_driver);
 
 static int vme_bus_match(struct device *dev, const struct device_driver *drv)
 {
-	struct vme_driver *vme_drv;
+	const struct vme_driver *vme_drv;
 
 	vme_drv = container_of(drv, struct vme_driver, driver);
 
-- 
2.49.0

