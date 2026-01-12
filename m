Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4126561E;
	Mon, 12 Jan 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210345; cv=none; b=FVYVnslQNYG/GLp1wIkdTuZqbafSdDVEbOJmrZv2J3GXxvlG2ZZgT7c4bkVwo5btJRU3pjl4/4IKYARemB19uwlPq26c178t9E9ZEg/p4/B1cWQ76RJuwuns2ofcQwPUjUzBOuKQlQ+GyC+qNJ5QhmoIo2wOUzyj4rrwxrYErRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210345; c=relaxed/simple;
	bh=vOoJ6brQEYDw5F5iPQjZTHje4/bgwwfnDal/Xt++yIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXKLPOTyoIDSQjqmTVggBt2/Z38n5JF1H0Lhymr3rQ/t4EZXAMThLu4uVFOtZFA5EP+k4F/3WtYtT4ucUbTXVpaqRzws9sP/dRaAfmnlRH9ye+dH+5mXAoq/pC4SKJExM9xLPipdIJ14bX/aFq6Qavf96PFOXXl2QJpwshu9Ivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aUbcEWH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aUbcEWH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4586BC116D0;
	Mon, 12 Jan 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768210344;
	bh=vOoJ6brQEYDw5F5iPQjZTHje4/bgwwfnDal/Xt++yIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUbcEWH57EaAA0zLeUl/qvP+5IrQDFMjjBM6qKVnomkg8czXVQDvk/nz9zQ1JleXL
	 Ro5JZOdZO7LWqzwqvVWGhUeXTsrOlSXvgnbCT+itVq4EGVUQKK7USRPqF7p+aH33Mn
	 dmzSxTWcvB4p66fJqlt8OHEZiQUk4FRh3tH3pzY0=
Date: Mon, 12 Jan 2026 10:32:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] staging: rtl8723bs: fix block comment style
Message-ID: <2026011200-rudder-amino-445a@gregkh>
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
 <20260112043429.42615-2-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112043429.42615-2-nayana.mariyappa@gmail.com>

On Mon, Jan 12, 2026 at 04:34:26AM +0000, Nayana Mariyappa wrote:
> Fixed multi-line block comments in osdep_service.c to follow kernel
> coding style.
> No functional change.
> 
> Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index a00f9f0c85c5..8f6dd3560303 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -6,10 +6,10 @@
>   ******************************************************************************/
>  #include <drv_types.h>
>  
> -/*
> -* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> -* @return: one of RTW_STATUS_CODE
> -*/
> +/**

Nit, this shouldn't be /**, but rather /* as before, as this is not a
valid kernel doc comment.

If you want to turn it into a kernel-doc statement, like I think
checkpatch is warning you about, then please do so, with the full
function name and arguments documented.  But I really doubt this is
needed at all, but rather this can just be a one line comment instead.

thanks,

greg k-h
