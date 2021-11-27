Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7D2C81
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 09:49:51 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id r26so30238317lfn.8
        for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 01:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4dvE+ch/nK/kBBnPMxA7WcMHh6CQ4+F3d1jcet3ts9E=;
        b=ZXuIR2mSzWESYoGxApxyDpzUZ7G9DWJus7hcVkGx5nQJ4UeELMyJ/lQiabT9sZ5Wck
         jRFwzfU41LyA7/qTY2jI+WV3tk5iYy1GSsawVGH7YUX5a+YNppPuQobRMKvbyroBDy3n
         n8Z3PyyR7vm2NPYGJFkMC4yWu3xlkZBlrCZ+WM+vzokTmvNwzYWeu3XdwqCDLNMXjH7B
         OpsS8el+slyxIa0w8Mt1Yv43KZvD3bnyEjc8OEHbOcH0LOTRGJwh45Kx0GOta+X8vFqb
         85DUALpHlFBzem+7+TinTX/0+mw8ICYTBZTsCnqVjFoSuac4jxzimeIpmFFqS8RpjbL2
         mrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4dvE+ch/nK/kBBnPMxA7WcMHh6CQ4+F3d1jcet3ts9E=;
        b=yV2Yv1zlm3+6AgE40tSrJC728437pimkLP3bzQ5QeOEZ0KFdO3OOshVf6gfgvJ81Qx
         kZgZeIbYKTYJfXFAh0Ubuyu1+4sGEtUNROVmx4uIInKuT3yq8WbGtVEiWJh72SNmdLso
         c8O5OTJ9XFwlw/uiTFg/jHnWlHAhd8PpR0cTZkJBlqB2pB+8nCGIeyACMBHHgO7H7kPk
         c3wjTKb1OVmuYsBF6RLpobzvlkNg75Muvgxm2/zSxXrB2KnWVgpAC5wYWSHF98fquLk1
         wgIBmtZ7jzJyDGSbkxBhnCO4/tFyJC78hziKRWrXLXYultG5qYC8NVfPRKjA/Esiz8Wr
         XMPQ==
X-Gm-Message-State: AOAM531POyqTOmnePpRhRJB6Dk1BcWYI3L8hZYfHpHSH1xvJ2RlSTzcG
	ST20o2UMahF8EHGKvgaWkUc=
X-Google-Smtp-Source: ABdhPJwfnbwzqV+ykIQ/LK2UA5l0Ll8vWjs+AQqxLyu+TGPMiTQkbN3nRbqiaeJnvRMk82/2oUYU3g==
X-Received: by 2002:ac2:5499:: with SMTP id t25mr35000401lfk.674.1638006589932;
        Sat, 27 Nov 2021 01:49:49 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se. [155.4.221.129])
        by smtp.gmail.com with ESMTPSA id g10sm704582lfv.113.2021.11.27.01.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:49:49 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: staging: max96712: Constify static v4l2_subdev_ops
Date: Sat, 27 Nov 2021 10:49:44 +0100
Message-Id: <20211127094945.27985-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only usage of max96712_subdev_ops is to pass its address to
v4l2_i2c_subdev_init() which takes a pointer to const struct
v4l2_subdev_ops as argument. Make it const to allow the compiler to put
it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 847e2ffd4f53..9bc72d9a858b 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -250,7 +250,7 @@ static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.set_fmt = max96712_get_pad_format,
 };
 
-static struct v4l2_subdev_ops max96712_subdev_ops = {
+static const struct v4l2_subdev_ops max96712_subdev_ops = {
 	.video = &max96712_video_ops,
 	.pad = &max96712_pad_ops,
 };
-- 
2.34.1

