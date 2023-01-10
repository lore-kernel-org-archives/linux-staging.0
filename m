Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2878C199
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 08:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E866C433D2;
	Tue, 10 Jan 2023 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673339521;
	bh=UyeZgHJZT70Fj8aWOL8C1090uhN4RG7XF83yhxSnaT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAzVkk0lHq/NH+INplkz/jHPp2Tc8HjNgbn8oKkjxg0NvFpgCosXjgk0k4Y9130dI
	 pSP6qN1wWh796w/37hhTxcaxJAHdaLuFQLGwT3yYxQ9jsopWJ/rOikKGjyEcmczqq9
	 zy4GbLahbTwWsnKfKgLV0UKUiJQiVQSibuR5wWwU=
Date: Tue, 10 Jan 2023 09:31:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yui Washizu <yui.washidu@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media/av7110: cleanup coding style in av7110.c
Message-ID: <Y70ifV8ZUk3EHIGA@kroah.com>
References: <1673339336-27571-1-git-send-email-yui.washidu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673339336-27571-1-git-send-email-yui.washidu@gmail.com>

On Tue, Jan 10, 2023 at 05:28:56PM +0900, Yui Washizu wrote:
> Fix everything checkpatch.pl complained about in av7110.c
> 
> Signed-off-by: Yui Washizu <yui.washidu@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 183 +++++++++++++++++-----------------
>  1 file changed, 91 insertions(+), 92 deletions(-)
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
