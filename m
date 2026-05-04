Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230653DE45C
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906760; cv=none; b=pHhU+92mmzADH4rIlznIgjuaAD3yRQE7y78Bp9liGTI74z9tQ/PQlr7tmjeJp4nic2ZpcYHSd4SiCu0wlRiIjblwdYzXnkv+WXjrxVjV/RC3THQxCkC8SO8QTy0wzpG8aQpJwTIqHS376IOhmJGlpw2oFeOr91WLFm4GFkVwh0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906760; c=relaxed/simple;
	bh=7Hs8eBYD+M8B3xm7dQYLFlg7I1fNP2LLX82D8rfg6qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHdi26ND6tWSHYWKlkPCTDTEzqYi6vZfkds/dKRogju7QRFmVGKZEKl9SFgc4Z6Vr7fTHMrQi7MSBjdEJ86ORDE426X2ukhj/VPcKVjHS4ytvVoYROCR145wNrmhuC7ULIOKR35tT3Vi+aLd8NwWghF2XcqlfpsMbVvqRSfELkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Meb4W/ku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Meb4W/ku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64821C2BCB8;
	Mon,  4 May 2026 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906759;
	bh=7Hs8eBYD+M8B3xm7dQYLFlg7I1fNP2LLX82D8rfg6qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Meb4W/kuh9D2FmMYeEoOJ8RcoTqu2db+C0fLS/iwOY0gKCq2zORTioAAVUFptmnx0
	 CbDKRCqU4NHTEd97FTW7HVtQHEYlXlkkcjT6QH4Pf57TNwCx+Dxs589wc1e7kfjuFb
	 ZmbtVip5P/Z8hjwBJm/lINiQrFBQuyyff49oDhX8=
Date: Mon, 4 May 2026 16:58:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucas Poupeau <lucasp.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, Lucas Poupeau <anonymecode077@gmail.com>
Subject: Re: [PATCH] staging: vme_user: add missing blank line after
 declarations
Message-ID: <2026050454-pessimism-icky-3007@gregkh>
References: <20260504144612.12727-1-lucasp.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504144612.12727-1-lucasp.linux@gmail.com>

On Mon, May 04, 2026 at 04:46:12PM +0200, Lucas Poupeau wrote:
> From: Lucas Poupeau <anonymecode077@gmail.com>
> 
> Fix the following checkpatch.pl warning:
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Lucas Poupeau <anonymecode077@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index be4ad47ed526..d108f9549b0d 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,7 +67,9 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);
> +
>  	void *lm_data[4];
>  	struct tasklet_struct int_tasklet;
>  	int int_level;
> -- 
> 2.54.0
> 

This is a structure, not a function :(
