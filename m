Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716CDA29;
	Mon, 18 Apr 2022 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=25YuxAr1PTEePBc5J+xHwi7RoAPIjjwOJ1WIOV6Xjlc=;
  b=cc5C7Y0S5vPI2P1rMhz6zgwMuDm5mltRgTpz2sFyqlwTJJwgfOVucB5F
   KcZtCakb5NbQD6PGzfGeohj+YRI+M5Ftd/DvSpopqr5gpYxt5QdJ4wJ+B
   Z13tE1u75Vw4HkiSweG27ilaqyluu0z+FR6heZhk0hMlVhudes/jXuoxI
   M=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,270,1643670000"; 
   d="scan'208";a="11802383"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 18:39:20 +0200
Date: Mon, 18 Apr 2022 18:37:53 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: clabbe@baylibre.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] staging: media: zoran: else is not generally
 useful after a break or return
In-Reply-To: <20220418162244.15346-3-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204181837420.13551@hadrien>
References: <20220418162244.15346-1-aliyarahmani786@gmail.com> <20220418162244.15346-3-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 18 Apr 2022, Aliya Rahmani wrote:

> Remove the else without affecting the logic. Fixes the checkpatch warning: else is not generally useful after a break or return

This line is still too long.

julia

>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/media/zoran/videocodec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
> index 16a1f23a7f19..19732a47c8bd 100644
> --- a/drivers/staging/media/zoran/videocodec.c
> +++ b/drivers/staging/media/zoran/videocodec.c
> @@ -98,9 +98,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
>
>  				h->attached += 1;
>  				return codec;
> -			} else {
> -				kfree(codec);
>  			}
> +			kfree(codec);
>  		}
>  		h = h->next;
>  	}
> --
> 2.25.1
>
>
>
