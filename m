Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7A1D1E89
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729325125; cv=none; b=lGcM5o4evlLwFmYJ3sio1ayEl1RJ7Jv1RN583rWbKtoqATAbi4IL0iAATDvVrOrSGznJXLuPpADsUuqKZXQc1ioNfjNIi65Bf5qk0M+ceZimcST5Ye5lrk1TUEJBGV0CWhML9rPYVe7ODj+dj+73cr4av2QK0TdYhjco5MCGE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729325125; c=relaxed/simple;
	bh=RSrvxDJqoWdUpVOO2z4vIqQZ9C6WCWtQ2OfzE01sxnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgwwF9dmg48zspkYL3lh4n9RXOTlMMQ4/tcjFUxZuKRTVDH74QUllpN1YbcR+xOaL//iaihN8SNKs2KYs9FSJej1EFZu1/q7TWiD0ea6w0OcuUuYOg7PVDyFfBqj5cyp0nOCaGn299Pq+oIZ/bmbyUauRlPLhqtjexE5i6P04EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iG5KTCpb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iG5KTCpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6F9C4CEC5;
	Sat, 19 Oct 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729325125;
	bh=RSrvxDJqoWdUpVOO2z4vIqQZ9C6WCWtQ2OfzE01sxnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iG5KTCpbo6h6Gjo9pSrQ7VrxJSj0lI2Ys1RO0qhhfxlGVt/zFgFSEKdSrp3gQlGzk
	 ILbRw+I3Ko7C7QdT+R2ht7TA+1t/B+C+QfCbzjb0O4rZBL5AokYEdcCZvqffc92wGP
	 J1yvdXCwiTkxoonET+g+9O8rznarsVrkjY/vKTuA=
Date: Sat, 19 Oct 2024 10:03:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: avoid unintended sign extension
Message-ID: <2024101951-security-haven-778c@gregkh>
References: <20241018193924.C90B818DA4C@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018193924.C90B818DA4C@bout3.ijzerbout.nl>

On Thu, Oct 17, 2024 at 09:54:47PM +0200, Kees Bakker wrote:
> The code was basically like this (assuming size_t can be u64)
>     var_u64 |= var_u8 << 24
> var_u8 is first promoted to i32 and then the shift is done. Next, it is
> promoted to u64 by first signextending to 64 bits. This is very unlikely
> what was intended. So now it is first forced to u32.
>     var_u64 |= (u32)var_u8 << 24
> 
> This was detected by Coverity, CID 1600792.
> 
> Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
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
