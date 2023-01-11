Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA4417EF
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 09:02:30 +0000 (UTC)
Received: from [192.168.1.103] (unknown [103.86.18.160])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DD7E4DD;
	Wed, 11 Jan 2023 10:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673427748;
	bh=mCRaCQzpanc70O5SB58jkkUOVGiMR2i1X1lcKR2lf0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lx1SPktNzcO6D1b8hnv6+SE/xKDYzUL9mxBN6aaxu0mDZs9YO9ie+xCTZhzO7EI0E
	 El0Laj1lPZEM6q/BdSdwd9ZZyATAUxwoPUyQ3wE6sMBDK/APqmIiYwgBbYsAeVbSfT
	 2fh1PnhNUuT05MyH42QsCzFBu17LsY+2jY0p7qOU=
Message-ID: <ba52e6b4-33ec-622e-00b6-1b098f529a90@ideasonboard.com>
Date: Wed, 11 Jan 2023 14:32:17 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/7] staging: vc04_services: Remove custom return
 values
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Kees Cook <keescook@chromium.org>, Stefan Wahren
 <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221223122404.170585-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20221223122404.170585-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Gentle ping for review, If it's needs more iterations or ready to be 
accepted...

Thanks,
Umang

On 12/23/22 5:53 PM, Umang Jain wrote:
> The series removes the custom return values from functions
> and replaces them with linux error codes. This address the TODO
>   vchiq interface:
> * Get rid of custom function return values
>
> Changes in v3:
> - Drop fixes tag for 5/7 as suggested in review
> - Add Tested-by: by Stefan Wahren to the series
>
> Changes in V2:
> - Patch 3/7 now reports for specific errors like -ENOMEM, -EHOSTDOWN
> - Patch 5/7 reports -ENOTCONN instead of -EINVAL and adds a "Fixes" tag
>
> Umang Jain (7):
>    staging: vc04_services: Replace vchiq_status return type to int
>    staging: vc04_services: Drop VCHIQ_SUCCESS usage
>    staging: vc04_services: Drop VCHIQ_ERROR usage
>    staging: vc04_services: Drop VCHIQ_RETRY usage
>    vc04_services: vchiq_arm: Drop VCHIQ_RETRY usage on disconnect
>    staging: vc04_services: Drop enum vchiq_status remnants
>    staging: vc04_services: vchiq: Drop custom return values from TODO
>
>   .../bcm2835-audio/bcm2835-vchiq.c             |  12 +-
>   .../include/linux/raspberrypi/vchiq.h         |  65 +++---
>   drivers/staging/vc04_services/interface/TODO  |   5 -
>   .../interface/vchiq_arm/vchiq_arm.c           | 124 +++++-----
>   .../interface/vchiq_arm/vchiq_arm.h           |  12 +-
>   .../interface/vchiq_arm/vchiq_core.c          | 216 +++++++++---------
>   .../interface/vchiq_arm/vchiq_core.h          |  18 +-
>   .../interface/vchiq_arm/vchiq_dev.c           |  36 +--
>   .../interface/vchiq_arm/vchiq_ioctl.h         |   8 +-
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  11 +-
>   10 files changed, 246 insertions(+), 261 deletions(-)
>

