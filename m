Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F9168
	for <linux-staging@lists.linux.dev>; Thu, 23 Dec 2021 07:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C05AC36AE9;
	Thu, 23 Dec 2021 07:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640244315;
	bh=EzQ0lMhEEgU5MhLwfGJMNUOGlgGuCdJsf4/+9GUOSF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ck7DfhbEM8OHy3B9FlmQPj0Sl7arfuyBEU03fAGFJO15fCHuMOugKUF5+MHsjnizi
	 XDtWuEge/ftLeFMGSpha0pO39cCzK8lPr5QaI661wUFpwRLaoxsA4b0WjKPJyqFTP6
	 IbzUWeJTyjmJIi/RY6c2/4gKGzBybSOUb5OzyeLg=
Date: Thu, 23 Dec 2021 08:25:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ismayil Mirzali <ismayilmirzeli@gmail.com>
Cc: linux-staging@lists.linux.dev, fabioaiuto83@gmail.com,
	linux@roeck-us.net, paskripkin@gmail.com
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: address style guide warnings
Message-ID: <YcQkVmydaX+SE094@kroah.com>
References: <cover.1640197297.git.ismayilmirzeli@gmail.com>
 <3bddd2a8c02540c56a48d6844b3fcd897441803b.1640197297.git.ismayilmirzeli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bddd2a8c02540c56a48d6844b3fcd897441803b.1640197297.git.ismayilmirzeli@gmail.com>

On Wed, Dec 22, 2021 at 08:51:14PM +0200, Ismayil Mirzali wrote:
> Fixed mistakes regarding wrongly formatted if statements,
> added missing lines after declarations and removed unnecessary
> whitespace.

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
