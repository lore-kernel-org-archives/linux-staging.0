Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209491C12;
	Mon, 17 Oct 2022 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3CTsJGe8bY+pItCw50sxDPAN3XWBgWvK9oJXOucHAFs=;
  b=A/FsqbGEadvZ1Eb67IUcQh0wB2/etHEDRdXTFlPvkfEvdSxdZnxqbSBd
   /UJJl76usnPX9lLzoZHc/OfmkNCRlZegijgQIr+dZ74VoiDy/mpf+xOAG
   0I7Sc0vphFdsmJUvuM81u2zQb22ZUu8QCBSIH4M8a5w8uVFdu75BA7u9b
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,191,1661810400"; 
   d="scan'208";a="65537852"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 15:57:17 +0200
Date: Mon, 17 Oct 2022 15:57:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net, 
    phil@philpotter.co.uk, paskripkin@gmail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH 3/4] staging: r8188eu: remove {} for single statement
 blocks
In-Reply-To: <478d652b9f467d47685c1af72a876f34dd92710f.1666011479.git.drv@mailo.com>
Message-ID: <alpine.DEB.2.22.394.2210171556290.16433@hadrien>
References: <cover.1666011479.git.drv@mailo.com> <478d652b9f467d47685c1af72a876f34dd92710f.1666011479.git.drv@mailo.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 17 Oct 2022, Deepak R Varma wrote:

> As per the Linux kernel coding-style guidelines, there is no need to
> use {} for single statement blocks. Address following checkpatch script
> complaint:
> 	WARNING: braces {} are not necessary for single statement blocks

It's nice to say something like "Problem identified using checkpatch".
But putting the verbatim checkpatch message that says what you just said
doesn't seem necessary.

julia

>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 427da7e8ba4c..290affe50d0b 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -655,9 +655,8 @@ void *scdb_findEntry(struct adapter *priv, unsigned char *ip_addr)
>  	hash = __nat25_network_hash(network_addr);
>  	db = priv->nethash[hash];
>  	while (db) {
> -		if (!memcmp(db->networkAddr, network_addr, MAX_NETWORK_ADDR_LEN)) {
> +		if (!memcmp(db->networkAddr, network_addr, MAX_NETWORK_ADDR_LEN))
>  			return (void *)db;
> -		}
>
>  		db = db->next_hash;
>  	}
> --
> 2.30.2
>
>
>
>
>
