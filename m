Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B0376471;
	Wed, 18 Mar 2026 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845328; cv=none; b=le8srZbNHMgY72oGpHoChtiTF6JaB6dkrVFFF9W95XEQGJt8NuhmJVyxGldzlf8LtXkM7g1QF2KsewjPM4SvZi4j3Z2A0TbXzE6qfe7Q8ojCRq+EqO0YPONKA+pKxu1uj1n6ONjuHBzCx+c2Lu3azun8aHZvfEzxZ4uI/pFN2Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845328; c=relaxed/simple;
	bh=d2vIiUmBIziR4Z1WpFAGWrhmJBIs2mQ7OqhhsvB+kT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsc/Ur9Q7W+4MST+1ZQvW437eU8hOgd+RqmKZrxXrXkCiOc7D+uU+lIAQFBc3fbJHmEjGQMrw3HyUKR0NhMaLAT6rE0T44rXRiWwLArPkKCsA7vHtSiFJwIsCzdSwZcP3dbRYuFHb5ufl3f4nGO5Hjy1GvhkXI3zuWYVkNjLHC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FG8C87MP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FG8C87MP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B21BC19421;
	Wed, 18 Mar 2026 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773845327;
	bh=d2vIiUmBIziR4Z1WpFAGWrhmJBIs2mQ7OqhhsvB+kT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FG8C87MPICKxKf/NRgJ7qG9H7Gmbo2EaZSmZIrYsgwV6NieSigbycSZUo97vjmF0B
	 34VzRAyGKLitdSQez1RgQ7nTcj425+0dmZ/VGFhyELnyLX2DTmBv4YLN2SxmpzwTly
	 ff8+T935h+e02BLDvPJ/kYQHdGQFmSle7/Pu37U8=
Date: Wed, 18 Mar 2026 15:48:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?H=FCseyin?= Can Erdem <erdemhuseyincan09@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix code style issues in
 rtl8723b_hal.h
Message-ID: <2026031815-food-omission-e77f@gregkh>
References: <20260318142957.6157-1-erdemhuseyincan09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318142957.6157-1-erdemhuseyincan09@gmail.com>

On Wed, Mar 18, 2026 at 05:29:57PM +0300, Hüseyin Can Erdem wrote:
> Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
> index 7ec84304a..cd3b49338 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
> @@ -28,7 +28,7 @@
>  #define FW_8723B_END_ADDRESS   0x1FFF /* 0x5FFF */
>  
>  #define IS_FW_HEADER_EXIST_8723B(fw_hdr) \
> -	((le16_to_cpu(fw_hdr->signature) & 0xFFF0) == 0x5300)
> +	((le16_to_cpu((fw_hdr)->signature) & 0xFFF0) == 0x5300)
>  
>  struct rt_firmware {
>  	u32 fw_length;
> @@ -133,7 +133,7 @@ struct rt_firmware_hdr {
>  #define EFUSE_IC_ID_OFFSET 506 /* For some inferiority IC purpose.
>  				* Added by Roger, 2009.09.02.
>  				*/
> -#define AVAILABLE_EFUSE_ADDR(addr) (addr < EFUSE_REAL_CONTENT_LEN_8723B)
> +#define AVAILABLE_EFUSE_ADDR(addr) ((addr) < EFUSE_REAL_CONTENT_LEN_8723B)
>  
>  #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
>  #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
> @@ -171,7 +171,7 @@ struct c2h_evt_hdr_t {
>  	u8 CmdID;
>  	u8 CmdLen;
>  	u8 CmdSeq;
> -} __attribute__((__packed__));
> +} __packed;
>  
>  enum { /* tag_Package_Definition */
>  	PACKAGE_DEFAULT,
> -- 
> 2.47.3
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

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
