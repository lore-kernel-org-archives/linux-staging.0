Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0418E054
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 10:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075599; cv=none; b=dDQjoYdmg4Jtms96fUvX3HVTX7Wamq8scxrsx3+nA3tkGJSmyxPLxV8kCQgehYssRsPJyFHvQLWMEv0vVTaMKHlnW9QmdTmkHaYR3ihN10CGaN7w8VlzJ3Fxi2Ygo/B0uwXpfyluK55jMwbnyuKoeWjFasU4X9ZuhXuHzCViD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075599; c=relaxed/simple;
	bh=OKV8KUZHewj9DkFaymIkygTNBz92fHa0ztzPBv4Q4CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyrAMDpHUqliqu8cvmY40MJ5zV01WW94p+LdjdUwQfTXBvQduI97Rs1VK5g0afRAl/ag+OyjWud+boVKtRnbbd2kE/Cbc5lCgN2eAEQ7IkAR/w6TwzuvfGI4wOjimEh7di/hjRAQsN/FqSmUy+m1o6v1UnKy9XRphvC5RKh1Y3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L+kTYyuM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L+kTYyuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87985C4CEC5;
	Wed, 16 Oct 2024 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729075599;
	bh=OKV8KUZHewj9DkFaymIkygTNBz92fHa0ztzPBv4Q4CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+kTYyuMppkRfpKxqPC5K1gWxoEyosyb8W8znWcoDxDeLELW6SaFHXGG/C4Kka0AD
	 Lt0FwjWz3AyXJqKUinUVZjnO0hd5E4Twsgq7I77HXyu47jtRjdsBG2xm8atI2LVRPv
	 LZ4APTiXrc2mPqVBDzI7BK3bMJg9TdKX8kNvM7MA=
Date: Wed, 16 Oct 2024 12:46:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aymen Khalfa <a.khalfa.1012@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] drivers: staging: rtl8723bs: Fixed coding style issues
 and msleep() issue.
Message-ID: <2024101620-clunky-anthill-35a0@gregkh>
References: <20241016100224.2449224-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016100224.2449224-1-a.khalfa.1012@gmail.com>

On Wed, Oct 16, 2024 at 12:02:24PM +0200, Aymen Khalfa wrote:
> -Fixed brace coding style issues.
> -Fixed unaligned comments coding style issue.
> -Replaced msleep(1) with usleep_range() as recommended in documentation.
> 
> Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 31 ++++++++++----------
>  1 file changed, 16 insertions(+), 15 deletions(-)
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
