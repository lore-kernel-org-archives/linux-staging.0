Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D566ED0
	for <linux-staging@lists.linux.dev>; Thu,  1 Sep 2022 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662025629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0rfbkSmizgr6psOrdFPtmaKUUBAt+oDMxTM54MoYWs=;
	b=VhbQ4zcA/21z87yncWT5a7PLnvMt9U2EmwgeRx80/8B9HkeW6FymNbplBQCTc0S/YsO6E0
	Kx9YGQ5/RD8jDrI+3gF75dcZT/ly4dFvIQ22T+rNU9tE4M9eX7+FTaK7XthyhBOkeOqeOE
	W1O+l+u1nXgT4LfwgrC2sUUy+AUh1Ic=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-2g3p_K4bMNKLuSXFVpTgJQ-1; Thu, 01 Sep 2022 05:47:07 -0400
X-MC-Unique: 2g3p_K4bMNKLuSXFVpTgJQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32A24280CF31;
	Thu,  1 Sep 2022 09:46:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C911403350;
	Thu,  1 Sep 2022 09:46:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()
Date: Thu,  1 Sep 2022 11:46:22 +0200
Message-Id: <20220901094626.11513-11-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

Register /dev/* nodes at the end of atomisp_pci_probe(), this is
a prerequisite for dropping the loading mutex + ready flag kludge
for delaying open() calls on the /dev/* nodes .

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 40 +++++++++++++------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 9a1eae1ba8c0..f819a6993e45 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1194,11 +1194,8 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
 		ret = atomisp_subdev_register_subdev(asd, &isp->v4l2_dev);
-		if (ret == 0)
-			ret = atomisp_subdev_register_video_nodes(asd, &isp->v4l2_dev);
 		if (ret < 0) {
-			dev_err(isp->dev,
-				"atomisp_subdev_register_entities fail\n");
+			dev_err(isp->dev, "atomisp_subdev_register_subdev fail\n");
 			for (; i > 0; i--)
 				atomisp_subdev_unregister_entities(
 				    &isp->asd[i - 1]);
@@ -1248,11 +1245,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		dev_warn(isp->dev, "too many atomisp inputs, TPG ignored.\n");
 	}
 
-	ret = v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
-	if (ret < 0)
-		goto link_failed;
-
-	return media_device_register(&isp->media_dev);
+	return 0;
 
 link_failed:
 	for (i = 0; i < isp->num_of_streams; i++)
@@ -1275,6 +1268,27 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	return ret;
 }
 
+static int atomisp_register_device_nodes(struct atomisp_device *isp)
+{
+	int i, err;
+
+	for (i = 0; i < isp->num_of_streams; i++) {
+		err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
+		if (err)
+			return err;
+	}
+
+	err = atomisp_create_pads_links(isp);
+	if (err)
+		return err;
+
+	err = v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
+	if (err)
+		return err;
+
+	return media_device_register(&isp->media_dev);
+}
+
 static int atomisp_initialize_modules(struct atomisp_device *isp)
 {
 	int ret;
@@ -1687,9 +1701,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
 		goto register_entities_fail;
 	}
-	err = atomisp_create_pads_links(isp);
-	if (err < 0)
-		goto register_entities_fail;
 	/* init atomisp wdts */
 	err = init_atomisp_wdts(isp);
 	if (err != 0)
@@ -1727,8 +1738,13 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
 	isp->ready = true;
+
 	rt_mutex_unlock(&isp->loading);
 
+	err = atomisp_register_device_nodes(isp);
+	if (err)
+		goto css_init_fail;
+
 	atomisp_drvfs_init(isp);
 
 	return 0;
-- 
2.37.2

