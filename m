Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B27266B5D
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322713; cv=none; b=W9LL3+/BfYREWMJ9iiFnVljCfV0BANzyq9xT3/+Ew+aPsTbHkqKDkm1YgcvfaycuavscrcFZqVMttOG0N5NDhgEdt6UCyw3k8qIDuNuuMo+WQMiwYp6oP+pQq5mrERaMU5Wux3FKpEYkSFLGRzXdNVUaMnzFAGpWwwOsaz6zt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322713; c=relaxed/simple;
	bh=8wRQGv3zkd7w5VQBvNieRLV0qggGrNgPo8gaoi8QA+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FmaXcMSKTRtWXfTT+gR7HtRQZ8CrccllEf12HXF1Bq8PENSvenjWeK2XOJteWJZIbWsw4/LQUxnR2eOtiJz00RQdbELuRTz4RTnzsdHicL9Pxg8MPwuHeleDbGEerVsVFBCRMgKB8MJkrY77XnApXTKTPkOZCG3rD7cYfIWHiLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4WbaVIq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4WbaVIq"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so867405a12.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322710; x=1750927510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5X8gLMjNHyFOL2GGdyUmdBVB8Aoo+W1ibQ2rMarhgs=;
        b=e4WbaVIqdHo5jLLsMVmEF+XVacuzYa6QjrnTlDyzk3b0KWF5DDxG+TbBHpp/qfPfYW
         W2EYyWfrvyrGquDeZcpai2UuSbnqa2kyS7oEK3vcN+tzGuQ9bC9L1y0xPyC2wD6y9ixS
         7YFSG6onLwpirgwXi0q3CuofIKLtEGPWZpUJckuwIuUjiDqofegtFvIHLdCs//Gw95od
         dXf43TIX7ENMGAeD7I3m1IqYr6WBq7YVaxImuxTwXetrM9P9vNmCqDcFr6Jld+hVObNc
         xRA/VIqj9al70Qgcfg8sb/zKWEKWnpADzS6guWagVQFpFiDAEHETMaxWo9o0H/6Hg76t
         6EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322710; x=1750927510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5X8gLMjNHyFOL2GGdyUmdBVB8Aoo+W1ibQ2rMarhgs=;
        b=E1jwLDsVIIrXJhFtZQyHzjzujwmI4M03aiJVXLOPnn4+1pvMrD75pt127d9X1fePiU
         IeblsPc/wJPgct70NqRonrJEx8OdQnMuUZBbR7g1KaxCTqvRXkT+EsTqSNRJZwBSe2vQ
         CpW8iDHlZpHHoBgPM1C9fc/FK//CXvGYA28VUHn2QtPn32sXffMxMxRQc34MKVfWD5zW
         GnILIQjmyDFZ93XXjx8kXC9vwfPwiS0SIz+sge9qwS/nNmwv5NsrA8OCDTBGWIfpoYgz
         V6M/4r92fA1yUy/FtDG5ROFzq7tUGRbp8jOyOHdmXN/4sIVVSHUhsYc2seURdW688N5V
         mpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0bZfLj2qV1xo5Gbqd6AcpBJrULXTQkKpjy8jq9w1BpSgs3/158pEzL66qChtHcWMzgOM20GMF9K7aYVXi@lists.linux.dev
X-Gm-Message-State: AOJu0YxeDrj7j9ukxgJ+cmDzqHQacdKDfVIDpPcQze+v/nKjPW5t37vj
	BNQlELwlQxZgZH3F/aZ8QKJWpFh6lPQmL3yAVqy/891RTxyOzMnhN/Mf
X-Gm-Gg: ASbGncuLb0VHynlhWyZpFEDJvfVoXckOfYBMbdTyZ22AFEOd+KSJ1DmYasz28yg8ko8
	gStSOw8oJl5id80bqAGiT5xk1shmZ3flKfOftcWLspO3knf+aqUL5xqtVK/vmQN5Tm1V9xmHHZn
	V+GFp8jdYixafJLntkrie4gR+8jioievcMSRWmAFpAud1jjKLTFsmkj844Eva1sJK3Xj7mlUZI+
	Kvy/cc/defHkwE3H2UBuGYwxEcWFa7JxO6d0dtinDQ2lQQExCTVGpva8mW6HTIwdb0bc+2PsPLs
	jAsY/iCproCAvTmbMVVz6nNH8IjYZ8B9LGeFw99LrXuPbg/ZsqTV6eG4VmVL6BJa0S8VieOpuNe
	hLitaIQ==
X-Google-Smtp-Source: AGHT+IGMjyetyOU7YuxTeXG4YgVrNbIrwYWbe4hNfU6dsQ/FW/NlzDErrsExPei/I+rW4MGBXCh/Ew==
X-Received: by 2002:a05:6402:34d3:b0:606:b778:78af with SMTP id 4fb4d7f45d1cf-608d09cf8a8mr19573568a12.27.1750322709940;
        Thu, 19 Jun 2025 01:45:09 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:09 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 1/4 V2] Staging: media: atomisp: i2c: removed redundand debug message
Date: Thu, 19 Jun 2025 10:44:18 +0200
Message-Id: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: deleted `dev_dbg()` printing the name of the function.
                ftrace can be used instead.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index d35394f1ddbb..830a38086cb8 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -584,8 +584,6 @@ static void gc0310_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	dev_dbg(&client->dev, "gc0310_remove...\n");
-
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
-- 
2.34.1

