Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C301C39
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 12:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1FFC433D7;
	Tue, 22 Nov 2022 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669118935;
	bh=v6NsHjzd2SnTcLVVr8sZ0m3lpYwFPx7WXSFWTJ+LPEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0toz47snQknZS31Pj7vosvIW/pnNCUm9XeS9LuoJO16Ph5ZdsQK320+TLljEFWdf
	 OZRWnTysdtmxkxcNRYw/KkSCFv+BSsJxqUh6TOYDAaNMZGwLNLYtB3yV7y08bejflp
	 zE4MzmGgsefzro8gjAtJxNPAmpjDyBoVDCw2PKpQ=
Date: Tue, 22 Nov 2022 13:08:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: set DCC setting to spec recommended value
Message-ID: <Y3y71Nt/wCkyM02I@kroah.com>
References: <Y3k0bbM2/5jXfNKQ@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3k0bbM2/5jXfNKQ@qemulion>

On Sun, Nov 20, 2022 at 01:24:21AM +0530, Deepak R Varma wrote:
> The DCCFreq value is used to obtain the DC offset canceller cut-off
> frequency. Upon device power reset, the bits 7-5 of the RegRxBw register
> that represent the DCCFreq setting are set to 0x4, which evaluates the
> cut-off frequency to be 1% of RxBw.
> 
> In the current implementation, first, there is no configuration variable
> defined in the struct pi433_rx_cfg for the user to set this value as
> part of the UAPI. Second, the code simply ignores the value of DCC
> setting and allows it to never change.
> 
> As per the RFM69HCW tech specs, the default value for DCC frequency is
> recommended to be 4% of the RxBw; which requires the DCC setting bits
> to be set to 010. So allow the DCC setting to change to recommended /
> default value for improved rx sensitivity.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Please Note: The proposed change is compile tested only. I am unable to perform
> device based testing in the absence of the hardware, both the RasPi board and the
> Pi433 device. Please let me know if it is necessary for me to test such patches
> on the real device myself. I will stop sending the patches till I have the hardware
> to test them. Thanks.

For changes like this, you need to test it on the device itself.

thanks,

greg k-h
