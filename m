Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976DD2C684;
	Fri, 15 Dec 2023 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2EGeuSHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B155AC433C8;
	Fri, 15 Dec 2023 12:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702643565;
	bh=Y8hbSRWRPFhwGIby9Bq2cIIBOU9rk6sYVOTuyf1oNcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2EGeuSHvFyQjpJxhGREeC4dd2W5E9NmIQYtEdcf2/2uOcgw7WYqkobz2pZ//0EN21
	 yQaVRx1ZrBbnrC0FZB8lE4RmhkG2cXyQj4RjqLl+o6kIe7Z8tta3B/BaTaArxHd0wi
	 FdxmPQaXYt5XHlisD7+9rA53QyiLx1dXoKTXV5Yk=
Date: Fri, 15 Dec 2023 13:32:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryan England <rcengland@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: remove unnecessary parentheses
Message-ID: <2023121508-limeade-gander-d777@gregkh>
References: <ZXn/JjyrLGQzS9zD@kernel.ryanengland.xyz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXn/JjyrLGQzS9zD@kernel.ryanengland.xyz>

On Wed, Dec 13, 2023 at 06:59:50PM +0000, Ryan England wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses
> 
> Signed-off-by: Ryan England <rcengland@gmail.com>


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

- You sent a patch that has been sent multiple times in the past and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
