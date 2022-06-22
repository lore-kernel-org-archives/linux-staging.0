Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3747710E8
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 09:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F367C34114;
	Wed, 22 Jun 2022 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655890369;
	bh=dVRKxuJ7ZZmra+kiXqYKdSDrtj+XLC9PNEXLOYasc68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmbptiz6nQSPdMo3tKkoJhMJScYdbwJM9K59QAh8jRFR/dT8ylRUZXKE4xjRg3jLC
	 /sI8ldIiGqpkigwl2FWzX8YVeWFQZY3exGwRIC/1C9XutrJlWDzhRYEYKaeUqfjqD3
	 5w4tzgrteOa7u8GcBeWDeqVNZ0ywDowdtUUWEyXk=
Date: Wed, 22 Jun 2022 11:32:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: r8188eu: Fixed a function declaration
 coding style issue
Message-ID: <YrLhv4dqb/Qk+HUU@kroah.com>
References: <cover.1655872968.git.marcus.yu.56@gmail.com>
 <778c21724752f2de136d82b31c9ffc2bf35ced55.1655872968.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778c21724752f2de136d82b31c9ffc2bf35ced55.1655872968.git.marcus.yu.56@gmail.com>

On Tue, Jun 21, 2022 at 09:52:30PM -0700, Chang Yu wrote:
> Added an identifier name for function definition argument
> 'struct timer_list *' as per checkpatch.pl
> 
> Note that for the same line checkpatch.pl will also complain "extern
> should be avoided in .c". I am not very familiar with the codebase
> so I decided not to move the declaration to a header file.
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 36ea79586992..7e2f5c2f9111 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -24,7 +24,7 @@ static u8 rtw_rfc1042_header[] = {
>         0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
>  };
>  
> -void rtw_signal_stat_timer_hdl(struct timer_list *);
> +void rtw_signal_stat_timer_hdl(struct timer_list *t);

This really should be a static function, not a global one like this.
That is the correct fix to make, can you do that as an add-on patch?

thanks,

greg k-h
