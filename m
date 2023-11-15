Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6CC3BB2C
	for <linux-staging@lists.linux.dev>; Wed, 15 Nov 2023 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=i2se.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [192.168.1.129] ([37.4.248.43]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMWcT-1qkyqR1Jzz-00JbZM; Wed, 15 Nov 2023 20:03:48 +0100
Message-ID: <3b9ec650-8a99-4bac-9ac9-d2cd87efced5@i2se.com>
Date: Wed, 15 Nov 2023 20:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] staging: mmal-vchiq: Use vc-sm-cma to support
 zero copy
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>,
 Dan Carpenter <error27@gmail.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-6-umang.jain@ideasonboard.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20231109210309.638594-6-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hRUgUPLJ7rFTcdE7NnVcI/4HzsqA4QYhQf3aFo9afPhySVvhACg
 ///NpGH8Kc41l0Xucn7dDL/L68PirBZ42PrNbUYgYG7D3G2W3tYshi8mtRw3lfS+XnAmCM0
 rQo082W3D2O9M9Nl8qzao9eoEA9zyeQKotc0xhQmXhA4zIyxpFBCw0WAreIMUPosdf23Y9l
 9ZXAY34760qzi05XY8MZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:40eYUtB9v8Y=;GM/DBigz38EMGzOSldIKUo4hQCK
 krZIW0m/vQ9ugAw0KuDe7oy0c0sGv+uAbhj6gPUGLOyOidJGREb70z1OEfUr54S/0t1dO4xrk
 pce1aFNZuPi+4ise5WFJ3QaIyVJBFEZ1yEodpJZex5zakETXEbNOZeCYmk2Wy7DaL14lSh0Wx
 7T5QxN+qJiGBDEk1HR/Cxgk1QLDGKIXwK/IAo7jlWLwYiKtQZD0GAqZgi64/GunFBlFDuxfCU
 09PK1QcrXycEG2Vph+xPfvvNKAdHMBWR3JCwzlE/+jz6pvH1iUGQkSZeLOazLYm6x28Nwj6Os
 Pe1kIE+wX8nPQ6JiFs/0kAt/wx9ZLX7iew2dV77ZVTaP2kE/f6v0Rxe25TjwT37vzfGuuPU0D
 hraAXzisjUClkxfZFr3+KhD2aJLRroaUI8xE0H43bJL8ASjgWSWrnM+vJwmaUchzlvXTf0Qsx
 KpIAXXlEm0RVrcP9+vAuGOHDS+tuMWr6mV/7Pa4tcCUus8V9atlguokmmVOooW3eiuOOQt238
 CKArQYIFNTGpJiRDSEKGDi1zHa6CxqrqSTcLrBCOKALFQCVx35jA1ZGwxz5mL+56OmZhGponL
 zkbQCy77yycWaw8B+6K+/FJwyJ0K5HqlA+wmnM+H6tAFTsqII3SzGqMXwi2iHQCfPKf0rT9uc
 65RIQFOhJAp6zwMSoraUveGH7retJU0AL72fKBQyA6BLR1oE7voIdKPMBKNalimVaXeZdJnmg
 rl/w/EOMUJOHN+Lvc36ujJc+8ZpxGgq2rPIkV3om3e6vBFx7GVlrOcGSiA1KMYEcFkjRv3OjL
 Mndztezr7dtzyMeMqHAZYW85C4Nga4oOIgEyiweU/e0xY/wd+7hsBZp6H03LbpGp1zdHIUSGn
 OGKSDnScklqtpCg==

Hi Umang,

Am 09.11.23 um 22:02 schrieb Umang Jain:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> With the vc-sm-cma driver we can support zero copy of buffers between
> the kernel and VPU. Add this support to mmal-vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../staging/vc04_services/vchiq-mmal/Kconfig  |  1 +
>   .../vc04_services/vchiq-mmal/mmal-common.h    |  4 +
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 84 +++++++++++++++++--
>   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  1 +
>   4 files changed, 83 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> index c99525a0bb45..a7c1a7bf516e 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> +++ b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> @@ -1,6 +1,7 @@
>   config BCM2835_VCHIQ_MMAL
>   	tristate "BCM2835 MMAL VCHIQ service"
>   	depends on BCM2835_VCHIQ
> +	select BCM_VC_SM_CMA

i think we need more explanation in the commit message of the relation 
between these both modules.

On the one side BCM_VC_SM_CMA should be a driver, but it's not a driver 
for a specific hardware. It looks like more an extension of VCHIQ MMAL 
or does other (maybe not yet imported) vc04 driver make also use of this.

My question is: is BCM_VC_SM_CMA a real member on the VCHIQ bus and why?

Best regards
