Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB7249E7
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oW+fyBse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAE9C433C8;
	Thu, 23 Nov 2023 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745318;
	bh=K+DNH7DzHe6581zgyhM/KZXPPp8xkP+h7tBgMCoC63w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oW+fyBsed4oLSs6iEResGo9tBuulLceSKzmMTOuaPcZqATIV20wNvM1cGR8KCo1X/
	 plBoAoc15qQjBoM8l/OGDKJBzp2Lsskg3DcEZseQxM+lwMOGIN/uSHSvf/rVROk8L6
	 s3eBZyHQ5QYOh+tbMCc6g+TBWOhs/Uo8704WbH30=
Date: Thu, 23 Nov 2023 12:55:35 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: Re: [PATCH v3 103/108] staging: greybus: pwm: Make use of
 devm_pwmchip_alloc() function
Message-ID: <2023112331-flagpole-unloader-b72e@gregkh>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-104-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121134901.208535-104-u.kleine-koenig@pengutronix.de>

On Tue, Nov 21, 2023 at 02:50:45PM +0100, Uwe Kleine-König wrote:
> This prepares the greybus pwm driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/greybus/pwm.c | 75 ++++++++++-------------------------
>  1 file changed, 20 insertions(+), 55 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
