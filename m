Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286023C13E7;
	Fri, 27 Mar 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607741; cv=none; b=pT1XzFz8P+oZgvqNMEWi7IqHt+xiYv5iOE9Yc0UGknLlk9X3QEF4Ffy8yJJsSZXugcb52JufD6uxlEeXoZjAmO5cFtZkYTGNieap7vvbVequq2x8ynq071a5vXWjdiRIw+EDqtSlvh3GsiJcmdvbzqcUgSvjX7huyVw6Zi86D6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607741; c=relaxed/simple;
	bh=/uhC0JMfxEmRWEeuYoWu4DW1TOUOORU5RwieZcF4mA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT7Y/NWWcnRuumXRCQcE1S0VGf/mFeftb3Q1QiK0uxr6VfvTAc7v2muZdRZpJg60GI7usP+WZqSBrg4xohOi7RHcw4VHRiQi76KgmRYQT57BzAdqYAc3QFftquA7iNViXumMsA9IiqOHeeMRLtJcrWZQSQ36nMXhxhE6n9W1yZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eJNqEw0C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eJNqEw0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF389C19423;
	Fri, 27 Mar 2026 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774607740;
	bh=/uhC0JMfxEmRWEeuYoWu4DW1TOUOORU5RwieZcF4mA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJNqEw0C0A8Pqc3RA7mqyd5KKFHoE0m1mqJQqQU2PA4Fvs3escQ60C/oiea8BVv5y
	 zXiKbD5DJ09r/W0FH7CIN8iHld45ugsdkmiESbgilqtZtT0Lfo6sl/Pafx2JQu7eks
	 gMg2MevbhsrbfZMob6+EHYSSr1odEsG0Q90BP7ZU=
Date: Fri, 27 Mar 2026 11:35:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix spelling in comment
Message-ID: <2026032706-opulently-flap-90ef@gregkh>
References: <20260327102052.2937-1-hechushiguitu666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327102052.2937-1-hechushiguitu666@gmail.com>

On Fri, Mar 27, 2026 at 06:20:50PM +0800, Haoyu Lu wrote:
> Change "co-existance" to "co-existence" in comment.
> 
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
> index b87c90f693ec..ff4383e30322 100644
> --- a/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:48:04.333064200 +0800
> +++ b/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:49:02.478348700 +0800
> @@ -385,7 +385,7 @@ struct hal_com_data {
>  	struct dm_priv dmpriv;
>  	struct dm_odm_t		odmpriv;
> 
> -	/*  For bluetooth co-existance */
> +	/*  For bluetooth co-existence */
>  	struct bt_coexist		bt_coexist;
> 
>  	/*  Interrupt related register information. */

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
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
