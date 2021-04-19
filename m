Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBE22F83
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 19:12:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 20so14338122pll.7
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hhCuGXWa0fhjfhibJmgMwfVxqiMW8JqhMXVVBFl7UlE=;
        b=h/2xO5MHvbzo/6sLqX/slReFjbdfceWv4QDvMzUjAv+ZW3B20hWBoCZAUOdE8vKEY9
         faH/CYNYYb+bKZuZdf/BLuZawWyAEXXZjCdOd73twX9oCjqAYuULZnYwz1B7X2+t74+6
         S+5GXrKZbM6fvUfzd6wMccpIlwulKX2H84Q0A+YVfO6ZXZ+eiTNbF28r0VsZgIp5yv1I
         LE/6dPTXazuv7AcA2BoJ1/vXMe+/e8wIIVVy0Wdg0KYT5+H+1wJencik0OJ1XRSMi8Rq
         OzXXg0g4yT9YqPxWkRXUSRu29kOE3wY9v1liErLT0wAm9y9TnQcNRNl73TH+pYneYnpv
         7tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hhCuGXWa0fhjfhibJmgMwfVxqiMW8JqhMXVVBFl7UlE=;
        b=OEgg+5250TvyXMUyU2HSrUrqWMiz+kOOlGSuRxaJxsF9C3LG6TP4MYeYUgPIm7A1g8
         GNvJtUUG66kOOLtb31VamgZWVNdq14aKE4CkjUUV3LlnJFT3/k/HvxoZztQ9Dh9ui4vk
         +moSspp3mJvKbka+mT7gsyrvT9MtqqyzUmyHUQyWw2p7zyeSWtdDarofSPDFUA9cqJ7d
         tRL8q0eYHKuUYriqA3E7h3GuEmCYiNKSQx8ZAwCBs7zDR88WlC4UHE4MEuEwnv6G6sxB
         mrSOSNb/wdIhpFwNMiVewOZGCbUPu5XQEvf24rr766kNOFERMor2WxKOvMKYg2QM7A4l
         O15w==
X-Gm-Message-State: AOAM532d6lPADVM2c6E6GGtQymIp6z39Iqq3YBQ7sxAbuusWde49lp0a
	ElRFUw2hx68sFhT5cM3S74Q=
X-Google-Smtp-Source: ABdhPJwwnoRLnvUg/qcBV69px02pdkGq9lZIfhnSCOJd5DYa4kt7j+iMQx09/c6YNhRYxNf7+GrBSA==
X-Received: by 2002:a17:90a:d201:: with SMTP id o1mr631123pju.230.1618859558651;
        Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id q18sm13752588pfj.131.2021.04.19.12.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
From: Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date: Tue, 20 Apr 2021 00:42:33 +0530
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: mh12gx2825@gmail.com
Subject: [PATCH 1/6] staging: media: atomisp: improve function argument
 alignment
Message-ID: <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>

Improve multi-line function argument alignment according to the code style
guidelines. Resolves checkpatch feedback: "Alignment should match
open parenthesis".

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 2b71de722ec3..6be3ee1d93a5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc0310_write_ctrl *ctrl,
-	const struct gc0310_reg *next)
+					     struct gc0310_write_ctrl *ctrl,
+					     const struct gc0310_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 78147ffb6099..6ba4a8adff7c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc2235_write_ctrl *ctrl,
-	const struct gc2235_reg *next)
+					     struct gc2235_write_ctrl *ctrl,
+					     const struct gc2235_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index eecefcd734d0..aec7392fd1de 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
 }
 
 static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
-	struct ov2722_write_ctrl *ctrl,
-	const struct ov2722_reg *next)
+					     struct ov2722_write_ctrl *ctrl,
+					     const struct ov2722_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
-- 
2.25.1

