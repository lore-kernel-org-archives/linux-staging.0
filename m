Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B37237266E
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436616; cv=none; b=WJwnVONJxG3a+NI26c9CVmqvdq//QN2GUHjd5MBxTBUvg6HVCNsfEAWAsID9QejP9vqfIz0cpL0i31WLXdlle6ZLCWq38IY4GNyj5Be4nEftTy/v87mKD+d8ts516VfzGEVPet56o4Ro5Hw3NA5sJcAB7JIYeINxuTJ6INNFdmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436616; c=relaxed/simple;
	bh=WIvJ/zjcMo6mUW9sI3RPnc0QUrY+/Xv0ltvp3NGiIxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PV8KydhWLMabLQebTcdj84VbKqjuCKO3cZ3nJVxm6ubBQeXwRA8f8GR7V0RVFFVql1J3xSBtT87n1h8vH77Ntx9WeLghmdrjz069OMCjnuifNldK4P5TEeZ8WgQnubvU0RfsMBET+SxYIqHlza/A1GrtcGoTqooaB1ZDXUo8pKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRiDnjZo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRiDnjZo"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so842038b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436614; x=1784041414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yuz6fHmdCtAYz8Y8qNJQTbNofhSYgvmngc/Kl/kwUc=;
        b=qRiDnjZout9qDtkn2FPw2Ri5YEVKE6zf2y71zGXYA+U28nXMVNVRxjtcT79e/B1a2h
         SFO/iX34wF0BPJMIN/40sidd5IrDm2V1tSwGjNo58uNPejjTxN1SABiKCL+9kIkEORXX
         VVgbkkN29wCDuvdoM+2lZw2ycccePgb+2+bTgJNLE0E1oTbBnd0P6ibpt7moXJnD6uS7
         3pWaOBpSD+CQxeVoQxSRMinqGVP3IZBaxi7rU+79+xGJtzt+b0JI+11QeYt9pJ7asJMK
         txaBAOnTHFZzhqSFwfow/MEcQnOPPYZQ+8wac/SVMz3EsVqGMItcKtxnir4ruVjFRu0a
         mJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436614; x=1784041414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Yuz6fHmdCtAYz8Y8qNJQTbNofhSYgvmngc/Kl/kwUc=;
        b=AsL4KCVzotGo59XEADLs3KAJXOtRvg2FzYtFBVT8htLLsZiATJwuof7uOEOQ2Ec1RM
         aprrrJ2Vj1B4ZD6x806KXlK0q/1i5kemn0icwCeGJQRq8OeBRny1pvD4YWSb9D2OoJoh
         E5+mejD/sedMv/gp+KUsT/QE4QiylZ6eZnY/HVzyJppukMO3AqIJzeiJ849PB4zz63x2
         bposqZ+tBeaDONqjsceaUOQuhXSl/nJZhEwmAqntP0YrlhafXuVzIp1vHMjdgUQBCR31
         1vU0nSZSZ4YNjnQr2AIF6IzgOZrXFi8u/EGJ5x2w/9Iv458bfOJSm457bkCW/KzWRIyP
         3PXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmQPcQSNJoblG0HOA4wh1JrNCg2Zu+bW0V1OkDhPT5Qpt/NlvP4SYinBSY0N6eUX1frCiU8oHl1kXf1IZv@lists.linux.dev
X-Gm-Message-State: AOJu0YyfHOmER8QanzvbbygER8eyE/zulqvqBV1aafiblnQILjs5hkaa
	uZal6E3d2ugtoGmC+6IpUjRYkkYeUtXEuhVxXsYvKFPCDCmiX4gIXQEw
X-Gm-Gg: AfdE7cmi6rdrMVjIyVOttAgEMgRvtSCSqjuRwwMv/b7oTEsk4efkdl2AzwXV0WB8gB3
	4H5cRoWDaCOis4sWZvHzPPBqLaLXlRLZF7OpaZo6uI7fpo+AdO36LsQAM8AJdWUxfullJ3h6exi
	7xiX74fE7owkhmyY+zRHStnUlZEFriuNicEB1QH/KrIQHUSZGYtZRNQ45fR7vzXjL7oxACUSiRA
	ECjkqdb2L5bwRoDFWbNAPhFtWEfFWQNuXHNxX4u8x8OALh88hP6oXT0j/OFomgrvC9p3arqStxz
	dthg+eOZ+K4tTrCmcaZbGOZC2wGSiylSuQHLtAs22E509CdGE2L/KPkPL145Nr7IHQvkwn4jMsb
	o2LVST9sV1/HZpMnllYZZkJEFK9eS+FJwwAP6qI8g8kaFlJRFrB1QXNBOjxOFEZe8ANrC9vVZZU
	hEYQqxwK+5/FMNo8jMnb3/k5+HOdVfg4p1+AiqpKQBqZvw
X-Received: by 2002:a05:6a00:844:b0:847:e2e4:a36b with SMTP id d2e1a72fcca58-8482f4ba9fcmr2733557b3a.19.1783436613808;
        Tue, 07 Jul 2026 08:03:33 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dd3bd3sm5604773b3a.58.2026.07.07.08.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:03:33 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: fix of_node_put() on VIP parse errors
Date: Tue,  7 Jul 2026 23:03:26 +0800
Message-ID: <20260707150326.554689-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_vip_channel_of_parse() initializes np from dev->of_node without
taking a reference, but its error paths drop one through the
err_node_put label. This underflows the refcount of the VIP device's
OF node when endpoint parsing fails on a malformed device tree.

The only reference the function takes on np is the success-path
of_node_get() stored in vip->chan.of_node, and that one is already
released by the tegra_vip_init() error path and by tegra_vip_exit().

Return errors directly instead of jumping to the bogus cleanup label.

Fixes: e740d199cf0f ("staging: media: tegra-video: add support for Tegra20 parallel input")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 9ff1f1750a15..5fba11e31e1d 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -126,7 +126,7 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	if (!ep) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: error getting endpoint node\n", np);
-		goto err_node_put;
+		return err;
 	}
 
 	fwh = of_fwnode_handle(ep);
@@ -134,14 +134,14 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	of_node_put(ep);
 	if (err) {
 		dev_err_probe(dev, err, "%pOF: failed to parse v4l2 endpoint\n", np);
-		goto err_node_put;
+		return err;
 	}
 
 	num_pads = of_graph_get_endpoint_count(np);
 	if (num_pads != TEGRA_VIP_PADS_NUM) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: need 2 pads, got %d\n", np, num_pads);
-		goto err_node_put;
+		return err;
 	}
 
 	vip->chan.of_node = of_node_get(np);
@@ -149,10 +149,6 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	vip->chan.pads[TEGRA_VIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	return 0;
-
-err_node_put:
-	of_node_put(np);
-	return err;
 }
 
 static int tegra_vip_channel_init(struct tegra_vip *vip)
