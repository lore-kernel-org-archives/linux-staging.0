Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42AD29CA
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 14:20:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8794A613A7;
	Wed, 29 Sep 2021 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632925204;
	bh=/rFaJ/GWthiiFP4i+etBeG9LoeoqNtBGaxI8dkwdWLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLQUd2R30FU25Q/pjWqD86gU0LXsOCAmuWbfatlF3n9gTH/eVaBbejlM0Y/nVbnww
	 8jJK3Ke33wZm6ugH6Iwao5v/m8+mvqJq+4a7nfRpiRrv+xzQcP/yJ4PDuwunfqH/Ob
	 1RnQUotHpv3iGcDBBaH7bDCo9PvtoHSrHZnzp5nZlP4jWZNcBRh4TmjOW9XEgPOpSD
	 YP8Iq1E1hWL3yKuRMZoba9u7eh6W6tEUcP1pl6UEhCfZkZRWyOXComIOAdaKdiPagT
	 ST6EvIYLEbPG4Px00nnpK6oecE1OnqFOF1L4ql37gIAiW5GyKg9MULEYCT5Z8EGHa8
	 eLZbXug7Mf1tA==
Date: Wed, 29 Sep 2021 17:20:01 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Ariel Elior <aelior@marvell.com>,
	Bin Luo <luobin9@huawei.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Coiby Xu <coiby.xu@gmail.com>,
	Derek Chickles <dchickles@marvell.com>,
	"drivers@pensando.io" <drivers@pensando.io>,
	Eric Dumazet <eric.dumazet@gmail.com>,
	Felix Manlunas <fmanlunas@marvell.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"GR-everest-linux-l2@marvell.com" <GR-everest-linux-l2@marvell.com>,
	"GR-Linux-NIC-Dev@marvell.com" <GR-Linux-NIC-Dev@marvell.com>,
	hariprasad <hkelam@marvell.com>, Ido Schimmel <idosch@nvidia.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jerin Jacob <jerinj@marvell.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Linu Cherian <lcherian@marvell.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	Manish Chopra <manishc@marvell.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Moshe Shemesh <moshe@nvidia.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"oss-drivers@corigine.com" <oss-drivers@corigine.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Satanand Burla <sburla@marvell.com>,
	Shannon Nelson <snelson@pensando.io>, Shay Drory <shayd@nvidia.com>,
	Simon Horman <simon.horman@corigine.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	Vadym Kochan <vkochan@marvell.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>
Subject: Re: [PATCH net-next v1 0/5] Devlink reload and missed notifications
 fix
Message-ID: <YVR2EYrklpj+CSfo@unreal>
References: <cover.1632916329.git.leonro@nvidia.com>
 <20210929064004.3172946e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20210929134637.4wlbd5ehbgc55cuo@skbuf>
 <20210929065621.20cb08ad@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929065621.20cb08ad@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>

On Wed, Sep 29, 2021 at 06:56:21AM -0700, Jakub Kicinski wrote:
> On Wed, 29 Sep 2021 13:46:38 +0000 Vladimir Oltean wrote:
> > On Wed, Sep 29, 2021 at 06:40:04AM -0700, Jakub Kicinski wrote:
> > > Swapping ops is a nasty hack in my book.
> > >
> > > And all that to avoid having two op structures in one driver.
> > > Or to avoid having counters which are always 0?
> > >
> > > Sorry, at the very least you need better explanation for this.  
> > 
> > Leon, while the discussion about this unfolds, can you please repost
> > patch 1 separately? :)
> 
> Yes, please and thanks! :)

Done, thanks
https://lore.kernel.org/netdev/2ed1159291f2a589b013914f2b60d8172fc525c1.1632925030.git.leonro@nvidia.com/T/#u
