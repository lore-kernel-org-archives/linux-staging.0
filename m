Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2D33CEA7
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 20:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024564; cv=none; b=Mif5LyCXSxJBnzsH6VbMWLMZgi0+1DSfkVCBvFl5JUt2P7YOXk2dtacAWHpbYwRCUUybd9vY2Qj3B7WvfvQwbRxs1tWuLUDNcuGNWyxycrVaEnJnI/Q9ZZpLSHQxDwsaLkgVlJnFKTbCTKMYFLWIDGDtqdMp+tco8Ebuej5lbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024564; c=relaxed/simple;
	bh=dchpzZKAMpkaaRYmz/vRjjzmWDDxB/vqQCy7QgqzFcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCio7fP+8YQtC3FW0NO7P3X804vpKxlT57Hiz5k/BEzCIhVpAVAd5LDcdshLC3Ds6pn2/qedxi5MhK5YFn6DNIb59QVBx2o6AlkZfeBPu+YaYUIn+bLdMll9CVZLpPkUS25agIoWinA5r+AsS2qWVhmIo6KlxrEfPOpIzCk1DX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gT4kduvr; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gT4kduvr"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37f816d01e3so2361576a91.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024562; x=1783629362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QEKmnJzZfnQDm2kosAyHcQ+Ww+jnVYT9tRCo7bBwQk=;
        b=gT4kduvrICsylkn3F551bfWxst93dtoEq93WpigKfSryhAT/T3VPP0cT81BCir2D1w
         cHnXRkN8esFXhRQLQd6QVU6MFPJ0b6h4OQKOslrJ9IRNz8oIFotoLqn700A+Jj7vVYNp
         9COQFag1+cRoPJ4rcc3VwtavPhmCwP1XwgoLEvoe0LXJQW2NIuWLopSfV/GJ07M+fEd4
         krXu2pCowywrn7Qpt7nuyJps7hWp3bEnOLNHV0VoICV2nzSUDy0B6GfOqXqE6MFfOYAZ
         FfLcUqjlAlCAfOup199emFvnMBzpLoOl0Zy0hlKDeIVMlTIbLQr+GsPUaWvE4cp4iOOq
         jjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024562; x=1783629362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QEKmnJzZfnQDm2kosAyHcQ+Ww+jnVYT9tRCo7bBwQk=;
        b=lDs+DxBw2MC8Wo98k4ZDclonsot711ukqF3YNtPYSvgYa0SPLc+9m0DQ0Upc1ZU6Sk
         vJyL4WFmfgzCgN7qTt+6ulFWGvor5vznqkGvcA6JGCl8/v+FWYmPq2IEmW1edtAUZ5tw
         gksbbtxEYAnsQGs1zriPG73G8puAhhqxn1RzYLYahXVNGY6WJDDrecq46u3lcFA51sdq
         VSAVxJ4j2vLEzw0OLXdoA/gKtvzniUidPyOAn2sCtwjxwX45cpXFy9sc65jw9C2M51FP
         yXG7FZGybH59AlRUt7fef/hgJ9n3qLCRbODor6TFqFlVO2PAlLObO2U5LtM1hVekgJ7h
         wyDw==
X-Gm-Message-State: AOJu0YwM0iJKi30VED0m9UaKDxBOlCdPfzmzFsBZBat/neVKqAJ24cSd
	rhHq4l65RdEGyUrhiXziZR+vKLrSZfmWreMjNVqXD0U1TRld4a8GxN8nlCULtM6pyPQ=
X-Gm-Gg: AfdE7clAKVEsxmX2W1wLGoiF/SwUFlHOhHqw3Yld/ZnyprQ3Rg6kSTY5c++UNA+zkMB
	XodLifF/3gNdZlVQsPMup27ri3mBg4dUuUyL/LNQuHC1TO23XvfX/+MzhKHAirONngqYilXlY+d
	0maBmMntWnIiYxlnyNVUfikBl7L2gdH2BWXm9g4rX/MJmBxSvo1zB6Ya11yfffdeP1zEYY7RKGs
	yVouCNQKn9RlVehkPIiooNHP6zsZjdaBhe3Fq+0dACrjpl6keqAmTlWkqEae5MgEc7bm4Rwb04W
	Wdiq1SCDvMRl0WMYAM+BVnAfJHuwWtV+mhkUOmEt1ZKjmuXJtjLVhZVRUEwQV+LTYUElGeodfbP
	fpH+fhcR4OXYQpYpIdR9njO8SuReOaxk+k7oL7soOIredk7RzwsiGCA3qiVcZoEBTXNCniU5PZl
	MZLi77YI1qYx+JCWJg+yCh1ZCw6we5b9WZCU2qVwK7740TC/F9PiZApP+tU2BTe0cjtO6Giygog
	Sf/og==
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr7238710a91.31.1783024561882;
        Thu, 02 Jul 2026 13:36:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:647:4002:5b80:1cdb:ec29:363f:984a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2350sm13538142eec.23.2026.07.02.13.36.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jul 2026 13:36:00 -0700 (PDT)
From: Abhinav Srivastava <atg271@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhinav Srivastava <atg271@gmail.com>
Subject: [PATCH] staging: octeon: ethernet: remove redundant parentheses in conditionals
Date: Thu,  2 Jul 2026 13:35:57 -0700
Message-ID: <20260702203557.59238-1-atg271@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra parentheses in 3 multiline if conditions and align
continuation lines under opening parenthesis. No functional change
intended.

Signed-off-by: Abhinav Srivastava <atg271@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index f3fa221f4..e28625b47 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -247,9 +247,9 @@ static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 
 	dev->mtu = new_mtu;
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+	    CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int index = INDEX(priv->port);
 		/* Add ethernet header and FCS, and VLAN if configured. */
 		int max_packet = new_mtu + mtu_overhead;
@@ -293,9 +293,9 @@ static void cvm_oct_common_set_multicast_list(struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+	    CVMX_HELPER_INTERFACE_MODE_SPI) {
 		union cvmx_gmxx_rxx_adr_ctl control;
 		int index = INDEX(priv->port);
 
@@ -345,9 +345,9 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
 	union cvmx_gmxx_prtx_cfg gmx_cfg;
 	int interface = INTERFACE(priv->port);
 
-	if ((interface < 2) &&
-	    (cvmx_helper_interface_get_mode(interface) !=
-		CVMX_HELPER_INTERFACE_MODE_SPI)) {
+	if (interface < 2 &&
+	    cvmx_helper_interface_get_mode(interface) !=
+	    CVMX_HELPER_INTERFACE_MODE_SPI) {
 		int i;
 		const u8 *ptr = dev->dev_addr;
 		u64 mac = 0;
-- 
2.50.1 (Apple Git-155)

