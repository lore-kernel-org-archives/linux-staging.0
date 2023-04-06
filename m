Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295C9AD47
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 20:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A76C4339C;
	Thu,  6 Apr 2023 20:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680811594;
	bh=X/qAhGx90u1TS6QAXF/fVAceMyuEhsw6EnQLbQ8YU7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1UWAmMsHJkGtHy0W20TC4T5RREAioQ2+I61odfTO1UBuKU2IdhJEILsCVbJg1tOg
	 H3fkG9GCiLMCUHviMsqVhu7xezduSSkXVdX12GzZ2Rnqi7NqJUcRZzj4GSmSU9lH6l
	 jwqTUtfRNe6fMQPthbezGJqywoU0TSxZwJaO5zz4=
Date: Thu, 6 Apr 2023 22:06:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8192e: Remove unused local variable
 irq_line
Message-ID: <ZC8mR9OjVlEdDMV-@kroah.com>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
 <6ec702e12cb30501fc81693a71a96b238bf09ea0.1680729716.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec702e12cb30501fc81693a71a96b238bf09ea0.1680729716.git.philipp.g.hortmann@gmail.com>

On Wed, Apr 05, 2023 at 11:48:20PM +0200, Philipp Hortmann wrote:
> Remove unused local variable irq_line.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> index 0bc3e013001e..1c3ccd2aabc3 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> @@ -33,11 +33,9 @@ bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
>  	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
>  	u16 device_id;
>  	u8  revision_id;
> -	u16 irq_line;
>  
>  	device_id = pdev->device;
>  	revision_id = pdev->revision;
> -	pci_read_config_word(pdev, 0x3C, &irq_line);

As was pointed out, that might not be "unused".

When doing a PCI write, the only way to know it has completed is to
issue a read.  Are you sure this isn't a read that is flushing out a
pending write?  Look at who calls this function and verify that this
read really is safe to remove and then document that really really well
in the changelog text when doing so.

Be careful about removing seemingly-unused PCI read/writes, they often
times are actually needed.

thanks,

greg k-h
