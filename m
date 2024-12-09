Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DE199239
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772342; cv=none; b=o3RZhHih/yoJyJROTtbuhv5Q6E8OM+RmNLeOUAWp2ffXwReDMQ+DApbOFB48f06thsvRQCdzXbAKTl27ggSOy4KsxEwmmUaUkrcciN4iNkk6Tn7bAaoGYZowDosjZJTnH4GJHdZ5HGEY22J4MfTzvgvzSrxxsVU4BOjmUhnAyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772342; c=relaxed/simple;
	bh=3hn+UbgNRo1Vvg//E6tf3MH9DX6Es4eU9XONllUKPyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXN0SdP+a3eAboa841xFj75tl6mNRu6TWTuw+gCSzlRZ/XxXCGbOBKdL2rbmqWljHu6Ix+j3znFdetmBUzUt6EE/Glt6jEf3/ANeaG+k9aLMiBFprOxtqlEGLY4aIxZq9BPp87pV5IYK1HiEXadh6a8In9cJA7rhSZoex9Au1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bq84mWZb; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bq84mWZb"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4676aad83d3so9367701cf.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772339; x=1734377139; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ2bYJmReZdYhWgrWqbpm/s7LwVM5L6DZW3JOy2ZqFs=;
        b=bq84mWZb5Anp9T1m5QwKtTptf6gUa0z2S60+pxwUUBL2A7FUXzzvjRNj/u06IdXGaJ
         UJfnyttpG0FpGvwpuyE95AlsBDnFpb2Fa8WjKwEWVGLa/RTojDdl/ng45hneL8Z7aF/8
         3zj4vu/DRzpTcsWbM2K0l8mmGA3gYYcXI7iC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772339; x=1734377139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ2bYJmReZdYhWgrWqbpm/s7LwVM5L6DZW3JOy2ZqFs=;
        b=KX8oxqFnxs8+VxioI+jcOKSNqHUaOkR3ztl+xDAfqt02cahIE0xOsoFUODY+Xto3pY
         5+Su8rXFalUd3DlfvS9smyWKjgKS7GtJeI14GyM5X+XjrBr0WH1iG/Ar49k2U5vY41Tl
         eMkOdmDnBdx1LQUV5F07YLc+Q4Tb2f2SQHS3cdx6c188k9vRatNMDrtHi+Ui0lTpUL9S
         2pUeQLlI+4cGSV4J1Ifttg6fhwgqHtpbvgeW1/ziZoBpJn4f9pwniyzNkppSL3zquZjJ
         WRjPGer19W7zuj8d+OxSGKGlyAnYKVI/oJO5pdQTypHom9WnMhSeY022sxX2DylS1kzQ
         YV+g==
X-Forwarded-Encrypted: i=1; AJvYcCWDofB9qMePnN1ClfYNKwnOzE/+tyiugWw4mcHGbZVNoIaRqhXgVaqslcsmFokDIL1Rj73SVahIZ170HSiu@lists.linux.dev
X-Gm-Message-State: AOJu0YxE294iTodBTwT4AFDk/1iRrymjOvUJx7s60VhsReyXIYws8+D8
	0w8IDZDH4X1iBy0n5er7XiDEBg1RegKHK60oO8GXtAHIGT6wZAP7mz5KKNTxVw==
X-Gm-Gg: ASbGncvfdujlDLCDdklPzGJcEBcDOIU24RJ3n0vH/jsYmDkEEqGJLp47blOfj+K6Ln7
	FvWFTeaA+USPOH6u777wUg5tVzgvlcmQtrWzzUKuPvM8ozXqwdLrkPV/AI74CYYvAaLK3meV4Gu
	hr4bCQAQQUwO7qDZQSs0IoU8fn2LgiESFM2406xVq04jTKyrfi0JkPvvJv3mH5TpIXm0AvsoXIM
	pc/Cp7I7eAn0z52+6XRObTWuAe8GUZOUNBchDd06xekwye68ojEPEkNbbBn681KeUTC5lqXalxi
	34lRSof9ELsmL6VwAIDqhU2q
X-Google-Smtp-Source: AGHT+IEEzHN2lOcUckbzOhPkCQcj1XO3mZCg8zUBijND4xHIzep7iljKXyw3l3y8ggzjN0SCzkOjSw==
X-Received: by 2002:a05:6214:d84:b0:6d4:1e43:f395 with SMTP id 6a1803df08f44-6d91e399f68mr25209096d6.24.1733772338843;
        Mon, 09 Dec 2024 11:25:38 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6cc1cf6fesm217433385a.102.2024.12.09.11.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:25:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 09 Dec 2024 19:25:36 +0000
Subject: [PATCH 05/10] media: atomisp: Replace queryctrl with
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-queryctrl-v1-5-deff7acfcdcb@chromium.org>
References: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
In-Reply-To: <20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The ioctl framework provides an emulator of queryctrl using
query_ext_ctrl.
Replace our implementation of queryctrl to support both.

Now that we are at it:
- Add comment about missing functionality.
- Remove superfluous clear of reserved[0].
- Remove ret var.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 34 +++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1a960a01854f..d24420d8bd57 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -34,7 +34,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
  * FIXME: ISP should not know beforehand all CIDs supported by sensor.
  * Instead, it needs to propagate to sensor unknown CIDs.
  */
-static struct v4l2_queryctrl ci_v4l2_controls[] = {
+static struct v4l2_query_ext_ctrl ci_v4l2_controls[] = {
 	{
 		.id = V4L2_CID_AUTO_WHITE_BALANCE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -1140,31 +1140,35 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 
 /*
  * To query the attributes of a control.
- * applications set the id field of a struct v4l2_queryctrl and call the
+ * applications set the id field of a struct v4l2_query_ext_ctrl and call the
  * this ioctl with a pointer to this structure. The driver fills
  * the rest of the structure.
  */
-static int atomisp_queryctl(struct file *file, void *fh,
-			    struct v4l2_queryctrl *qc)
+static int atomisp_query_ext_ctrl(struct file *file, void *fh,
+				  struct v4l2_query_ext_ctrl *qc)
 {
-	int i, ret = -EINVAL;
+	int i;
 
+	/* TODO: implement V4L2_CTRL_FLAG_NEXT_CTRL */
 	if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
-		return ret;
+		return -EINVAL;
 
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == qc->id) {
-			memcpy(qc, &ci_v4l2_controls[i],
-			       sizeof(struct v4l2_queryctrl));
-			qc->reserved[0] = 0;
-			ret = 0;
-			break;
+			memcpy(qc, &ci_v4l2_controls[i], sizeof(*qc));
+			qc->nr_of_dims = 0;
+			qc->elems = 1;
+			qc->elem_size = 4;
+			return 0;
 		}
 	}
-	if (ret != 0)
-		qc->flags = V4L2_CTRL_FLAG_DISABLED;
 
-	return ret;
+	/*
+	 * This is probably not needed, but this flag has been set for
+	 * many kernel versions. Leave to avoid breaking any apps
+	 */
+	qc->flags = V4L2_CTRL_FLAG_DISABLED;
+	return -EINVAL;
 }
 
 static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
@@ -1561,7 +1565,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_enum_input = atomisp_enum_input,
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
-	.vidioc_queryctrl = atomisp_queryctl,
+	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
 	.vidioc_s_ctrl = atomisp_s_ctrl,
 	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog

