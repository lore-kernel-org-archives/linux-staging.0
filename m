Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DC62F27
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 16:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BB1C433C1;
	Mon, 31 Oct 2022 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667234990;
	bh=QI8zw9/JvSlOn+sVbxNRsxyM4n7AqGNg4R4xhEVvo7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMKVPWPzdFUgYyT3Rr/v9ennfGrHwgxl9RDutESfJaTt7gqd0PY0YMsVYDkpt3OEP
	 B7+TYmfdYUDeeSKPqt+Z/CGkXD1gUySp+t4K2FGVV+d1sAhXO29EYxUKH7M05xu+ZH
	 cvn9CidAEIhCB3PHbdMdbQn/hIQ1teS2znU0vW0M=
Date: Mon, 31 Oct 2022 17:50:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: drake@draketalley.com
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: qlge: replace msleep with usleep_range
Message-ID: <Y1/85jGvMRAJ8bYh@kroah.com>
References: <20221031142516.266704-1-drake@draketalley.com>
 <20221031142516.266704-3-drake@draketalley.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031142516.266704-3-drake@draketalley.com>

On Mon, Oct 31, 2022 at 10:25:15AM -0400, drake@draketalley.com wrote:
> From: Drake Talley <drake@draketalley.com>
> 
> Since msleep may delay for up to 20ms, usleep_range is recommended for
> short durations in the docs linked in the below warning.  I set the
> range to 1000-2000 based on looking at other usages of usleep_range.
> 
> Reported by checkpatch:
> 
> WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> 
> Signed-off-by: Drake Talley <drake@draketalley.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index 8c1fdd8ebba0..c8403dbb5bad 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -3890,7 +3890,7 @@ static int qlge_close(struct net_device *ndev)
>  	 * (Rarely happens, but possible.)
>  	 */
>  	while (!test_bit(QL_ADAPTER_UP, &qdev->flags))
> -		msleep(1);
> +		usleep_range(1000, 2000);

Please see the mailing list archives for why making this type of change
without the hardware to test it is not a good idea.

sorry,

greg k-h
