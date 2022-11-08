Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0D68BE7
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255A8C433D6;
	Tue,  8 Nov 2022 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667921039;
	bh=pGa3kMUhkeVYwx9VwwV88DIO73kHEJXQzYlqd3eNCWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqqXD6bl/qT/EVqpBmio0doghGB5OK9tbBW/A7HChDqmGOYH6IKaA8KE83eCVz64r
	 k1RNKpbnhuhqOEeELuDi0wLvZKXa+qIJ1On9oB5wcxynbNo/CAzsEOiIrAQCccCloB
	 4y3L+gVgJRiGcxdfRIIffgf2ZscnkfOkITo6eol8=
Date: Tue, 8 Nov 2022 16:23:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] staging: rtl8192e: rename tables in r8192e_hwimg.c
Message-ID: <Y2p0jDSZXAsjQl2U@kroah.com>
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
 <01eb4d9cb22be5f76aa39eedd406577cdfd9f486.1667723306.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01eb4d9cb22be5f76aa39eedd406577cdfd9f486.1667723306.git.jacob.bai.au@gmail.com>

On Sun, Nov 06, 2022 at 07:31:16PM +1100, Jacob Bai wrote:
> fix camel case issue.
> 
> Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
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
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
