Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB28825
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 15:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40225C433C7;
	Sun, 13 Aug 2023 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941977;
	bh=Xl+zWuxlzf8UrZZuScqSJCZOz7bnr8WH0zt1Hh4Qr00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rHyixOt5JDoBueaLQbG0oikg300GpknpFfMQUSOa72ZDTVpY9C2yr9ULN24xyPeIb
	 eDpErAnMKhVex82OsinofQDzdtlPt83/yOmhLB3EKpi65luhOVSW/Nbq2t8ucs81RB
	 f8mSA15hn24XYe0u6M+Z+mr7/20LjC0gty5+MSB5BBVG5hAqbu1I34B9daRbzcVG9m
	 F/pKxvB0A35olJoHVLNinYg9uCps/DF/ZGxDmO6M3sV9BF/8z/WlGRbmfH5Uqg34/l
	 8ig1k4iCdsMeKFg+Tf5Lttry981cmp2DGabsQ9ho80OdEbLj1RImtqjyxKmnePvbph
	 3y6I6tcQbCAhg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 6.4 50/54] staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
Date: Sun, 13 Aug 2023 11:49:29 -0400
Message-Id: <20230813154934.1067569-50-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit

From: Raphael Gallais-Pou <rgallaispou@gmail.com>

[ Upstream commit 4912649e1cf0317bf563f91655e04a303cacaf8d ]

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes a warning when the module probes. Fixes it.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Link: https://lore.kernel.org/r/20230718172024.67488-1-rgallaispou@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/fbtft/fb_ili9341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab3..47e72b87d76d9 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -145,7 +145,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
 
 MODULE_ALIAS("spi:" DRVNAME);
 MODULE_ALIAS("platform:" DRVNAME);
-- 
2.40.1

