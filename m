Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D21EA6E
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XN/Cr27w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F80EC433C7;
	Sat, 21 Oct 2023 21:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697924372;
	bh=OesIK1vv18YxMVOSsbR7a6z1lzp5vKkXkAr5iUOU4gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XN/Cr27wTTA0dfxotwyX0jawH2jDB3Yf2mW29gITgTplMuylccMy0+DCUbc63rbv+
	 IKtOWpA7DuZCPm21gBcczxwLCHkEMrfik6dzTikXnCtsNx8H5yRgl7FlWdFZsxxsGZ
	 3UvysTqlBhiHNlZFSxr5+4+GAEgH24nshvI6SlUo=
Date: Sat, 21 Oct 2023 23:39:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: renamed variable TxCountToDataRate
Message-ID: <2023102107-tipping-dosage-5062@gregkh>
References: <20231021213202.6244-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021213202.6244-1-garyrookard@fastmail.org>

On Sat, Oct 21, 2023 at 05:32:02PM -0400, Gary Rookard wrote:
> Renamed from Pascal/CamelCase to Snake case the variable
> TxCountDataRate, TxCountDataRate -> tx_count_data_rate.
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver rtl8192e compiles.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
>  drivers/staging/rtl8192e/rtllib.h            | 2 +-
>  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)


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
