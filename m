Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C433D9
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 16:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6908C433D2;
	Sat, 15 Apr 2023 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681574563;
	bh=Keho5jZUf9JoMSbHmX57TIOBY/LQblSMA+MdqWd6VXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmWfuR3uSekN6HhPeC3PBfkOM6/U+mAO6TNArkm/CpYFEZOpXE3G6j9SZM54hvhw9
	 I8aKbZdhpUOpdwQM03SAEvB3mNX9SNwsf/8iuo0YqdQJGHYNA4dsumZ1RdjjpFC+2C
	 VW7a3a866ltfvQpIK/zlw/YeYnXoIKRukvV3QmFc=
Date: Sat, 15 Apr 2023 18:02:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Fix W_DISABLE# does not work after
 stop/start
Message-ID: <2023041515-overhung-grime-d9fc@gregkh>
References: <20230414183452.GA12295@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414183452.GA12295@matrix-ESPRIMO-P710>

On Fri, Apr 14, 2023 at 08:34:52PM +0200, Philipp Hortmann wrote:
> When loading the driver for rtl8192e, the W_DISABLE# switch is working as
> intended. But when the WLAN is turned off in software and then turned on
> again the W_DISABLE# does not work anymore. Reason for this is that in
> the function _rtl92e_dm_check_rf_ctrl_gpio() the bfirst_after_down is
> checked and returned when true. bfirst_after_down is set true when
> switching the WLAN off in software. But it is not set to false again
> when WLAN is turned on again.
> 
> Add bfirst_after_down = false in _rtl92e_sta_up to reset bit and fix
> above described bug.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> Tested with rtl8192e (WLL6130-D99)
> Transferred this patch over wlan connection of rtl8192e
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 +
>  1 file changed, 1 insertion(+)


What commit id does this fix?  Should it go to the stable kernels?  If
so, how far back?

thanks,

greg k-h
