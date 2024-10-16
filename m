Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85C20B1ED
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089712; cv=none; b=PTL2s8RMU68CPOmkVPTAtBgfWtIOO0++QhRg1PX6qaiTqY53OFGPdgKmmHQF+uxk1s97Dp14FF+gEIXc7ryUdaYZH7fRAlJTwsjgn8bFlFqd3F3AwHaL4S6QG5Ag63Hps7y7qKOVADcJMauzflWxDHxRo4a/GIqkanOK6VQvgoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089712; c=relaxed/simple;
	bh=Xm89ZQTxOiruJJc2c626as0TSbAz4qE0b9K3bd8RCaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoKboZbVTHZEBLi+9w+2Xb/rgR6i7Z7v9aNf+q9EANBFq0axQi7DDu/aOA7QdzCk39tSWnzSyzfT9gWiKIIK6Fm5C6t1wktyuWPLziw+13GtWz8fcOdXFaWOKjEmUiZR84pppkMnCIIiQx7cp/PFdSeIJ38YeuFdTZ8pgRk35B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9gP6+PD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9gP6+PD"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e8607c2aso4871980e87.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729089709; x=1729694509; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZJgMAiThnKM9DCESXpeGrJ3grxtNNbWoomMwPV4xGU=;
        b=D9gP6+PDmIDZlrELeh/RmiuPgTuH9LiLE05+c50ePuF+GFQwcxlawVBgSY6ihz+8xx
         BN7nwizpW3ukPH45eZrIApigmTrtjsZN9nMi4gBOpqP236kA3Mo3iS5H9zMRpayt2iTz
         +bofItOYYP2ot8exG1CmFJfiiR54DLmtAKUNdTQbfy99XPUL9SBJsm7y1Zf98pUzcaOt
         KJUWV+4sou0v7JjVNeKMXusTYHP9qTSLIyW1QYG+8QmsDLuFZJG6swHXfyp8VwT7IaVe
         5XEDj2FwC/SCzA8i4ofaeH3JBNmzOKZObKCvvmH3VIcWFF2qNBQdKL6VrEA/S4mo+Vy9
         Bk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089709; x=1729694509;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZJgMAiThnKM9DCESXpeGrJ3grxtNNbWoomMwPV4xGU=;
        b=AK7iFIyldlmZWbdlu9FX3xRz6/WBFrKwrggkEkAK4hGgc08n87jzMutACFPKjGjFho
         /3mwmvaNNiYyOUj8QejlO9g961wN0fhffDF3CxxOPKSouxJBaWAXbtLiusW3GJ24m21O
         JHScY2YcJJs3HPRHJl0lab9P2zahIRgdYskbA0CUIjeIn/1o3ge8eN/TUgahWLjayoLO
         oA/N2vRrNpWpV6UbUyyaXp6bd8K1aAtpb/qDxoadvsiJImyzxW+iZR+0uufD/cNdPE5v
         NufOcklpak3JLbwGKVR6rNAW0tJdTBfqxWz4DKh6MnQ9pEVkLP5irtmM8OXB9FNN4dVu
         9LPA==
X-Forwarded-Encrypted: i=1; AJvYcCXfeNOxAGaUu1knejYyisnX3/JqH3rVcIJnXUXPoTI1SQOIJsDsTORFZstF9YAUPmgMY5MIFcb49A9cp7qV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7UuJxWTRUcr1KiqXFEWRK92Y9Kn/m5pkSqRxFYdX+RQdWp8aD
	2pGuaYwuPPDSvDP28i3BANYmWExHC1jCCIDSs8qY5FpthXIq7jxS1GylwJwn0B4=
X-Google-Smtp-Source: AGHT+IEO8z3y3HtXlHNDMzb5tA37caZtOPrnQTurgO1vgyFjMMIuObM//raNXXBa8cL3Rrh3e6nZ6Q==
X-Received: by 2002:a05:6512:e85:b0:539:ec29:1cc3 with SMTP id 2adb3069b0e04-53a03f2da18mr2766237e87.30.1729089708648;
        Wed, 16 Oct 2024 07:41:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2987c700sm190328866b.189.2024.10.16.07.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:41:48 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:41:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>,
	Julien Panis <jpanis@baylibre.com>,
	Chintan Vankar <c-vankar@ti.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: ti: am65-cpsw: Fix uninitialized
 variable
Message-ID: <b168d5c7-704b-4452-84f9-1c1762b1f4ce@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The *ndev pointer needs to be set or it leads to an uninitialized variable
bug in the caller.

Fixes: 4a7b2ba94a59 ("net: ethernet: ti: am65-cpsw: Use tstats instead of open coded version")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 1 +
 1 files changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index cda7ddfe6845..fe1f2fa0ff9c 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1341,6 +1341,7 @@ am65_cpsw_nuss_tx_compl_packet_xdp(struct am65_cpsw_common *common,
 
 	port = am65_common_get_port(common, port_id);
 	dev_sw_netstats_tx_add(port->ndev, 1, xdpf->len);
+	*ndev = port->ndev;
 
 	return xdpf;
 }
