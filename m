Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61713173
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 20:32:21 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1n1aBl-0000aj-4n; Sun, 26 Dec 2021 21:32:17 +0100
Date: Sun, 26 Dec 2021 21:32:17 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: include variable declarations from
 Hal8188EPwrSeq.h
Message-ID: <20211226203217.bzghwjpyagagstep@viti.kaiser.cx>
References: <20211224121043.175650-1-abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224121043.175650-1-abdun.nihaal@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Abdun,

Thus wrote Abdun Nihaal (abdun.nihaal@gmail.com):

> Variable declarations of rtl8188E_power_on_flow, rtl8188E_card_disable_flow
> and rtl8188E_enter_lps_flow are present in Hal8188EPwrSeq.h.

> A previous commit changed Hal8188EPwrSeq.c to include HalPwrSeqCmd.h
> directly instead of Hal8188EPwrSeq.h, causing these sparse warnings:
> - symbol 'rtl8188E_power_on_flow' was not declared. Should it be static?
> - symbol 'rtl8188E_card_disable_flow' was not declared.Should it be static?
> - symbol 'rtl8188E_enter_lps_flow' was not declared. Should it be static?

> This patch reverts the include line to include the declarations.

> Fixes: 4f458ec5f497 ("staging: r8188: move the steps into Hal8188EPwrSeq.c")
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
> index 566a1701302c..6505e1fcb070 100644
> --- a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
> +++ b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright(c) 2007 - 2011 Realtek Corporation. */

> -#include "../include/HalPwrSeqCmd.h"
> +#include "../include/Hal8188EPwrSeq.h"
>  #include "../include/rtl8188e_hal.h"

>  struct wl_pwr_cfg rtl8188E_power_on_flow[] = {

thanks for spotting this, I should run my patches through sparse
before submitting.

Acked-by: Martin Kaiser <martin@kaiser.cx>
