Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6794A24;
	Tue, 18 Oct 2022 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=p9MaN1cNxzsKmUBSvr1168hWuNPIS4qtuoR7aCQsxpU=;
  b=LxsqxbvGaWIxD/unTRxG5cIthVOf+F9Oz0EHw+V2fmvgfY3dEs0ugeEe
   6ZrqdXw1buEUBzN9RVn7822ZoNopi0TJH2VrYs17gJcQzTgK8dKyzP3hu
   Jf1JOFS+0V68YNc6gPaXky+IrrSdwyiwQHoUuDuFajq/0pUKkrotozZCG
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="65739145"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 14:11:55 +0200
Date: Tue, 18 Oct 2022 14:11:54 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rts5208: split long line of code
In-Reply-To: <Y06Vsr7JVvpPem5T@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Message-ID: <16a2d3ed-8841-ba37-28cb-7dd727fcae6d@inria.fr>
References: <Y06Vsr7JVvpPem5T@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 18 Oct 2022, Tanjuate Brunostar wrote:

> Fix checkpatch warning by splitting up a long line of code, improving
> code readability
>
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>

Acked-by: Julia Lawall <julia.lawall@inria.fr>

> ---
>
> v2: Reorganized the line of code by splitting it where it does not break
> the parenthesis as recommended by Julia Lawall
>
>  drivers/staging/rts5208/sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
> index 4643127a87ca..74c4f476b3a4 100644
> --- a/drivers/staging/rts5208/sd.c
> +++ b/drivers/staging/rts5208/sd.c
> @@ -4505,7 +4505,8 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  				if (CHK_SD(sd_card)) {
>  					retval = reset_sd(chip);
>  					if (retval != STATUS_SUCCESS) {
> -						sd_card->sd_lock_status &= ~(SD_UNLOCK_POW_ON | SD_SDR_RST);
> +						sd_card->sd_lock_status &=
> +							~(SD_UNLOCK_POW_ON | SD_SDR_RST);
>  						goto sd_execute_write_cmd_failed;
>  					}
>  				}
> --
> 2.34.1
>
>
>
