Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB3817
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 07:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06ABC433D2;
	Mon, 23 Jan 2023 07:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674457238;
	bh=nStXYg4Mqxkj8WBIwqGgxPUwGoNANkbsMpVUTplftYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkyZlH7uI3jkrWuz8mJsLH7ercTAjLbV49+aKUX5ZFltWPHf2Ck7HCCt1YI1CdZec
	 6ZG1yfm7jQf7H64Mr3pugW1NBdq0LRPZyRF7QJssbivNjz7Ein7ttjG2Yn/rS9CNM6
	 BU3sH+ZZgEWUodYJzTll3F2wVd9Z5rZ1IKXq39HY=
Date: Mon, 23 Jan 2023 08:00:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Message-ID: <Y84wk+sw/gR7gNW4@kroah.com>
References: <20230122191047.58769-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230122191047.58769-1-didi.debian@cknow.org>

On Sun, Jan 22, 2023 at 08:10:47PM +0100, Diederik de Haas wrote:
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
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
