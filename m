Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2628E0;
	Wed, 13 Apr 2022 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WZXVfbn7Xmy2IUbSiErC0DQBQ09EL5o8/ozG9ScWffM=;
  b=Oka8rzxa65HDACZ6lsv6coFrMw1n1sc2cKNwqK1+Cx3m8q9QFs9gowV4
   15aX5ms7vn+eZJIIYwyFto7dBLvqPw9LFFd5P3lrUwglsHi/HHegITJOo
   dAlfYRJWWPzi01sKNGGLkmJg6FZubw4ozgkxgOiZ3b43FUej/ybfhUfXC
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,256,1643670000"; 
   d="scan'208";a="11389012"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 12:25:47 +0200
Date: Wed, 13 Apr 2022 12:25:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: cmd:remove redundant space after
 cast
In-Reply-To: <20220413102356.25357-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204131225230.3091@hadrien>
References: <20220413102356.25357-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Going for maximally picky, there should be a space after cmd:

julia

On Wed, 13 Apr 2022, Aliya Rahmani wrote:

> Remove the unnecessary space immediately after a cast. Identified by
> checkpatch: CHECK: No space is necessary after a cast.
>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
> index f5746020a1b7..4be96df5a329 100644
> --- a/drivers/staging/rtl8712/rtl871x_cmd.c
> +++ b/drivers/staging/rtl8712/rtl871x_cmd.c
> @@ -536,7 +536,7 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
>  		return;
>  	}
>  	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
> -	ph2c->rsp = (u8 *) psetstakey_rsp;
> +	ph2c->rsp = (u8 *)psetstakey_rsp;
>  	ph2c->rspsz = sizeof(struct set_stakey_rsp);
>  	ether_addr_copy(psetstakey_para->addr, sta->hwaddr);
>  	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
> --
> 2.25.1
>
>
>
