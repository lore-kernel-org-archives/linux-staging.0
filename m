Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23015C7
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 06:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49987C433D2;
	Tue, 18 Apr 2023 06:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681798669;
	bh=nqidHXv6ILSq69xfot9dCKAiN14YUM8TTkLugS/sXR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWW9LEj2tcDjD1rXsRHaF6X3bPRL4QNL3gPZzu19VZUA1qudoAVrhPcDsPG0ic8yw
	 Z9Ct/VWdGoXp2xwX3drmIAiqVWYMNCR/4cgaXhrt+88O6L00M2WgIV1cTJpcer/6CA
	 /ZcKmwLr+RJyj2Sxab9leqYiP27z52ManLb4q7Yo=
Date: Tue, 18 Apr 2023 08:17:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Fix W_DISABLE# does not work after
 stop/start
Message-ID: <ZD42Cn9OkovF5bho@kroah.com>
References: <20230417185723.GA11245@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417185723.GA11245@matrix-ESPRIMO-P710>

On Mon, Apr 17, 2023 at 08:57:23PM +0200, Philipp Hortmann wrote:
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
> Fixes: https://lore.kernel.org/linux-staging/248ec330-b4c3-aa7b-61eb-69ce8d333b69@gmail.com/
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> v1->v2: Added Fixes Tag

"Fixes:" needs to point to a git commit id, not a url.

thanks,

greg k-h
