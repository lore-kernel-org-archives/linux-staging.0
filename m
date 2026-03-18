Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC128853A;
	Wed, 18 Mar 2026 06:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773814442; cv=none; b=sWyu3IJMTcfWFoZ4/K2shiNPOFfkXt6a7gqAZRNIa6m7z44P34gKUJbddLU5Ufs/4yRGXURw10YsAIdd2PVaHplhJpD+49+TucmolHOhy5MnkQP/plLy+HAFP8sWYutxTmMUA1A4TgRifI7wvvB8XPw9vVJm0iTqtC2RLhVXyms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773814442; c=relaxed/simple;
	bh=zLs1tMXJ7IvN6HAJbOYVneJzdrClZ7loWKRgsrJOv8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXUgHjKh6Rg4FaNGDH4Rzi/D1uLjknIrIhSpqDk7vodYIuGLSdNvZHiB7nsN+QBXCFVY086fIezAURTAQgVzu19jSgHOqqHLJvlBBXsyc/oDxAm2oWVPHH6dtYZ8wacHHytPhdrUaqgtuqpDTH+i/KMaL27k5xI/qFbXL6Wmdoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mEguHDKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mEguHDKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D33FC19421;
	Wed, 18 Mar 2026 06:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773814441;
	bh=zLs1tMXJ7IvN6HAJbOYVneJzdrClZ7loWKRgsrJOv8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEguHDKnKHQn7zNozyFrXnJnDc8gfxaQ0i8DvlgtV4OJ/AdqvRw8oFksSdaukCMIt
	 Osfr4q8sgv38TgbW4GiJ171ey769AEbIUY3C8jrmyAYoErDLV53Mw7U6iXSJdAopzU
	 D3uPHQrnXDEIimfDuNeAycjTsxVj1r2d0vqhF6NI=
Date: Wed, 18 Mar 2026 07:13:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Malavya Raval <malavyaraval@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: coding style cleanup
Message-ID: <2026031827-aim-upcoming-394b@gregkh>
References: <CAJhGtcFQ03WHOq+UOO4FUH==JqvYi=GEP=1L3nY2JYBZYm5J5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJhGtcFQ03WHOq+UOO4FUH==JqvYi=GEP=1L3nY2JYBZYm5J5g@mail.gmail.com>

On Tue, Mar 17, 2026 at 03:14:22PM -0700, Malavya Raval wrote:
> Dear Linux Staging Maintainers,
> 
> I have performed a series of coding style cleanups on the rtl8723bs staging
> driver.
> These changes address multiple checkpatch.pl warnings, including CamelCase
> variable renaming, long line formatting, and missing blank lines to bring
> the code closer to kernel standards.
> 
> The changes primarily focus on:
> - Renaming CamelCase variables and macros to snake_case.
> - Cleaning up formatting in rtw_io.c and rtw_cmd.c for readability.
> 
> This is my first contribution to the Linux kernel. I hope these cleanups
> are helpful.
> 
> Signed-off-by: Malavya Raval <malavyaraval@gmail.com>


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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
