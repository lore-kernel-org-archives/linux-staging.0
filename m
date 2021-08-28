Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2503FC3
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 13:55:11 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mJynS-0006qF-JY; Sat, 28 Aug 2021 15:54:58 +0200
Date: Sat, 28 Aug 2021 15:54:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	jing.yangyang@zte.com.cn, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove unused static variable
Message-ID: <20210828135458.sx443eayxi7bahsv@viti.kaiser.cx>
References: <YSoz5Qip12K899SN@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSoz5Qip12K899SN@user>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Saurav Girepunje (saurav.girepunje@gmail.com):

> Remove unused static variable rtw_enusbss from os_intfs.c file.

> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/os_intfs.c | 2 --
>  1 file changed, 2 deletions(-)

> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 8d0158f4a45d..c3ac0ae153f8 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -85,7 +85,6 @@ static int rtw_AcceptAddbaReq = true;/*  0:Reject AP's Add BA req, 1:Accept AP's
>  static int rtw_antdiv_cfg = 2; /*  0:OFF , 1:ON, 2:decide by Efuse config */
>  static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */

> -static int rtw_enusbss;/* 0:disable, 1:enable */

>  static int rtw_hwpdn_mode = 2;/* 0:disable, 1:enable, 2: by EFUSE config */

> @@ -133,7 +132,6 @@ module_param(rtw_low_power, int, 0644);
>  module_param(rtw_wifi_spec, int, 0644);
>  module_param(rtw_antdiv_cfg, int, 0644);
>  module_param(rtw_antdiv_type, int, 0644);
> -module_param(rtw_enusbss, int, 0644);
>  module_param(rtw_hwpdn_mode, int, 0644);
>  module_param(rtw_hwpwrp_detect, int, 0644);
>  module_param(rtw_hw_wps_pbc, int, 0644);
> --
> 2.32.0

Looks ok to me, thanks.

Acked-by: Martin Kaiser <martin@kaiser.cx>
