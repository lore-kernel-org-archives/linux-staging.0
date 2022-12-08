Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0A7F3
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 09:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA82FC433D6;
	Thu,  8 Dec 2022 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670491827;
	bh=Nkicfm25kIk7lK9v1K8b/hhnq6A0lK12N/yYgRIf0LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHS1ZiQzZb1qjxOYo4g0RSK0U0dJsvfhifSNuY7FpqWGdX2yjNlLubxuC93gisHLK
	 oemJzQa5DYZFq+nkJ6lvrEQEy2NRWQTToVf9tgTkhmlRJ8SwCcyv6nQ79g02caj74k
	 eqT339slGKZH70ksTNSi6yeAaxH0ndWW5LXJ5o4E=
Date: Thu, 8 Dec 2022 10:30:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matt Jan <zoo868e@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] staging: vme_user: add the spaces around the "*"
Message-ID: <Y5GusPhYhyq3d1KM@kroah.com>
References: <20221208091100.GA95120@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208091100.GA95120@zoo868e>

On Thu, Dec 08, 2022 at 05:11:00PM +0800, Matt Jan wrote:
> Add a space around the "*" at vme_bridge.h to clear up a checkpatch
> check.
> 
> Signed-off-by: Matt Jan <zoo868e@gmail.com>
> ---
>  drivers/staging/vme_user/vme_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
> index 0bbefe9851d7..e17a8f7de165 100644
> --- a/drivers/staging/vme_user/vme_bridge.h
> +++ b/drivers/staging/vme_user/vme_bridge.h
> @@ -4,7 +4,7 @@
>  
>  #include "vme.h"
>  
> -#define VME_CRCSR_BUF_SIZE (508*1024)
> +#define VME_CRCSR_BUF_SIZE (508 * 1024)
>  /*
>   * Resource structures
>   */
> -- 
> 2.25.1
> 
> 

I see 2 copies of this patch sent to us, one properly threaded with
others, and one (this one), not.  Which one is correct?  As I have no
way of guessing, I'll drop both sets :(

Please fix up and resend a v2 set only once.

thanks,

greg k-h
