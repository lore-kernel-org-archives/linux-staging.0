Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A826F7E
	for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 15:36:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso13423041wmr.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Apr 2023 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681400160; x=1683992160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r6I2G6BkP+bNNZVfkmIhLe91i4VfsEWmmDNeAoNhNEI=;
        b=Ehru/xIlXIEJpYxPqbLviYrViaTVbkbA1dyTiW2JnizwpU4IqbMWB7VoEnke5BsXTh
         pAbB8aF0qJeUfxoOk/bZIRbMM569dov8jKGDCKpxG3bIIEVbclwZeKdvyPsn6W3DZ5i5
         Adk493lPuAiNf6Tnjpu6AG4oEta3qjU4jEkUtalazmfakd+uLtR6MlARCYHsRblH+aIq
         snWw75q762whWWCGtGb1Cv+kHrbubsWa3ASY72v3IzVdVVYlkvUnActQWs/eYhx1FsYx
         SnQ/io84EL7rIij1niKqMVLDHjPRjEXFpnt7pnRSJFXURE8rs5cqiHCk31I/4TtnqvdZ
         crBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681400160; x=1683992160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6I2G6BkP+bNNZVfkmIhLe91i4VfsEWmmDNeAoNhNEI=;
        b=WzXUC4PFq9Zg7gMApKlSuvC0jrgR/AhFpIaeoVT1rhCJYjhAhDZIKG/u7+c2gRIupQ
         g9Px3aegxZWH+VwWimwU+tgCPN2tVBm7U9mEUbY+uXO0Mkqi5quQeVH/4dP1PDl7CmO9
         xM7Gk775DhSO9jx4qhA85vTtcgpnaQUpKoAbewXoS2GpSCv9ebvl/V9dfU5RspChbFxQ
         ukFxMrFVia00AUuoqLTxOTEHYUruET8vKIDJ1x6zfqCZzTc0VW/Bq0t9xkvRqMvHgV8k
         Tt0yAoJMnG75l+x5b9lM5BGKwpu/eaLbZ6CwVPalbWx2/wzvlDpcizmRzRJpatPWh3yg
         2qSQ==
X-Gm-Message-State: AAQBX9fgd4h6XibVl9HhdBd3aCxJfN3Oo6AF67xcXmbFXqVgKQQ7awCo
	03PP0lHGYtgx1Gjac8u0WkE=
X-Google-Smtp-Source: AKy350YoLsyin4t111fcr0f1FnNC8cGvjNnrOymbTwNfHPjUsySFXoJjUar5/nzzdD/aN0kPHXp11w==
X-Received: by 2002:a7b:c3cc:0:b0:3f0:310c:165 with SMTP id t12-20020a7bc3cc000000b003f0310c0165mr2121102wmj.28.1681400159600;
        Thu, 13 Apr 2023 08:35:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bcb89000000b003edc11c2ecbsm2118935wmi.4.2023.04.13.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 08:35:59 -0700 (PDT)
Date: Thu, 13 Apr 2023 18:35:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ladislav Michl <oss-lists@triops.cz>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [RFC 3/3] staging: octeon: convert to use phylink
Message-ID: <0af60abb-d599-4fdd-9bf6-ccf14524fe44@kili.mountain>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgOZZb2LrlFEEbv@lenoch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgOZZb2LrlFEEbv@lenoch>

On Thu, Apr 13, 2023 at 04:15:01PM +0200, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

We always insist that every commit needs a commit message.

Why are you doing this?  Does this have any effect for the user?
Imagine you are a power user and something stops working and they are
reviewing the git log to see if it's intentional or not.

> ---
>  drivers/staging/octeon/Kconfig           |   2 +-
>  drivers/staging/octeon/ethernet-mdio.c   | 171 ++++++++++++++---------
>  drivers/staging/octeon/ethernet-rgmii.c  |  13 +-
>  drivers/staging/octeon/ethernet.c        |  64 +++------
>  drivers/staging/octeon/octeon-ethernet.h |   8 +-
>  5 files changed, 136 insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/staging/octeon/Kconfig b/drivers/staging/octeon/Kconfig
> index 5319909eb2f6..fda90025710d 100644
> --- a/drivers/staging/octeon/Kconfig
> +++ b/drivers/staging/octeon/Kconfig
> @@ -3,7 +3,7 @@ config OCTEON_ETHERNET
>  	tristate "Cavium Networks Octeon Ethernet support"
>  	depends on CAVIUM_OCTEON_SOC || COMPILE_TEST
>  	depends on NETDEVICES
> -	select PHYLIB
> +	select PHYLINK
>  	select MDIO_OCTEON
>  	help
>  	  This driver supports the builtin ethernet ports on Cavium
> diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
> index b3049108edc4..a14fb4dbb2fd 100644
> --- a/drivers/staging/octeon/ethernet-mdio.c
> +++ b/drivers/staging/octeon/ethernet-mdio.c
> @@ -9,7 +9,7 @@
>  #include <linux/ethtool.h>
>  #include <linux/phy.h>
>  #include <linux/ratelimit.h>
> -#include <linux/of_mdio.h>

Removing this include seems unrelated?

> +#include <linux/of_net.h>
>  #include <generated/utsrelease.h>
>  #include <net/dst.h>
>  
> @@ -26,23 +26,27 @@ static void cvm_oct_get_drvinfo(struct net_device *dev,
>  	strscpy(info->bus_info, "Builtin", sizeof(info->bus_info));
>  }
>  
> -static int cvm_oct_nway_reset(struct net_device *dev)
> +static int cvm_oct_get_link_ksettings(struct net_device *dev,
> +				      struct ethtool_link_ksettings *cmd)
>  {
> -	if (!capable(CAP_NET_ADMIN))
> -		return -EPERM;
> +	struct octeon_ethernet *priv = netdev_priv(dev);
> +
> +	return phylink_ethtool_ksettings_get(priv->phylink, cmd);
> +}
>  
> -	if (dev->phydev)
> -		return phy_start_aneg(dev->phydev);
> +static int cvm_oct_set_link_ksettings(struct net_device *dev,
> +				      const struct ethtool_link_ksettings *cmd)
> +{
> +	struct octeon_ethernet *priv = netdev_priv(dev);
>  
> -	return -EINVAL;
> +	return phylink_ethtool_ksettings_set(priv->phylink, cmd);
>  }
>  
>  const struct ethtool_ops cvm_oct_ethtool_ops = {
>  	.get_drvinfo = cvm_oct_get_drvinfo,
> -	.nway_reset = cvm_oct_nway_reset,
>  	.get_link = ethtool_op_get_link,
> -	.get_link_ksettings = phy_ethtool_get_link_ksettings,
> -	.set_link_ksettings = phy_ethtool_set_link_ksettings,
> +	.get_link_ksettings = cvm_oct_get_link_ksettings,
> +	.set_link_ksettings = cvm_oct_set_link_ksettings,
>  };
>  
>  /**
> @@ -55,53 +59,80 @@ const struct ethtool_ops cvm_oct_ethtool_ops = {
>   */
>  int cvm_oct_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
>  {
> -	if (!netif_running(dev))
> -		return -EINVAL;
> +	struct octeon_ethernet *priv = netdev_priv(dev);
>  
> -	if (!dev->phydev)
> -		return -EINVAL;
> +	return phylink_mii_ioctl(priv->phylink, rq, cmd);
> +}
>  
> -	return phy_mii_ioctl(dev->phydev, rq, cmd);
> +static void cvm_oct_mac_get_state(struct phylink_config *config,
> +				  struct phylink_link_state *state)
> +{
> +	union cvmx_helper_link_info link_info;
> +	struct net_device *dev = to_net_dev(config->dev);
> +	struct octeon_ethernet *priv = netdev_priv(dev);
> +
> +	link_info = cvmx_helper_link_get(priv->port);
> +	state->link = link_info.s.link_up;
> +	state->duplex = link_info.s.full_duplex ? DUPLEX_FULL : DUPLEX_HALF;
> +	state->speed = link_info.s.speed;
>  }
>  
> -void cvm_oct_note_carrier(struct octeon_ethernet *priv,
> -			  union cvmx_helper_link_info li)
> +static void cvm_oct_mac_config(struct phylink_config *config,
> +			       unsigned int mode,
> +			       const struct phylink_link_state *state)
>  {
> -	if (li.s.link_up) {
> -		pr_notice_ratelimited("%s: %u Mbps %s duplex, port %d, queue %d\n",
> -				      netdev_name(priv->netdev), li.s.speed,
> -				      (li.s.full_duplex) ? "Full" : "Half",
> -				      priv->port, priv->queue);
> -	} else {
> -		pr_notice_ratelimited("%s: Link down\n",
> -				      netdev_name(priv->netdev));
> -	}
>  }

Delete this dummy function.

>  
> -void cvm_oct_adjust_link(struct net_device *dev)
> +static void cvm_oct_mac_link_down(struct phylink_config *config,
> +				  unsigned int mode, phy_interface_t interface)
>  {
> +	union cvmx_helper_link_info link_info;
> +	struct net_device *dev = to_net_dev(config->dev);
>  	struct octeon_ethernet *priv = netdev_priv(dev);
> +
> +	link_info.u64		= 0;
> +	link_info.s.link_up	= 0;
> +	link_info.s.full_duplex = 0;
> +	link_info.s.speed	= 0;

Just do this in the initializer:

	union cvmx_helper_link_info link_info = {};

> +	priv->link_info		= link_info.u64;

Best to not align anything in a .c file.  Stuff in .c files changes a
lot and then when you change it you have to re-indent everything.  And
it's like, *ugh*, is re-indenting supposed to be done in a follow on
patch?

The "link_info.u64" also zeroes everything so the rest was already
duplicative...

> +
> +	cvmx_helper_link_set(priv->port, link_info);
> +
> +	priv->poll_used = false;
> +}
> +
> +static void cvm_oct_mac_link_up(struct phylink_config *config,
> +				struct phy_device *phy,
> +				unsigned int mode, phy_interface_t interface,
> +				int speed, int duplex,
> +				bool tx_pause, bool rx_pause)
> +{
>  	union cvmx_helper_link_info link_info;
> +	struct net_device *dev = to_net_dev(config->dev);
> +	struct octeon_ethernet *priv = netdev_priv(dev);
>  
>  	link_info.u64		= 0;
> -	link_info.s.link_up	= dev->phydev->link ? 1 : 0;
> -	link_info.s.full_duplex = dev->phydev->duplex ? 1 : 0;
> -	link_info.s.speed	= dev->phydev->speed;
> +	link_info.s.link_up	= 1;
> +	link_info.s.full_duplex = duplex == DUPLEX_FULL ? 1 : 0;
> +	link_info.s.speed	= speed;
>  	priv->link_info		= link_info.u64;
>  
> -	/*
> -	 * The polling task need to know about link status changes.
> -	 */
> -	if (priv->poll)
> -		priv->poll(dev);
> +	cvmx_helper_link_set(priv->port, link_info);
>  
> -	if (priv->last_link != dev->phydev->link) {
> -		priv->last_link = dev->phydev->link;
> -		cvmx_helper_link_set(priv->port, link_info);
> -		cvm_oct_note_carrier(priv, link_info);
> +	if (!phy && priv->poll) {
> +		priv->poll_used = true;
> +		priv->poll(dev);
>  	}
>  }
>  
> +static const struct phylink_mac_ops cvm_oct_phylink_ops = {
> +	.validate = phylink_generic_validate,
> +	.mac_pcs_get_state = cvm_oct_mac_get_state,
> +	.mac_config = cvm_oct_mac_config,
> +	.mac_link_down = cvm_oct_mac_link_down,
> +	.mac_link_up = cvm_oct_mac_link_up,
> +};
> +
>  int cvm_oct_common_stop(struct net_device *dev)
>  {
>  	struct octeon_ethernet *priv = netdev_priv(dev);
> @@ -116,15 +147,14 @@ int cvm_oct_common_stop(struct net_device *dev)
>  
>  	priv->poll = NULL;
>  
> -	if (dev->phydev)
> -		phy_disconnect(dev->phydev);
> +	phylink_stop(priv->phylink);
> +	phylink_disconnect_phy(priv->phylink);
>  
>  	if (priv->last_link) {
>  		link_info.u64 = 0;
>  		priv->last_link = 0;
>  
>  		cvmx_helper_link_set(priv->port, link_info);
> -		cvm_oct_note_carrier(priv, link_info);
>  	}
>  	return 0;
>  }
> @@ -138,34 +168,45 @@ int cvm_oct_common_stop(struct net_device *dev)
>   */
>  int cvm_oct_phy_setup_device(struct net_device *dev)
>  {
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
>  	struct octeon_ethernet *priv = netdev_priv(dev);
> -	struct device_node *phy_node;
> -	struct phy_device *phydev = NULL;
>  
> -	if (!priv->of_node)
> -		goto no_phy;
> -
> -	phy_node = of_parse_phandle(priv->of_node, "phy-handle", 0);
> -	if (!phy_node && of_phy_is_fixed_link(priv->of_node))
> -		phy_node = of_node_get(priv->of_node);
> -	if (!phy_node)
> -		goto no_phy;
> +	priv->phylink_config.dev = &dev->dev;
> +	priv->phylink_config.type = PHYLINK_NETDEV;
> +	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
> +						MAC_10 | MAC_100 | MAC_1000;
> +	__set_bit(PHY_INTERFACE_MODE_MII,
> +		  priv->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_RMII,
> +		  priv->phylink_config.supported_interfaces);
> +
> +	switch (priv->imode) {
> +	case CVMX_HELPER_INTERFACE_MODE_RGMII:
> +		phy_interface_set_rgmii(priv->phylink_config.supported_interfaces);
> +		break;
> +	case CVMX_HELPER_INTERFACE_MODE_SGMII:
> +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> +			  priv->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> +			  priv->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_QSGMII,
> +			  priv->phylink_config.supported_interfaces);
> +		break;
> +	default:
> +		break;
> +	}
>  
> -	phydev = of_phy_connect(dev, phy_node, cvm_oct_adjust_link, 0,
> -				priv->phy_mode);
> -	of_node_put(phy_node);
> +	if (of_get_phy_mode(priv->of_node, &phy_mode) == 0)
> +		priv->phy_mode = phy_mode;
>  
> -	if (!phydev)
> -		return -EPROBE_DEFER;
> +	phylink = phylink_create(&priv->phylink_config,
> +				 of_fwnode_handle(priv->of_node),
> +				 priv->phy_mode, &cvm_oct_phylink_ops);
> +	if (IS_ERR(phylink))
> +		return PTR_ERR(phylink);
>  
> -	priv->last_link = 0;
> -	phy_start(phydev);
> +	priv->phylink = phylink;
>  
> -	return 0;
> -no_phy:
> -	/* If there is no phy, assume a direct MAC connection and that
> -	 * the link is up.
> -	 */
> -	netif_carrier_on(dev);
>  	return 0;
>  }
> diff --git a/drivers/staging/octeon/ethernet-rgmii.c b/drivers/staging/octeon/ethernet-rgmii.c
> index 0c4fac31540a..8c6eb0b87254 100644
> --- a/drivers/staging/octeon/ethernet-rgmii.c
> +++ b/drivers/staging/octeon/ethernet-rgmii.c
> @@ -115,17 +115,8 @@ static void cvm_oct_rgmii_poll(struct net_device *dev)
>  
>  	cvm_oct_check_preamble_errors(dev);
>  
> -	if (likely(!status_change))
                   ^
Negated.

> -		return;
> -
> -	/* Tell core. */
> -	if (link_info.s.link_up) {
> -		if (!netif_carrier_ok(dev))
> -			netif_carrier_on(dev);
> -	} else if (netif_carrier_ok(dev)) {
> -		netif_carrier_off(dev);
> -	}
> -	cvm_oct_note_carrier(priv, link_info);
> +	if (likely(status_change))

Originally a status_change was unlikely but now it is likely.


> +		phylink_mac_change(priv->phylink, link_info.s.link_up);
>  }
>  
>  int cvm_oct_rgmii_open(struct net_device *dev)
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index 466d43a71d34..21892f805245 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -10,7 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
>  #include <linux/etherdevice.h>
> -#include <linux/phy.h>
> +#include <linux/phylink.h>
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_mdio.h>
> @@ -128,7 +128,7 @@ static void cvm_oct_periodic_worker(struct work_struct *work)
>  						    struct octeon_ethernet,
>  						    port_periodic_work.work);
>  
> -	if (priv->poll)
> +	if (priv->poll_used && priv->poll)
>  		priv->poll(cvm_oct_device[priv->port]);

The name poll_used was really confusing to me.  We set it before we've
done any polling so the tense is wrong.  I think it means that we should
not bother polling if the link is down...  Could we change the name to
->link_up?  Or maybe add a comment?

>  
>  	cvm_oct_device[priv->port]->netdev_ops->ndo_get_stats
> @@ -446,23 +446,20 @@ int cvm_oct_common_init(struct net_device *dev)
>  
>  void cvm_oct_common_uninit(struct net_device *dev)
>  {
> -	if (dev->phydev)
> -		phy_disconnect(dev->phydev);
> +	struct octeon_ethernet *priv = netdev_priv(dev);
> +
> +	cancel_delayed_work_sync(&priv->port_periodic_work);
> +	phylink_destroy(priv->phylink);
>  }
>  
>  int cvm_oct_common_open(struct net_device *dev,
>  			void (*link_poll)(struct net_device *))
>  {
> +	int err;

This is networking code so declarations need to be in reverse Christmas
tree order.

	long long_variable_name;
	medium variable_name;
	short name;

>  	union cvmx_gmxx_prtx_cfg gmx_cfg;
>  	struct octeon_ethernet *priv = netdev_priv(dev);
>  	int interface = INTERFACE(priv->port);
>  	int index = INDEX(priv->port);
> -	union cvmx_helper_link_info link_info;
> -	int rv;
> -
> -	rv = cvm_oct_phy_setup_device(dev);
> -	if (rv)
> -		return rv;
>  
>  	gmx_cfg.u64 = cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
>  	gmx_cfg.s.en = 1;
> @@ -473,20 +470,17 @@ int cvm_oct_common_open(struct net_device *dev,
>  	if (octeon_is_simulation())
>  		return 0;
>  
> -	if (dev->phydev) {
> -		int r = phy_read_status(dev->phydev);
> -
> -		if (r == 0 && dev->phydev->link == 0)
> -			netif_carrier_off(dev);
> -		cvm_oct_adjust_link(dev);
> -	} else {
> -		link_info = cvmx_helper_link_get(priv->port);
> -		if (!link_info.s.link_up)
> -			netif_carrier_off(dev);
> -		priv->poll = link_poll;
> -		link_poll(dev);
> +	err = phylink_of_phy_connect(priv->phylink, priv->of_node, 0);
> +	if (err) {
> +		netdev_err(dev, "Could not attach PHY (%d)\n", err);
> +		return err;
>  	}
>  
> +	priv->poll_used = false;
> +	priv->poll = link_poll;
> +
> +	phylink_start(priv->phylink);
> +
>  	return 0;
>  }
>  
> @@ -504,13 +498,7 @@ void cvm_oct_link_poll(struct net_device *dev)
>  	else
>  		priv->link_info = link_info.u64;
>  
> -	if (link_info.s.link_up) {
> -		if (!netif_carrier_ok(dev))
> -			netif_carrier_on(dev);
> -	} else if (netif_carrier_ok(dev)) {
> -		netif_carrier_off(dev);
> -	}
> -	cvm_oct_note_carrier(priv, link_info);
> +	phylink_mac_change(priv->phylink, link_info.s.link_up);
>  }
>  
>  static int cvm_oct_xaui_open(struct net_device *dev)
> @@ -797,7 +785,6 @@ static int cvm_oct_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	num_interfaces = cvmx_helper_get_number_of_interfaces();

This change is correct, but I wish it were in a different commit.  It
is unrelated.

>  	for (interface = 0; interface < num_interfaces; interface++) {
>  		int num_ports, port_index;
>  		const struct net_device_ops *ops;
> @@ -889,18 +876,15 @@ static int cvm_oct_probe(struct platform_device *pdev)
>  			dev->min_mtu = VLAN_ETH_ZLEN - mtu_overhead;
>  			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
>  
> -			if (priv->of_node && of_phy_is_fixed_link(priv->of_node)) {
> -				if (of_phy_register_fixed_link(priv->of_node)) {
> -					netdev_err(dev, "Failed to register fixed link for interface %d, port %d\n",
> -						   interface, priv->port);
> -					free_netdev(dev);
> -					continue;
> -				}
> +			if (cvm_oct_phy_setup_device(dev)) {
> +				free_netdev(dev);
> +				continue;

This was in the original code, but I don't think this is correct.  If
there is an error then we should return instead of continuing.  This
is especially true because cvm_oct_phy_setup_device() returns
-EPROBE_DEFER so in theory errors are a matter of course and we have a
way to recover from them.

>  			}
>  
>  			if (register_netdev(dev) < 0) {
>  				pr_err("Failed to register ethernet device for interface %d, port %d\n",
>  				       interface, priv->port);
> +				phylink_destroy(priv->phylink);

Could you create a wrapper around this so that it's more clear that
this matches cvm_oct_phy_setup_device()?

void cvm_oct_phy_free_device(struct net_device *dev)
{
	struct octeon_ethernet *priv = netdev_priv(dev);

	phylink_destroy(priv->phylink);
}

>  				free_netdev(dev);
>  			} else {
>  				cvm_oct_device[priv->port] = dev;
> @@ -938,8 +922,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
>  			struct net_device *dev = cvm_oct_device[port];
>  			struct octeon_ethernet *priv = netdev_priv(dev);
>  
> -			cancel_delayed_work_sync(&priv->port_periodic_work);
> -
> +			phylink_destroy(priv->phylink);

I don't understand how this works.  This call to:

	cancel_delayed_work_sync(&priv->port_periodic_work);

moved to cvm_oct_common_uninit().  But then why are we adding a
phylink_destroy(priv->phylink); when the phylink_destroy() is also done
in cvm_oct_common_uninit().

>  			unregister_netdev(dev);
>  			free_netdev(dev);
>  			cvm_oct_device[port] = NULL;
> @@ -969,9 +952,8 @@ static int cvm_oct_remove(struct platform_device *pdev)
>  			struct net_device *dev = cvm_oct_device[port];
>  			struct octeon_ethernet *priv = netdev_priv(dev);
>  
> -			cancel_delayed_work_sync(&priv->port_periodic_work);
> -
>  			cvm_oct_tx_shutdown_dev(dev);
> +			phylink_destroy(priv->phylink);

Same.

>  			unregister_netdev(dev);
>  			free_netdev(dev);
>  			cvm_oct_device[port] = NULL;

regards,
dan carpenter

