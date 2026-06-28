Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5EF32C923
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630109; cv=none; b=lZeaNxRIleZ+l7lTbIIpV5OakYzd+gKeIFqNi/Wi5W39ziLW3BmZrQIZNzR5I2I+6fCsJUqyYd0JKEz81eHnUZwyYAbmS3SY2M7zcZ5rP9Fo0z8ZUpbIOhg27c1tJOOFvRKUzCgg4YL+EURSbOrg3/TvtEHwajR6TiJaZr9ttK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630109; c=relaxed/simple;
	bh=qmJ1u5i7dUxtk1Om5Jtki/OJy4eDe0UdEmPjGhr7Ji8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyplk5QLhIjQ3znMya5ELIL4yhb2+S+Z7FNcD/kXlfvQXtNOcXQx5tlN4tqZaBBGhEokI3m2cex9mB1jIYpPi5cG2lmFCvCzaoG8tfiAnA7jO9u8ta5F29m7gS//v92R8Z6jUnxgwAd/kECpWwt0g2fu4kpmsu6ReP0w2x3aFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0GhVOFV; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0GhVOFV"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so5954413eec.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 00:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630107; x=1783234907; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYfs/uXnRVPNQ7LHpddf5rjRf2cS7Tft/Nd/ILvU5x8=;
        b=M0GhVOFVFXaWBGcVbUp28aDwHjegEn5xHSP3x3a4gkJgj/IQi5A9QQ+90Y0D57/hoG
         0bggne8B3Hy2+SdMYsCg9Yuo+R6Gxe2YgTCWh8KsPW/tdHazVrwJ70JzGkGjD4fNXxrK
         YybwGjkTDZ/gqCtu5MBeVWiPrqbcB/Qkg0umMog74DIpflWtxSAfZMUtDcUAYPyVGpzw
         /gW8Z/LT752cxDfAVxMCJj8G1dczWZVRC06nPjCncqwprTpd6q0TxqtynzuRrbISPN4S
         ShQmmfhKFDPKgcc22wGUBGRvcqgMq6TDPZkya4wJQuPMNFClsHu/VpvR4dME8I9l6qZb
         FWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630107; x=1783234907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYfs/uXnRVPNQ7LHpddf5rjRf2cS7Tft/Nd/ILvU5x8=;
        b=r0Cd6Kj1FZmc6IOeN7gGWKWwQmhPlXOt2iJ6GfTIWCLuV1AIZTHZR1AnFrQKfjOcKz
         KIboDv3XQggtXJ1COL+q2qeEoKccY8jMFciwKKeZ++wWq2U3TU4jbFirQq6s5SxW97n/
         U39jD4MK6CVdq8zRt4iTCz8u0jUtbtJaQALWPRS/QRWHQ9oU/7bOoi9gq1LBmm1AHW4X
         K+P8cb2PWbobVWm3/iHA5TSFsF38GcwXfRpmTwBoY+LgaA/bq3RKZT7YgzGSK6fsIwTO
         fk5NOCs9DjAcSLw8Et71Gu7YBw33fcSIkFUxQlu9IkVHJy9J04ZgckRLMvtT8GuKGMso
         55Sw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8jS5jIAV2U7yUCaKywyBLMhxTOxcB7it6XrHMKHyGX+LEfXPZGUueiTQDgSw9RjzjjPxYiqtnhODBPB2y@lists.linux.dev
X-Gm-Message-State: AOJu0YyRfWChj9XJ0sD5ttg0y/RmbSXjfbEQ4qaWjP0lKXcD6qwerRVg
	xQeYALbSEX0wWSz1ZgznKGtvmlbSZu3qePige5XOOVvtyNnzm1dj3bTK
X-Gm-Gg: AfdE7ck4p5wRUwGEiE9mfyAXmvH95Tgiu4GUiClrPFmbGMRCCoYdChikh1no3dozWbJ
	8PD9lwZXwC/Rf6c1upqoVIE/eBGCdcFcf7YwHeGFq1t37+iCxk3WNYQk8uszruxiz911EjO05ZL
	4zwgZpkGUW7WYZXK8RECqnE4uoM0i3TPM3wNUQhUh0N3H8EVTfuXp/VLU8NHrCI4Gvfp+KzDuY9
	v1OOJOdLAVPgXiFCVOtwBJaoydCNZIcdYPTwJHktL/uYX1GVPbfo6OKGTN42hp2EW5sUAtf9jpr
	kSvsFTAnlREVX8gdwx/dp7YwNRaO0I9Z3AU5Ou71t09d1i+nxtZiox2n+pW8jFCjtSVeAg0ALdy
	BvvbutfuNxvgxjhIC588T3+bwC9/3jI0lYaU38kH9mYJvv1xyC9rTO7HNMCUxD9Gj86ckZWheFA
	r5uiYSnAy1lEvRMiCEzgtVI6Zbfrp6o8Hr50Ywhv0OX8LVgKqSPjpKGuHW3dbPcJrHpVEgoi95F
	DesJHkZRMI=
X-Received: by 2002:a05:7300:2146:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30c84b6cffdmr13075690eec.4.1782630106728;
        Sun, 28 Jun 2026 00:01:46 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm39878489eec.16.2026.06.28.00.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 00:01:46 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Sun, 28 Jun 2026 12:31:24 +0530
Subject: [PATCH 1/4] staging: octeon: factor out device removal into a
 helper
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-staging-driver-octeon-panic-v1-1-fe8c34989254@gmail.com>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=qmJ1u5i7dUxtk1Om5Jtki/OJy4eDe0UdEmPjGhr7Ji8=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqQMbUQGyiBhy/O7DvPhZ7aQqEeWGa2K4A93X0G
 aueYubFhUKJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCakDG1AAKCRBsPpGo1/A4
 bZKaEACm2/iBd89hxkJvqctf3TX5ZndR41qPKfUOkGwYXuORQiyblG5XsivjfH9gYq1OheymdyC
 wYzbuJZRQzzOqweKhvwquL+wpB+QGBxruVNyqMN5NxpCQVhosFnm/1ynTV4wnnY6rvMhi8VMKZr
 q+zJQs6cIlu8rKHkPg5Fst6gnAEfb2/5zYK73U/twb9yhy4HwIpQZjqgkA3bBbCa0SfmYkVrAX8
 ujn1Z115R2fYhXpGhd6/jgxlJHxw2hwHReaTNhQEVLoKEb1tG4VMWj2EE7O4Xe2yzCn1sK0QJJ7
 IvSeloBN6K1uO50l5TS4ZVeYNmqu8evRkc2w3rfIDmFkEjnILolnX+PptwQ6eMQydNzm2RY1XR/
 +zE9++rkpPVQSOuNcV6V4TCtjd5c6hxGpCXNZxDM+PZgRuenolmaQ/FMAM2Sf89yJemwUk2OYf5
 ITRU8xy+POsu1u+Txd+m2VHKCXxnzBSWhmf9gWpHn/dNom7cwiWb6lH/pTqiXqWRwih3spHhhFW
 iL6+TRxExrL9LvKggsXpuZlHiL3nZmQsjhBF5oe7mjcUNaR+OEEPGAkpwCWqfrWW0NcI4TZnR/m
 PRUx0TT7Mx4JJuyi76DMlo/3AUp3hXTJH1QieYa7ZDqxgUDWp85ySsR3e5HjeiLr8HAFA6vUde+
 Pon1MXExXD4UDIA==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D

Factor out the common device removal sequence into a helper in
preparation for adding cleanup to the probe error path.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index f3fa221f452e2..e07c6911b8252 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -104,6 +104,21 @@ struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
 
 u64 cvm_oct_tx_poll_interval;
 
+static inline void cvm_oct_remove_device(int port)
+{
+	if (cvm_oct_device[port]) {
+		struct net_device *dev = cvm_oct_device[port];
+		struct octeon_ethernet *priv = netdev_priv(dev);
+
+		cancel_delayed_work_sync(&priv->port_periodic_work);
+
+		cvm_oct_tx_shutdown_dev(dev);
+		unregister_netdev(dev);
+		free_netdev(dev);
+		cvm_oct_device[port] = NULL;
+	}
+}
+
 static void cvm_oct_rx_refill_worker(struct work_struct *work)
 {
 	struct octeon_ethernet_platform *plat = container_of(work,
@@ -949,17 +964,7 @@ static void cvm_oct_remove(struct platform_device *pdev)
 
 	/* Free the ethernet devices */
 	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++) {
-		if (cvm_oct_device[port]) {
-			struct net_device *dev = cvm_oct_device[port];
-			struct octeon_ethernet *priv = netdev_priv(dev);
-
-			cancel_delayed_work_sync(&priv->port_periodic_work);
-
-			cvm_oct_tx_shutdown_dev(dev);
-			unregister_netdev(dev);
-			free_netdev(dev);
-			cvm_oct_device[port] = NULL;
-		}
+		cvm_oct_remove_device(port);
 	}
 
 	cvmx_pko_shutdown();

-- 
2.54.0

