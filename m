Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B69E139A
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C033C433EF;
	Sat, 13 May 2023 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683976654;
	bh=sjNYwsemOtgKeawfitZAjLmzy+bKFAbZ/n2brRmITDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=by8XrQKONnpDv9DiD3ABF99vaRwmQgALQ1ATJjgN2V4DbJzK+W9Kg3WWSUdJYIGuG
	 YlDzYqM9Lc+MsttoalcU8NaGL03xNq1NyXS3xGJPPGWCgtGj/lzUMC1t29Ww0xGI9Q
	 F0tHxD++VW8qPlHu6PktWF/ZawYSVD+GC1HB2vhM=
Date: Sat, 13 May 2023 20:13:24 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Atin Bainada <hi@atinb.me>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: hal: Add whitespace around '?'
Message-ID: <2023051301-tipped-morally-eb3f@gregkh>
References: <20230512151538.17609-1-hi@atinb.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512151538.17609-1-hi@atinb.me>

On Fri, May 12, 2023 at 03:16:21PM +0000, Atin Bainada wrote:
> Signed-off-by: Atin Bainada <hi@atinb.me>
> ---


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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
