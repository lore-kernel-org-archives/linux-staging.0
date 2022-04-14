Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138C915A5;
	Thu, 14 Apr 2022 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9GK0sQaF3bhvG8x9VbwKKKzRtlt/G5M0FRr4BwsS3/0=;
  b=aQSGGnR8w/oK3RjcRsOux+MZ+3IfdFHXTYQ2aRzOZ5Ug4vzZTq/Z7R+X
   Sa2LYIc0vpEz9m7NDnVbVRWK+14Y4W+E2iHbqVomHZ9XMlSCV5COwtkYj
   BWNciISGUe6vaZdYzlD0eSIgpGx3bsfm3cqGK8lneYU6asYCwveeI0UcT
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,259,1643670000"; 
   d="scan'208";a="31626172"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 09:06:27 +0200
Date: Thu, 14 Apr 2022 09:06:26 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: kuba@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: ks7010: coding style fix: use tabs for indent
In-Reply-To: <20220413204648.60358-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204140906010.3023@hadrien>
References: <20220413204648.60358-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 14 Apr 2022, Aliya Rahmani wrote:

> Added tabs for indent to fix the checkpatch error.

This looks like "Replace spaces by tabs".

julia

>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/ks7010/ks_hostif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
> index f1aa3be4261d..d0475189607d 100644
> --- a/drivers/staging/ks7010/ks_hostif.c
> +++ b/drivers/staging/ks7010/ks_hostif.c
> @@ -2213,7 +2213,7 @@ static void hostif_sme_work(struct work_struct *work)
>  	hostif_sme_execute(priv, priv->sme_i.event_buff[priv->sme_i.qhead]);
>  	inc_smeqhead(priv);
>  	if (cnt_smeqbody(priv) > 0)
> -	        schedule_work(&priv->sme_work);
> +		schedule_work(&priv->sme_work);
>  }
>
>  /* send to Station Management Entity module */
> --
> 2.25.1
>
>
>
