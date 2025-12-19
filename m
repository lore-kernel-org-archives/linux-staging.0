Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3214A62B;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142006; cv=none; b=gzK9ekN55OYo/0tubhWR+HVVPvA0UHhwhljMGDfSGOU5HuYvmiOwUGLAIkxJZWZ5lCto+CfODGEPkVC26qHJlmDrIOQSlvTeSe+TCDi19joVZKtUfwtL+TKjPPdM9DBvNgRLva7nm4lqshW/9yVToMWXX8SWt4uzVWHI4Wji/Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142006; c=relaxed/simple;
	bh=rF1yPDuyGMfo+9a72fmkdnuoNV1bBA7A6RwbKHhS2Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEpbcUYyD0RjBPEw0G5lF7r3UlScSL3N6dWpUuBrHmrB6rL7iADObqC5DdobEoBSjQaGP3aCKavvobkx/QrXm6Io38v30kUmSKbTfMPOS50x5TQA8vgbGE/x59poZfpVcIgoVWbqhX4jTllMhXmr7yS2ZlxWw0Udygq9tSjKEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWOYjAWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWOYjAWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C082C116C6;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=rF1yPDuyGMfo+9a72fmkdnuoNV1bBA7A6RwbKHhS2Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWOYjAWWw07MCGCIFhNQyL1gDA/wi0yNnrbIUPLw0ly8jEULMs3/rFjWEatQzKqgd
	 2GhSx+0+lioW708eKxQa0zj94uFLfjauZcTE6sPcagrbmP/WO93KO6lNclQlbnRFQy
	 rQGcRo2PjRNzOSp/Ad3MxYG83MOU9FYykVQEKT/gkAtUrL0rbBeRne2Ka43k4slSSA
	 rI6CdHmxArPv7KfEgntnL9GOp6PwdnW/6NFkzoBG/GoFJjGzY5YEKCNbFK2yq74KM5
	 s6pY5nr8ZRmyFxibLkSsdmcEZexAaFoC0+uoySPS8t2WbTS1S9uB69VsxaL0cz2uro
	 6IbvaqO38ZMzA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDM-0000000065i-0wjA;
	Fri, 19 Dec 2025 12:00:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: greybus: arche-platform: fix OF populate on driver rebind
Date: Fri, 19 Dec 2025 11:59:28 +0100
Message-ID: <20251219105928.23329-4-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219105928.23329-1-johan@kernel.org>
References: <20251219105928.23329-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c6e126de43e7 ("of: Keep track of populated platform
devices") child devices will not be created by of_platform_populate()
if the devices had previously been deregistered individually so that the
OF_POPULATED flag is still set in the corresponding OF nodes.

Switch to using of_platform_depopulate() instead of open coding so that
the child devices are created if the driver is rebound.

Fixes: bc142bbb4ceb ("greybus: arche_platform: Remove child's platform device as part of _remove() fn")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/arche-platform.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 7dcb33a6f2e3..8aaff4e45660 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -553,22 +553,13 @@ static int arche_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int arche_remove_child(struct device *dev, void *unused)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-
-	return 0;
-}
-
 static void arche_platform_remove(struct platform_device *pdev)
 {
 	struct arche_platform_drvdata *arche_pdata = platform_get_drvdata(pdev);
 
 	unregister_pm_notifier(&arche_pdata->pm_notifier);
 	device_remove_file(&pdev->dev, &dev_attr_state);
-	device_for_each_child(&pdev->dev, NULL, arche_remove_child);
+	of_platform_depopulate(&pdev->dev);
 	arche_platform_poweroff_seq(arche_pdata);
 
 	if (usb3613_hub_mode_ctrl(false))
-- 
2.51.2

