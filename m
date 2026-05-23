Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F09335067
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779518906; cv=none; b=EIjW9hcvWsDnX4aeGC7RprtWzEEO/QmcTq83YNLNg6B/rV2XsCfkuic4J8hE+YX51J7LF++1BzwKeQ1PlKikxpy/UGO9FaB7/kd1+FUpCt8JKs1LydOrTFhOHpbyfPOYWhlc/9MkDqBh0UKkvJbIeX7gjI/Uh93KDDQrtLO+SSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779518906; c=relaxed/simple;
	bh=ruHWhs/NAmjUK/E6UKPL9THibS9Ul5SiTJSCwblcQ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1BCVsO7v4QyggOm3zpCAUe6KE4qHmLrpvNBHgael3LiQm8M1D+auH4tAxTThh+HGhtzwCdH3zHkrIw4J2pS8m+cZdfrKpJEIrVSBiIOi4ucWjZ/xZcqAUKHikKWk70WsTUpL2LTo82Cus9mZISR6D1GXF5QwDXIrdEipuwvL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4uQ3ER5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4uQ3ER5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso1578445a12.1
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 23:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779518902; x=1780123702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQNJLijS1LXC3DyCF2fRyHh6+k3ll0IPAv+Qb62GcJI=;
        b=c4uQ3ER5uF9l/niTmnmzLc19We8+dpFID00vlElJr0PXa+nhcNEU9Dozi9k/5a7H3s
         MT84prwgKPrFu8CLO1SJ6TTpS8BnNoq/iwh2Fpd1MlTMkem8++URch8uEtcGdg8+GqPu
         KCgOFS2PwW2Ta95K6IYHW/E5wgVTpvZk0wI0VHSO7kPHqvQcH3OYzneRGoROSNOVhlvc
         g4VgwwpUW7HrOsA8ciBCQqM8WA0JemMoVbtuhtBVDBZAq13rO5ajBXny6kL0r3NtKoTf
         RXo2Eq3LXzOaHu9GFcP2WnT5XVLZl58BmfO2ZpvYGdeqI8ky6OgdjV7yCR3fwR1gLxD9
         siIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779518902; x=1780123702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQNJLijS1LXC3DyCF2fRyHh6+k3ll0IPAv+Qb62GcJI=;
        b=dnlIJxeWngAFHA+2S4zS1BHgXb/CY4NCx39afymXby2N/OQy72cx8rRYjnZuSKncun
         0ND+RWRzTs6bvvhvtT/MoZrFRTkRzNTRAKeu+yt72gGmPLWq3eph/9B2Nz14Pxj47Udc
         MDxuFXnmODZUB2/GEA+76TnxyAFZGbMaG0EZ3Eu3Tqng6eRj836e++x1dqdKuMY6Tr57
         guV9hpMonN3el7ohcZ2vJgTDxW+v1i7DX1N1xbB+YuUAqF++pNoKA6rBu155aZnkcCCb
         hZIAE8Ya09FMOF9xsfjifNKrfWujWH/RVdN36B6zi97yiwOQ29cnYJT1dkxMXUV2Ncbc
         UwfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mlcd4wIul4kXNg12HKdkyDDONjuImaeHIKP0C3dQ2h9bBGpE1+jFb62DWWEkioJrq2QAsQ3Hsr2FjWrBz@lists.linux.dev
X-Gm-Message-State: AOJu0YycVYmb4GzrCUao7qkolZEvSAHynXH9uAJb1oCz8wyUUorQTdPK
	FiBs9RmC30YEA9XBFQfX/J5oxDeGMxffvTtSS+EpMrMSWmK7mj2ee5tn
X-Gm-Gg: Acq92OFG36uoKk6N5PMqqOPUP0f9725U1BlTnu0yWm3MNZehlQLsGdSGcAUlLGla313
	MfxEsZK0etha7wK2OXkfuoo2djaR7niQTTYyelEhYA7qo36WnJ4c+zvuYMqOw8c7x4tq55i5xoV
	n6iMPwEnjzeI4I7AkKLlIHiE+JUdWuLflWoDHGrHgRJJyAgigOogJE6EpNJCjilL4z4eYKggGin
	6M6xtt3uvZwnyvZ/OdQzkkV9NM36JsMp92dChAHL82R4HfZjsBV5JenFpO9KcnmEJ+kpLA3bae8
	Ap2Nhhd6bY5rtIUhL1qjQ3FVlzdVrZB/JAK2wB3YEnJOdfgYYbVkHpZ7pC92dEYggWXBiDasUNF
	VyO/WI1yAkaJeMM2edcDANY/kjiSyNNxFoVJtl6XyWOQbFm1HLDwrkrP20XEmIf8r+mWcCqJwFD
	OhUVDslWC3y6yN
X-Received: by 2002:a05:6402:3896:b0:680:1e7:cfa4 with SMTP id 4fb4d7f45d1cf-6889cc78d76mr3740625a12.24.1779518902334;
        Fri, 22 May 2026 23:48:22 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1532272a12.30.2026.05.22.23.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 23:48:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] staging: media: tegra-video: vi: Improve media graph building logic
Date: Sat, 23 May 2026 09:47:50 +0300
Message-ID: <20260523064750.35553-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523064750.35553-1-clamor95@gmail.com>
References: <20260523064750.35553-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..24e4bd438678 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1468,7 +1468,6 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 	struct tegra_vi *vi = chan->vi;
 	struct tegra_vi_graph_entity *ent;
 	struct fwnode_handle *ep = NULL;
-	struct v4l2_fwnode_link link;
 	struct media_entity *local = entity->entity;
 	struct media_entity *remote;
 	struct media_pad *local_pad;
@@ -1478,70 +1477,64 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 
 	dev_dbg(vi->dev, "creating links for entity %s\n", local->name);
 
-	while (1) {
-		ep = fwnode_graph_get_next_endpoint(entity->asd.match.fwnode,
-						    ep);
-		if (!ep)
-			break;
+	fwnode_graph_for_each_endpoint(entity->asd.match.fwnode, ep) {
+		struct fwnode_handle *remote_parent __free(fwnode_handle) = NULL;
+		struct fwnode_handle *sink_ep __free(fwnode_handle) = NULL;
+		int src_idx, sink_idx;
 
-		ret = v4l2_fwnode_parse_link(ep, &link);
-		if (ret < 0) {
-			dev_err(vi->dev, "failed to parse link for %pOF: %d\n",
-				to_of_node(ep), ret);
+		src_idx = media_entity_get_fwnode_pad(local, ep,
+						      MEDIA_PAD_FL_SOURCE);
+		if (src_idx < 0) {
+			dev_dbg(vi->dev, "no source pad found for %pfw\n", ep);
 			continue;
 		}
 
-		if (link.local_port >= local->num_pads) {
-			dev_err(vi->dev, "invalid port number %u on %pOF\n",
-				link.local_port, to_of_node(link.local_node));
-			v4l2_fwnode_put_link(&link);
-			ret = -EINVAL;
-			break;
+		remote_parent = fwnode_graph_get_remote_port_parent(ep);
+		if (!remote_parent) {
+			dev_dbg(vi->dev, "no remote parent found for %pfw\n",
+				ep);
+			continue;
 		}
 
-		local_pad = &local->pads[link.local_port];
+		local_pad = &local->pads[src_idx];
 		/* Remote node is vi node. So use channel video entity and pad
 		 * as remote/sink.
 		 */
-		if (link.remote_node == of_fwnode_handle(vi->dev->of_node)) {
+		if (remote_parent == of_fwnode_handle(vi->dev->of_node)) {
 			remote = &chan->video.entity;
 			remote_pad = &chan->pad;
 			goto create_link;
 		}
 
-		/*
-		 * Skip sink ports, they will be processed from the other end
-		 * of the link.
-		 */
-		if (local_pad->flags & MEDIA_PAD_FL_SINK) {
-			dev_dbg(vi->dev, "skipping sink port %pOF:%u\n",
-				to_of_node(link.local_node), link.local_port);
-			v4l2_fwnode_put_link(&link);
-			continue;
-		}
-
 		/* find the remote entity from notifier list */
 		ent = tegra_vi_graph_find_entity(&chan->notifier.done_list,
-						 link.remote_node);
+						 remote_parent);
 		if (!ent) {
-			dev_err(vi->dev, "no entity found for %pOF\n",
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
+			fwnode_handle_put(ep);
+			dev_err(vi->dev, "no entity found for %pfw\n",
+				remote_parent);
 			ret = -ENODEV;
 			break;
 		}
 
 		remote = ent->entity;
-		if (link.remote_port >= remote->num_pads) {
-			dev_err(vi->dev, "invalid port number %u on %pOF\n",
-				link.remote_port,
-				to_of_node(link.remote_node));
-			v4l2_fwnode_put_link(&link);
-			ret = -EINVAL;
-			break;
+
+		sink_ep = fwnode_graph_get_remote_endpoint(ep);
+		if (!sink_ep) {
+			dev_dbg(vi->dev, "no sink ep found for %pfw\n",
+				ep);
+			continue;
+		}
+
+		sink_idx = media_entity_get_fwnode_pad(remote, sink_ep,
+						       MEDIA_PAD_FL_SINK);
+		if (sink_idx < 0) {
+			dev_dbg(vi->dev, "no sink pad found for %pfw\n",
+				sink_ep);
+			continue;
 		}
 
-		remote_pad = &remote->pads[link.remote_port];
+		remote_pad = &remote->pads[sink_idx];
 
 create_link:
 		dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
@@ -1551,8 +1544,8 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 		ret = media_create_pad_link(local, local_pad->index,
 					    remote, remote_pad->index,
 					    link_flags);
-		v4l2_fwnode_put_link(&link);
 		if (ret < 0) {
+			fwnode_handle_put(ep);
 			dev_err(vi->dev,
 				"failed to create %s:%u -> %s:%u link: %d\n",
 				local->name, local_pad->index,
@@ -1561,7 +1554,6 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 		}
 	}
 
-	fwnode_handle_put(ep);
 	return ret;
 }
 
-- 
2.51.0

