Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D61C03
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 12:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E080C433D6;
	Tue, 22 Nov 2022 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669118914;
	bh=i1/B8KPOq23+jpieWztQH/1k9du0dfBH3YUJ5icWXhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p5pt4jZNb0tafaiF3Oqmnp2OXIsR9giOzMApVEjLuUsPGiNAWtye6goFu2yhJr79V
	 5PNO2nrbA8KuUnfmXOVWEvT3bG8QucY2Fx3Tsq5aSewEVF2uaxYTAAa9Si0VYkmN7S
	 uNZ9TOSry6g2zVi0RPJUIEDzodSy0YblvpYmleLE=
Date: Tue, 22 Nov 2022 13:08:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: call set_lan_gain for receiver config
Message-ID: <Y3y7v1WAumU1o5na@kroah.com>
References: <Y3kONX7KhQ1GX9QW@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3kONX7KhQ1GX9QW@qemulion>

On Sat, Nov 19, 2022 at 10:41:17PM +0530, Deepak R Varma wrote:
> Value for the LNA gain is captured from the user as part of the struct
> pi433_rx_cfg, however, the corresponding function rf69_set_lna_gain() is
> never called to set it. Include a call to this function as part of
> setting up the rx configurations.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/pi433/pi433_if.c | 3 +++
>  1 file changed, 3 insertions(+)

How was this change tested?

thanks,

greg k-h
