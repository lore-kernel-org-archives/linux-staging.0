Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2906A2C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:47:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA8036108B;
	Thu, 25 Nov 2021 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637858842;
	bh=7lDGoPA0mMSEjJe6DonC9KjW9vvxa0XRA2BJIcil1N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2KWtVjE+XsV0Gm0x6xgf/3ZaJoirbhkFQ1igkzVYs677QvIXPhj463eb9ui9Yya6Z
	 d1q2c8O5p5t3wuFzRUZ0VyFShXFSyzJoCWDk7MfYCHZEfDTCEgfKKuyEg/mM9J2E3H
	 vJubv+X2VMpQFxLw4LMmpOgGAyVyk6jFCvVmx220=
Date: Thu, 25 Nov 2021 17:46:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: joe@perches.com, forest@alittletooquiet.net, karolinadrobnik@gmail.com,
	lucas.henneman@linaro.org, dan.carpenter@oracle.com,
	tomm.merciai@gmail.com, eantoranz@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: vt6655: refactor camelcase uCurrRSSI to
 current_rssi
Message-ID: <YZ+9yDiG1SoWrWED@kroah.com>
References: <20211118211128.GA156436@t470p>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118211128.GA156436@t470p>

On Thu, Nov 18, 2021 at 10:16:59PM +0100, Alberto Merciai wrote:
> Replace camelcase variable "uCurrRSSI" (current Received Signal Strength
> Indicator) into linux kernel coding style equivalent
> variable "current_rssi".
> 
> Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> ---
> 
> v4
> - rebase against the staging-next

Is this v4 or v5?

Subject says v5, but this says v4 and then you sent v4 two days later?

I'm totally lost, sorry.
Please resend this again and properly set the version number.

thanks,

greg k-h
