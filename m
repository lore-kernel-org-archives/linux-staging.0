Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074846D570
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649893; cv=none; b=au9IERbChTbAzCZGENWF6BR/N0iD8167G/UQpYJe7xoRBwJ0nITOq3BU126jWErlwPY0lWgWPoKguuIV4/YR9G1ok8v+cEUFEm4yIiseuZSh788/GGm1vRvhDFS72xFi5iEQHKZsqjlLi9ya5VckHxF7vcJAcRmHybXSyo/VPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649893; c=relaxed/simple;
	bh=y60J1vaaP8TUzLNxgUTx0t4GsR+fleFS3Ps/t53XRz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fpwtvtn4N1EWsf/o3Huj4nVx/7o7dSsPw9sExGkRZK6j2WP9lHgnIKHtiC81xVbKHwC9EqQB5dyt7/XfJm4a6+Kdvw0ocWCvhRScoGS+nc7wBXu0Rl+wMrwI7pFmk3cGV8V5fDIKFDR4dCgz1fEJwojuWXAU7v7jKZHvBk61szY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIA46TKa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIA46TKa"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47362928f65so10467181f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784649890; x=1785254690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXoWCdwhd85iJHMaOslBo9FxJYhxSgzHEpw839M28tA=;
        b=tIA46TKa8/pnxaqBo2Y8htWP+7NS8hHvlAMcxpe9/nZf3cuYc0ibcqxpp1VpZk3KYE
         LtGWBKg2qP0hWtrFZch2kGdg3ihvttBfrf0n20AuDBrwwXRnJN2sM5QZXAhB2/9L6qqV
         TwB92FMlrJn2rDxg/HZzeHWUy49PfhfLjpOD7vcSU1do4Mn4ow/6hXgsV6fLQapxzA++
         oihexUltgp+Is3U6v7KD/bN5LhKjKLiVU7vtjbhvCBtUnc854GMsxiTFLlmz8Qj+6NpR
         QGLiSx9HJcacllHSi8Kkd0ELqVqP+oQo/s5XofM9K8Zsap3hNhxFvgEOL9OMQDbyBvic
         r7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649890; x=1785254690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXoWCdwhd85iJHMaOslBo9FxJYhxSgzHEpw839M28tA=;
        b=YDe1DXNLYuiTCyl4/9sByscFex+APo2y0dx3D6dxMOUo+z7RauHtQfQsjZ4QGnbHXb
         mDxNmco1msEtNBJg8b8Q4kGLackfpn4q/IMU8nCBx/yLawMzBO+FgLKjXImaRCN5Xle+
         qV2aAMbCFNGJmiey/uc6Efzl4iwHinLQRXeOrCkPj6wiz2YRUUmn28VSiK8ikg7mMXhB
         qU4j0/Cc3LBEuSN/YyVt1bVIbvEG5cTzNqdFcHSB1SyjmmUc9q4SVZeD8aPD1ExnCS1m
         dvaawMK688fjPfQF3NlyEqak4G7zAVDPXQgKtduaOoMtbLOzSLSWeozfOvdLD0pLCORg
         JGiA==
X-Forwarded-Encrypted: i=1; AHgh+RrE5YNrzmrMF7D1j2RTN+Ddhp9Wz/0muNBU8oXQ6afy0e9D2KsnIj/ybs+mOg5D05hJSGC9hP7hHMvXD2Eb@lists.linux.dev
X-Gm-Message-State: AOJu0YxPrRr3mufm8VHuw432olOIe5LG0P5VVTYBjUL3xRtSbZpWu0qP
	I8RGNc7zQR4x3e7gYl5/uzMNkbNYLqSMhN1N2BIdjnQT+o6nJNai85Xo
X-Gm-Gg: AR+sD13R48qIj7bUKbbn6qsxKe4mxiO/dnh1VPRL7DOaZiHjrVtfiXMK+yTkL1NDNEa
	lfieDKdmbjRWfcUdECmjbNagjMyfpfnJ/vb+nL9o7IUBu5m2m161SHCUvGP5NJpeVw8ZJgoArUE
	DmpCiJXIPmoN3ANVc5N3MI8ULGGqdaK2PG54SIaZk5+ASmSADpnMP+FDNi4mS3SjBPTNgo3AKm8
	3CtvEbZqHOGYLgvWVQ6pG4fnAej7gBQv0wFZAc7bUT8TA+dinGPr+6qoa+olmNfthkZO8/0bwPX
	/cYRl5E1Rv3G7Xru1mk8bYosullqfULf5/RBs0n49zKF+r0wjYfafghBgvS6h6HpjxxCcYtxOqf
	SBrJ+QmZc8tcFF4hswgw+EbDlqC7xmIVZNQCP4h0ZofLy6AI7R3vxWA83wXZKBqm/YD3I1S0PcY
	uc
X-Received: by 2002:a05:6000:26c5:b0:47f:73d3:bfc6 with SMTP id ffacd0b85a97d-47f73d3c168mr14462717f8f.46.1784649889820;
        Tue, 21 Jul 2026 09:04:49 -0700 (PDT)
Received: from ubuntu ([27.96.94.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm43793828f8f.21.2026.07.21.09.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:04:49 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Eric Wu <kunjinkao.jp@gmail.com>,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] drivers: staging: octeon: ethernet: removed unneeded parentheses
Date: Tue, 21 Jul 2026 21:04:17 +0500
Message-ID: <20260721160417.242644-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

removed redundant inner parentheses around "interface < 2"
in 3 if statement instances within the file ethernet.c,
got the warning by running checkpatch.pl script on the file.

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index f3fa221f452e..5083d9596972 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -247,7 +247,7 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = new_mtu;
 
-	if ((interface < 2) &&
+	if (interface < 2 &&
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		int index = INDEX(priv->port);
@@ -293,7 +293,7 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
+	if (interface < 2 &&
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		union cvmx_gmxx_rxx_adr_ctl control;
@@ -345,7 +345,7 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
+	if (interface < 2 &&
 	    (cvmx_helper_interface_get_mode(interface) !=
 		CVMX_HELPER_INTERFACE_MODE_SPI)) {
 		int i;
-- 
2.53.0

