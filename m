Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3558632ABC0;
	Wed, 19 Nov 2025 07:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539131; cv=none; b=TOeGBDAcAdDvKVBdSLTOYqAfpzloOqqUpVubW/ecndYjEST1GdsB64FkKkppnGO42miS/69HZygyNyHodWMNIKAKrGVeSBu15O/vhFvducB+qRXrMMJzssYIN2JRD9nDA0TD4AdXQrEHspVWNbqxAtXPb2xtWj3hlz6/ad1PFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539131; c=relaxed/simple;
	bh=qtlPStTXMirS2IevjrAF2KnMIXkntWIyXgYm2xa3QA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3dryG/gzkwzStbXkh92dK2T+NVC59Wx50jqT5U+H+TI/nNzcZAMi5glHYmaIkDmh4HGv3EnzVG+eYi8QeK7v39EvgW1UVzL0F0B/S6J9+3W/buRBQWpq2B+rKxV6MNRq2HQ6P/QMFfa/CvNmJYo42V4uZFN0Br1X61dmimamDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MTc6Pqii; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MTc6Pqii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305A3C113D0;
	Wed, 19 Nov 2025 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763539130;
	bh=qtlPStTXMirS2IevjrAF2KnMIXkntWIyXgYm2xa3QA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTc6Pqii5oHplAMyk5FgbVds1wHbXSx36bbzq5e9feQD7Sz+7G87xgr1zPslCV9BW
	 yv1FgiMDUoNskpaAUK6zVzxKjt/CJ1aGE5Yg86nXZwrZqlDYtzRN/JKStBFsKqwpdF
	 GdqBnAVzuVg2CFcXfwcuxBwOR3wdSsSRghe+O/gM=
Date: Wed, 19 Nov 2025 02:58:47 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Bachir Benyammi <bachir.benyammi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhaochenguang@kylinos.cn, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix various coding style issues in
 rtw_io.c
Message-ID: <2025111912-privacy-kinsman-ba94@gregkh>
References: <20251118133321.300960-1-bachir.benyammi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118133321.300960-1-bachir.benyammi@gmail.com>

On Tue, Nov 18, 2025 at 02:33:21PM +0100, Bachir Benyammi wrote:
> This patch addresses various coding style warnings reported by
> checkpatch.pl in drivers/staging/rtl8723bs/core/rtw_io.c to
> bring it closer to kernel coding standards.
> 
> Specific fixes include:
> * Reducing line lengths to fit within 80 columns.
> * Removing unnecessary blank lines.
> * Removing unnecessary parentheses in conditional statements.
> * Aligning pointer stars ('*') in multi-line comments for readability
> 
> Signed-off-by: Bachir Benyammi <bachir.benyammi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_io.c | 71 +++++++++++++------------
>  1 file changed, 37 insertions(+), 34 deletions(-)

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
