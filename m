Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD572
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 08:55:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EF0B6322A;
	Mon, 15 Nov 2021 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636966525;
	bh=5QR5v6614zTOntPsUILdpgvMgyj2h7YC8v32L7VdrY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BVo2LZMTKnvi18fTU1oVyCcq5hSRkXwUKaqwxPxFj8ksBb3j3ZAMGnnyUBzxyju35
	 JD89ztkndvHbilbR165m9u29eYAyiAZP/352auOvSmoASz8QbySIAkx8sx6HqA3Fi+
	 NajC4qp9b42h6JI1IOXBv9o4BCffOY7AZgYVuLKQ7HNB7CtLqpCFYPXpzybPothEc7
	 iVAogxjPLeJtqekWAMFQpZU9AzNb/YLn/6ECUKqDOQJhupZ04BtGq9L1VopOyBhPBv
	 zquvlt2qbQvpw7jHxz0Ax3OX5az2YhpYpHthYZCr7jXdKg9XrvsUnmDM+vt780Vm2H
	 YQtg0r4AXxFjg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jon Hunter <jonathanh@nvidia.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Scott Branden <sbranden@broadcom.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	alsa-devel@alsa-project.org,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH 06/11] dmaengine: sprd: stop referencing config->slave_id
Date: Mon, 15 Nov 2021 09:53:58 +0100
Message-Id: <20211115085403.360194-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

It appears that the code that reads the slave_id from the channel config
was copied incorrectly from other drivers. Nothing ever sets this field
on platforms that use this driver, so remove the reference.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/sprd-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 4357d2395e6b..7f158ef5672d 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -795,9 +795,6 @@ static int sprd_dma_fill_desc(struct dma_chan *chan,
 		return dst_datawidth;
 	}
 
-	if (slave_cfg->slave_id)
-		schan->dev_id = slave_cfg->slave_id;
-
 	hw->cfg = SPRD_DMA_DONOT_WAIT_BDONE << SPRD_DMA_WAIT_BDONE_OFFSET;
 
 	/*
-- 
2.30.2

