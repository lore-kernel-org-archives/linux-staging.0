Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C53002AB
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622542; cv=none; b=AAnY7D/FxwcvQ35u0dZWronOSQJRfKVQVSXbrugBnLey2l1rv7+spxuwEMU32eLtIyPNtQyUiHrWaKUIm+LWwhccl90qlO9Xc9NjIw5MImULKcRUz0CvHRVfJbEI0vpBC/IpglbRGHpgFq7rZAR6rn54cGFtZ544OChvGFuN+Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622542; c=relaxed/simple;
	bh=gFFdN1ha8Tp79B1B3Zl2oM554MhbhbybYNUFrHskT80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZmEGcpfyFAk7TYO2SxApCMybU18cYHPQtGKK8JW+nZY1UtdzXiUDeoYGNmKhjp1+5ZGKTr5cp4VVvyQUOgqGaAzIA7FB/gZ2cy99jYK0Vr18kA9tikQiu7Ebrm89Q0bOCo1K9Uin/YkLdJ6/j6RtIOTrMJ4WvJXaUwZZ16By+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+PIqMEe; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+PIqMEe"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso91029a91.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622541; x=1789227341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
        b=b+PIqMEeJdGgTtL6RXHqnBVh3rO7SZWPlMOm3/zXtQmWYQNuANM5f4D1vd6UBW59P7
         M1813E73/536npNQr8qvA05czmWnocwVcaK8b6SZvIDch8Tkr3VD1VLY5c/J0Ix6TbwD
         Y9uXrD5bLgb3AKeUM87CQ+XF93NGN619QktswTrUxLZNW8rAZFwSYL0FSAaxXJA/ackw
         RhJLRmZNyGe7lhVNp3tiKc+KvGWW9cD7VVqF9mdxZeVxiIptXg6oOQS5BXiaatHD0FQQ
         znaMJNlFfk38a5PcvY+5bIyB+9aDFBvHqNESkwXhVNq+pJBFStWA0eVMdDJ6n40BKfoc
         PlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622541; x=1789227341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
        b=XkwB5EkhY62D+wB8mb28zPKMIIqweKIUpA65CzULwclSNAxJvFblP+aoMSCTMvYr1l
         UUkR9sUy9KQUDzB330yBuvYlO6tXuAWcrj1OS8g/taCTifUbuYOuULO3EjePtydJvUjk
         6R8fvZ7oXPhLiMaF8ZTPyXORM0kohToF+H49Xd4IbL2koL/Of9ToVJ3g0eXRjp85FA0d
         W0pNH8p16j5Mv0+QED+4yqwaBpeT1q0CSOP5WgTSNwLWLliiGtvRIm+vBP96X52+lSIi
         6WlNCXa+JwdpGmYIVDY1G1km0DBJp/UpVz3qe5+MFO6b2ziDtP/TjSAD5iyFyOiwiipv
         wjjw==
X-Forwarded-Encrypted: i=1; AKwUvBxxMl8Lh3o1pWW7yIQb+iBT0GkYJOKUxvFmsuCKl68t1X29RT/KBi2I6vegyoFS72ajgjpWjsuEENyGnYlO@lists.linux.dev
X-Gm-Message-State: AFuF++lu60+HvBUmnwMu5c4kNhM6KAhTS4cOwC0mLE4t23O1e9QOACb+
	On51zHGLalq8cs9M7FQvIFZ6OACxLt9yEppiy6gTFQm3rIYWtAQk1WsP
X-Gm-Gg: AYBFou1zb5b7HVTnwHKI1uLfBnMWBL0iALOSZilXKNG8KYz+jp7B1JIhGO6eYvIPuzd
	N7OZKolAQaj3HWFQ5/We0ZiD2sJ/9uO/QtEovjR6/SbLyBMy8bQM8zVGFso45coF2OzBWCIlxvT
	s4ebnr9X0z6Devci1iMKh5ZbNV6fHulIH//H3B/TEDOe5aa++DoOax7I2yN61ZEXJ3hsh7ZBFst
	qPi0GsDVanW7wsK1AZTXTyfeKps5RGfUhdLqc1ZOFGjfEkPNTw+WLzVbig9lImfK60Yzr4fi0mp
	8kuMI8i55Ofnbi0FqP5FAyHB1L44oquPYPKivo//z7frXoHy7e2i324uBJ31W7Bqf+Sc57yLPtR
	c8I5mE4zmK7gu4raan+O9kzAH4OwRFyGWaM0/PdAJ1SrRg6RfpF3QGdtQb3jm8JSY4RkxdqfV40
	0vwoWGO8c/sFvWvzLLmzSl1CQd/f9vCAmMNKefhsRyN0OqYgA6CCaoDCM1WpUtQkl3+Ub9Fle2Z
	cXrHUvzc3y6/UYMyqmsnrqLx7wSAaw1+bbeCkn4VhJ7owxdVD6UW6C+/bygAk4WMNY=
X-Received: by 2002:a17:90b:562b:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39b3d5f2c09mr6126052a91.2.1788622540707;
        Sat, 05 Sep 2026 08:35:40 -0700 (PDT)
Received: from fedora.iiita.ac.in ([103.119.35.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm10493484a91.11.2026.09.05.08.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:35:40 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ayushmukkanwar@gmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH 1/2] staging: octeon: fix use-after-free in tasklet teardown
Date: Sat,  5 Sep 2026 21:05:29 +0530
Message-ID: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_tx_shutdown() kills the tx cleanup tasklet while
the net devices are still registered. This could lead
to use-after-free when a tasklet is scheduled after the
tasklet_kill() is called which might run after the net
devices are freed.
Fix it by unregistering the net devices before the tasklet
is killed.

Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..98d4e025c301 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -113,7 +113,6 @@ static void cvm_oct_remove_device(int port)
 		cancel_delayed_work_sync(&priv->port_periodic_work);
 
 		cvm_oct_tx_shutdown_dev(dev);
-		unregister_netdev(dev);
 		free_netdev(dev);
 		cvm_oct_device[port] = NULL;
 	}
@@ -694,6 +693,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	struct device_node *pip;
 	int mtu_overhead = ETH_HLEN + ETH_FCS_LEN;
 	struct octeon_ethernet_platform *plat;
+	int port;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
@@ -729,7 +729,6 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
 		int num_ports = cvmx_helper_ports_on_interface(interface);
-		int port;
 
 		for (port = cvmx_helper_get_ipd_port(interface, 0);
 		     port < cvmx_helper_get_ipd_port(interface, num_ports);
@@ -953,8 +952,21 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	return 0;
 
 err_rx:
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
 	cvm_oct_tx_shutdown();
+	goto disable_ipd;
+
 err_tx:
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
+disable_ipd:
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
@@ -984,6 +996,11 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	int port;
 
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
-- 
2.54.0

