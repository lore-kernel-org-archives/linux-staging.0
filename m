Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D51DC99A
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822940; cv=none; b=iZ2B5sW1vTIbWA4fXpsrTwu6PmkTsdBXBNBw+DCOUYybcaTg45kFUkBvzlptL8g/vkHeRDGX1dlVBE0nYcClLZfHBu0YaoRkGxU1tp1KGdpJKPb8OAnO2JLIm3pxXenT2JYi+Bzj2d7dMVmusV975BetaY6qy30U/08a07Rw4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822940; c=relaxed/simple;
	bh=ctL5AnJGV5DJC9CXkrWVL7zWfndzHWXxxUlRLsEsOfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=go4X65v6GU04bqGtDBId351l8ewHIXNxXnEEkEnTQNHTo5ivL+/6UOPqZri0mBzAgoDvB7jXo1Ldu0AEb/bWp4jXpuc1lB2cLxxyS0785m/4FVpMpcsVxxAXLPcOn/7aPEsRcFOs5wd1/7j7ILi6kuvnRmsTIjxynKp2r0j2hno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IavHztQr; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IavHztQr"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46760d9e4daso16024251cf.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822937; x=1734427737; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6+2CPj9NTbpQOo8ueUbGM8wqslpqQFkOdhDSPG4NAo=;
        b=IavHztQrsYNutfLstcltr+iPuqUbiwR8aJ/Wypw264q+Hcd/ZKMZWKSF0ArOyn31W6
         Qw3EgSn1TjreEBwGTMtjRbA+6CS4rwMzwjRAB4+WmbKBVI89HdI1jBXYN+0xmw8/wsrY
         AuINP8C0VzRiE261kI6l+fh9rYxHruN5ET4j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822937; x=1734427737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6+2CPj9NTbpQOo8ueUbGM8wqslpqQFkOdhDSPG4NAo=;
        b=P/onrUJByNWkYf7nG+zlfdSewmVf4TFSC11zrjYeWGhJpdY1G7dV+mB30yYpkG6uRV
         Q7hSI3Gd3lKi54cRf3o0m1o1fXrkg1KlP8zBdRYGZQYlZzh8Pa+VPTgzYdD84lGF+h97
         zh5nnOOD1hzRHMEu5pvJiN50xaLR3h/YzID4WWMIWVnCuUDiUav9IzuGuB1ILQKf4+61
         pYkAmx9/1utkTwBHSBTLPW3E5IifGGIl8vfkS3dSlsPspMexm3bQu9KFDmd4QYBRyBGC
         zYGclicYXsQ5947Je7iwWTtp4w/UFfVpUmImHNN96gC82xzGpV7NOx9a1IF8VM47hHtp
         nmsg==
X-Forwarded-Encrypted: i=1; AJvYcCVqTYWHrJULJB6U1LDlKYzJVR1MvM4z6KMPJzDgSAcgqii0/4i3ehXXTYa9h1/piVzLWMTam44uH5rl76rg@lists.linux.dev
X-Gm-Message-State: AOJu0YyJCHtFYddPuv3mlJLgt8R8qyujgfo7I/F1k2sWyFIbwxOuMFtC
	8g/IyNZCYvAa36hmUD7PT/q0S3OuEmcUXjTjUmGv7WZySXhfvtdyuFJkgdvQxA==
X-Gm-Gg: ASbGncsOC6zqyTkGzE6uOPBjs/POThhaD4RCwvpVO9MjcvTqlAEEYLRbZlP3nJddcWo
	w6x8Z7R2OTk2OY643bEmOS6BkIu0XepjGJBCmPFmLQvH11d480GAPgPUH/EaQnNONpSpjXNAZ81
	0zgvLxsk/hSM7cKo/dIlhmsfKYyR4ts/lywCHhCNNm0+P2WGez3qr2prphRXBjgmcWpBmtRvgKV
	WMBWNw/fQGx2j/lRKJF5xV8QY5NE4+oE0sjcbn7xz3SusmAIdm9u5vyBfooI6BM4+RjHpo0VjSA
	FcmgQ86hbS+ejhs+p8m8VzIT7zyK
X-Google-Smtp-Source: AGHT+IE8b0PM7gKALz88Rd23P5sKAeyq0cPFEHzTFCgEulkAqAHRhkOVnMDbHAXt7ijPFaIS17Apgg==
X-Received: by 2002:ac8:5fc6:0:b0:467:774b:f04b with SMTP id d75a77b69052e-467774bf44cmr28726901cf.22.1733822937679;
        Tue, 10 Dec 2024 01:28:57 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:49 +0000
Subject: [PATCH v2 05/11] media: atomisp: Replace queryctrl with
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-5-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
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
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 33 ++++++++++++-----------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1a960a01854f..6b84bd8e6cf3 100644
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
@@ -1140,31 +1140,34 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 
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
+			*qc = ci_v4l2_controls[i];
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
+	 * many kernel versions. Leave it to avoid breaking any apps.
+	 */
+	qc->flags = V4L2_CTRL_FLAG_DISABLED;
+	return -EINVAL;
 }
 
 static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
@@ -1561,7 +1564,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
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

