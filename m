Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD43D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A38CC433D6;
	Thu, 20 Oct 2022 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666280809;
	bh=eP4e8g5LGe7tE0rzg1TkiUPKLfDmJmDnBitOJzbIoX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1jKLukBcnl+iVVvlo13J3MNXZa8cNtK3LE9CqhcpJki5gwFNW1DkX5nEl5dXPy3MZ
	 J3bRXrIva+cfwVo9Vy1xyOOGTVrCy7Z1gc60JmahWl3sVygk+dS2zwvQdOBo2qdSr3
	 WXn1kFuDKqU7/Sna1Qo7Fzq23jgyWpmqR55u469I=
Date: Thu, 20 Oct 2022 17:46:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	paskripkin@gmail.com, martin@kaiser.cx, straube.linux@gmail.com,
	kuba@kernel.org
Subject: Re: [PATCH] drivers: staging: r8188eu: Fix sleep-in-atomic-context
 bug in rtw_join_timeout_handler
Message-ID: <Y1FtZzV9wRQRaTYk@kroah.com>
References: <20221018083424.79741-1-duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018083424.79741-1-duoming@zju.edu.cn>

On Tue, Oct 18, 2022 at 04:34:24PM +0800, Duoming Zhou wrote:
> The rtw_join_timeout_handler() is a timer handler that
> runs in atomic context, but it could call msleep().
> As a result, the sleep-in-atomic-context bug will happen.
> The process is shown below:
> 
>      (atomic context)
> rtw_join_timeout_handler

Wait, how is this an atomic timeout?

When can that happen?

>  _rtw_join_timeout_handler
>   rtw_do_join
>    rtw_select_and_join_from_scanned_queue
>     rtw_indicate_disconnect
>      rtw_lps_ctrl_wk_cmd
>       lps_ctrl_wk_hdl
>        LPS_Leave
>         LPS_RF_ON_check
>          msleep //sleep in atomic context

How was this found?

> Fix by removing msleep() and replacing with mdelay().

Wouldn't people have seen an error already if msleep() was really called
in atomic context?

And what about the other drivers that have this identical code, why only
fix one?

thanks,

greg k-h
