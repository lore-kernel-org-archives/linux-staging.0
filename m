Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46E31F9B0;
	Thu,  2 Apr 2026 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132214; cv=none; b=ZbqD0p0yifTBhFQxrEqXPYps2eQIBpD5mrE1I+doz6DDXTVILzzGrYep5B0uWn9bj3sWz5VMWW3wz4VmN8g97uHi2W8lnuAgx61Wp5XrWQNLbOyym8tb5XpirWGG+2TEzsrAM+vkamSNa/+TMx1wKRecxaWOFE4Q9BWv1IL9P5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132214; c=relaxed/simple;
	bh=Zs2KkHxBU8UHSQoS0l3U7B/uL1L63s0Pb6Z0jKsrhmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEp1RGAJEYw8iyj2yZGnppH2Wi3nlPEOJ1lmL3lgkzMYF0QngdjDATpvc3F1godd+GvUdJYNPeGrE4fFv4o9e+9m90g5/4dMiNd6ZCxc6vXbpYF6edcNjPrCWse8B8daO02DCMEMfH+33vPKXCG0lNM5OlDzO/CrTfMZUgUd7N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zvW8XPI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zvW8XPI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0910C116C6;
	Thu,  2 Apr 2026 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775132214;
	bh=Zs2KkHxBU8UHSQoS0l3U7B/uL1L63s0Pb6Z0jKsrhmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zvW8XPI57KBWaRUZoP8wPgcbdhlPbufC5l0ozMtmlgVj0TeZ17qbPFp2+Ixb+mQ+0
	 Fzk3lihsHQxx+kGEpDBeUBTo6W7nlDVwjza0fpP24L9YDWjdShyUOIqc7qCm3r4fbQ
	 7x//rkodvFZAdBFdrFCKROcZRWOsX2W6TRjfPePY=
Date: Thu, 2 Apr 2026 14:16:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, grondon@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: atomisp: fix alignment in function signature
Message-ID: <2026040239-sulphate-reflected-daa5@gregkh>
References: <20260402120807.1266-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402120807.1266-1-joshua.crofts1@gmail.com>

On Thu, Apr 02, 2026 at 12:08:06PM +0000, Joshua Crofts wrote:
> Fix alignment checks in function signatures
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index c7aef066f2..c51d04af6c 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
>  }
>  
>  static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
> -	enum atomisp_input_stream_id stream_id,
> -	enum ia_css_pipe_id css_pipe_id)
> +					 enum atomisp_input_stream_id stream_id,
> +					 enum ia_css_pipe_id css_pipe_id)
>  {
>  	struct atomisp_metadata_buf *metadata_buf;
>  	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
> -- 
> 2.47.3
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
