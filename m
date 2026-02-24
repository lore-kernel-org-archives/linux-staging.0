Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF23AEF2B;
	Tue, 24 Feb 2026 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955910; cv=none; b=mpSe1pUbFFFxc7XC+kGCGmoz2KohTA+HloDQMBz2yyVNVJ1P2Pn82/se1k8mLfviWUX96QisQBGUfShdboXqHiOC4ymBQsGFkutl7cWwMEcxtxks/v/lCgyZsn9e8w1WfPK3jPMW3os/y/yTts4kuvNYIycBk5i//1kTkFjZta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955910; c=relaxed/simple;
	bh=gqFKmFP5oja9e0q7WtqA1k+cSbRKKZqDwSJRUc6jPOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVM7vdDSYXX0GbtQ3IU1+bG+Y5I613GxQwmXn5B/IeW+m6YF/Gd5vUFu9JlwvjChxDqFfD8bnqZ1trQ1l3Ja1FceCxo+1gmb6jWoFkKLxNOrt2dzQGQHoHPDcRi7e6AU6rWMuLvZ5/BeBnilxc3PH5WbegNDb+aFwsDJJnRxuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ugbt0jJ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ugbt0jJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD87C19423;
	Tue, 24 Feb 2026 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771955910;
	bh=gqFKmFP5oja9e0q7WtqA1k+cSbRKKZqDwSJRUc6jPOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugbt0jJ+P5Xvx3uhvlMDllLVfwiIE3NTqK43dboxuf7uJBb/kG3kXuFV6B56oLNaL
	 QTyLohtmTgowk8COqWXcf5EuwJxSfV5rGKhWis7whaqlQFMp/uDpzhB4rKYpiq6sfC
	 3IIwvsnwAB9HYcTabgX5MH5oW9Z6rNfMHkhLB+Lk=
Date: Tue, 24 Feb 2026 09:58:24 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: greybus: move topology allocation to codec
 probe
Message-ID: <2026022448-sprain-engaged-3f7a@gregkh>
References: <20260223195939.71151-1-azpijr@gmail.com>
 <20260224084508.88867-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224084508.88867-1-azpijr@gmail.com>

On Tue, Feb 24, 2026 at 09:44:23AM +0100, Jose A. Perez de Azpillaga wrote:
> The FIXME in gb_audio_probe noted that memory allocation for the
> topology should happen within the codec driver rather than the
> greybus helper.
> 
> Move the size-check and kzalloc from audio_gb.c to audio_module.c
> and update the function signature of gb_audio_gb_get_topology to
> accept the pointer. This clarifies ownership of the allocated memory.
> 
> Reported-by: kernel test robot <lkp@intel.com>

The kernel test robot did not ask for this patch, it reported a problem
with your v1 patch.

> Closes: https://lore.kernel.org/oe-kbuild-all/202602240844.4eT24iVh-lkp@intel.com/

Nor does this change fix anything.


> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> v2:
>  - Fixed build error by updating function prototype in audio_codec.h.
>  - Fixed 'struct gb_audio_topology has no member named size' by passing
>    size as an explicit argument to gb_audio_gb_get_topology().

Did you test this version as well?  But step back, why is this change
needed at all?

> ---
>  drivers/staging/greybus/audio_codec.h  |  2 +-
>  drivers/staging/greybus/audio_gb.c     | 33 +++-----------------------
>  drivers/staging/greybus/audio_module.c | 27 +++++++++++++++++----
>  3 files changed, 26 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6be4..2d7c3f928b1d 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -179,7 +179,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
> 
>  /* protocol related */
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology);
> +			     struct gb_audio_topology *topology, u16 size);

Adding a random new field to a function means that we need to look up
what that value is to try to figure out what is going on.  That makes
things much harder overall.  So did this make the code harder to
understand?

Why can't the size be determined automatically by this function?

thanks,

greg k-h
