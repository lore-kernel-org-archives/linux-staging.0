Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97970
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:07:44 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v4so2141371wrp.13
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MbKLAGz4OO4bkaK2mn5gJbhDW+pmNyk19HFcUZTJdJg=;
        b=GRr7eS+aFYlubvf1mPOYcVQQgMHnfQ0NegZX00k4kHoMYsIKZ4BVrmlZlAzofy5DWv
         R95KUIOcwiQhJZXStFdhS6EGKVRwm0AYzLWs8C89sMpKtNfHNgts2zl68Mq3jekWTY21
         3eORmfMoCBoLlha/R4Hcec0dxt6jUWvkHMFiKgMM5i/TJcGZP73R1SrM6m9Cu9Ahfgj4
         J/qgd94AonllohzFWegDtH3E4+6geuEY7eZgVNSwvUsvdrwXTMUB9ZqcMMAbLYxGinnG
         tVof+nifxAlS28roJ6tKUY1BQi+5nhjDaLWeqtpmo6oNgYTsV6WsRsRibSXCxOINXm6Y
         Jl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbKLAGz4OO4bkaK2mn5gJbhDW+pmNyk19HFcUZTJdJg=;
        b=IZsZysCzHM5CVH979fCrGoMNKjmuzx1JwkNnjb6TqtrPL6eJXfpzajLlu/h/XEKZqP
         9HDvg0DsLcsz/yvK2azLzkLzSgDniJHOsxKFE9l7zQJ6ywZGwHr2gzfZZ5uGtjLou4mM
         smz45vq1zRfkMAdHSVk/7J6BcqGzTey3YgTrOJJx266tbTc4ynzurpPMVzC7YV2TwDAf
         SI/CIM3i4ubqfLsqbeVbrFGaZojUGD59bfSlguhNysaHgOpdQIuLhMR5J36uYwNtWo1k
         n2pc/dhFisG7AYD9QkLCP3h6R8mr0x3985o0+0zYI8B32iLvjkaNSKqs4d62fxtlJQjm
         b0uw==
X-Gm-Message-State: AOAM5321d1CBYHKeX5l9EZcV6tv4RWLxGxugtcSNIIhWOgdWypomh0Js
	cZvghXkNt+ZS9xtWTxJBMJ8=
X-Google-Smtp-Source: ABdhPJxQciKxKjLxekC/0FTunb06t06BDPKTfdhNYB9ydwv7ENmiHDDN+Ryg92CSwjPJcqAh3IswWg==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr10435295wrv.340.1617289663089;
        Thu, 01 Apr 2021 08:07:43 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a182:b5f0:9f7c:c891])
        by smtp.gmail.com with ESMTPSA id n8sm9710108wrm.70.2021.04.01.08.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:07:42 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] staging: media: omap4iss: align arguments with open parenthesis
Date: Thu,  1 Apr 2021 16:07:39 +0100
Message-Id: <475dbbe5774cbfed2d924807d8a3cfeb84b3d845.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleans up checks of "Alignment should match open parenthesis"
in iss.c:96.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/media/omap4iss/iss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index e8f724dbf810..472f1837632e 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -963,7 +963,7 @@ iss_register_subdev_group(struct iss_device *iss,
 		}
 
 		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
-				board_info->board_info, NULL);
+						   board_info->board_info, NULL);
 		if (!subdev) {
 			dev_err(iss->dev, "Unable to register subdev %s\n",
 				board_info->board_info->type);
-- 
2.25.1

