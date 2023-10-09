Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57F11C8F
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1NWXqfFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B24C433C7;
	Mon,  9 Oct 2023 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696846576;
	bh=RSSmBe2hBTVt5zo3o9PsUHPyXSee+Ceb+hlfyxj1OxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1NWXqfFxwZCDZNLjtbeDlsdfaMmJmRVLJczlRzq6WTh+3MhTv0DACUOHbjMaE1jZJ
	 UtTix9FQIns7d4LTyXyeCJtfTxQusHfYj7chvkOQLFOrHG1Vcec8CoHT6QwK4Hc3HW
	 h+WY1ckDlhKll5K3ykMVIhGJwV2RrAisppKgMZ2E=
Date: Mon, 9 Oct 2023 12:16:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] staging: vc04_services: vchiq_bus: Do not kfree device
Message-ID: <2023100902-common-myself-e3f4@gregkh>
References: <20231009060906.33407-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009060906.33407-1-umang.jain@ideasonboard.com>

On Mon, Oct 09, 2023 at 11:39:06AM +0530, Umang Jain wrote:
> As per device_register() documentation, this kfree() on error path will
> crash. The call to put_device() is all that is needed here to free the
> memory.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c | 1 -
>  1 file changed, 1 deletion(-)

This needs a "Fixes:" tag, right?

thanks,

greg k-h
