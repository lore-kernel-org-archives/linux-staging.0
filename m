Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2453D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEADC433C1;
	Thu, 20 Oct 2022 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666279543;
	bh=cESfqJUV+gfapMWt+oh9689NPRleQRywDn452vJmvuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJn8SC/HFtPSEPp1SUvngHE+GYG4kCYiaKJMl+w9tYQxy4B8A51el8FlGo8ATOhIc
	 or9h4Q7hmaQpH9suS/eNC+P+95Ov/XPR672UOtHI68sjpSMrN/IXFCuRwrCf5+ARe5
	 NYEjLoUMszeXJxNiQ/5OEWc7oh3uEuAUh+f3XoFo=
Date: Thu, 20 Oct 2022 17:25:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: namcaov@gmail.com, cai.huoqing@linux.dev, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	pappasbrent@knights.ucf.edu
Subject: Re: [PATCH v3] Replace macros HB and LB with static inline functions
Message-ID: <Y1FodCN/JQv9zZMI@kroah.com>
References: <20221006174436.GA8933@nam-dell>
 <20221006230757.33369-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006230757.33369-1-bpappas@pappasbrent.com>

On Thu, Oct 06, 2022 at 07:07:57PM -0400, Brent Pappas wrote:
> Replace function-like macros "HB" and "LB" with static inline functions
> to comply with preferred Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
> Changelog:
> V1 -> V2: Resent diff from a mail client that would not replace tabs
>           with spaces so that patch can be successfully applied.
> V2 -> V3: Created patch using git format-patch.
> 		  Tested downloading and applying patch.
>           Sent patch using git send-email.
> 
>  drivers/staging/most/net/net.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
> index 1d1fe8bff7ee..8a8fbc274b73 100644
> --- a/drivers/staging/most/net/net.c
> +++ b/drivers/staging/most/net/net.c
> @@ -36,8 +36,8 @@
>  #define PMS_TELID_MASK		0x0F
>  #define PMS_TELID_SHIFT		4
>  
> -#define HB(value)		((u8)((u16)(value) >> 8))
> -#define LB(value)		((u8)(value))
> +static inline u8 HB(unsigned int value)		{ return ((u8)((u16)(value) >> 8)); }
> +static inline u8 LB(unsigned int value)		{ return ((u8)(value)); }

If you use one less tab, you will not go over the 90 column limit,
right?

Only 1 tab is needed.

thanks,

greg k-h
