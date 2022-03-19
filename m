Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90973180
	for <linux-staging@lists.linux.dev>; Sat, 19 Mar 2022 12:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA0DC340EC;
	Sat, 19 Mar 2022 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647692715;
	bh=VzIZ83awD2ygJPiTFC5oot4SImMZHSu28rTC7D4Gc5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcJv4Ajr+BLrfuYrVy2BncrW92PMQ+0HLA86yK2ELfTxiXVifgiNbCVknbiZwszez
	 ugonme2U5nA7NndYlCSZXUjyRnMMYSkHcCbBNwQlCXpS4uYepzRgxpFj57egmMy19A
	 XrOaiL1cLvXs4M/ZqgvcIk45jOxlE1vuXnsM5Cho=
Date: Sat, 19 Mar 2022 13:25:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase names as reported by
 checkpatch.pl
Message-ID: <YjXLp2pdGUQIWcFg@kroah.com>
References: <20220319103152.16142-1-namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319103152.16142-1-namcaov@gmail.com>

On Sat, Mar 19, 2022 at 11:31:52AM +0100, Nam Cao wrote:
> Signed-off-by: Nam Cao <namcaov@gmail.com>


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


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
