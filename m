Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CB2375AC6
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162064; cv=none; b=JXA4okKR6boGeDszXhKBbMLd2o8EkJ8ORMOqp6pFnaf1dHAxZP0japFFMt/T0ivaM2QvCoSZ8BGi2DW8JlQi48nIubsyFjyyvDPKw1zgSFxAjKHF29Qhci8n6i1ZcprURCQUSGQRAmEjTRdC4AgfhZ2l542IJeS+fgvxt+ZQZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162064; c=relaxed/simple;
	bh=c9kamtxeZK7dkuST6nX73rNFYrjOycKlzsHqFyFlQxo=;
	h=Message-ID:Date:To:Cc:MIME-Version:Content-Type:From:Subject; b=up4byQJ0h62EX8OrCzOJl0sCY34vz6nv9zFOfF2naEg9AMAVCEzxibGoaIOpAiMuMVJxCODGe4GRaipxwWnpvhNW3OGCFXYGWPtp+ywhN3elXeOX357+XULxq/BrCkv6KrOh6r3BP+YrzZHRxerNIyXxNv8LZxuexWgL4RKGmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjvaAX6Q; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjvaAX6Q"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2664153a91.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162062; x=1785766862; darn=lists.linux.dev;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVpghhcuxKhGyEPXRijDOdAxQjgTj39oRcqWienm+DY=;
        b=sjvaAX6QfzKPzh6KYn2ZTyLx5wBYVWULWh8PpzGeSJFtFU02c2Q1CtvrFA4lvIhBrY
         iRFvOWpuYQ07AYY/OooPojNrkzuKKvZSdb4NSxEuIgtgwoIGuwB6GeKXJW9voklZM868
         RQv+fo4a5Z8Nt/C1A3A4NshT2lbp4wyCZcj8l6NEK43ZvTh7qnfX4mo/WiPu+Hz4Ode+
         TWAKNa/S5lgbDvqeQ6DzyLZW4WNnWmur/zgjBfc55t9juft/r6H/wpx55EIAoeGHTD5d
         M/D1fOEMW+JwvBw3mD0HUEgRhSYIV6SbuEYm0WCRJZglcZmTOX7VTYV+TBn3cWLe/h3T
         BRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162062; x=1785766862;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVpghhcuxKhGyEPXRijDOdAxQjgTj39oRcqWienm+DY=;
        b=Z05nnWANqqkZvtF0gnr4oRmhhPw2Cr/2BfngzY/gX3Sg8x/IBNAHDIRvRABQHE9sjg
         YH+FxEybiBbBsu/AOKHc26z8GitbTMlUi5yrsKzhsWdNnzfOSgXOb9e/jZsY+LDSLHEl
         daWhvbsGzbDRQiKwaFLGyzXLL5Vbsq945veDefL1/wxeMQ3q4SRpsnig7t9kAykxr8oE
         Rrarn0iO+JiBx7UB323FdgzCzyasb+0kpNqrCPvxi3Wg3sCqvstOm/yXA8DpnuN4JwHc
         fp5zUjHhsWYWcPw9VrrfGSlyzclDuN/Ncpf9t/EKCsIp2cq4ivR1lWh5PTUJJr7tq4Eo
         qSbg==
X-Forwarded-Encrypted: i=1; AHgh+RqhtG5t0TCf3tQOR3H3P7undYvSS4rOThH0dCqBoaOfNE4VU8P9YBsW7SeMyYolmNK+b30QzkXbtrowNblu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4z1gYcMvSVqXIh9Rl3VPtUeCyInVuOB33O1ok9ls8hUYBXlzY
	t3NuNO+Id7fmy2WHid3sWpK33Bju+7LWUj0XGGAVkvQbSqr7d7TKPT8n
X-Gm-Gg: AR+sD11Co14Yfg4UOUaVrjOt2POd/zfic9PUyJ1q7G+5MDgRMrNVyEhw/EQXnLpLxEt
	BJ/8LIouvgLiIA+S7uhdidGl/hWaqhhrKhbIU+ORH10TN7D0TQW9nK+gl75ExwXqpjAgmGKDv4N
	/ML2gk7bedNOvpcl6rLb7kAurOC/78ZhQkQK1kCZsiKtLdH+8gq8JS7hfQ6UD1sJtqohyHSQNKW
	RKYclKVoZpmzmKURSv/ct6IJUX90kwBQsnXy9jebNyeLtCcZSDjGQlzEcK5D9qreNh/3rXwnAUp
	Ky+U7OqhSX536Rc3b1RwqRoxEA0yXIGXopuT10BbBu6W2OO6H/6ynaoCJoR7AoWOg86iGVRri7W
	aVnR88NffWSPNPdQVAA6OUq5lZ+isOQ1rhCCS9L8aRquHxO/8SCpV8uCq0yrfP28etIcyw/hchC
	eo6Ae9YpGWOY1z2sPVHw==
X-Received: by 2002:a17:90b:37c6:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-38f293cd077mr7722235a91.1.1785162062437;
        Mon, 27 Jul 2026 07:21:02 -0700 (PDT)
Received: from tv2_send.eml ([101.9.192.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041d5f78sm5117163a91.17.2026.07.27.07.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:21:02 -0700 (PDT)
Message-ID: <20260727222056.26262.alvinhuang0603@gmail.com>
Date: Mon, 27 Jul 2026 22:20:56 +0800
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: vi: move port parsing into a
 subfunction

tegra_vi_channels_alloc() needs two error variables because its loop body
mixes two things: ports that are skipped because they cannot be used, and
errors that have to stop the whole allocation.

Move the loop body into tegra_vi_port_channel_alloc(), which returns 0
both when the port is skipped and when a channel was allocated, and a
negative error only when allocation must stop. The loop is then a call
and an error check, and the second error variable is no longer needed.

No functional change intended.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
This is the cleanup on top of "staging: media: tegra-video: vi: fix probe
failure on skipped last port", already in media.git/next, so it needs
that one applied first.
 drivers/staging/media/tegra-video/vi.c | 92 ++++++++++++++------------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f461e117305e..09eac34a7813 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1247,17 +1247,54 @@ static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
 	return 0;
 }
 
+static int tegra_vi_port_channel_alloc(struct tegra_vi *vi,
+				       struct device_node *port)
+{
+	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
+	struct device_node *parent;
+	struct device_node *ep;
+	unsigned int port_num;
+	unsigned int lanes;
+	int ret;
+
+	if (!of_node_name_eq(port, "port"))
+		return 0;
+
+	if (of_property_read_u32(port, "reg", &port_num) < 0)
+		return 0;
+
+	if (port_num > vi->soc->vi_max_channels) {
+		dev_err(vi->dev, "invalid port num %d for %pOF\n",
+			port_num, port);
+		return -EINVAL;
+	}
+
+	ep = of_get_child_by_name(port, "endpoint");
+	if (!ep)
+		return 0;
+
+	parent = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!parent)
+		return 0;
+
+	ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
+	of_node_put(parent);
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
+	of_node_put(ep);
+	if (ret)
+		return 0;
+
+	lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
+
+	return tegra_vi_channel_alloc(vi, port_num, port, lanes);
+}
+
 static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 {
 	struct device_node *node = vi->dev->of_node;
-	struct device_node *ep = NULL;
 	struct device_node *ports;
-	struct device_node *port = NULL;
-	unsigned int port_num;
-	struct device_node *parent;
-	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
-	unsigned int lanes;
-	int err;
+	struct device_node *port;
 	int ret = 0;
 
 	ports = of_get_child_by_name(node, "ports");
@@ -1265,46 +1302,15 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 		return dev_err_probe(vi->dev, -ENODEV, "%pOF: missing 'ports' node\n", node);
 
 	for_each_child_of_node(ports, port) {
-		if (!of_node_name_eq(port, "port"))
-			continue;
-
-		err = of_property_read_u32(port, "reg", &port_num);
-		if (err < 0)
-			continue;
-
-		if (port_num > vi->soc->vi_max_channels) {
-			dev_err(vi->dev, "invalid port num %d for %pOF\n",
-				port_num, port);
-			ret = -EINVAL;
-			goto cleanup;
+		ret = tegra_vi_port_channel_alloc(vi, port);
+		if (ret) {
+			of_node_put(port);
+			break;
 		}
-
-		ep = of_get_child_by_name(port, "endpoint");
-		if (!ep)
-			continue;
-
-		parent = of_graph_get_remote_port_parent(ep);
-		of_node_put(ep);
-		if (!parent)
-			continue;
-
-		ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
-		of_node_put(parent);
-		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
-						 &v4l2_ep);
-		of_node_put(ep);
-		if (err)
-			continue;
-
-		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
-		ret = tegra_vi_channel_alloc(vi, port_num, port, lanes);
-		if (ret < 0)
-			goto cleanup;
 	}
 
-cleanup:
-	of_node_put(port);
 	of_node_put(ports);
+
 	return ret;
 }
 
-- 
2.43.0

