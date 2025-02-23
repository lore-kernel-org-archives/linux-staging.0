Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776120F090
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337185; cv=none; b=gR+vZI5YX24xbPSw+qtEkZ1QbpCQxu83YEmDR/Vx0WB44VaCzojQOgwxfnHVE7a12aprxzYgMui0IOKxMclUPEIX2D7XkZMD3mq+uhbHuC4LHgpZuN8WuYTKi+0aNOlRyJtm6vFun6mD0DcfWoRejg83LH5YET0NwZDC1KO9XZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337185; c=relaxed/simple;
	bh=bGURjosegTH+P+Gw5HjXH9uRa5Uc4pPh6VYCjWY0HAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW4v4hZcZxCAkT3Y04A7kgfYhaM1u71Qsc/GrvxYbt3mtfgnCQjyyR4+eUxUDnAjHx/X+OZTJfVYgvHpPRSJ9QP4c9zB4jTX64d6WGVQoqMzjkfBsSzszJc+rNgGDzyYh5uooUqjrfFCDvQZljxzBR2F19g5ud62QIcAoH05u88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qf5jh8vG; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qf5jh8vG"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7be6fdeee35so749333285a.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337183; x=1740941983; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXG9+uuGWmSBcxIUkNXdZws6nfJZHCT+9+MDo1/1sYc=;
        b=Qf5jh8vGqqBwzkOA14dhv+Jcy6gVvEa4VQ5GDzBx7RFVMpPJAZzw3Ompjf8+fa7KA+
         VqLIJ65nv8uh2SQA4CLirJN/7XcVALOSbL8eqyp+fTYFf1bVZFW7Rcc3ucpXcvZKSYnV
         hT5IGM5PZoyyBCs/X8dOITfdILSa563zF9yL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337183; x=1740941983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXG9+uuGWmSBcxIUkNXdZws6nfJZHCT+9+MDo1/1sYc=;
        b=m4LM3jVZhokYbEMNGkUvxco54qTEjG+x1OSzSHEZSVlk9AR+fy5zqE1rnSmNT+Yqwm
         S5e03PvY1KP5EcEbr/W+h4yRDrO+XiIExUXY6/ruXBg57xNBWh9frQK9045uQmfJfgba
         iBhHazzgxuR4gztFsRT+OthOd0443M2r7M6euZKNU6//uVLYQBqAuF7E4TLcgC08cJky
         xbtogZGVOJXtCpy4nc+wbKnFcNZ29E479L3EUqKRqe3t7oGtaBMeQcX5tM/ue7anPs1M
         o2csnR5NtS9ZN8g0pq81rJQbOJYlJ1vVjuMrBSJKOx3yWpXelyJtVLhfH8F4+RGrwj+o
         Ju5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5qDg4c8fzj1Du+/WNAMwTpRj0ZEd3r2DeZAaFHmQrbTfRUoycDm8ZXYqIwp1j2BdpDe3qf3/S6SasAU7E@lists.linux.dev
X-Gm-Message-State: AOJu0YyA1vDUlkQeK6zi5JpR/AAQq38aRrZtzpWLpV8nMDkIJqk960B5
	/KDabgZ4LXp7f68FRrlHmakg1UaDnPoJnRA8Qm+d3/dyDRrDdn/c9nbRT+BxEZJz0zQHUznJDKH
	mMBPf
X-Gm-Gg: ASbGncuYxHpaYOOp1TrT+kfssqJgFnAUp6adhtZisWkSF1SEZRpdb7Hz0zTnhwAABUf
	PfmIpcnfPWPCcMu1UswQje7gF9mUPsGZyF6jHioGD3k3qVrcJ0M4dSNWDB38oI5vNID9QKjdiXn
	ss8co3OOFNRiR1LbPyrAiX2vDclvg7TWm83bV5f0xD7jFXJqYhgLWeC89aUnrakHv4WnSYrEsPz
	wNMfII+iXhQcz5W4Hnp//Q0OLEdmDJh19rfWEP45MtkCL5m2UzbPGYKb3HBp3i3vKPqvsKVa5Jm
	6Ra0Myq+/0i8OY1AbGM9Jp0nm3ZMb05EbwPbY7jjU7mTbWNcu5vdFn1xLpPFsGUVlk0ztknXCqZ
	c39Y=
X-Google-Smtp-Source: AGHT+IGjHh9bP3Z1R0+XLoulszUD7WhUuuTZdPXT1kOhHNmPI8BbzEJMwqu44jAaJET9UyJKRwaG6w==
X-Received: by 2002:a05:620a:450c:b0:7c0:b5bc:a122 with SMTP id af79cd13be357-7c0cef55f43mr1666469185a.35.1740337183095;
        Sun, 23 Feb 2025 10:59:43 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:14 +0000
Subject: [PATCH v3 11/12] media: v4l2-core: Introduce
 v4l2_query_ext_ctrl_to_v4l2_queryctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-11-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
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

We use this logic in a couple of places. Refactor into a function.
No functional change expected from this patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 51 +++++++++++++++++++-------------
 drivers/media/v4l2-core/v4l2-ioctl.c     | 28 ++----------------
 include/media/v4l2-ctrls.h               | 12 ++++++++
 3 files changed, 44 insertions(+), 47 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 95a2202879d8..9dd2bc5893dd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1123,39 +1123,48 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctr
 }
 EXPORT_SYMBOL(v4l2_query_ext_ctrl);
 
-/* Implement VIDIOC_QUERYCTRL */
-int v4l2_queryctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_queryctrl *qc)
+void v4l2_query_ext_ctrl_to_v4l2_queryctrl(struct v4l2_queryctrl *to,
+					   const struct v4l2_query_ext_ctrl *from)
 {
-	struct v4l2_query_ext_ctrl qec = { qc->id };
-	int rc;
+	to->id = from->id;
+	to->type = from->type;
+	to->flags = from->flags;
+	strscpy(to->name, from->name, sizeof(to->name));
 
-	rc = v4l2_query_ext_ctrl(hdl, &qec);
-	if (rc)
-		return rc;
-
-	qc->id = qec.id;
-	qc->type = qec.type;
-	qc->flags = qec.flags;
-	strscpy(qc->name, qec.name, sizeof(qc->name));
-	switch (qc->type) {
+	switch (from->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_BOOLEAN:
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_INTEGER_MENU:
 	case V4L2_CTRL_TYPE_STRING:
 	case V4L2_CTRL_TYPE_BITMASK:
-		qc->minimum = qec.minimum;
-		qc->maximum = qec.maximum;
-		qc->step = qec.step;
-		qc->default_value = qec.default_value;
+		to->minimum = from->minimum;
+		to->maximum = from->maximum;
+		to->step = from->step;
+		to->default_value = from->default_value;
 		break;
 	default:
-		qc->minimum = 0;
-		qc->maximum = 0;
-		qc->step = 0;
-		qc->default_value = 0;
+		to->minimum = 0;
+		to->maximum = 0;
+		to->step = 0;
+		to->default_value = 0;
 		break;
 	}
+}
+EXPORT_SYMBOL(v4l2_query_ext_ctrl_to_v4l2_queryctrl);
+
+/* Implement VIDIOC_QUERYCTRL */
+int v4l2_queryctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_queryctrl *qc)
+{
+	struct v4l2_query_ext_ctrl qec = { qc->id };
+	int rc;
+
+	rc = v4l2_query_ext_ctrl(hdl, &qec);
+	if (rc)
+		return rc;
+
+	v4l2_query_ext_ctrl_to_v4l2_queryctrl(qc, &qec);
+
 	return 0;
 }
 EXPORT_SYMBOL(v4l2_queryctrl);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index fea53b419351..4e15ef4840b0 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2302,32 +2302,8 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 	ret = ops->vidioc_query_ext_ctrl(file, fh, &qec);
 	if (ret)
 		return ret;
-
-	p->id = qec.id;
-	p->type = qec.type;
-	p->flags = qec.flags;
-	strscpy(p->name, qec.name, sizeof(p->name));
-	switch (p->type) {
-	case V4L2_CTRL_TYPE_INTEGER:
-	case V4L2_CTRL_TYPE_BOOLEAN:
-	case V4L2_CTRL_TYPE_MENU:
-	case V4L2_CTRL_TYPE_INTEGER_MENU:
-	case V4L2_CTRL_TYPE_STRING:
-	case V4L2_CTRL_TYPE_BITMASK:
-		p->minimum = qec.minimum;
-		p->maximum = qec.maximum;
-		p->step = qec.step;
-		p->default_value = qec.default_value;
-		break;
-	default:
-		p->minimum = 0;
-		p->maximum = 0;
-		p->step = 0;
-		p->default_value = 0;
-		break;
-	}
-
-	return 0;
+	v4l2_query_ext_ctrl_to_v4l2_queryctrl(p, &qec);
+	return ret;
 }
 
 static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..83b84cb5cf06 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1404,6 +1404,18 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id);
  */
 int v4l2_queryctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_queryctrl *qc);
 
+/**
+ * v4l2_query_ext_ctrl_to_v4l2_queryctrl - Convert a qec to qe.
+ *
+ * @to: The v4l2_queryctrl to write to.
+ * @from: The v4l2_query_ext_ctrl to read from.
+ *
+ * This function is a helper to convert a v4l2_query_ext_ctrl into a
+ * v4l2_queryctrl.
+ */
+void v4l2_query_ext_ctrl_to_v4l2_queryctrl(struct v4l2_queryctrl *to,
+					   const struct v4l2_query_ext_ctrl *from);
+
 /**
  * v4l2_query_ext_ctrl - Helper function to implement
  *	 :ref:`VIDIOC_QUERY_EXT_CTRL <vidioc_queryctrl>` ioctl

-- 
2.48.1.601.g30ceb7b040-goog

