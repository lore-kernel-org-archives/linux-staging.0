Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6883034E769;
	Mon, 12 Jan 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215240; cv=none; b=NgZTAq52BhWp4KIr0tfeG1rOM3gXRLExOuK+79mUDLlUmyfT4Tl4VNyW5LulBcZmWt71EO4b5pv96FC4pFuVYa9ZAwGawgXKs03M1Yq+ooY7j16hn+hAhWvJlL+NQ1jumLIoqnJkEO1Fs1UjEtLaeE0T+qvYz7n+bEnOecY+ULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215240; c=relaxed/simple;
	bh=EFYoNGt9afBDMa/9nc6Tl+0jjps5q5kcwL/AxHtYrlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkTJqhi2hNesvDtUSuE3uO7mqMO+TDmGOZL6jV9a7t/s55Ey4OioKCaakAlXfh23q69Q4McFcnhBRAQLSq6ZdnCYwaWcbvHBZ+ltQR1Fy7+ve1mpMbzRv2RQtSGaoDGwFz6UddgUU2RvI7KubQ5JqOfaufn9bZyOsg1dX6EazDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ssxboldS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ssxboldS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35299C19422;
	Mon, 12 Jan 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768215239;
	bh=EFYoNGt9afBDMa/9nc6Tl+0jjps5q5kcwL/AxHtYrlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssxboldSOnofAIxtu513oa+MN1TPSB7OSDHCvG4wbXgwt+zDrqUPNkUMvQkmE0i33
	 J1bzWDmR25FCbNRgpiDDNhO/YNjwN//ZhVFK96/fYccZQqgyR5Ix9AysAsWoRGdBhF
	 rL665HKLNJIGKq+wY8PZHgTO0yv2AQVTqHVCh4Co=
Date: Mon, 12 Jan 2026 11:49:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: Remove port status typedefs
Message-ID: <2026011223-radiation-unethical-09b5@gregkh>
References: <20260112103843.22925-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112103843.22925-1-karthikey3608@gmail.com>

On Mon, Jan 12, 2026 at 04:08:43PM +0530, Karthikey Kadati wrote:
> Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs.
> 
> Replace them with struct cvmx_pip_port_status and struct cvmx_pko_port_status
> 
> to match Linux kernel coding style.
> 
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c     |  4 ++--
>  drivers/staging/octeon/octeon-stubs.h | 15 ++++++++-------
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index eadb74fc1..6d03d2346 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
>   */
>  static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
>  {
> -	cvmx_pip_port_status_t rx_status;
> -	cvmx_pko_port_status_t tx_status;
> +	struct cvmx_pip_port_status rx_status;
> +	struct cvmx_pko_port_status tx_status;
>  	struct octeon_ethernet *priv = netdev_priv(dev);
>  
>  	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 35b5078ba..3f90cfd0d 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
>  	} s;
>  };
>  
> -typedef struct {
> +struct cvmx_pip_port_status {
>  	uint32_t dropped_octets;
>  	uint32_t dropped_packets;
>  	uint32_t pci_raw_packets;
> @@ -409,13 +409,13 @@ typedef struct {
>  	uint32_t inb_packets;
>  	uint64_t inb_octets;
>  	uint16_t inb_errors;
> -} cvmx_pip_port_status_t;
> +};
>  
> -typedef struct {
> +struct cvmx_pko_port_status {
>  	uint32_t packets;
>  	uint64_t octets;
>  	uint64_t doorbell;
> -} cvmx_pko_port_status_t;
> +};
>  
>  union cvmx_pip_frm_len_chkx {
>  	uint64_t u64;
> @@ -1260,11 +1260,12 @@ static inline int octeon_is_simulation(void)
>  }
>  
>  static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
> -					    cvmx_pip_port_status_t *status)
> +					    struct cvmx_pip_port_status *status)
>  { }
>  
> -static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
> -					    cvmx_pko_port_status_t *status)
> +static inline void cvmx_pko_get_port_status(uint64_t port_num,
> +					      uint64_t clear,
> +					      struct cvmx_pko_port_status *status)
>  { }
>  
>  static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
> -- 
> 2.43.0
> 
> 
Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
