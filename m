Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C212E41
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxa5YV7j"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-27d113508bfso1728862a91.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697924927; x=1698529727; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUY/6aiz/kuqBCZnsp6ZXSxXydVcwFjt2+x9XvheJnQ=;
        b=gxa5YV7jsAPq6F5LYl9qpKC+FuAZ84Ehg3+3LpPte9Qs0xnFoEP3RClENRoNl128s+
         H4KhGYozMqXzd5H1rNjDly7DLILZlOaQMhesryd/e4ZIcNJKJrKJ4+VgCcsRHjgJxIOD
         dyfhTrkel03XtP692NVZqvvZL/CuIEMjMY2BwbLAAdBDB4wR0kTP9xITqJZzIxGcBMWX
         eNBvT2SlP+cm4ng1KOBc+BBZEekKF/pBneH9aPGb16t3Yro6a2vxgklsI9wTm3uupk6h
         ByptKvsuffIgiWcVZtJW2+29rUfE0kW3KuIZsHLWcG3EKt5AXo6GzmCfz13dAi9ol2oj
         Pj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697924927; x=1698529727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUY/6aiz/kuqBCZnsp6ZXSxXydVcwFjt2+x9XvheJnQ=;
        b=rrLEVh0XE5g/pNRkbBbxhHh7/f4F2eMXjD5jigSEHbEi4ssIcZGHnkYo6E8ZemhUOo
         /omx3bsxxONVq2F11InYaRsGywfQhaiMJByhP7OtPXgkvXiCUmmqvzPV/M1fkAqPDcP/
         flRxNQ8gm0p1ssPdKoDszUB6QFPCWsZp/MRbXFX/F1rySyXtrGdi8mAw/ZlKMi0JXEFT
         DatOCSiVT+eiuM8D43XxffFl+4OmYJizQ8TKq+o80SS2STwAPrwidHG2qywYaSnsqjES
         KfMatQ93fTm2zTVrmyAth/ffHws0f1r2hwB2RmVdrf6nKvXd6JdCNzSsB4FsjAZRNdj8
         0jUQ==
X-Gm-Message-State: AOJu0YxjR/w6cPa4QgbfR7Y8BUuOShD1ef7RU1+dC10KFC+j9odzBa1G
	atsS1AJ+Bi6otvLf00FV6Tw=
X-Google-Smtp-Source: AGHT+IEZd9SN83EFFxrJuxljhGwxuZ4exyWb83Q2VVJHLmEQIDMjLqdOV1BIKqIgpjkUfG9ZCE44sg==
X-Received: by 2002:a17:902:cec4:b0:1ca:2caa:aca6 with SMTP id d4-20020a170902cec400b001ca2caaaca6mr6514621plg.68.1697924927110;
        Sat, 21 Oct 2023 14:48:47 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001c5eb2c4d8csm3542882plg.160.2023.10.21.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 14:48:46 -0700 (PDT)
Date: Sat, 21 Oct 2023 14:48:40 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH] staging: greybus: avoid macro argument precedence issues
Message-ID: <20231021214840.GA6557@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to linux coding style, added parentheses around
macro argument 'gcam'.
CHECK: Macro argument 'gcam' may be better as '(gcam)' to
avoid precedence issues

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..ae49e37a87e9 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
 
 #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
 
-#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
-#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
-#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
+#define gcam_dbg(gcam, format...)	dev_dbg(&(gcam)->bundle->dev, format)
+#define gcam_info(gcam, format...)	dev_info(&(gcam)->bundle->dev, format)
+#define gcam_err(gcam, format...)	dev_err(&(gcam)->bundle->dev, format)
 
 static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 					  int type, unsigned int flags,
-- 
2.25.1

