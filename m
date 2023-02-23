Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779B723A5
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 09:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2497C4339C;
	Thu, 23 Feb 2023 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677143860;
	bh=TziV0sGtNmJ5jLkrWB9nNF+F5MXF6aRvlpXLf0vu188=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y2nyhw0qIicf3OBxOofy3cETsZI9eRxq0T1qimLreGQbHYTXNQ7+a0xwVR2PZJesh
	 W1dAUl0puE/mkVGhQ8KhRKezlz+ElZiFiehyA8dKEQeaYrdL0bnbonIcTqsBcU1Oto
	 wtM009rng6CnURwYCcA7z6xZR8GKDoE1CeWHlgg7dS1FYISmtMelrTMCr0DvueNlFx
	 tLbASO5UDdrW0xxUUiykrA46zpea042r5MgHuXv6cHt75bw1fQD13ZUQvM41YEpHIv
	 zSMwSZs3Hfi7ciCA4Y/1x8Ow2ZFQP9yomVZzSJziIB9LC909ytlNDA4ALf944WPsFM
	 1eNBPYRZF2CBw==
Date: Thu, 23 Feb 2023 10:17:34 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto
 <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff
 <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/10] media: atomisp: Remove depth-mode and continuous
 mode support
Message-ID: <20230223101734.5f3bb8e3@coco.lan>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 21 Feb 2023 15:58:56 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi All,
> 
> This is the first step of the removal of special/obscure features
> discussed here:
> 
> https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/
> 
> Plus some follow-up patches removing some dead code (some new dead
> code as well as some pre-existing dead code).

Nice cleanup. Yeah, I was considering doing this for some time,
as those "extra" modes are meant to be used only on Android.

Regards,
Mauro

> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (10):
>   media: atomisp: Remove depth-mode support
>   media: atomisp: Remove continuous mode support
>   media: atomisp: Remove delayed_init related code
>   media: atomisp: Remove crop_needs_override from atomisp_set_fmt()
>   media: atomisp: Remove atomisp_css_enable_raw_binning()
>   media: atomisp: Remove atomisp_get_metadata_type()
>   media: atomisp: Remove unused SOC_CAMERA, XENON_FLASH and FILE_INPUT
>     subdev types
>   media: atomisp: Remove ATOMISP_USE_YUVPP()
>   media: atomisp: Remove yuvpp_mode
>   media: atomisp: Remove online_process setting
> 
>  .../media/atomisp/include/linux/atomisp.h     |  26 -
>  .../atomisp/include/linux/atomisp_platform.h  |   9 +-
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 744 ++----------------
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 -
>  .../media/atomisp/pci/atomisp_compat.h        |   7 -
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 321 +-------
>  .../staging/media/atomisp/pci/atomisp_fops.c  | 110 +--
>  .../media/atomisp/pci/atomisp_internal.h      |  21 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 162 +---
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
>  .../media/atomisp/pci/atomisp_subdev.c        |  78 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |  16 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  35 +-
>  13 files changed, 129 insertions(+), 1412 deletions(-)
> 



Thanks,
Mauro
