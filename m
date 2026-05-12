Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395AE4BCAD6
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580245; cv=none; b=nHmZP17ZxuviTQ//1VAvW/cGPD+VahCYN33iFqtsq391IqMgqWP6AF8RsQy1pC6p7m5F/Y6aKgp+hws/aTE38Us8D6op3npkwkIzYOeJQdZCrOA+Co9rF7Mk6FFD1G0T8ppIxfImWAYG+sz18bmkbv5B57zOicG706mNGlamkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580245; c=relaxed/simple;
	bh=WKrmxABRMAE4DhbaXi8a+LUQv14nHWHSekbhApTXvmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gs/1Q9mNxTXdPERnsC3J8zm1meVXau2pfom9TT2p5oOsjrKS88BQkcXnCY0VB7FNbFhuuhrAYiZniAx4E2llVSML9ofsB6BuZKzhHBaapP4B0RllaaE2GuEu0HKCzyhy5q61qKYCzUkoaBwkBZXzsB3p6BaH3pAeHj2DRe00P9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB0c4/19; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB0c4/19"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcff2d08ca8so287474866b.3
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580240; x=1779185040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHje3x59v0HJxAwBRIB3HpZNZGjAYVtaQrA4sS+BMTc=;
        b=SB0c4/197hcE/XLdA+rxj5eo8me/S8U+KOiXHmuQlL2egeAO+asdnitodC/y+uVdq2
         n1jlNjOnM9Mgjng7ZqbbMlOQOi/uvof7EuBYwTGwUpH5ibJW0gyPQ3xjx9nmz5fZwhVc
         SKSMNwUdKjPKKDDTJkAmcwhgWSxjzCBnyDx7IS0slkEWGKSkmFdJhceyjlAGPHridn2z
         mJoNHlFhGz8zksaE8XujgwaeeLoUqmElZJZy3SvydrJnOL/+xRM6o9ygtPaEK5OuSaaF
         o416GmOiluTtVkxatCYsQlN6mpP01oqHKU78kivmr2FPbaf3kH05LeXMsOcFI3XeLDQD
         6wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580240; x=1779185040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHje3x59v0HJxAwBRIB3HpZNZGjAYVtaQrA4sS+BMTc=;
        b=hJSrj6nuWWfIZg/lpwMiw/M6dUFeRBuUAip6Yo3JAeEFJTUJ9puoIbk9keAOFPNwTQ
         kAGd8phau+hQwsTSPMTBaUV7WuONPm+P4UFu//k0acf7P+swXZSgQjj1sT7UDeHmigi9
         y75PJZIXHekMkN3qD1XeUqE+bLsZpvAOQtE2zNcLxzeNve1t/uUSWS/p1bAK/fO7/SXb
         HNpOob9pm+kzI9VUIZkC2+T3v5xAMT06G5HTSUUjulKha47jLYm2hync2EjORBrMrZBS
         YM1G5qkQP8tiG+T09uj6BNrtmy7IqiNWVIdaz9l41bK1DRPQ+9Rw2wo4qUx+EB+LmkYu
         ur8A==
X-Forwarded-Encrypted: i=1; AFNElJ8mzlqftfnonlRIL4TOOxobwx1eywxK3nugTN/cDnLSzSNo99x+EGWmJjBAsi2l8Im9e/qJJSg7dg4vVVT0@lists.linux.dev
X-Gm-Message-State: AOJu0YwREv63RBI8HZIwPJJ14t1D3h82oYkqmd8+kvXBg691o/Ubeqyi
	tg6RFXZmPVoE7JKsRIsjmgr8IIJ7OEk9YNqOwFLiZC16i7qI4gTRLTTw
X-Gm-Gg: Acq92OHbHDtzmCxifMyLLNyYOZTM+WlRENayN67IH16+4Eawke9CLqwPIfkJqfnhKe2
	1mh2MKQLZ4v7b26hyaWkQnkE7lhjy1tjtbjYp9e2icbAplJNYbdmi0QJuGrzvSq6bFwvUf3i7Jc
	nHnfGh7G5K56RNe7C1luA/5Pq4Gu7DlWwXUGH1xyUSRkfR9C80+odltq6DM6IN0/kPUPpgAKZq4
	3nFmGlRaS8MRXFWphf1KyeA5SJN4hx+Ak4Lol6l/zXO8yW8ssIyYigw46ldIMTg2n2R3guLDnK5
	fAbhu+RNA5vAJ3uL8HBhm/csJNctGYAXkSKO9dCp/CcGTcJUzfAiUF7vBgeSaQMuXFKt3A2HBHy
	NYSnNA6nYxbA1ZWydZOSivgFADaj01va3l52cHoQPSrZqB05I9uqckbX4JVOineo3JYZrK7YnDP
	d3sNoUSdDFkn9D
X-Received: by 2002:a17:907:9611:b0:ba9:3122:49fd with SMTP id a640c23a62f3a-bc56ebf195dmr1769720766b.34.1778580240328;
        Tue, 12 May 2026 03:04:00 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm570531266b.53.2026.05.12.03.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:03:59 -0700 (PDT)
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
Subject: [PATCH v1 1/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Tue, 12 May 2026 13:03:41 +0300
Message-ID: <20260512100341.53769-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260512100341.53769-1-clamor95@gmail.com>
References: <20260512100341.53769-1-clamor95@gmail.com>
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
index f14cdc7b5211..d84be14bb80e 100644
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
+				remote_parent);
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
+				sink_ep);
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

