Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A82367D5
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692070; cv=none; b=cg5PHnCcm6haAUBVC1NQYbKqJlsSvzeZiBT4eQmvMebUUCZE9CIi+TdjwDIF5YxNm/zGpaZzTFtDj5kDfZoqnZENbnsdCh4QZ4Q0B6nVhNW9UUZGd2ptv/cF59/yJYiZ3XzveApKaIHzugOGc0Kz0KnymF9/kX8HaoJz6X7vGO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692070; c=relaxed/simple;
	bh=Q93r5XsVAYH01/IaXbrD/ulOS3CSAoNRbx5rmSy1IKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNCtIpTeJod0mYbHNP2V79ci49d6JYEMpN8M/+UhMy9t3UA+nY3yOQ7yfuM6JZsP+ijft84oxvD0Y6KHMdw+3ZF6pG7jjXGLwXDmkJgfx7PZGURIOmo6vlEpWMpcD8xe3hoOBidErEpYNIsRy1KQrIeErWh0LvFpiHd0H1AJ3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLgYgf7G; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLgYgf7G"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-298145fe27eso88842175ad.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 08:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692068; x=1765296868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=jLgYgf7GnZr++sLr6VNA4pPB4CCSULpXEkjhFS2pwEvMkiy4uJvBlcd5cEjdpLU8jL
         MJs9OjF7Y+hPR4lpSlxzC/JXq4sF+W1NoByrJMyyXA1LxbtpYTFNrGKoz+Z4Iovis43o
         dMeCHjb2OJbXzE4OferI10TpkJNNZi5xDcqd1gky1EwP3BXOBGl0GzP80paMDOgIZUpK
         iPHTu498KIaV5AY8ZW4cOveB2JjTUjexr6Td3nWdA5NyDIufeGz4cp+Ovonf7Kvs13WS
         fiXRMiYCbQGDZSSp6TJFwvCPlJkSZYfUvo4bn+6qITfcMhdCKF83JTSsTPQwtsnIiHCW
         cwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692068; x=1765296868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujAnw4eyXMXxdoX4FR6nN3wY45XQHoiz/qHdt7YVd04=;
        b=LgqC3GvFQ4Yq2ho0NELJv9Tz5cWQAcRQLwTPQjXC1WcLGic8fsNd5uJQ380VGTdAPV
         L2OZtrEccMZRBCSjfUT+WoqtYwFgn5vyKnAwxTCbcpywKKEhsNfwS/FyNorxF+WKxFiD
         xdaZdDyziGKEO9qrOc7j8jljk6sBS+VSCHMhiv+fkTiADm/iZBAD9/1+mvxqcYEVzaEn
         W4qCRSLBo+HQRxYOA5fvEfVK89z/saBZlhGHmOI2saL+UIX1baq4DYXIS+GzBWvdq44Z
         g9ICHfl+j/Z3CmmsufbsSUvnHyOIv52nP3yFudDRU7TNPRIgiQpE0u26hHP2pZj2Y/hz
         25lw==
X-Forwarded-Encrypted: i=1; AJvYcCW4PhXQrRrLhFgU4mYFkq68pIyHO0uxTsvVqoZQZE+Hj1ZfOrVouSB9a1mrGGAItBHUYHCYeZDXQedsV0/s@lists.linux.dev
X-Gm-Message-State: AOJu0Ywge9Hd8X0Sq8s3BFQYkY4/u2a7zltljDiQ0pGDumh0iRmmQAW2
	zP5Csb4DfQ5jNAspk0czFm6IkvMufrvXdfk0/mehQtWONfYyAM8VNO/4
X-Gm-Gg: ASbGncuvzKcjqxV1on2U/I9nLg6GgVWvIasls1t67631Jo7xaeKb+58LEKyN7w/JEqy
	E2ntllFnU5nCNm3VEx9oeLUSznkI+GYb+36pfF7TBHFIKWOzX9hrcIWPvlZ/Ddwtlii1m4ZnCsw
	QUEWGQg3K3GWp4Gt4rcajrRWEmdjXnLkf0aUA6yIKmH06XmfI2Uhi/e2dXkEEfs+MrEtIuzk9j+
	IVRHFLqFDRA/8VhmyJs2DgDjCjyAQTB/lACZEumTDwTdWJvf9f/HiqeEujO5LLWrpTwr8H71oeh
	bzOBOR+rSV5NtQjANCOQu1kZy0e1/bI+2T+EqwXy9VYoH3A9XpixyKFoxc79FGOdekNo6hz2heB
	ryYayn+xXL9Se4GXqGiLkJg6v5ZjOO1jFri3RJFvyuwS3RLmiziNGJ26MxeniUxdaDP1uxxryDo
	67W2bGXwueO3gUUuIqCiXEkYp8+eAX37QfGvk=
X-Google-Smtp-Source: AGHT+IHKFWblm5LnaQm2d8+shTmkcU+FDf+0H06eH8nxVUhcOjJfWxAnQTwqjA0T3qIJaqWoH98RSQ==
X-Received: by 2002:a17:903:244a:b0:294:d953:6ff9 with SMTP id d9443c01a7336-29bab1ae07fmr312387985ad.47.1764692068151;
        Tue, 02 Dec 2025 08:14:28 -0800 (PST)
Received: from vivek-IdeaPad-Slim-5-16IAH8.. ([2405:201:c020:c865:ca9f:dff7:8120:8577])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44389bsm160814385ad.32.2025.12.02.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:14:27 -0800 (PST)
From: vivek yadav <y9.vivek@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: vivek yadav <y9.vivek@gmail.com>
Subject: [PATCH] staging: media: imx: fix style issues
Date: Tue,  2 Dec 2025 21:44:13 +0530
Message-ID: <20251202161413.92230-1-y9.vivek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Applied checkpatch.pl recommendations:
- corrected whitespace
- fixed line length
- adjusted indentation

Signed-off-by: vivek yadav <y9.vivek@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 2 +-
 drivers/staging/media/imx/imx-media-vdic.c | 2 +-
 drivers/staging/media/imx/imx-media.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index fd7e37d803e7..725478bc2026 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1509,7 +1509,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 	}
 
 	imx_media_try_colorimetry(&sdformat->format,
-			priv->active_output_pad == CSI_SRC_PAD_DIRECT);
+				  priv->active_output_pad == CSI_SRC_PAD_DIRECT);
 }
 
 static int csi_set_fmt(struct v4l2_subdev *sd,
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 86f2b30cb06c..58f1112e28e5 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -616,7 +616,7 @@ static int vdic_set_fmt(struct v4l2_subdev *sd,
 }
 
 static int vdic_link_setup(struct media_entity *entity,
-			    const struct media_pad *local,
+			   const struct media_pad *local,
 			    const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f095d9134fee..135daca7d55b 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -231,7 +231,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier);
 struct imx_media_dev *imx_media_dev_init(struct device *dev,
 					 const struct media_device_ops *ops);
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops);
+				    const struct v4l2_async_notifier_operations *ops);
 
 /* imx-media-fim.c */
 struct imx_media_fim;
-- 
2.43.0

