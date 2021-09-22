Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686572
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:22:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A880760FC1;
	Wed, 22 Sep 2021 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632316969;
	bh=RMLmKC2ffOq6sR/gzS529nDFxhd9wlS77MVexpDzG6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lkWzjNglpdHkDPCl+AybxJ57pkPgALNx9aV/Fy7QfdVVqQdxl3S9IifKmtR6bzPUm
	 sX0M6EVDQzdO/i1jX/kIjYrSlMhO3q2UFV3UOH5i56st5JIMfJ2fBmD9YzmUFV6qxO
	 ci39RgUEQ5V/AsXiKRYf1m6ECWmF6BSrN+cGtMMq7atGke9nHXLXmAeIz/xL2gWY7V
	 3bMA6Hc74s/osrSr5a2NocRFZq6W5fp9wNJrkzLeS6kpvj+Ag2GurH/Nzd3ddQPqV0
	 YNDFc+U1kLBFE75PKv4+2Wy5cE1s0/n2YI5SsKYoRpR1X9ziVH0w++LaLJHHhKrBTG
	 CyN3i7ALKNH7A==
Date: Wed, 22 Sep 2021 06:22:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Leon Romanovsky
 <leonro@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Ariel Elior <aelior@marvell.com>, Bin Luo
 <luobin9@huawei.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Coiby Xu
 <coiby.xu@gmail.com>, Derek Chickles <dchickles@marvell.com>,
 drivers@pensando.io, Felix Manlunas <fmanlunas@marvell.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Geetha sowjanya <gakula@marvell.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com, hariprasad
 <hkelam@marvell.com>, Ido Schimmel <idosch@nvidia.com>, Intel Corporation
 <linuxwwan@intel.com>, intel-wired-lan@lists.osuosl.org, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Jerin Jacob <jerinj@marvell.com>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>, Jiri Pirko <jiri@nvidia.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Linu Cherian <lcherian@marvell.com>,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, Loic Poulain
 <loic.poulain@linaro.org>, Manish Chopra <manishc@marvell.com>, M Chetan
 Kumar <m.chetan.kumar@intel.com>, Michael Chan <michael.chan@broadcom.com>,
 netdev@vger.kernel.org, oss-drivers@corigine.com, Richard Cochran
 <richardcochran@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, Salil Mehta
 <salil.mehta@huawei.com>, Satanand Burla <sburla@marvell.com>, Sergey
 Ryazanov <ryazanov.s.a@gmail.com>, Shannon Nelson <snelson@pensando.io>,
 Simon Horman <simon.horman@corigine.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, Taras Chornyi
 <tchornyi@marvell.com>, Tariq Toukan <tariqt@nvidia.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, UNGLinuxDriver@microchip.com, Vadym Kochan
 <vkochan@marvell.com>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>
Subject: Re: [PATCH net-next v1] devlink: Make devlink_register to be void
Message-ID: <20210922062246.26e38305@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <311a6c7e74ad612474446890a12c9d310b9507ed.1632300324.git.leonro@nvidia.com>
References: <311a6c7e74ad612474446890a12c9d310b9507ed.1632300324.git.leonro@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Sep 2021 11:58:03 +0300 Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> devlink_register() can't fail and always returns success, but all drivers
> are obligated to check returned status anyway. This adds a lot of boilerplate
> code to handle impossible flow.
> 
> Make devlink_register() void and simplify the drivers that use that
> API call.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Acked-by: Jakub Kicinski <kuba@kernel.org>
