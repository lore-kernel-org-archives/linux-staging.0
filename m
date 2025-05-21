Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D37B1E5B60
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839359; cv=none; b=mj8V+Sr8NNj+nyToVqww2yLOITBoKrut8YbJblolXf9mjmbuaH+OCJgzoQu52TpQH+XA8PYS1drk8/fYeCCyN6puk7S+cWiMeRUJs9u8u0XM94S7L0VTE2hjmnDeQT4leMf4T3ymLjgu193SvbW/yPfwIYsm+6ESByYnS9ZYKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839359; c=relaxed/simple;
	bh=t91FJSeqItJEcmBvyt4yB/k/FAm8dvOiXl1QymjZyJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAmJ7RIWCrrdAh8loRXoG+cU2waYyYMXurFXUIeLpT8JTTDz9lHlIkagUXVzDCbl9L5EAgUpnFNRJf28hLQKWNAStclDIxwToOmGSaYbceCO87Y0lIkFOtoodfO1oU/cwH/bd1XAWmtjA1wVOzDotwkyY7/zuEG1/UdSDnLNiPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N4qjFkuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N4qjFkuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBB3C4CEE4;
	Wed, 21 May 2025 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747839358;
	bh=t91FJSeqItJEcmBvyt4yB/k/FAm8dvOiXl1QymjZyJM=;
	h=From:To:Cc:Subject:Date:From;
	b=N4qjFkuuLmaGgQMAfBcDt/TveCJ+9kThVAx5KfQGzWsaL3XT9KdM5IUmsyKacP1Mt
	 7OdUUqnToZoDqPRgVpbxI4pIGDC/3EDMFvAbYjbmyWSUA1GokwIHJVk6xKtj3ZpDh1
	 /y0efl+IKegQHhz7q/ufCjWXIUc5OeKTbEc/h108=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: greybus: gbphy: fix up const issue with the match callback
Date: Wed, 21 May 2025 16:55:55 +0200
Message-ID: <2025052155-peddling-happier-f825@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=t91FJSeqItJEcmBvyt4yB/k/FAm8dvOiXl1QymjZyJM=; b=owGbwMvMwCRo6H6F97bub03G02pJDBm6L6s/T2xtkq9meZQY8vdh9zwO5fdXnlauZdv3/41Dl sm7lY8ndMSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEmuUZ5uepaa58p7S0Siaj PfHLlTt5fpFaFxkWrGA5ZNAUcGBC0q5Gljh5p7zjs9/XAAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

gbphy_dev_match_id() should be taking a const pointer, as the pointer
passed to it from the container_of() call was const to start with (it
was accidentally cast away with the call.)  Fix this all up by correctly
marking the pointer types.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/gbphy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..ab8a1af36808 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -102,8 +102,8 @@ static int gbphy_dev_uevent(const struct device *dev, struct kobj_uevent_env *en
 }
 
 static const struct gbphy_device_id *
-gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
-		   struct gbphy_driver *gbphy_drv)
+gbphy_dev_match_id(const struct gbphy_device *gbphy_dev,
+		   const struct gbphy_driver *gbphy_drv)
 {
 	const struct gbphy_device_id *id = gbphy_drv->id_table;
 
@@ -119,8 +119,8 @@ gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
 
 static int gbphy_dev_match(struct device *dev, const struct device_driver *drv)
 {
-	struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
-	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
+	const struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
+	const struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 	const struct gbphy_device_id *id;
 
 	id = gbphy_dev_match_id(gbphy_dev, gbphy_drv);
-- 
2.49.0

