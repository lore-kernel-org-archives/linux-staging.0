Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C45FDA7;
	Sat,  7 Feb 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465378; cv=none; b=GHbQA1P2YP70ZnFzHR/KQxGkHefNwPZJu4RaMTUiXVJ8VOvkcBpTtC8r3fGBR2ui1ofBN/bPCv4+h6ERGlSEaFYK5aJdhC+sbtUDOzmxujpXDnyKa1YE315YygpSdgX3n144P6k80n3faQ6wMYmBcKud0TS1smNhT5jLxr/UVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465378; c=relaxed/simple;
	bh=2mM0S7N5GPkMjzvbCrNo/z3QYZKa86Imx7mc62Tw//g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY4S/rsoUpoiHFLWFwB5n2TrtDD/ZeULae7/5B+XR2YE2YnHatkfgC2owuSs80Z2a7m0hY2jmGzs84/xzVImzsOI+vB5CuVTsjj0GfMGryqe3VDcQ5KH1Pk1DXz8C9gv8CnOVmuDEA67vs1jWseyNv79a/t3YYEdDEMLNeLCCWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RQlZKAUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RQlZKAUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C00C116D0;
	Sat,  7 Feb 2026 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770465378;
	bh=2mM0S7N5GPkMjzvbCrNo/z3QYZKa86Imx7mc62Tw//g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQlZKAUwaf86mi1YdgH9/4eyS4v14k3B1qKH9RDTmS1EuaxU5+8GKJ/YnuSujC8xr
	 OICUAshzYD8fOFmTsCSqgKb1Eoxy309p8fKuZr94Af2NcMgdcAuoijr5ihNI9GMSiK
	 5PGJrGNMZEIT7sXKoTmsha6LsPi/ehLhz/11DReU=
Date: Sat, 7 Feb 2026 12:56:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: most: dim2: convert pr_info/err/warn to
 dev_info/err/warn
Message-ID: <2026020759-conductor-going-669d@gregkh>
References: <20260207023433.3935-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207023433.3935-1-zeeshanahmad022019@gmail.com>

On Sat, Feb 07, 2026 at 07:34:32AM +0500, Zeeshan Ahmad wrote:
> The dim2 driver currently uses generic pr_* logging macros. Hardware
> drivers should use the device-specific dev_* logging macros to provide
> better context in the system logs, especially in systems with multiple
> controller instances.
> 
> This patch converts all applicable logging calls in dim2.c to use the
> proper device-specific APIs.
> 
> Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> ---
> v3:
>  - Removed "staging-next" and redundant "[PATCH]" from the subject line.
>  - Shortened commit message lines to stay under 75 characters.
>  - Added this changelog below the "---" as suggested by Ethan Tidmore.
>  - Cleaned up temporary submission notes from the permanent commit body.
> v2:
>  - Rebased against the staging-next branch.
>  - Fixed CC list to include relevant maintainers.
> 
>  drivers/staging/most/dim2/dim2.c | 44 ++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 80af965356d0..4bcafda481f9 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -246,9 +246,9 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
>  {
>  	u8 *data = mbo->virt_address;
>  
> -	pr_info("Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
> +	dev_info(&dev->dev, "Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);

My review comments from your v1 patch remain the same here.

thanks,

greg k-h
