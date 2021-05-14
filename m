Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8A172
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 13:36:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 833E66144C;
	Fri, 14 May 2021 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620999388;
	bh=SVrdacbDqwyIT1cfNRvEYHJGC8wvLyRFcGyMUtYAo50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vsbOqCM/DMDtOpfQviaa3o8jBt7/qilVgeSYuKUA5NtcmJxLEAWl+U6RRnIrm3wGn
	 YVbB/O9BrL5vIl72TRQZNsCnFncaTDakypdUSd85yljA8EZ6GMWFvZbdmT05XWhy4H
	 ms+5UBEhL5pRIqn8ks3f+DTtXLrOOdH+2GiWrdwI=
Date: Fri, 14 May 2021 15:36:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Message-ID: <YJ582f3O9K9YD3QA@kroah.com>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>

On Fri, May 14, 2021 at 07:00:39PM +0530, Shreyansh Chouhan wrote:
> The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
> multiline macro whose statements were not enclosed in a do while
> loop.
> 
> This patch adds a do while loop around the statements of the said
> macro.
> 
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 2471448ba42a..c88ef3e894fa 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do {								\
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);				\
> +	} while (0)
>  
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> -- 
> 2.31.1
> 
> 

Did you test build this change?
