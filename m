Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C2E2F80
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 14:39:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7FC061288;
	Wed, 29 Sep 2021 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632926383;
	bh=nnq87NutyIOGGif5N+QrkzjWO+6VWs0z6DZ46avoARs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eqiziXnfY6Gb8Aqa7QR6beBqHy27XIjRrNUvvAZpBe8wAWCnLdAtcFyomIe7AQOpr
	 4y5Asa4+B80UxnB1HHcJhWNrtHtO1xZ3wY/gSf+jYnf98cFaKFzj08VOrxUhrIW7Xl
	 WhtES6XqwCW5MPr95wOLYo64luS6u1zSPfI8WRAF7ohJTYNANFQJlfrV9MLvFa+BQB
	 qRGrx+33hqKztnR5yfNuHpe7tcbvP77g91NjW7WEy/hhDjv2PbU7F3vMSN5g+9a7XX
	 6BT/cH+dKXao9KYoRKv24DJNK8fNaz/UswWiMxA+XjskLExRXFjir7NSfinIiFeJQq
	 T9KesJYV0X2ng==
Date: Wed, 29 Sep 2021 07:39:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Ariel Elior
 <aelior@marvell.com>, Bin Luo <luobin9@huawei.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Coiby Xu <coiby.xu@gmail.com>, Derek Chickles
 <dchickles@marvell.com>, drivers@pensando.io, Eric Dumazet
 <eric.dumazet@gmail.com>, Felix Manlunas <fmanlunas@marvell.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Geetha sowjanya <gakula@marvell.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com, hariprasad
 <hkelam@marvell.com>, Ido Schimmel <idosch@nvidia.com>,
 intel-wired-lan@lists.osuosl.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Jerin Jacob <jerinj@marvell.com>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>, Jiri Pirko <jiri@nvidia.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Linu Cherian <lcherian@marvell.com>,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, Manish Chopra
 <manishc@marvell.com>, Michael Chan <michael.chan@broadcom.com>, Moshe
 Shemesh <moshe@nvidia.com>, netdev@vger.kernel.org,
 oss-drivers@corigine.com, Richard Cochran <richardcochran@gmail.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Salil Mehta <salil.mehta@huawei.com>,
 Satanand Burla <sburla@marvell.com>, Shannon Nelson <snelson@pensando.io>,
 Shay Drory <shayd@nvidia.com>, Simon Horman <simon.horman@corigine.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Sunil Goutham
 <sgoutham@marvell.com>, Taras Chornyi <tchornyi@marvell.com>, Tariq Toukan
 <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 UNGLinuxDriver@microchip.com, Vadym Kochan <vkochan@marvell.com>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>
Subject: Re: [PATCH net-next v1 0/5] Devlink reload and missed notifications
 fix
Message-ID: <20210929073940.5d7ed022@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YVR0iKIRYDXQbD+o@unreal>
References: <cover.1632916329.git.leonro@nvidia.com>
	<20210929064004.3172946e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<YVR0iKIRYDXQbD+o@unreal>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Sep 2021 17:13:28 +0300 Leon Romanovsky wrote:
> On Wed, Sep 29, 2021 at 06:40:04AM -0700, Jakub Kicinski wrote:
> > On Wed, 29 Sep 2021 15:00:41 +0300 Leon Romanovsky wrote:  
> > > This series starts from the fixing the bug introduced by implementing
> > > devlink delayed notifications logic, where I missed some of the
> > > notifications functions.
> > > 
> > > The rest series provides a way to dynamically set devlink ops that is
> > > needed for mlx5 multiport device and starts cleanup by removing
> > > not-needed logic.
> > > 
> > > In the next series, we will delete various publish API, drop general
> > > lock, annotate the code and rework logic around devlink->lock.
> > > 
> > > All this is possible because driver initialization is separated from the
> > > user input now.  
> > 
> > Swapping ops is a nasty hack in my book.
> > 
> > And all that to avoid having two op structures in one driver.
> > Or to avoid having counters which are always 0?  
> 
> We don't need to advertise counters for feature that is not supported.
> In multiport mlx5 devices, the reload functionality is not supported, so
> this change at least make that device to behave like all other netdev
> devices that don't support devlink reload.
> 
> The ops structure is set very early to make sure that internal devlink
> routines will be able access driver back during initialization (btw very
> questionable design choice)

Indeed, is this fixable? Or now that devlink_register() was moved to 
the end of probe netdev can call ops before instance is registered?

> and at that stage the driver doesn't know
> yet which device type it is going to drive.
> 
> So the answer is:
> 1. Can't have two structures.

I still don't understand why. To be clear - swapping full op structures
is probably acceptable if it's a pure upgrade (existing pointers match).
Poking new ops into a structure (in alphabetical order if I understand
your reply to Greg, not destructor-before-contructor) is what I deem
questionable.

> 2. Same behaviour across all netdev devices.

Unclear what this is referring to.
