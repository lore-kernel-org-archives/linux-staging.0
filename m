Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7B2F22
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 06:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EDAC004E1;
	Thu, 10 Feb 2022 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644476025;
	bh=CQSix5a+5H/ZM9UAfPny9dzwDbc7P5NWY/v4mbg44C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHNbzPFjeIFSruAbQX7GnZtj7bB7Qhoe+WtZ/x0fL95JS3GoFtoXWuSfTM4OHt5On
	 Xmnerns6gOBLzyKw11VJPtVuUIeptXqKefG9OpMMB9nHN7ISXZCHXLKD07sQGFyQHW
	 0oMclZljut4Pa0bc3aO+GhgcHtfObt2O+03Q8owU=
Date: Thu, 10 Feb 2022 07:53:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Leonardo Araujo <leonardo.aa88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: core: Avoid CamelCase: <bEnterPS>
Message-ID: <YgS2dAHofenuyVjg@kroah.com>
References: <20220209205740.9926-1-leonardo.aa88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209205740.9926-1-leonardo.aa88@gmail.com>

On Wed, Feb 09, 2022 at 05:57:40PM -0300, Leonardo Araujo wrote:
> Fixed a coding style issue.

Please read the kernel documentation for how to write better subject
lines and changelog texts.  These need a lot of work, you can't just put
the checkpatch message in the subject and then nothing in the changelog
body.

> 
> Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index e42119e16284..4ec4da6d3078 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -880,7 +880,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan)
>  
>  static void traffic_status_watchdog(struct adapter *padapter)
>  {
> -	u8	bEnterPS;
> +	u8	b_enter_ps;

No, think about what you are changing here.  Why keep the "b" at all?
What does this variable name?  Why was there a "b" to start with?


>  	u8	bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;


What about all of these other variables, why ignore them and not send a
patch series to fix them all up?

Remember where the "b" comes from, this is "hungarian notation" and is
trying to describe the type of the variable, which makes no sense in
this century.  Please do not keep it around for no reason at all.

thanks,

greg k-h
