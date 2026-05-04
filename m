Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703703DFC74;
	Mon,  4 May 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906583; cv=none; b=bCH4a7e3tLV2zsyuLBzcGuiLwLwaXHE/qNDWAFBvATnfVqY9fK+H7Ab32KdJtE5lxtdVJBjD3ze9yZHALKU1iJl/PfwwGqBoY4ruSAP9pRdwwu8ANJ2hyAtCWT/1Eos5CfV3MWCX/oKHXzRZxUGBoGQaJp2gH4PcwSOf3Kw4TIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906583; c=relaxed/simple;
	bh=X/7VBMTm3+eto7vEW10SsiUp7+kkWMD+Vb9hek4Ix3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBzyWPLDcERNueChPUmKI182Jndsa3z4PXXV0hoS04vLUS57+jwgdlxNRWQdsb75hmGitWo8M9gCdP1FIURBzqzG2R597+vDRLHsSo7z1mI2JJUV8Lm/ND9LLBLmUFOZy+KqTCnf+9eKkB4UuY4AUiDlWK3FH4xHjSn10wtvCRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DWCNwbVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DWCNwbVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DE8C2BCB8;
	Mon,  4 May 2026 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906578;
	bh=X/7VBMTm3+eto7vEW10SsiUp7+kkWMD+Vb9hek4Ix3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWCNwbVePi17cS6sXQPaJAOg+a4/0tKorOx61zl1OuZYz2vTR/Ef3UoxR+olDolU1
	 2R6Ur0Vz1vF937imFmhzJ4yx8mhAWon4delUc3KyfqlNAz41m/Ld3I0ai7zVdIh12z
	 G/fGZ0fXhiYWsbez0ofXRgcNKq0RSmjhIL2st25g=
Date: Mon, 4 May 2026 16:14:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ajith P V <ajithpv.linux@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newline to sysfs_emit
Message-ID: <2026050444-refract-pushover-b8b7@gregkh>
References: <20260428165708.3565022-1-ajithpv.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428165708.3565022-1-ajithpv.linux@gmail.com>

On Tue, Apr 28, 2026 at 04:57:08PM +0000, Ajith P V wrote:
> The sysfs attribute is missing a terminating newline.
> According to the kernel documentation for sysfs, attributes should
> be terminated by a newline to follow standard userspace conventions.
> 
> Fix the formatting by adding a '\n' to the sysfs_emit string.
> This resolves the checkpatch warning:
> "return sysfs_emit(...) formats should include a terminating newline"
> 
> Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)


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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
