Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56661D262;
	Thu, 19 Oct 2023 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m35e7QLa"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ce291b5df9so222939a34.2;
        Thu, 19 Oct 2023 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697700030; x=1698304830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFWmc4leeJU0JvtOUCdlOewkD9kkUgR6yLJHBt3j+jY=;
        b=m35e7QLa5g7nv/JXXsIu1JS46n426dTbQDWarXJHWaO+N4iicpVXdUqyrLgmvAfk7s
         wYSRQKW8Q5lxzHFFXw6AMVKOVLXRVVEPJWbP2fy08oGJnR+fqxpIWkw/35FtK52YqTYv
         4M+6XVWRsr9cmBPkqz4XWvN1/DyYDEqIBFsG0XQblbohdI3fRElraXxMVdDXueEJsDdY
         +AtDqg1NHjoH2naw0SoxpAe+wonpNmHzQJEGKuvZ8gI+lqkGPnGGmnywAEmi1hWnISfx
         xt90TVdKHNofUiXYC5WCpSsjAv388mhWbYoKYOtU8MJxmNyz7hO+Ws/7LykFxM7VFGYC
         rY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700030; x=1698304830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFWmc4leeJU0JvtOUCdlOewkD9kkUgR6yLJHBt3j+jY=;
        b=bkVRyTPmYTzE6T/1/pT0Ykulr+6MyE2Js8rhNiQFqhEbpkWVRzU1CEQPbjRxTZHXgR
         3O1EXlPfgyeRQWefTODjiNCUGW6+phy5EZVgjEofl1sLUIFVnJkNvvIoX6+HhOsAK7Ei
         rDCwaaIgsd1d5ELmwljCTtzo09w/+BSIoxCMgGqKnYuO7xESSDJo7AgbkgAMk3ac2E2m
         33uazuuTMzVoc2y9NQXbXGwQYNJvawkQhUdaTj9A0fDqRbVdUKp1ipKo2b+xGqjLVevI
         SlWJlpds3ATNLSfpvnznqImrGLlxRA6/dogHbd3RQ2v7c3jop20xyvP9KE8R/210p5I9
         YxLw==
X-Gm-Message-State: AOJu0Yzq0C4nAQuK3pCYH1TmAbHUZYI3XfqGzHeuJ815rN0mXDPnh/T4
	/B6GaPWJJxVB/VUX61FpVw4=
X-Google-Smtp-Source: AGHT+IFhfqS+9PkzSgvH/94GRdjTN4G4Ebor8Y3l7RWGbuV8foAtwJqJoXeoSgt0dumdo5kfN502Tw==
X-Received: by 2002:a05:6830:410b:b0:6b9:146a:f1c9 with SMTP id w11-20020a056830410b00b006b9146af1c9mr1674172ott.0.1697700030357;
        Thu, 19 Oct 2023 00:20:30 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id t6-20020a625f06000000b0068fe7c4148fsm4613445pfb.57.2023.10.19.00.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:20:30 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v2 2/2] staging: vme_user: Use __func__ instead of function name
Date: Thu, 19 Oct 2023 00:20:10 -0700
Message-ID: <996c9f92e7fd288f67c02dfb0ba524ab7c5fe421.1697696951.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697696951.git.soumya.negi97@gmail.com>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function names in message strings with __func__ to fix
all checkpatch warnings like:

    WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
             this function's name, in a string

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
Changes in v2:
* None

 drivers/staging/vme_user/vme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 640b2dda3ac6..e533cce8e54e 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -424,7 +424,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
 	if (!bridge->slave_get) {
-		dev_err(bridge->parent, "vme_slave_get not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -576,7 +576,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
 	if (!bridge->master_set) {
-		dev_warn(bridge->parent, "vme_master_set not supported\n");
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1576,7 +1576,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_set) {
-		dev_err(bridge->parent, "vme_lm_set not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1612,7 +1612,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_get) {
-		dev_err(bridge->parent, "vme_lm_get not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1649,7 +1649,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_attach) {
-		dev_err(bridge->parent, "vme_lm_attach not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1682,7 +1682,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
 	if (!bridge->lm_detach) {
-		dev_err(bridge->parent, "vme_lm_detach not supported\n");
+		dev_err(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1750,7 +1750,7 @@ int vme_slot_num(struct vme_dev *vdev)
 	}
 
 	if (!bridge->slot_get) {
-		dev_warn(bridge->parent, "vme_slot_num not supported\n");
+		dev_warn(bridge->parent, "%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.42.0

