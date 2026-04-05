Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B996270EDF
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775398439; cv=none; b=a2NA9fO+y66GNnXmsbGRM3AyzTGhvCOYEra70tyUX95Nex41ROVISXEMtGjSvE5uTfIhTDIZbM52b2JTvkIfBwEdbdgeFFNK+98AlVTwUoZj/9pZWd8br+fHVdjS3276vR5c7zv/yUanyN5ufTuQMHIDAvWTzmM8sLEWtAMwWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775398439; c=relaxed/simple;
	bh=SeLHWJSm3VQuJCEeSaRLCqVnoUtA8KmutbSxFLsMJII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrDO/DFZuJhknwD3EUBwTZBVjjdqZb6D73XXVoywtJmPXmBu5MnxCiFSOUVbDjyuy5W4hyp0trhq3t2Gfj38Ke3efUAz7qBlsXCubVT3jH0D8mlSdn/hszaHCpwmYgMyYjEP6UpMMY/ATrmxwaNe5dGzA8AlitJRhOUuSQZnKzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SScYnLcV; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SScYnLcV"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76afacbb0bso226003a12.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775398438; x=1776003238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeeYoJchmIwBM/6rDWjV5/Iw+D5ZiU05N5VNWiTx3CM=;
        b=SScYnLcVelKpE3YUq+HWsKmFG0LWnhy1Q6/qdv+u3KTHpVjsFiSnBJSEpPmqzjPNWu
         ESaxwotvYFCPrUgod8995KSoqCoim0aPkWTN7U5lyX3xj6SCyT9BVL22R0Xb6QxN7DBT
         eZJpbqThIg5aYoOpd8Tdy+JskV2PFDR3Yr6ieSCzBXpeDqvQ0mqV8lsd/wyUJgDYb2wc
         JmoO/nl8DXhjXTKymYpJUkd+zTqmnKSjZp0tIK2jHb1Wajep/+KsIWyCOYLLE6EOe2n1
         toOlWTsRhGaNa6MgevNjzAEAfsH8buVVTvOvHJSHdqhXtlZ6ZadcPbYz3+Z5btx5tl/e
         N67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775398438; x=1776003238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeeYoJchmIwBM/6rDWjV5/Iw+D5ZiU05N5VNWiTx3CM=;
        b=i667z/Q5+np10DV5yj2KkHeuEbIMw4SdS9phon20Mvv+W6ZU581K7769hVhfsPdOQD
         f7R7CQ7r5amhj3LobeUn+oFtmTmW1hejxbfp3Z7RqxBzXEboUh2+bnI5+nLo/xDIquhm
         fXQd31iQiol6FJZ51Zohpt5dlXU9LWKtiF77FHXbLdTwWRBcnCwCetRqZeZC5WLr0XVn
         MGXB/5k84BxjH/My6e+mRlN2JEa8s1FZsjZauLJvXg3n34dHNtmOtlcoLhnln5s8mFjW
         hsrHtDbfHAGmMGLdpPZt7/eJ9LtBM1WE9+Fhkw+JQPMUoyZvOAOjvJkCKMYfLki3O8LQ
         RNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX44AHiC/uESD7I5+xY1dHKFQU19Nl/oyhNSpV/Veqfs7xwo0cDcxlpHFPyXaJJ9Am6TbdsQWOMJ0Y5E259@lists.linux.dev
X-Gm-Message-State: AOJu0YzIaGHvcuzsL7UncMHtnaOyDfvhinIJwMV5/41OSuwnyJH/U2OL
	ywnmtOwhk9j3D0WYJu09OwFhgxYI1SUAYcRjl5l93+cRORbB0eUoWKOr
X-Gm-Gg: AeBDieu7ysSGqzcXPIYuGVoIaG12d18YcEVRRdYdotsgsOHDCWnzrsLpnzQIuIDqBZw
	w/VHUQRYYVgfvMJHzPsleChUrmniYPkESKJMtvahz8ygh7Vq3nhNAScdsw6GsN77+6snVHfZexu
	ggOKJ0di8tjmgCNgiOPdg5XYj37ac9ru839uVf4jG64zujvtcRp8vVBgUc1yfX7zD0tiw/1w0Zv
	q6F9yvIOVU4TA7n4pkIgUQdqG2A+zCK1DPMtn03bjPqEwYSWFESewBKmLBDYLCQjfKv5WRu4dr8
	51P8nj0oGddQXcw2oS4ui3Leo7XRnmEFuNv08nyO+O6uDHaRYC7bq6Cbxi6l/y5miLYjEMHAHtY
	KQdNF1mhvM4ww2SD8famZ4AszLZD4qSDkrtbSagDko8e6i5rI05zO88Wb8+/pCaDZqNQmdPtzF7
	a7KVpzdspE29s4bu/idOXPUlmArimJuCT7EXj0vaE=
X-Received: by 2002:a05:6a00:4506:b0:823:b2c:4aa9 with SMTP id d2e1a72fcca58-82d0da464c3mr5308118b3a.2.1775398437737;
        Sun, 05 Apr 2026 07:13:57 -0700 (PDT)
Received: from fedora ([2401:4900:82af:33ce:56b8:b90b:816d:c3d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm11244051b3a.0.2026.04.05.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:13:57 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v4 3/3] staging: octeon: ethernet: replace pr_err and pr_info with dev_err and netdev_err
Date: Sun,  5 Apr 2026 19:41:10 +0530
Message-ID: <20260405141111.87925-4-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
References: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() and pr_info() calls in cvm_oct_probe() with
dev_err(), netdev_err(), and netdev_info() to include device
information in log messages. Use dev_err() where no net_device
is available (allocation failures), and netdev_err()/netdev_info()
where a net_device exists.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index a7ac29c0a4ca..7c3cfd9efa7e 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -698,7 +698,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	pip = pdev->dev.of_node;
 	if (!pip) {
-		pr_err("Error: No 'pip' in /aliases\n");
+		dev_err(&pdev->dev, "No 'pip' in /aliases\n");
 		return -EINVAL;
 	}
 
@@ -796,16 +796,16 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
 
 			if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for POW\n");
+				netdev_err(dev, "Failed to register ethernet device for POW\n");
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
-				pr_info("%s: POW send group %d, receive group %d\n",
-					dev->name, pow_send_group,
-					pow_receive_group);
+				netdev_info(dev, "POW send group %d, receive group %d\n",
+					    pow_send_group,
+					    pow_receive_group);
 			}
 		} else {
-			pr_err("Failed to allocate ethernet device for POW\n");
+			dev_err(&pdev->dev, "Failed to allocate ethernet device for POW\n");
 		}
 	}
 
@@ -825,8 +825,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			struct net_device *dev =
 			    alloc_etherdev(sizeof(struct octeon_ethernet));
 			if (!dev) {
-				pr_err("Failed to allocate ethernet device for port %d\n",
-				       port);
+				dev_err(&pdev->dev, "Failed to allocate ethernet device for port %d\n",
+					port);
 				continue;
 			}
 
@@ -910,8 +910,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for interface %d, port %d\n",
-				       interface, priv->port);
+				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
+					   interface, priv->port);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
-- 
2.53.0

