Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C9F640
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 05:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F2FC4339B;
	Tue, 31 Jan 2023 05:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675142547;
	bh=vamPmLKzrgPgWeFkRVN7ja3QhobN1Vem+eCM8cD69Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYzUNpMUAqiuuY6p4K1EZllxNf7CQqLOyD4cakLKIeu/oGJZHBhvs4K2qlBh5ASu3
	 iN+eDxwEdrD04bGiy+pSril7kl1EGx/AP90gvkY+izj2IhZI8MzewA3woYPRGvW7v9
	 axY8XdEhzIKVdTf2hIRbl9srgGnMIROGRbbhLH1w=
Date: Tue, 31 Jan 2023 06:22:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9ilj812USHrSXe+@kroah.com>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>

On Tue, Jan 31, 2023 at 03:11:38AM +0100, Guru Mehar Rachaputi wrote:
> (struct pi433_tx_cfg)->bit_rate is modified from u16 to u32 to
> support bit rates up to 300kbps per the spec

What spec?

And how can changing the size of a variable that crosses the user/kernel
boundry like this change the bit rate max?

> 
> Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> ---
>  drivers/staging/pi433/pi433_if.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
> index 25ee0b77a32c..1f8ffaf02d99 100644
> --- a/drivers/staging/pi433/pi433_if.h
> +++ b/drivers/staging/pi433/pi433_if.h
> @@ -51,7 +51,7 @@ enum option_on_off {
>  #define PI433_TX_CFG_IOCTL_NR	0
>  struct pi433_tx_cfg {
>  	__u32			frequency;
> -	__u16			bit_rate;
> +	__u32			bit_rate;
>  	__u32			dev_frequency;
>  	enum modulation		modulation;
>  	enum mod_shaping	mod_shaping;

And didn't you just break existing userspace code?  If not, how?  If so,
how did you test this?

thanks,

greg k-h
