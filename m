Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885135FDA7;
	Sat,  7 Feb 2026 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465276; cv=none; b=Q0OeukLtgKYjiqaIB74a3PYTYy1LA3Q7ohyowCaZPcplEM7g3nIbLhYQdrNdgaHubUyIT70f9keMnmbyZ1JB938asjkOrqKsKUlC0VkvJZ38ECKj5nXfjEJfzlu9+OMrPncPS++NWGT6GnWoEzU9MBtyeSmOXAcSJMu1kHD3GH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465276; c=relaxed/simple;
	bh=/dU81hJwN/EEH94eAg2v7zQohBkOGSN1p8jB3SZlKD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOmrAjpLFOEYtm67al3oB7G2OMupXhyYVIcTZtOD9U31udBzcdbmlepY5OetUXW6nD02QexjSAvWsgAkZqFEI8FlWJexJV4IXG4O9Aw5c+jpYDvtLkLqXjfDH3SoLHC4I5PlsukSRQiyV3QOkjPdJIPBw0cjlEBikkOQv7yh4TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IaTpcb/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IaTpcb/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95141C116D0;
	Sat,  7 Feb 2026 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770465276;
	bh=/dU81hJwN/EEH94eAg2v7zQohBkOGSN1p8jB3SZlKD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaTpcb/S1LiNY30g7sNweluL8xCa7UMUVvfnEd5xohdU677/EQv0VVTyreWGV33UJ
	 3hlqCN573/wMJmf+/rJNe1/jG9Gh+CX8M9VnghjEKVPdOcnf3jmhrYyeivbrHsxJmN
	 XuVGaQ2HBH3dHpO1FyaJsw5BcD47UjMp0WBjgDw8=
Date: Sat, 7 Feb 2026 12:54:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: convert pr_info/err/warn to
 dev_info/err/warn
Message-ID: <2026020739-oat-tinker-84a6@gregkh>
References: <20260205191315.8936-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205191315.8936-1-zeeshanahmad022019@gmail.com>

On Fri, Feb 06, 2026 at 12:13:14AM +0500, Zeeshan Ahmad wrote:
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
>  drivers/staging/most/dim2/dim2.c | 44 ++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index dad2abe6c0c9..e6d99d9009b5 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -244,9 +244,9 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
>  {
>  	u8 *data = mbo->virt_address;
>  
> -	pr_info("Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
> +	dev_info(&dev->dev, "Node Address: 0x%03x\n", (u16)data[16] << 8 | data[17]);
>  	dev->link_state = data[18];
> -	pr_info("NIState: %d\n", dev->link_state);
> +	dev_info(&dev->dev, "NIState: %d\n", dev->link_state);

This is a nice start, but when drivers work properly, they should be
quiet.  Can you make this a 2 patch series, the first getting rid of
these "extra" messages (or moving them to dev_dbg()) and the second
doing the other conversions?

thanks,

greg k-h
