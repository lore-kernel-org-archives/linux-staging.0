Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B533CD8CC
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223161; cv=none; b=DzVBzgc5Zz15HhsKSdum2DiFp7P4euxxUGiD2n5dYDSvkYJnRQGDbEcPWnZ7dqe6Ex9qmwjkDVsJoHGlvAWhNAhMa4Wf3cv8WwaKTtlM9NRGE2jUzMQj8ub/gecY/dhdXflIf+XlLNktDzo4k3kxh1YJNGbxh7q7IG075c3QVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223161; c=relaxed/simple;
	bh=27gWCpBp5DQkIc7I13yB5xOT7eHX//cnBw3hoUQRneM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+sajjQBQOd3GPB/pQzWJkbQogw459SjdnZErz/o+VDL9QqsTuv9019sIIibS/kfPxi0X5QGDNwxYmLq9oINKAejg2sqB0kwTqPO8lyoZN5Lzyfou0aHpokHhoygIL+cDyBN0DKbcfz/iTvF+OgS6bs8HyaSYZtakMuWR7kmX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GEYwmrUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GEYwmrUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02481F00A3D;
	Tue, 28 Jul 2026 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223160;
	bh=Mo+OP0jJX+QxRfgnE92qYHUe3s/Tg7M+WJED5Kt4GWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEYwmrUjcbepXKTShXOXf4C9xwVafU7SnK0wyKAt5Mvzhdew46n0YXVLkf8skxRTj
	 59ZXYyQ84JFiWptVTJnsifZic/am85M0t8TfcRcbrUvllPonpEhuEltXT8gkwSFe7h
	 boTZaT0073OaFsPMAFxvlwpUnMAeznKQ2DM0eKd8=
Date: Tue, 28 Jul 2026 09:19:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH RESEND] staging: vme_user: reorder NULL check after
 kzalloc in fake_crcsr_init
Message-ID: <2026072827-trifocals-cubbyhole-6cfb@gregkh>
References: <20260723161846.23939-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723161846.23939-1-iprintercanon@gmail.com>

On Thu, Jul 23, 2026 at 07:18:46PM +0300, Artem Lytkin wrote:
> Move the NULL check for bridge->crcsr_kernel before its use in
> fake_ptr_to_pci(). While fake_ptr_to_pci() is a simple cast that
> handles NULL safely, using a value before validating it is a bad
> pattern that static analyzers flag and could become a real issue
> if fake_ptr_to_pci() changes in the future.

Let's worry about that in the future, as this does not actually do
anything at all.

> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 434cf760ade6c..5a4e61d204796 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1029,9 +1029,9 @@ static int fake_crcsr_init(struct vme_bridge *fake_bridge)
>  
>  	/* Allocate mem for CR/CSR image */
>  	bridge->crcsr_kernel = kzalloc(VME_CRCSR_BUF_SIZE, GFP_KERNEL);
> -	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);

Again, assigning NULL to a value is just fine.

thanks,

greg k-h
