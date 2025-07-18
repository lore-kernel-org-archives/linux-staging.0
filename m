Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B82DCF73
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852318; cv=none; b=lUxe6qeHbX6DHUNKkXxUhVum+Eiwvkmn+kG1JuiXvrj5sKW3qcQv3Yh54oVWNfZvEpaG2Y0bt2HOdB+hOCbsIs7PkkdYfg4qWS/c7PE88nQdBm8DDN8ctmevga6grLxIIQURZs9zG3SINRjE8pJTlTc5UP3phXsrg2XPhahoDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852318; c=relaxed/simple;
	bh=GD/LZsxNHLFcQHHnyEVtdV+W9ayAHFLj58BoFvS4TbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSCClU2jbn+Md8qZu/rKPI/WOpxEI3bLM8AnY/w3OvzeDso1XeMLJNEAQptF87nTx+Q70fkiyXHPWbbjD18yv2y+JFKu4KajCihLj3f1ugKMV9WPH7PNqygnoT2HY1RnG0sLGBDieOgwGQBON3gPq797LzEuqv3JhP5FzRC9kag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SW92qaDr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SW92qaDr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45622a1829eso7544595e9.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852314; x=1753457114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=SW92qaDrEIEC5Vg+ytymnQx2ZH8deBwBXERF7xq1j+y9FQHog9ZngXAL3l8KgX015n
         MHtARgkJxp8yCHaVWf0E3bxGMbsu2/nYQw3N/VKwyWn84bntsf189LHo3pt6C21KERzV
         BGZnqXNz0fVecQG8m1EVgPgaGV/KFlBS8FT9NCLegasIkR7ShX5JTN0ezQRR//q4bVIa
         BHmOi8nWpb7CIyjRJagSW7dSrCIRX8D7UTHoIJy+tX4CrnSoD3xqMvm33FMqCYzIGSWM
         +BxFYWInhrQ3qzpvEivNd1kC3rq0noFW8MuTLLvbnWtb+U2QPhQMK+HRASdm0AOzivyI
         VQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852314; x=1753457114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=UMUTObx4fNZop0CFAM5nSKJoix+7W6f8LDK+hxen2tWAQWvsP+hz8Iexdi7ofMS8A8
         CFFX2LG6ijr4vCXyIRpJkyirdHgJrNwt9aNZusN9k3oECuRHpnrxjziDBqENoBR+4RJp
         WR5az0juSzM1JbK0IupYA/n4Cd9zki5RVBwuSwUsYhZNg4lxA0W6gAfdcME2LyDptCo/
         Nig0Pie0CenToe6jhUF1BEdY0vqVEP6Gurron9qmc/V7xn4UgJctij4Dq3TTe7fYHijI
         SB9k1QGRgNpQa3Wxk9F1io3CLQBXdgZCJTvajP6WNhUSd2Q8XmEYlyDgQMKVlm0ijWEI
         YSuw==
X-Forwarded-Encrypted: i=1; AJvYcCXAPr+LqVG/h4fpMkFzkHWo6oLegq2hpKIwBIq0fiKsg13QaSpDJtrZA6GjcGBRfoAViSYBeE5NYLKHl0cz@lists.linux.dev
X-Gm-Message-State: AOJu0YxSzxvQDwJIGMU7MmCvYUV7GHInHEmYYsiA7FGTcBZ1u6DooOhp
	3Kmq2Op8vfjvbP3ZDZUe/uQqCeuA/mpD3gT0XsCOh1dewhHBdSGle85c
X-Gm-Gg: ASbGnct13KtwcJ9iA2MFS0onOZnky7dSKM1SI3eYDnP0hNrUb7OCBa48WP8VeGJH7cd
	x6jB9r5iAzKKEhqnk0UjMLhIgEIPbJUyU6lIIUJW/9Xc6bjozjvqgBxtbNG4zLgq9LdyTo5SpxW
	dx6axYZ0gj2xWHvwRC4EnJ5zW6Pav3dUGp8KjcaHmZ1CKYEz3c5PXdctFENzV5C5OtsG7LAs6pi
	oTmkLIuJRJXTaZXFnNPDaQvROJxfM6x7M3laOpcUp0opwC7YMZGlNPxJRfedBMBGmhG5TzJ4Q4P
	Bd16CY/uzY4jEoJ1wF+Rr23vRqWB1ZUj2eKJHHQ5CkbAdnwQU3CWJVWNHj7MAOcIFrlgI1+TXsb
	7umInS0dhCkEHy85pH9OZjbevJYVDlnRanBMPFw4CBrGv3w==
X-Google-Smtp-Source: AGHT+IEsvECTV9vCQ7lE8o+YTff30hJOsIR9MuRvOH5+iAHoGOCA7S1w2KqX/lPKISemuJT6ZPDrTQ==
X-Received: by 2002:a05:600c:8205:b0:456:2020:165d with SMTP id 5b1f17b1804b1-4563b8fcc48mr35428645e9.31.1752852314107;
        Fri, 18 Jul 2025 08:25:14 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:13 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 01/24] media: mc: Add INTERNAL pad flag
Date: Fri, 18 Jul 2025 18:24:37 +0300
Message-ID: <20250718152500.2656391-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
Internal source pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
 drivers/media/mc/mc-entity.c                           | 10 ++++++++--
 include/uapi/linux/media.h                             |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263b..f55ef055bcf85 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link.
+
+	  The internal flag may currently be present only in a source pad where
+	  it indicates that the :ref:``stream <media-glossary-stream>``
+	  originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 0455909055820..d1feacc608072 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1120,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1151,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf3..80cfd12a43fc1 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.50.1

