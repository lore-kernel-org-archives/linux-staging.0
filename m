Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA7F20F7
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 15:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9495BC433C1;
	Sun, 23 Oct 2022 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666539677;
	bh=+bj01iiwf+CdtRMBHGs4xgTOR7ZEf/SdTveVoJpgGC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfDCCjs+ubGpwCh2Q8ohzzglaDs1XSxFZESKh9+P5paO+P+4W/Mfc6N3dCcSUZUjQ
	 lhAM6pA0xfJ6wg4UaKId1Rj6n7KCikhYhqPCbzXZrj2FG74VRDme4+STL+fygkBA/i
	 imIByMaK0D277uzGelt2LcCiarPf6Q9C+Jwm391U=
Date: Sun, 23 Oct 2022 17:41:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dragan Cvetic <dragan.m.cvetic@gmail.com>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Rename Enable, cck_Rx_path and
 disabledRF
Message-ID: <Y1Vgms28JIPluZ45@kroah.com>
References: <20221022151506.63725-1-dragan.m.cvetic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022151506.63725-1-dragan.m.cvetic@gmail.com>

On Sat, Oct 22, 2022 at 04:15:06PM +0100, Dragan Cvetic wrote:
> Rename variable Enable to enable, cck_Rx_path to cck_rx_path and
> disabledRF to disabled_rf to avoid CamelCase which is not accepted
> by checkpatch.
> 
> Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>

Any reason you didn't cc: the staging tree maintainer?  :(

Anyway, this changelog is confusing, you just list some random variable
names that you have changed, without any explaining what ties them
together.

The code itself gives you a clue:

>  struct drx_path_sel {
> -	u8		Enable;
> +	u8		enable;
>  	u8		cck_method;
> -	u8		cck_Rx_path;
> +	u8		cck_rx_path;
>  
>  	u8		SS_TH_low;
>  	u8		diff_TH;
> -	u8		disabledRF;
> +	u8		disabled_rf;
>  	u8		reserved;
>  
>  	u8		rf_rssi[4];


Ah, you are fixing up the drx_path_sel structure.

But just some of the fields, not all of them, odd.

Please redo this and make the changelog more descriptive of what you are
doing, as well as the subject line (don't need the variable names in
there.)

Also do it for all the fields in the structure, not just 3 random ones.

thanks,

greg k-h
