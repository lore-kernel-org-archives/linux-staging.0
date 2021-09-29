Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1FD29CA
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 13:07:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B56C613DA;
	Wed, 29 Sep 2021 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632920872;
	bh=Yukjau1sHLA6B/N3xjvNRV9Olu/CU/SlHx+B5dO3Emw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCEGI93aXv71iUXZzEJTr2TRq+w3ofeLRCnVE3mfUAwTgmo43LOO/x8xfal4Yn1Ze
	 5X71y4uQ8YRh7OnS2bZh3zt5QGH/d+GE6zboUgNaYqlOLi52ms5UVyyxV39ka0MEOc
	 Czm7DZiGEiitUVSNqCGOAnAaUcGcngUKxn7fUwdUbP4McZrhBmNWkEdjvdPSpoJgij
	 Op8x6hXOiS0e+qrOEdpoSZZBHRkELZgQJCbCuJYraJ3HdQU2dXmtZGQZ7z6+pf+E9p
	 00gA9nJxmMWYATc3ehdXmsvfP3HTePMl+KEh7MA/OvrjrQdLZyAiE5oQqMPds3v/pB
	 D+ilhSmpvuSsQ==
Date: Wed, 29 Sep 2021 16:07:49 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Ariel Elior <aelior@marvell.com>,
	Bin Luo <luobin9@huawei.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Coiby Xu <coiby.xu@gmail.com>,
	Derek Chickles <dchickles@marvell.com>,
	"drivers@pensando.io" <drivers@pensando.io>,
	Felix Manlunas <fmanlunas@marvell.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"GR-everest-linux-l2@marvell.com" <GR-everest-linux-l2@marvell.com>,
	"GR-Linux-NIC-Dev@marvell.com" <GR-Linux-NIC-Dev@marvell.com>,
	hariprasad <hkelam@marvell.com>, Ido Schimmel <idosch@nvidia.com>,
	Intel Corporation <linuxwwan@intel.com>,
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
	Loic Poulain <loic.poulain@linaro.org>,
	Manish Chopra <manishc@marvell.com>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Michael Guralnik <michaelgur@mellanox.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"oss-drivers@corigine.com" <oss-drivers@corigine.com>,
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
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	Vadym Kochan <vkochan@marvell.com>,
	Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [PATCH net-next v1 21/21] net: dsa: Move devlink registration to
 be last devlink command
Message-ID: <YVRlJagqFInXCgGZ@unreal>
References: <cover.1632565508.git.leonro@nvidia.com>
 <66dd7979b44ac307711c382054f428f9287666a8.1632565508.git.leonro@nvidia.com>
 <20210929130226.j53fcztm6utpt3tu@skbuf>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929130226.j53fcztm6utpt3tu@skbuf>

On Wed, Sep 29, 2021 at 01:02:27PM +0000, Vladimir Oltean wrote:
> Hi Leon,
> 
> On Sat, Sep 25, 2021 at 02:23:01PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > This change prevents from users to access device before devlink
> > is fully configured.
> >
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  net/dsa/dsa2.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
> > index a020339e1973..8ca6a1170c9d 100644
> > --- a/net/dsa/dsa2.c
> > +++ b/net/dsa/dsa2.c
> > @@ -848,7 +848,6 @@ static int dsa_switch_setup(struct dsa_switch *ds)
> >  	dl_priv = devlink_priv(ds->devlink);
> >  	dl_priv->ds = ds;
> >
> > -	devlink_register(ds->devlink);
> >  	/* Setup devlink port instances now, so that the switch
> >  	 * setup() can register regions etc, against the ports
> >  	 */
> > @@ -874,8 +873,6 @@ static int dsa_switch_setup(struct dsa_switch *ds)
> >  	if (err)
> >  		goto teardown;
> >
> > -	devlink_params_publish(ds->devlink);
> > -
> >  	if (!ds->slave_mii_bus && ds->ops->phy_read) {
> >  		ds->slave_mii_bus = mdiobus_alloc();
> >  		if (!ds->slave_mii_bus) {
> > @@ -891,7 +888,7 @@ static int dsa_switch_setup(struct dsa_switch *ds)
> >  	}
> >
> >  	ds->setup = true;
> > -
> > +	devlink_register(ds->devlink);
> >  	return 0;
> >
> >  free_slave_mii_bus:
> > @@ -906,7 +903,6 @@ static int dsa_switch_setup(struct dsa_switch *ds)
> >  	list_for_each_entry(dp, &ds->dst->ports, list)
> >  		if (dp->ds == ds)
> >  			dsa_port_devlink_teardown(dp);
> > -	devlink_unregister(ds->devlink);
> >  	devlink_free(ds->devlink);
> >  	ds->devlink = NULL;
> >  	return err;
> > @@ -919,6 +915,9 @@ static void dsa_switch_teardown(struct dsa_switch *ds)
> >  	if (!ds->setup)
> >  		return;
> >
> > +	if (ds->devlink)
> > +		devlink_unregister(ds->devlink);
> > +
> >  	if (ds->slave_mii_bus && ds->ops->phy_read) {
> >  		mdiobus_unregister(ds->slave_mii_bus);
> >  		mdiobus_free(ds->slave_mii_bus);
> > @@ -934,7 +933,6 @@ static void dsa_switch_teardown(struct dsa_switch *ds)
> >  		list_for_each_entry(dp, &ds->dst->ports, list)
> >  			if (dp->ds == ds)
> >  				dsa_port_devlink_teardown(dp);
> > -		devlink_unregister(ds->devlink);
> >  		devlink_free(ds->devlink);
> >  		ds->devlink = NULL;
> >  	}
> > --
> > 2.31.1
> >
> 
> Sorry, I did not have time to review/test this change earlier.
> I now see this WARN_ON being triggered when I boot a board:

Sorry about that, it was missed in one of my rebases.
The fix was posted here.
https://lore.kernel.org/all/2ed1159291f2a589b013914f2b60d8172fc525c1.1632916329.git.leonro@nvidia.com

Thanks
