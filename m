Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F02F37;
	Wed, 22 Mar 2023 19:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C1CC4339B;
	Wed, 22 Mar 2023 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679513446;
	bh=qb4Cqk1IJpCYq+KM7+9+6ckaVY3hfSvOkYqDCxvpBOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBKyr5mrDxlJzrv5/FpKNxCbNbgSfE4Q1NQ4Rio/BNAXn2noygE2iQHwIEVboxKut
	 wieKngtlSyTVSD0/DAgrwbDCjoS5rILrPm1lbawCZ0dQyueq20xbwpPrZsDA2Qy1o2
	 sZ83ifw44z+Ntiur8kEtv3agcsI+gO1fsRbhPZps=
Date: Wed, 22 Mar 2023 20:30:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com, Coiby Xu <coiby.xu@gmail.com>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: avoid multiple assignments
Message-ID: <ZBtXYxrrGtyCyBzK@kroah.com>
References: <ZBtVMs1wHWyyl2A6@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBtVMs1wHWyyl2A6@khadija-virtual-machine>

On Thu, Mar 23, 2023 at 12:21:22AM +0500, Khadija Kamran wrote:
> Linux kernel coding style does not allow multiple assignments on a
> single line.
> Avoid multiple assignments by assigning value to each variable in a
> separate line.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index 1ead7793062a..b35fb7db2a77 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -4085,7 +4085,11 @@ static struct net_device_stats *qlge_get_stats(struct net_device
>  	int i;
>  
>  	/* Get RX stats. */
> -	pkts = mcast = dropped = errors = bytes = 0;
> +	pkts = 0;
> +	mcast = 0;
> +	dropped = 0;
> +	errors = 0;
> +	bytes = 0;

Nah, the original is fine, it makes it more obvious what is happening.

thanks,

greg k-h
