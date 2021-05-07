Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB271
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 06:27:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EEC061154;
	Fri,  7 May 2021 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620368867;
	bh=g1Waw8S6g5srkV3sVXlOHNgN6nlneoJfnIMAns1P+VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3PEIreIaW+nzWBEdSVfqdJhwEdc7NN2leomcf4N40HwAPfbHgdf7YujMkCYmvX0w
	 XTz2sIWLKvRx3AQny+FBTl0mCFB8WygbodegvGHknye+iUaV6Si7889MDZKi0/K/Bi
	 e+rhleY+RpuarDC9B8Q4yOoIqRwYiGIIFUMnTqGU=
Date: Fri, 7 May 2021 08:27:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, kishon@ti.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	neil@brown.name, ilya.lipnitskiy@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: ralink: phy-mt7621-pci: properly print pointer
 address
Message-ID: <YJTd4cl6ZsPieC1b@kroah.com>
References: <20210507060142.17049-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507060142.17049-1-sergio.paracuellos@gmail.com>

On Fri, May 07, 2021 at 08:01:42AM +0200, Sergio Paracuellos wrote:
> The way of printing the pointer address for the 'port_base'
> address got into compile warnings on some architectures
> [-Wpointer-to-int-cast]. Instead of use '%08x' and cast
> to an 'unsigned int' just make use of '%px' and avoid the
> cast.
> 
> Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
> index 753cb5bab930..4705931fb072 100644
> --- a/drivers/phy/ralink/phy-mt7621-pci.c
> +++ b/drivers/phy/ralink/phy-mt7621-pci.c
> @@ -272,8 +272,8 @@ static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
>  
>  	mt7621_phy->has_dual_port = args->args[0];
>  
> -	dev_info(dev, "PHY for 0x%08x (dual port = %d)\n",
> -		 (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
> +	dev_info(dev, "PHY for 0x%px (dual port = %d)\n",
> +		 mt7621_phy->port_base, mt7621_phy->has_dual_port);

This whole message should be dropped as drivers should be quiet if all
is going well, and only print messages when things go wrong.

And why cc: linux-staging?

thanks,

greg k-h
