Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0AA4A24;
	Tue, 18 Oct 2022 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DhhW9pDS4OIkDGz8nA4MNC0iz3jv35bQ4UoWTTmzBcs=;
  b=cBDUqDB8oTbAigCLMxmGNLoHmbgNK9HycxTtEiW0w02hY3iHlUNnA0SA
   f8Y+dqoV99lUyMvV4kVhEo/smd1BmIHxWY9K9RC2iC0jeQYaz/kDsC3gs
   hMSLT1stmNoBWXfU7KU1XqsVCTQCSFKlAhGWqEGKChekA8QNF+XVn7zYK
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="31750300"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 12:58:08 +0200
Date: Tue, 18 Oct 2022 12:58:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rts5208: split long line of code
In-Reply-To: <Y06GBWZe+zF+ddD3@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Message-ID: <1ccf5640-e95d-5138-5146-c45cf136da2b@inria.fr>
References: <Y06GBWZe+zF+ddD3@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
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

It doesn't seem like a great solution to break the expression in the
middle of the ().  You could put the whole right hand side expression on
the next line indented with one tab.

julia


>
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/rts5208/sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
> index 4643127a87ca..6503db5bb874 100644
> --- a/drivers/staging/rts5208/sd.c
> +++ b/drivers/staging/rts5208/sd.c
> @@ -4505,7 +4505,8 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  				if (CHK_SD(sd_card)) {
>  					retval = reset_sd(chip);
>  					if (retval != STATUS_SUCCESS) {
> -						sd_card->sd_lock_status &= ~(SD_UNLOCK_POW_ON | SD_SDR_RST);
> +						sd_card->sd_lock_status &= ~(SD_UNLOCK_POW_ON |
> +								SD_SDR_RST);
>  						goto sd_execute_write_cmd_failed;
>  					}
>  				}
> --
> 2.34.1
>
>
>
