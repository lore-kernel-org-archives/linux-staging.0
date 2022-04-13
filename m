Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34928E0;
	Wed, 13 Apr 2022 09:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fmpo4z+P6w7tjunPSwr96velZhm00w3pSRaGV9No/fg=;
  b=fsGaNr0Pmyb17ascOE1cDyC8MAvX/UXQvbZPBD9ACtPYxeeoYllEykPz
   LSYSsU6ZHH8/opHSJuSD5rx25fMkvMKn54OV+ibHmPXZfqQoMBzy2/u+f
   syUOHKizdhgM4kDUcUeRpCjlEsFYfDg+DJaUtZ+ORvLe7dAxFiJC9mRNp
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,256,1643670000"; 
   d="scan'208";a="31480815"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 11:06:40 +0200
Date: Wed, 13 Apr 2022 11:06:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: aliya-rahmani <aliyarahmani786@gmail.com>
cc: tomm.merciai@gmail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vt6655f: rxtx: code style - Fix Lines should
 not end with a '('
In-Reply-To: <20220413073545.14666-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204131104030.3470@hadrien>
References: <20220413073545.14666-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 13 Apr 2022, aliya-rahmani wrote:

> From: Aliya Rahmani <aliyarahmani786@gmail.com>
>
> Removed indentation to fix the checkpatch error that lines should not
> end with a '('.

The log message should be in the imperative, so it would be "Remove", not
"Removed".

Maybe it would be nice to keep the parameters aligned, thus indent the
others more?

In another patch you could improve the variable names and the function
name.  I'm not sure why static and void have to be on separate lines
either.

julia


>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
>
> ---
>  drivers/staging/vt6655/rxtx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 53506e242a96..dce9d87d2363 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -569,8 +569,7 @@ s_uFillDataHead(
>
>  static
>  void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> +s_vFillRTSHead(struct vnt_private *pDevice,
>  	unsigned char byPktType,
>  	void *pvRTS,
>  	unsigned int cbFrameLength,
> --
> 2.25.1
>
>
>
