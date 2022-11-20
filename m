Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50BEBF8
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 22:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668984094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S0UtkBCP79CbX4HC5j9osnoAbl+WZJiovxaTKMd1zGs=;
	b=M8pFkLEIWQmG1R/iBhWioNpVTjHmsaKn6s5WjvGSBUiy+XbICAZsNTVNvfHgiN/W7Lb/b8
	Zr59o8nlyOjC6Z4EopLNdbDXwyYtzp+uws9YejAj2tJw4B73qnQOUltBtybjHDVCqucbhW
	l3s4EPR7zPMPJVehlFtpJRJ6DjYswbU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-xIXREmFYMse3npL2dS0jyA-1; Sun, 20 Nov 2022 17:41:30 -0500
X-MC-Unique: xIXREmFYMse3npL2dS0jyA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CB2B85A588;
	Sun, 20 Nov 2022 22:41:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0CBF47505E;
	Sun, 20 Nov 2022 22:41:28 +0000 (UTC)
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
Subject: [PATCH 11/20] media: atomisp: Remove double atomisp_mrfld_power_down()/_up() calls from atomisp_reset()
Date: Sun, 20 Nov 2022 23:40:52 +0100
Message-Id: <20221120224101.746199-12-hdegoede@redhat.com>
In-Reply-To: <20221120224101.746199-1-hdegoede@redhat.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

atomisp_reset() calls atomisp_mrfld_power_down() after calling
atomisp_runtime_suspend(), which already calls
atomisp_mrfld_power_down() itself.

And the some goes for atomisp_runtime_resume() / atomisp_mrfld_power_up().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 16 +++++-----------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h  |  2 --
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c |  4 ++--
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7f33a2f1e3fc..c69a646aa4d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -311,17 +311,11 @@ int atomisp_reset(struct atomisp_device *isp)
 	ret = atomisp_runtime_suspend(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_runtime_suspend failed, %d\n", ret);
-	ret = atomisp_mrfld_power_down(isp);
-	if (ret < 0) {
-		dev_err(isp->dev, "can not disable ISP power\n");
-	} else {
-		ret = atomisp_mrfld_power_up(isp);
-		if (ret < 0)
-			dev_err(isp->dev, "can not enable ISP power\n");
-		ret = atomisp_runtime_resume(isp->dev);
-		if (ret < 0)
-			dev_err(isp->dev, "atomisp_runtime_resume failed, %d\n", ret);
-	}
+
+	ret = atomisp_runtime_resume(isp->dev);
+	if (ret < 0)
+		dev_err(isp->dev, "atomisp_runtime_resume failed, %d\n", ret);
+
 	ret = atomisp_css_resume(isp);
 	if (ret)
 		isp->isp_fatal_error = true;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d9110bba8c28..61cbdc1215de 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -341,8 +341,6 @@ int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 int atomisp_get_invalid_frame_num(struct video_device *vdev,
 				  int *invalid_frame_num);
 
-int atomisp_mrfld_power_up(struct atomisp_device *isp);
-int atomisp_mrfld_power_down(struct atomisp_device *isp);
 int atomisp_runtime_suspend(struct device *dev);
 int atomisp_runtime_resume(struct device *dev);
 #endif /* __ATOMISP_CMD_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d5bb9906ca6f..d7fb700252fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -725,13 +725,13 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
-int atomisp_mrfld_power_down(struct atomisp_device *isp)
+static int atomisp_mrfld_power_down(struct atomisp_device *isp)
 {
 	return atomisp_mrfld_power(isp, false);
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
-int atomisp_mrfld_power_up(struct atomisp_device *isp)
+static int atomisp_mrfld_power_up(struct atomisp_device *isp)
 {
 	return atomisp_mrfld_power(isp, true);
 }
-- 
2.38.1

