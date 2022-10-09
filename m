Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99D53B7
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 18:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA36DC433D7;
	Sun,  9 Oct 2022 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665339515;
	bh=MVjEC16KMFhYSc8vSL4ZVAZSk2tD1GmgL8X7YE0cSAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkv9Z3hD8gNtshzpbbDVBJ8sK1nJY4uY9a/qCitmmM66w+5utVarVmBXD5PuZ6+hW
	 21ffHXaUmeJwbpLWCsGkAVyLuFUL1mtBKRFjAu29KS0D2OGzh8Kklp9H0q5Ya88Rfq
	 aqfygMlbDZayWaktcK/7B0+2miyhhQy3BWYNVShY=
Date: Sun, 9 Oct 2022 20:19:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Li <me@lirui.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: remove necessary braces for single
 statement blocks
Message-ID: <Y0MQpuVTqXB17tyJ@kroah.com>
References: <166532561205.8.1223417525390189864.67805880@lirui.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166532561205.8.1223417525390189864.67805880@lirui.org>

On Sun, Oct 09, 2022 at 10:26:31PM +0800, Rui Li wrote:
> This commit cleans up checkpatch warning as follows:
> braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Rui Li <me@lirui.org>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  3 +--
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  9 +++------
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 12 ++++--------
>  3 files changed, 8 insertions(+), 16 deletions(-)

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
