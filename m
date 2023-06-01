Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C021CE7
	for <linux-staging@lists.linux.dev>; Thu,  1 Jun 2023 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685631553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ3o0SNnJxcjk3ocmDUvf+AKtFcF94ZqhfK0FB25tx0=;
	b=g85Pd6KpQLSwpwjIhIQTXksihLMrXmQS72gNbfhxymHf6w3cDgUQ/MMULB9wWrDVp48i6H
	8FSjindiR7m4SMnHANQ2k90h5vsy6QNUXbHd7Tcb00K4oYTKjPkeNx+eKXvYe3faNBLm0U
	+qJUyhPxpqbC+GbGv+qXd5D49Jcp0vU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-n9r7zK78POGK0xhBnMqVaw-1; Thu, 01 Jun 2023 10:59:03 -0400
X-MC-Unique: n9r7zK78POGK0xhBnMqVaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A39A685A5B5;
	Thu,  1 Jun 2023 14:59:02 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2692B202696C;
	Thu,  1 Jun 2023 14:59:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: atomisp: Take minimum padding requirement on BYT/ISP2400 into account
Date: Thu,  1 Jun 2023 16:58:56 +0200
Message-Id: <20230601145858.59652-2-hdegoede@redhat.com>
In-Reply-To: <20230601145858.59652-1-hdegoede@redhat.com>
References: <20230601145858.59652-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

The main binary for the pipeline on BYT/ISP2400 has its
ia_css_binary_info.pipeline.left_cropping and .top_cropping fields
set to 12. So a minimum padding of 12 is required.

And for certain bayer-orders additional width / height padding is
necessary so that the ISP crop rectangle for the raw sensor data
can be used to change the bayer-order to the fixed bayer-order
supported by the debayer block.

Without the minmum required padding ia_css_ifmtr_configure() will fail
inside ifmtr_input_start_line() and/or ifmtr_start_column() because
it cannot set the ISP crop rectangle for the raw sensor data.

Fix this by making atomisp_get_padding() take the minimum padding
requirements into account on BYT/ISP2400 (CHT/ISP2401 does not seem to
need this).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 +++++++++++++++++++
 .../media/atomisp/pci/atomisp_common.h        |  4 +++
 2 files changed, 37 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 76307f793dc8..5c984edfb3fc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3697,6 +3697,10 @@ static void atomisp_get_padding(struct atomisp_device *isp,
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect native_rect = input->native_rect;
+	const struct atomisp_in_fmt_conv *fc = NULL;
+	u32 min_pad_w = ISP2400_MIN_PAD_W;
+	u32 min_pad_h = ISP2400_MIN_PAD_H;
+	struct v4l2_mbus_framefmt *sink;
 
 	if (!input->crop_support) {
 		*padding_w = pad_w;
@@ -3715,6 +3719,35 @@ static void atomisp_get_padding(struct atomisp_device *isp,
 
 	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
 	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+
+	/* The below minimum padding requirements are for BYT / ISP2400 only */
+	if (IS_ISP2401)
+		return;
+
+	sink = atomisp_subdev_get_ffmt(&isp->asd.subdev, NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
+				       ATOMISP_SUBDEV_PAD_SINK);
+	if (sink)
+		fc = atomisp_find_in_fmt_conv(sink->code);
+	if (!fc) {
+		dev_warn(isp->dev, "%s: Could not get sensor format\n", __func__);
+		goto apply_min_padding;
+	}
+
+	/*
+	 * The ISP only supports GRBG for other bayer-orders additional padding
+	 * is used so that the raw sensor data can be cropped to fix the order.
+	 */
+	if (fc->bayer_order == IA_CSS_BAYER_ORDER_RGGB ||
+	    fc->bayer_order == IA_CSS_BAYER_ORDER_GBRG)
+		min_pad_w += 2;
+
+	if (fc->bayer_order == IA_CSS_BAYER_ORDER_BGGR ||
+	    fc->bayer_order == IA_CSS_BAYER_ORDER_GBRG)
+		min_pad_h += 2;
+
+apply_min_padding:
+	*padding_w = max_t(u32, *padding_w, min_pad_w);
+	*padding_h = max_t(u32, *padding_h, min_pad_h);
 }
 
 static int atomisp_set_crop(struct atomisp_device *isp,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index 07c38e487a66..9d23a6ccfc33 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -37,6 +37,10 @@ extern int mipicsi_flag;
 extern int pad_w;
 extern int pad_h;
 
+/* Minimum padding requirements for ISP2400 (BYT) */
+#define ISP2400_MIN_PAD_W		12
+#define ISP2400_MIN_PAD_H		12
+
 #define CSS_DTRACE_VERBOSITY_LEVEL	5	/* Controls trace verbosity */
 #define CSS_DTRACE_VERBOSITY_TIMEOUT	9	/* Verbosity on ISP timeout */
 #define MRFLD_MAX_ZOOM_FACTOR	1024
-- 
2.40.1

