Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F37B
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 07:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD468C433D2;
	Sun,  5 Feb 2023 07:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675580548;
	bh=leJ/A9U3hld+jFqFYFoy341exhkg6QeNUz3zACZbt7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLa/Ih6gz6ijv2J60hS7TCa6Tybl6ze4r//Kz0sDNNIhWwK2lGyAB8Ha+7LTDZcT7
	 tU6BnAOV/eNtIRZCnyR/60nEL3cHj3l8AoHs64OF2X6SB1+fCZInYL97MXqdID4+Gu
	 GDzu5UbDMf4T9k9pu9AluZv75jOqvqAmk5xWgliI=
Date: Sun, 5 Feb 2023 08:02:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y99UgQPLvzGTmU6M@kroah.com>
References: <Y972XuIWckKE3ZcX@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y972XuIWckKE3ZcX@combine-ThinkPad-S1-Yoga>

On Sun, Feb 05, 2023 at 01:20:46AM +0100, Guru Mehar Rachaputi wrote:
> This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> as '(iobase)' to avoid precedence issues changed to inline function.
> 
> Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> ---
> Changes in v2:
>         - Macros with one statement that calls 'iowrite8' function changed
>         to inline function as reviewed by gregkh@linuxfoundation.org.
> 	In relation to this, names of the callers of macro are modified
> 	to call this function.
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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
> 
