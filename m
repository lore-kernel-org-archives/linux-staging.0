Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B706623507C;
	Fri, 16 Jan 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568518; cv=none; b=UDEzhvAatdU6KFG6vDbMA0IuIO74kvRU5FhhUWEwzy6jRhiBQBlo73uWGZMhfB/G+UUdrj7LJBE4jwVFwcO3cgyzyHqi71qR4fjurYnsoRxt9g6NdbIBUF4BME06QlJVcmCnVOgxaqdtpvUYLezn4xeafMeV1fA9z2QLJNthrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568518; c=relaxed/simple;
	bh=Z6xYCrbBWLVy+kBePMA5fX7y3Is4CUCzAWR+4R1OKxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzcR4XyrGF+HcWE64HBnSUsIROKOAKf5ioi3baqCrr2FaYxjt7jvQAe7Oqwa22TczGuPKeirOWyv+8ujWtOwCCRS4l2MGazqvyTl3aKQmvDuRz1SNj7L5eWcvkMh5RtznbezxYDBzsME+8+5yFmkzDHX6GZZN/5nv1MAHEncleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2CA4Mri0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2CA4Mri0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D65C116C6;
	Fri, 16 Jan 2026 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768568518;
	bh=Z6xYCrbBWLVy+kBePMA5fX7y3Is4CUCzAWR+4R1OKxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2CA4Mri0xZb9Cn7tjbYHinMH92Mvp4Ez5QcR4ms85Ya5S6VkokpPjko2SwTcanlym
	 ZqLsO/UjKfB0vsTA/XXq7KUeeCRXj3H73pqzGHyePwIQwlS4lLFXVLqbb/MniqYiry
	 4TfVsgtQQ6NVIQLBwePV6mRp4nav7ta4h6+X+J/A=
Date: Fri, 16 Jan 2026 14:01:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] staging: rtl8723bs: Fix style and formatting in
 HalHWImg8723B_MAC.c
Message-ID: <2026011637-drippy-static-a28c@gregkh>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
 <20260112174227.14922-4-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112174227.14922-4-mahad.ibrahim.dev@gmail.com>

On Mon, Jan 12, 2026 at 10:42:20PM +0500, Mahad Ibrahim wrote:
> Fix multiple checkpatch.pl warnings/checks in HalHWImg8723B_MAC.c.
> 
> The checkpatch.pl warnings/checks constituted:
> -Lines should not end with a '('
> -Please don't use multiple blank lines
> -Missing a blank line after declarations
> -line length of <Int> exceeds 100 columns
> 
> Adhere to kernel coding style by fixing style, alignment and line length
> checkpatch.pl checks/warnings.
> 
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
