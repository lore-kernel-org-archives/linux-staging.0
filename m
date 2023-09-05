Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC4A38
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 07:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A2DC433C8;
	Tue,  5 Sep 2023 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693898258;
	bh=0bNZ/Ik9ie+O/I+s8u69OtphKsy1cdeCYHDnRIKduRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obZewG3rTxP/ed8H8LU4I5ip8ZwuGLgsJ+m9KMiBF5rCcPWMXGKuYZOifHm2SqsSs
	 s/XEkCIWxpcDO9YXsV6+thUn66RE41M2M0U+UQoIgavdJUpqIj0aUhhGcXhIk5awGy
	 VAqGPGSWjrr2xaIft3b6MmYn8iS76mKzMLrUY2iw=
Date: Tue, 5 Sep 2023 08:17:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Angus Gardner <angusg778@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng
Message-ID: <2023090537-gathering-evil-22bd@gregkh>
References: <ZPak2AD8lKfcqEXG@midnight>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPak2AD8lKfcqEXG@midnight>

On Tue, Sep 05, 2023 at 01:47:36PM +1000, Angus Gardner wrote:
> Unnecessary parentheses identified by checkpatch.pl removed.
> 
> Signed-off-by: Angus Gardner <angusg778@gmail.com>
> ---
>  drivers/staging/wlan-ng/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
> index 471bb310176f..948db2433463 100644
> --- a/drivers/staging/wlan-ng/cfg80211.c
> +++ b/drivers/staging/wlan-ng/cfg80211.c
> @@ -351,7 +351,7 @@ static int prism2_scan(struct wiphy *wiphy,
>  		msg2->bssindex.data = i;
>  
>  		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
> -		if ((result != 0) ||
> +		if (result != 0 ||
>  		    (msg2->resultcode.data != P80211ENUM_resultcode_success)) {
>  			break;
>  		}
> -- 
> 2.40.1
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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

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
