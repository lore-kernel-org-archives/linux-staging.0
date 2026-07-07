Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC192EEE7E
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437875; cv=none; b=BSvtPhzIpEcKwqeGI3ETIOsLW2yXASapuDPfCkvS4vM00lu1U+ou4UxwsVzjC3K5ixqStTL72hgvaF8pJOTxl7Tt/H+KiOERxVhNUhLDZEQ/N+MX0ryJ8w2WpKA4sO6uvOSbPibbqrWFmDguL3v19R6tqJkGgJSNSUQC73duaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437875; c=relaxed/simple;
	bh=CL1TWI09q6rHhesaHDbX4V0SqZsT9mM7aOBFw0VS9zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYCQxNEnN3Qf+/bImwz9Sdqsoi08BRQ9rgHurWQjiH67D+R8OQ7WSeweUv/p47JZeNeie+llUOgXnnVGp7yS4aumyDDZPoEh8TNkAYxTA/gkp1sMXGT8MIwzKSA3a2V5dogudYYSzKA6tggAA8bvn3zO/TXzaOS3SvhCgTQMHRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF0H+tBg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF0H+tBg"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-847921eed4aso5921739b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437873; x=1784042673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PiSvPUBbt45pXI07lt7UBDjYJzi7dkwQwjZGxzED6A=;
        b=NF0H+tBgYbIf60aAXt0nHmpgFMVH81q3ZzGEovmjD8lHrG4FW2UWHEFeiCOl0ISohI
         yUbEsF87ynX7YxhabV0L/AVLJLvpJKFpu9UdCBruHVI0HTPDvkEWiz/N8o+V+owrgrLE
         N59h4nhh2xDPle8GNgol/HiGRgWX3J2HIXRt7aMzqvTv9ojfufGrnBz21LVLtRIpe4RG
         awk3boUBJAY0Xfb3wKd16x07IW+c//nbivZkOSPTySB4oGHiO9aU+1u+OrVEZ3j5WNT4
         bfVQ+pxCTgElNN2VNlnx6BJ0UQRMoOUtLbca8Coz7zL+wLBMhkE9aabwkAVd6wGrQPys
         bkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437873; x=1784042673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PiSvPUBbt45pXI07lt7UBDjYJzi7dkwQwjZGxzED6A=;
        b=InJQ2wmbh5XdiYTPJZpJj7reVZ+lFY8PnRUZZf2XZgivapSyy8z2K8QMXcLqG6TA2/
         l5arME7umjs7BO/Jygbec2XSJIeK39RIDyMW4/7/PVl2B6kaHp/UKGzVEwvCmFC33qz1
         umtX/uluckihQxPYa2pFWXfNThN0Bpvb6BRgconfhGhpfI+98TK54tjQL/Zn5N4neCoZ
         U5aUZLX2pmplZW80P+qgomrEE4r+AoskOWEEvtGIoQdI8qn519ujqvH0XTD3LMDX0mNS
         TSbE3iza1g5Op6to9+Pa7n8rHykd/5C7/c7adn4o4/HD+lvWiHZmT7oJwvGvsVgfSLY9
         FTUw==
X-Forwarded-Encrypted: i=1; AHgh+RozWwJBhprs6Dfkl8uEcof/mRnvexDTiUrDq05ZL3GPSPVrznArgmr8KVPGL+Z20u9fwhneCxmqSooW/F+D@lists.linux.dev
X-Gm-Message-State: AOJu0YxDi8lkTiKOrvi6e648pYd1ppVdnm4nGl+43DqjHn+Xy7TuZGW5
	8o0IEP71SssPGKA7+Jfa8zAq9W60u/UnyT4XbusRutTsitWIqUmZ+pav/k0S/ykeWUVYYg==
X-Gm-Gg: AfdE7cmaKOQUtEyFz9nB99EcSP72U+sHIYe+ZyF27UT/xcHN/0Yz60uSOdVDDElRK0I
	6iZAv1b7aM10tJiiku+Ykjx9TRT54jZWsb/jTY9Jf4V5+8wiaNZoTHGXeJBGvhoQVELA1eWjJwm
	gwDDEuKco5jk4iIolJX3nAEfOiQ/ekPqKCa4QvVI7n0H9S0r+wrjq9Gx4h0IYzA8gB56O6TqcUd
	6DJugqwCQ33XswZQtxAkaaGmEn05IWC/b6IQLsE2Rp2Ado91U0j13YGfZePjGYTyQR6uDPhpWXy
	US3ElbtaJv4mcKyTxYWeKU3+i3yx9YF8bIFgX5ouREV9yk+7AnAHJ+TXQ0mPULNlfktCL0zo1fC
	G13DoIPvqkO+FoAyLO73/cAqkRjAcoFtcEwD/5DE+MFQQWWV8HjedpWB1Mi9lPS2yNfpnJjnx/u
	64seY+yAqCkOGyKUcudOfmHpQMdr6IYvVJ3g==
X-Received: by 2002:a05:6a00:3288:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-84826c1edeamr5779113b3a.5.1783437873353;
        Tue, 07 Jul 2026 08:24:33 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm5652726b3a.45.2026.07.07.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:24:32 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: vi: fix probe failure on skipped last port
Date: Tue,  7 Jul 2026 23:24:25 +0800
Message-ID: <20260707152425.571254-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_vi_channels_alloc() iterates over port nodes and skips those
whose reg property cannot be read or whose remote endpoint fails
v4l2_fwnode_endpoint_parse(), leaving the negative result of the
failed call in ret. If that happens on the last port node, the loop
ends with ret still negative and tegra_vi_init() fails the whole VI
probe.

The same defective port earlier in the ports node is skipped silently,
so probing succeeds or fails depending on the order of the port nodes.
The CSI equivalent, tegra_csi_channels_alloc(), returns 0
unconditionally after its loop and does not have this problem.

Use a separate variable for the per-port checks so that only fatal
errors end up in ret.

Fixes: 1ebaeb09830f ("media: tegra-video: Add support for external sensor capture")
Fixes: 2ac4035a78c9 ("media: tegra-video: Add support for x8 captures with gang ports")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 456134a9e8cf..f461e117305e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1257,6 +1257,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 	struct device_node *parent;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	unsigned int lanes;
+	int err;
 	int ret = 0;
 
 	ports = of_get_child_by_name(node, "ports");
@@ -1267,8 +1268,8 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 		if (!of_node_name_eq(port, "port"))
 			continue;
 
-		ret = of_property_read_u32(port, "reg", &port_num);
-		if (ret < 0)
+		err = of_property_read_u32(port, "reg", &port_num);
+		if (err < 0)
 			continue;
 
 		if (port_num > vi->soc->vi_max_channels) {
@@ -1289,10 +1290,10 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 		ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
 		of_node_put(parent);
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
+		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
 						 &v4l2_ep);
 		of_node_put(ep);
-		if (ret)
+		if (err)
 			continue;
 
 		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
