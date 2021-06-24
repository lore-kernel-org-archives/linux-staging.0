Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57629D6
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 14:26:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F77F6024A;
	Thu, 24 Jun 2021 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1624544803;
	bh=fidWoLxi9CvIgEMxC5pKHC+zyH4imGcIkbPZC1UJc9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=05ZviCxBd591Rd/Emz/ISAlQh7XK3YkClf2I3eIkdxoOeih86Vw3V16Spk0a+oxp2
	 n+UzGu4szI+lkwfzjkvV+j6mtimH0vMkyzw4EpI+tTGOSHHpfdhcR9KZ9y7GesvOTp
	 NogPKjypGBjW9yAwKo09aZxi2rp4DCKK8eObptkc=
Date: Thu, 24 Jun 2021 16:26:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v7 3/8] staging: hi6421-spmi-pmic: do some additional
 cleanups
Message-ID: <YNSWIUzO1FYDAxyS@kroah.com>
References: <cover.1624542940.git.mchehab+huawei@kernel.org>
 <08b3d0eb4256c4fad25652f2aeb701b81d11ece2.1624542940.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b3d0eb4256c4fad25652f2aeb701b81d11ece2.1624542940.git.mchehab+huawei@kernel.org>

On Thu, Jun 24, 2021 at 04:01:32PM +0200, Mauro Carvalho Chehab wrote:
> Before moving this driver out of staging, do a couple of
> cleanups, in order to make the driver clearer.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 122 ++++++++++--------
>  .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  |   7 +-
>  2 files changed, 71 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
> index 626140cb96f2..252b731e272d 100644
> --- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
> +++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
> @@ -2,9 +2,9 @@
>  /*
>   * Device driver for regulators in HISI PMIC IC
>   *
> - * Copyright (c) 2013 Linaro Ltd.
> - * Copyright (c) 2011 Hisilicon.
> - * Copyright (c) 2020-2021 Huawei Technologies Co., Ltd
> + * Copyright (c) 2013- Linaro Ltd.
> + * Copyright (c) 2011- Hisilicon.

What does the "-" mean here?  That does not mean from 2013-present.

thanks,

greg k-h
