Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6991EFFB7;
	Sat,  7 Feb 2026 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470448; cv=none; b=OKxTP3xRFifmFX5UDpS1zKYNIfk7XWhh1tcj+ii8dO+4Jq7Mi9XsTYab0igYdBGPUiiodc0JVT3yy/BPdQPDFf6w7sJb0lw79DOHr8CQFVs7ozfNy1icvGY12ZWpXFX7klmd/TQolzZ/bLCCvfNLlV8ddLe70WiVyp0Kj/D7kH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470448; c=relaxed/simple;
	bh=geGDY4/JbHEG3wN3/UKmwCguwBlGiw4ZczMWOOqs1n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjBJRxaMmdn3YfP7v7C8B0s9zhogRshyD65d2KI/ACAd8MDgAWOKkowiV7YChAvJcHdnq9RkTr2bAEkhfLlv9nC1FZvr/w5nYHUp2pvwmsDyJFSH3G4TY6W27qSZJaLOXRpwHI6Q38zyehmHDNuUJWsFZHXmvXMu1jccUTXtuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wEGT4Hhn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wEGT4Hhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE079C116D0;
	Sat,  7 Feb 2026 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770470448;
	bh=geGDY4/JbHEG3wN3/UKmwCguwBlGiw4ZczMWOOqs1n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wEGT4Hhnlko6PxVMgyt96MqJvG8n+93kAGhTVJziaiv6qdvb6ePkOzOclg+kOgn8B
	 LzMb8SEtnH+xUlvkkURlpSzp9Nm3HPQJD3GJ3LqCboLjctzFUfsWGYFo5o2eCP/sbV
	 lmoVLT/vxVjJn7ieyVhmYW36niAUMwXwaLdQ4RTI=
Date: Sat, 7 Feb 2026 14:20:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: dan.carpenter@linaro.org, bqn9090@gmail.com,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <2026020732-amiable-lilac-0384@gregkh>
References: <20260131171153.3729458-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131171153.3729458-1-s9430939@naver.com>

On Sun, Feb 01, 2026 at 02:11:53AM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Changes in v4:
>     - Add Reviewed-by tag from Dan Carpenter

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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
