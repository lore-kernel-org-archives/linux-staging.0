Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A372
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 11:24:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC77061288;
	Sat, 25 Sep 2021 11:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632569048;
	bh=UGe1xR5nQjl5sitWRrZO39MCG615CkI/XgeO5EfkyHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXJnTqgMbORVHaUsGV03ryKJr6A1PfdhYoeVsyCNEges2Dn9WZ7FE4+7QH3xqJvR9
	 Mz5qz1HhsuOgoYQOxRRc2geSU+85mrlqpccGRTMS5HNtlTD9qpZiA6BDhj7DVZhKv7
	 sj2HzVf0JYXhCn2l9u3cBQBv5vEik7dYiF8tPoahtV6EPb5DdE99UK8bicH0CXAY1W
	 HNyqws6BMBbppxtt3484q7TdwfEfbBOeq/bgChcm6v6hSMl1crla5Ovo4z8W/DKqtc
	 ElB0gliFBoCj4F940uxkATHVFsfX4EYpq0KC0xZ9LpCNrkxbV9d5shVyGsAIldIE1K
	 SK3ShGOLcii1A==
From: Leon Romanovsky <leon@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Ariel Elior <aelior@marvell.com>,
	Bin Luo <luobin9@huawei.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Coiby Xu <coiby.xu@gmail.com>,
	Derek Chickles <dchickles@marvell.com>,
	drivers@pensando.io,
	Felix Manlunas <fmanlunas@marvell.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	GR-everest-linux-l2@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	hariprasad <hkelam@marvell.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Intel Corporation <linuxwwan@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jerin Jacob <jerinj@marvell.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Linu Cherian <lcherian@marvell.com>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Manish Chopra <manishc@marvell.com>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Michael Guralnik <michaelgur@mellanox.com>,
	netdev@vger.kernel.org,
	oss-drivers@corigine.com,
	Richard Cochran <richardcochran@gmail.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Satanand Burla <sburla@marvell.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Shannon Nelson <snelson@pensando.io>,
	Simon Horman <simon.horman@corigine.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	UNGLinuxDriver@microchip.com,
	Vadym Kochan <vkochan@marvell.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH net-next v1 19/21] ptp: ocp: Move devlink registration to be last devlink command
Date: Sat, 25 Sep 2021 14:22:59 +0300
Message-Id: <1541e7cd8262ce9db7544669438d0f4360068dd2.1632565508.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632565508.git.leonro@nvidia.com>
References: <cover.1632565508.git.leonro@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

This change prevents from users to access device before devlink is
fully configured.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/ptp/ptp_ocp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 4c25467198e3..34f943c8c9fd 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2455,7 +2455,6 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENOMEM;
 	}
 
-	devlink_register(devlink);
 	err = pci_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "pci_enable_device\n");
@@ -2497,7 +2496,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out;
 
 	ptp_ocp_info(bp);
-
+	devlink_register(devlink);
 	return 0;
 
 out:
@@ -2506,7 +2505,6 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_disable:
 	pci_disable_device(pdev);
 out_unregister:
-	devlink_unregister(devlink);
 	devlink_free(devlink);
 	return err;
 }
@@ -2517,11 +2515,11 @@ ptp_ocp_remove(struct pci_dev *pdev)
 	struct ptp_ocp *bp = pci_get_drvdata(pdev);
 	struct devlink *devlink = priv_to_devlink(bp);
 
+	devlink_unregister(devlink);
 	ptp_ocp_detach(bp);
 	pci_set_drvdata(pdev, NULL);
 	pci_disable_device(pdev);
 
-	devlink_unregister(devlink);
 	devlink_free(devlink);
 }
 
-- 
2.31.1

