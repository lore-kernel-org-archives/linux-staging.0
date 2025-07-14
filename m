Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E643254873
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501403; cv=none; b=N739IN7PcL/otj2o4ddswWJs7UK3k40lJ9LRheOS0lBxMlVE5flmC/WWtrzjLWMdWz0g6qxkVrNqxUnLWBPiwULcssVA7z19WIBTC3Rv8llHBFyO6mAjUFpGw1DQ1IzN+gHnxH4kLsR/6ABLXk+vhqNO/G4H8y0qH+KTFWvqet0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501403; c=relaxed/simple;
	bh=2r4PJwbTP9Cp4Jke1ehe7I0MltoLzGMlwQSBAqTFUmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eaeMy17QqJ+PK1MXHeebk9OZtBnnecvgUhHf4ml5larKlAinHaqUiZNDLLO7qdnpFRRpbfRDzvMI7ShOY/wsGTjsrQpRgWyfk5OkhwjsVrtvea+rG/s3U4Rf8V08twj5KAknobVT8OYgXTIrZLZ5OcExGML450r8u1lknX2Tbio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Lm7aAlyc; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Lm7aAlyc"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F077219D4;
	Mon, 14 Jul 2025 15:56:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id um6tW3_VHP22; Mon, 14 Jul 2025 15:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752501392; bh=2r4PJwbTP9Cp4Jke1ehe7I0MltoLzGMlwQSBAqTFUmM=;
	h=From:To:Cc:Subject:Date;
	b=Lm7aAlyct43Xu4OjGv7sYrci5fa5kzBZ8gCYhk2+2zDSG201+WFpqr2u331baSpec
	 0aDFPaSrpgYLVWpFNAutxvO0jZS47k60SQ8FDFXAc6kR0FsPx+/HNTNI29GBNvBpzM
	 JD0J2P2Od3l1hV9r4WLcO6B+WayPCW7qAeC/qLu+Vj81ncUyp8N1WI9UmA/U//fk1r
	 8oXBGquRhhQWTie1U8dZoyDqeL6OeUlwM9EH2hztdqAOrrLwGK/o4p+mApHRJMM6UQ
	 3DnRkN8ztv2IuFwkLLB2FiJUFIp6PCkoFa7ZWSU1l5MCfzxM8NeoJ7BKH7yp9HTgFU
	 Yu1Xgz34+7jaw==
From: Akhil Varkey <akhilvarkey@disroot.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Akhil Varkey <akhilvarkey@disroot.org>
Subject: [PATCH] staging: greybus: power_supply fix alignment
Date: Mon, 14 Jul 2025 15:56:03 +0200
Message-ID: <20250714135606.41671-1-akhilvarkey@disroot.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch check "CHECK:Alignment should match open parenthesis"

Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
---

Hello, This is my first patch, I appreciate any feedbacks. Thanks!!
---
 drivers/staging/greybus/power_supply.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index 2ef46822f676..a484c0ca058d 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(struct gb_power_supply *gbpsy,
 }
 
 static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
-				     enum power_supply_property psp)
+				 enum power_supply_property psp)
 {
 	struct gb_power_supply_prop *prop;
 
@@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct gb_power_supply *gbpsy)
 	if (!gbpsy->model_name)
 		return -ENOMEM;
 	gbpsy->serial_number = kstrndup(resp.serial_number, PROP_MAX,
-				       GFP_KERNEL);
+					GFP_KERNEL);
 	if (!gbpsy->serial_number)
 		return -ENOMEM;
 
@@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(struct gb_power_supply *gbpsy)
 	}
 
 	gbpsy->props = kcalloc(gbpsy->properties_count, sizeof(*gbpsy->props),
-			      GFP_KERNEL);
+			       GFP_KERNEL);
 	if (!gbpsy->props) {
 		ret = -ENOMEM;
 		goto out_put_operation;
@@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct gb_power_supply *gbpsy,
 }
 
 static int __gb_power_supply_property_strval_get(struct gb_power_supply *gbpsy,
-						enum power_supply_property psp,
-						union power_supply_propval *val)
+						 enum power_supply_property psp,
+						 union power_supply_propval *val)
 {
 	switch (psp) {
 	case POWER_SUPPLY_PROP_MODEL_NAME:
@@ -943,8 +943,8 @@ static int gb_power_supplies_setup(struct gb_power_supplies *supplies)
 		goto out;
 
 	supplies->supply = kcalloc(supplies->supplies_count,
-				     sizeof(struct gb_power_supply),
-				     GFP_KERNEL);
+				   sizeof(struct gb_power_supply),
+				   GFP_KERNEL);
 
 	if (!supplies->supply) {
 		ret = -ENOMEM;
-- 
2.47.2

