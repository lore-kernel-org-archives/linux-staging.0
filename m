Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C07234975
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822951; cv=none; b=MJNJx/mEE6XJnk8Cet3WiDUccD/6X587ZGHQNNVDrIFK6pgkhDRccrghjdH1MF0KZHBIW4Uj8PRCj2gLP1zK2aI3QJ7pE6TndOBJdmmBlFlAbAjv6acY4b9C5GS4fBnTdJc65VF0s/pQL49lFBVJOIoh7lxM1xH4ca3QBDxXfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822951; c=relaxed/simple;
	bh=w7J6GH74FD94qUt1WS+yjzRqg4NaeMgHNEi8UiOgVn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQ9oHPDYof/yqxH+b2MYubKuOBk99V41dxmSsDeTCrb7Dn8d2q+eCKZR9g/uN4OLHnH716d0lS0GM+ZZpA+APM2/82jz5a1B2PrGwKXQlLE/IK8yTRM0kw7xLm4XB2bPo0muh9tHRvuUpNp8mI+CRuSUTxeiucY7oXvnH0AjRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+CDW+0z; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+CDW+0z"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46772a0f8fbso10276781cf.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822948; x=1734427748; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y//l0kib7ot3BmgnrtGvxoIcjefJ0s0WEOD2mlbXDKo=;
        b=h+CDW+0z6GNI7mmm60PyP6IuFBoBrQSMTU0wLAy7JKtsw4oyP/lp4LEOagNvs/EVyW
         +Rq+fXe3IgegsG6dk0Z3EOr4HnZgEKs0NMDICaxoSlu1P13OlCgPQ1DwXLpo4zCcayRo
         OtJHlwMN5Dclgo06/fbmu2/ZMlSudsmV4zEes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822948; x=1734427748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y//l0kib7ot3BmgnrtGvxoIcjefJ0s0WEOD2mlbXDKo=;
        b=kNciQPemdERWvCDJ90xGsxVnZi4wpXx8zTjY1u3z6huRBohCYgl6bA1+40fSCF26nm
         0xYBZFZPvVBQyD8ntWX1VZXgvb9pOZvtoERYMEjEoK2VuZ1KzmTHpgGPCXsGJW+34auk
         UPL/jEwTfEUBmv7P17g4YJAg7NxAvgjqGXqzre4xJ83WK7aLm+nPTj/1OuA8HHmBbYLF
         owkVi6TgC+HYwI1pHEOukllwnC937Zd82t7FeuTSvupl8T0ZVIn9BK1i7hx89Xdrgmju
         M9KpL5v1aAzgK9DtZfj4/yIEp0niB+EZvS1P2fVsE7fWNwSuFyUUDStYxuBC3lAdVW/z
         EaNg==
X-Forwarded-Encrypted: i=1; AJvYcCVMbAKvF9aLskSVXugpchOVIR96XxYuRt+wjFZX5/dBcHL0ib1KMN4aH2VbmfzP9I4DgpBcbZ3jfXczA70n@lists.linux.dev
X-Gm-Message-State: AOJu0YxaRTCAtWKosIkBrgFHTf9fYeukSj7QTR/7eMo53Mpi9Bx9fcKM
	9GsA0WLdB4+9E5tqU4//9tFNtm4uf/qAlThR/HbuhSu7EaYik1aA7tJ0rNv04w==
X-Gm-Gg: ASbGncvQGJ4gaRBAkjkSt1IiEfa9P2vEzRcZ8LMDhfXfUaRa1Dd/F7hsOLpykXzZ7CO
	Xh9lYXIpUwF4/qwZsNhWtXI7tH7U6PeCtC3V8jUaW4TJrAz4YLn4Wbq9zq5SjQYqFBA1Bse829+
	9tru3oIewj1mJBsa9tFmy3e2ktI5BJGCrWzwdRJO4G1C4mqrz0yoNA/M/cueBWd8IpWFGys3ZY2
	qjK+WymQH9KUMfdiM71ABrJ1YAwLrPirwqm5wrN/B9QH0uU4sx258qx7lxo77zNoZGIP/wB4Y6C
	fbTNCEgYbSoP1yt8U8lwo6vdCCit
X-Google-Smtp-Source: AGHT+IFf9kYaWa576VrO6wskX+9beQZ8FmZVkS93oM2U3Ri0fbfJz0ugCHR5677iLTfU/+g8oDAzSg==
X-Received: by 2002:a05:622a:110:b0:461:2150:d59c with SMTP id d75a77b69052e-46771eac17fmr59619831cf.9.1733822948169;
        Tue, 10 Dec 2024 01:29:08 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:29:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:55 +0000
Subject: [PATCH v2 11/11] media: v4l2-core: Introduce
 v4l2_query_ext_ctrl_to_v4l2_queryctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-11-c0a33d69f416@chromium.org>
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
index aa31678fb91e..ca89880b1359 100644
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
2.47.0.338.g60cca15819-goog

