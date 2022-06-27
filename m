Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093C7A
	for <linux-staging@lists.linux.dev>; Mon, 27 Jun 2022 06:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592D1C341C8;
	Mon, 27 Jun 2022 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656310361;
	bh=W2/0teteKx2jKh62N7fViXyxu1HRRs2lr8rLVK7gCDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7vQQT8frFHoW4CkPAMikjrxvebCo4Uu0esCk6+7yWtls7SsB0dxdoWmWz449dFSF
	 R+JZiZ+JTLIJPrBof0nyZRRphEriuaCd1+SM+gFkpfFHXWq0H7Q7LFKodKg6Bophqp
	 zhKSkDZar0xwzgmNcKGrU8b0SVN/Rm8JSZ3NSXzQ=
Date: Mon, 27 Jun 2022 08:12:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arun Vijayshankar <arunvijayshankar@gmail.com>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: replace msleep with usleep_range
Message-ID: <YrlKVg7ZN9yhTOvt@kroah.com>
References: <Yrk3zeyzSJ0424Aa@sug>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yrk3zeyzSJ0424Aa@sug>

On Sun, Jun 26, 2022 at 09:53:33PM -0700, Arun Vijayshankar wrote:
> qlge_close uses msleep for 1ms, in which case (1 - 20ms) it is preferable
> to use usleep_range in non-atomic contexts, as documented in
> Documentation/timers/timers-howto.rst. A range of 1 - 1.05ms is
> specified here, in case the device takes slightly longer than 1ms to recover from
> reset.
> 
> Signed-off-by: Arun Vijayshankar <arunvijayshankar@gmail.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index 689a87d58f27..3cc4f1902c80 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -3886,7 +3886,7 @@ static int qlge_close(struct net_device *ndev)
>  	 * (Rarely happens, but possible.)
>  	 */
>  	while (!test_bit(QL_ADAPTER_UP, &qdev->flags))
> -		msleep(1);
> +		usleep_range(1000, 1050);

Have you tested this with a device?  Doing these types of changes
without access to the hardware isn't a good idea.

Also, a loop that has the chance to never end should be fixed up, don't
you think?

thanks,

greg k-h
