Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A91218858
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694287; cv=none; b=BfxQfdC8o6hD9v22aJxB6I0rJM6o5e26oiLw73i0FhqmqPQm1UXf406+QkO8wmwtH+acrY02VvCYRRs7FkLGBG3ZwKjthX1D9Qj4tJTP/ZZF7R5Y7zOZYT/X6s3cZjYDTr44YeUKeobMaMyilA/WdNiPCWNB2wk0yOhzYQsL97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694287; c=relaxed/simple;
	bh=GD/LZsxNHLFcQHHnyEVtdV+W9ayAHFLj58BoFvS4TbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5kR3OgR/vcb72YzaO+SKMS06oWprm4z0h9nIRsUu7swJngIOmEug9FOzRoFwZIc7asIL3zYf6fpWpSkrdJGcPR4lx+6wUtaEVWysDb3t0E+VF6rBQten1UAMEcNNr7BezeS1mgp2V3nuTpDoFFaTK+4UnK+4Dl7K5KY+7oSY1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTeyEarM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTeyEarM"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so291307a12.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694284; x=1753299084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=OTeyEarMwTNGY7sVjJtF7mKje2FdvGi8mr5OiqEUXD6VJ5647AWHPpwNweoPyuVq/u
         CC6SPLltcsJKkSD2mmcCmOHc8JepaHCApcjYoWvwqynMPTPReyJsAxIR/Wr01N688xOe
         Ib+cGlKQl4ifll3OMLon8yBfBjPmsc+q5wcOXOac5F76vQ6kth/+bRuPNUuvLEAcUs/N
         FrAuFxpsZ7ZdauxaroikX8IwcMEMO/Akv2fiknOULqU93vlHSnYar/t0PSnBTgvka5Vr
         0bPm569NPV/lKo6JrjqwOBw8Kyjt2tk1l1Ls3VP5wZ21HjSbnAt7eos3wSKiuFZRy2aa
         VJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694284; x=1753299084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugGfw2VY9clI/uFiDBLfJMlcFJHXwCMAz/SON03qpmQ=;
        b=YMKI8ae/spvl2Y+iXCvF/84HW7Cn+MwNlWiAff4Ngy/+xODCdP1gLTHJSYfMwlcJl7
         znUxlXBZw+hrEhEkD6Ffbdmxo2X7Kc451DwbMxnfEYXRe7Yf9duKvkRQw63tulLg650P
         4VUgc8G8r/kyjb1d6P5qQ8OA5zsqCkcePWxYqy7qgY3XFiOuSFfMmuY8HLBjQbDB4c8E
         0dlV+Qk4J9dvopZbG3iNdI+pS4J1NvxZv4BeiQFiOQMzCGSPoplGkrXpDd4t2wP0wJxP
         WgQe16C5Vqa2UwtV/vfUgx/5/9DckeITBA+J6A2QJZ8hzcJgXCWk6ktkURV4CWhw0FZj
         jb8A==
X-Forwarded-Encrypted: i=1; AJvYcCWU0nt5EHLjEAUVrLg6WG0J8sFxEfI0k+e/TZ8oa1D2jqAX8GTcDmrgayPaw/R0FlhFw85OsQ8eG7JPPFTw@lists.linux.dev
X-Gm-Message-State: AOJu0YxinyRTQ9pdoliBI1+Y02fFL/WorNSFgeA6Js+DmkFjM+hmpQyR
	lq3vL4+Zx26sPGvvmOB6BjRE+M4tkTf9gCozLFGHI0mbOLvS+zZYQ8xl
X-Gm-Gg: ASbGncs1+VxzW0zMei3MI6aUAB/15oxqjzN4dnGHd6DLKZI4ingsCja7MY3tMxdVMdD
	1Gjt16oJ38xoarhwtZn2k60iFnE4ptljCsNa8fyYix8JrTth8MRmFulfBGGeoEEU0DCxRXRXaMW
	utXcj7jrF3o/zdkv/4BpWeGhzj/DUbQCsMwmF4rVFdEOjmmfdUgxdFsXtCGz9+CoOMdVsZbPR2E
	2EUetZby3GogqE61yz9+ggSM2i5HYD3xStXg7aRtRTxFI8mOCf60h+qBO6rPJwNjM6nJnIkJgid
	wl2is//7dq15jHYnr4xi2VHdyxUiBrcS9TiNgp7rZVQczjkLr0LCQFUg37sLr9CIgSd3OGFUR3s
	0KheJnw3vDCEHUAgKTtxBxYeTjsIBJm2PNgA=
X-Google-Smtp-Source: AGHT+IF1oWUA1OVfQOx4un1l96swc4j/iudsLCvxwM4vbZlbA9kI9dWlcOanNjxGseag2MN8Zx+TEw==
X-Received: by 2002:a17:907:983:b0:ae0:cde3:4bbd with SMTP id a640c23a62f3a-ae9ce14a5edmr399552966b.44.1752694283416;
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:23 -0700 (PDT)
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
Subject: [PATCH v6 01/24] media: mc: Add INTERNAL pad flag
Date: Wed, 16 Jul 2025 22:30:46 +0300
Message-ID: <20250716193111.942217-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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

