Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3EF37C
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 07:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB91AC433C7;
	Sat, 26 Aug 2023 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693035176;
	bh=hpq7XnKABXn0XZzi6ml3GrerSeURE/Bk0VHJ9PuXLAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9sVk05cUbhxp/KYB2hkIzcDk1ssL0ZvJ2ahFqjd2BN2UBgJsXJOIF5Ljb36tjjjy
	 dp1IHAwir7xkT00HUTCgnL+oJcE7wwoTa8OfSPu9itu2UyoQpYCW3RKGWxkV05/Cmx
	 LyHkqumLfkQ49NF7WGiMRC93LUj4K4vh5SWoNrro=
Date: Sat, 26 Aug 2023 09:32:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check alignment to match open
 parenthesis in vme_fake.c
Message-ID: <2023082632-crumpled-crease-4b7a@gregkh>
References: <ZOlCJ6uqBf+8HBa7@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOlCJ6uqBf+8HBa7@alolivei-thinkpadt480s.gru.csb>

On Fri, Aug 25, 2023 at 09:07:03PM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> as reported by checkpatch to adhere to the Linux kernel
> coding-style guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_fake.c | 65 +++++++++++++++--------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
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

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
