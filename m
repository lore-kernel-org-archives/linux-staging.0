Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818AB3D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52F5C433C1;
	Thu, 20 Oct 2022 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666280993;
	bh=8J2nnXNa6iCRJnyAygg98e7pMS9osOMSjxW0Z9nbm+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/X2LARCDCf7QfM7J4C2rjkrlziXPG2cbgDOBUP8xpkBm99kne1TTpDc5vrjBv2se
	 mTK/MBXWGwLJPAOSQ4qXvcxe/1Nec0Bpok5e4RdXl035Q/QIaptHAdVIDv2s2q4UO9
	 FVTcHVAhtogAeJqT2ZuJBjFTiNjjNUg/0pArPbck=
Date: Thu, 20 Oct 2022 17:49:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: rtl8192u: Provide a TODO file for this
 driver
Message-ID: <Y1FuHoeNNcUhNSpB@kroah.com>
References: <20221016110743.1448067-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221016110743.1448067-1-pbrobinson@gmail.com>

On Sun, Oct 16, 2022 at 12:07:40PM +0100, Peter Robinson wrote:
> Provide a TODO file that lists the tasks that should be carried out in
> order to move this driver off drivers/staging. It's missing from original
> addition of this driver.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/staging/rtl8192u/TODO | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 drivers/staging/rtl8192u/TODO
> 
> diff --git a/drivers/staging/rtl8192u/TODO b/drivers/staging/rtl8192u/TODO
> new file mode 100644
> index 000000000000..ab9d5d145b3b
> --- /dev/null
> +++ b/drivers/staging/rtl8192u/TODO
> @@ -0,0 +1,16 @@
> +To-do list:
> +
> +* Correct the coding style according to Linux guidelines; please read the document
> +  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
> +* Remove unnecessary debugging/printing macros; for those that are still needed
> +  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
> +* Remove dead code such as unusued functions, variables, fields, etc..
> +* Use in-kernel API and remove unnecessary wrappers where possible.
> +* Fix bugs due to code that sleeps in atomic context.
> +* Remove the HAL layer and migrate its functionality into the relevant parts of
> +  the driver.
> +* Switch to use LIB80211.
> +* Switch to use MAC80211.
> +* Switch to use CFG80211.
> +* Improve the error handling of various functions, particularly those that use
> +  existing kernel APIs.

Where did this list come from?

How do you know they are all needed?

thanks,

greg k-h
