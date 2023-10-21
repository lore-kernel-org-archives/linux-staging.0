Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D04125DD
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iUWM6Dt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32EC433C7;
	Sat, 21 Oct 2023 20:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697921664;
	bh=7pedbMyZC3RY2f8YICmZi8rYFJ9JmXp93D0DYC+QMpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUWM6Dt8sTW3RiP2kbNcs0VBujq5nZC4zy9BnU2Yf5xZfeLkPBGn5nir40fTVUOUR
	 4KTYcjYB25Ycw9xi9H8NbO4owDPgBqDmdxxb+4uWOTLeFeXHI1MQNfFHDI9umVz2fH
	 uqWtK/IE6Lb16fj9aUX2qkowdprXM7fFP/UzmJic=
Date: Sat, 21 Oct 2023 22:54:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] staging: octeon: Fix warnings due to introduction
 of new typedefs
Message-ID: <2023102152-droop-reconcile-ac4d@gregkh>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021101238.81466-1-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 12:12:31PM +0200, Jonathan Bergh wrote:
> This patch series fixes (removes) the introduction of several new typedefs
> for enums and structs in the octeon driver. First the declarations are
> fixed and then implementations are updated to remove references to the 
> old typedefs.
> 
> Changelog:
>  * v1 -> v2: Fix breaking change spread across multiple patches
>  * v2 -> v3: Break changes up into individual patches for each removed
>    typedef


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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
