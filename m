Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D214AD20;
	Sun, 15 Mar 2026 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773557709; cv=none; b=Ligu55/4Qz7Wax971vxrS531a7nNBC7N4XikNECrzjIW4XV93+l/475N+gqWsEOhceKzrnhL4bxkbh2ktfe5gbl3VNQiWUEC1OEksrU2Pcbq0TbR8egmmJxfNRPuWzSL2EbFjcZl9/CLGyWigxEvliz/M+PFWcg9fpUZmmfwNgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773557709; c=relaxed/simple;
	bh=oZl9OeDVUSWMobd2bAcZibv5HFomgwGqRMWa90yVF/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGFbFD8wzz2sjY6SihOnhzQdm6Do/FpbHWDUzWMD3x8uLbAiFT86sANMOR+ry6iEYUlgmQ/OpD/bJkd0c1o9WNmEjz+I4IekY6OiSFTVmVJHRu9NljP1GnlIWpEs2TtxgekwFaGYAftln41CGzs9uvFcqkbZzj0R3/HswSt/QWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e7fYt2B3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e7fYt2B3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6389BC4CEF7;
	Sun, 15 Mar 2026 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773557708;
	bh=oZl9OeDVUSWMobd2bAcZibv5HFomgwGqRMWa90yVF/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7fYt2B3PfjuTRnGRGt3BjI4jH9YGslf1GCt0sQHSyehrT4kusUlQps44AbP8AaoT
	 Txy2io5zL3Mb9LNnvL/1aEcngXzSUPDX5Qt/YFohf5oIApnLPxRyqd6j3thbzvtBJn
	 JJP98HPHHx3oIDIhM7AHF868xcih7ay2WRxFsD8Q=
Date: Sun, 15 Mar 2026 07:54:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Giacomo Di Clerico <giacomodiclerico@gmail.com>
Cc: akhilesh@ee.iitb.ac.in, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix missing blank line after
 declaration
Message-ID: <2026031510-answering-rack-fe40@gregkh>
References: <20260314220503.35991-1-giacomodiclerico@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314220503.35991-1-giacomodiclerico@gmail.com>

On Sat, Mar 14, 2026 at 11:05:03PM +0100, Giacomo Di Clerico wrote:
> Add a blank line between the last variable declaration and the
> function pointer declaration in struct tsi148_driver, as required
> by the kernel coding style.
> 
> Signed-off-by: Giacomo Di Clerico <giacomodiclerico@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
> index f73ac92320bb..3102b94a0a86 100644
> --- a/drivers/staging/vme_user/vme_tsi148.h
> +++ b/drivers/staging/vme_user/vme_tsi148.h
> @@ -34,6 +34,7 @@ struct tsi148_driver {
>  	void __iomem *base;	/* Base Address of device registers */
>  	wait_queue_head_t dma_queue[2];
>  	wait_queue_head_t iack_queue;
> +
>  	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
>  	void *lm_data[4];
>  	void *crcsr_kernel;

This is all a list of variables, no need for an extra line here.

thanks,

greg k-h
