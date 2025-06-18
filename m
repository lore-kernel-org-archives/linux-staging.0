Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFBA280334
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240774; cv=none; b=EGAr664Uq3023H+hRIib8a677umlOgYCOoQx1XlUgZdMQ7SKRcPPrYjgAqbCNZukZD5J+zlS7f+vaxDGURMUgrK2TFJHd2t0r09XIQS8Uu8BINMHsSAfX5m2w2h5zPRxGMtT5Ro3kYTmm1uie2nN8NZKMgDgxxjQpWXCzSF1NT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240774; c=relaxed/simple;
	bh=467CR6klSO/rABH5qwhEowl4H/h3tmem9X+4qwHlQvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpUNKXd7lIKmJ8PumO7w4nQNOxJOeK5+OkA2zJeMYcCSVvIyyneOtYUWgXpPdthS9IqMa4O7v7MfL3pjrC/89gj7A6j0coz4FKPeGeyyXVulx5yLgGAUOqpBRYGI7SvpB+TngIJu8Z522gACsJ/bcw0Nk7fI0EErMCF16kGxs+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWbyU9v9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWbyU9v9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so10240050a12.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240771; x=1750845571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=;
        b=WWbyU9v9YNk3liWiFvSbV5q/v4C5BOVgDzigeIOnjqYQn75AS2QVzM1C81sMyDt/0K
         au/Ut90CmXrxHMbxx+u9saATeyNGuPnVaMR5TW8dWNnG/eRkmYXqgluePqxr9YZLbzl/
         c2CccXWtPrpwlkqgkTuw6TAaxli3E7d7lds0VHXG4XHybEQS83eCWW51Orq9ZBm/Mx7q
         5favS4r/K6L9J2NFiEPNVeNqIoJXzA/43SlTLVtg/ZNUADKio+FXYzulcru5wYhgrqq0
         Q+WeqVCvHqZpbEhCFNLN/NT4Uaf8dxwm0Wx8PM7hvMMBUWM4TLa5xOvRhb0Zr7XeM/2b
         LjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240771; x=1750845571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaZUxZfR4LVFlXZ9G/sKKJWMQAC209gl7LEnCa9qfYw=;
        b=ogeU0Z1i6XL76EoLkw5FgAnIJ4Lb+ph2yDbBonQrvrsrO4ZzGXSSNDPZV3xxP7jYZV
         p0uL7hJMYxsOmQHChpqkZPvb0OwgGGYaNseqc8d1LkqEbczKBSnsC4MYlBvfyCZWs94k
         qd0kpppJ+lSLOqCHZ/bQv1p4qrGBdNQQGM8LuYPlikGo4qqTEJNOgB4+AejnOfYkj0SY
         rOqdVp3tJsWM6TINyjofIdmzTpBgEhQiJ5RIWcBWiczQTmCU+5V8g9HW8ABqr/U0fNXN
         pdLHgsRL6Hl4FTQcWUTwK8rLLhYewggfwvUFUd/4eN6Yr+CeTEQv81Dzo3AYvGdufHfx
         qZHA==
X-Forwarded-Encrypted: i=1; AJvYcCX7LmQBU4eNvTUpeXrlI6UROvsmeDybTm++1Knjww9LX1rJAvoFYcV6lmhwcy3AYQKq6bHdZb4Qs6io8rnp@lists.linux.dev
X-Gm-Message-State: AOJu0YyZQL59NZTrA8fcketzAehMvoPE46wLQDmqlmyWtGPV/J3r7fTK
	WUAftk9kKQF3SvLuhpaj3gi0UdFD/B1VOQFcPNFBxyM0PMwipz3ut8A9
X-Gm-Gg: ASbGncuoDfTWA4/rnqu7pjc6v/Nn1ZMHZ36EIoXknZC45k107UzZFSNhnJLw0/ncpU9
	fWg7xkm1JXnF8BHjuohl5UirUNeTtyH0A7bigYzDgSbuWvWVtm/18fDNTUpR3wU/GbN4HWb/TA1
	t8J0aHrx2hIk7aRyNROab4oFTV0kAklKWQTye7DUnVG4eHBP3PMm4z/y7mJj7KzUSgAbBodqu4l
	Dq3zetapOu+Z8UhKrAT4ZI2Ssu8jRHpe5FnFyPbeNWwo8BXjDdzuDdtv39LCj0ntlXK74sB37GV
	NVtvI6WkUP9hOAdUTCq2zh/QMTtnSj7QdGhW+wXTE5cLkTsNTpxsw8dTwLmFqZvjrv6HERmmdNc
	=
X-Google-Smtp-Source: AGHT+IHfnf3VtoJ26EFASDqtQTxgpRHeuZi+Y25r3DCIec5bB40siKeSLecbTcKf5YnOXIgJqGFk+w==
X-Received: by 2002:a05:6402:350e:b0:607:1c07:727d with SMTP id 4fb4d7f45d1cf-608d09b8ec8mr13802281a12.23.1750240770954;
        Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:30 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: [PATCH v4 01/19] media: mc: Add INTERNAL pad flag
Date: Wed, 18 Jun 2025 12:58:37 +0300
Message-ID: <20250618095858.2145209-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
index 6332e8395263..f55ef055bcf8 100644
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
index 045590905582..d1feacc60807 100644
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
index 1c80b1d6bbaf..80cfd12a43fc 100644
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
2.49.0

