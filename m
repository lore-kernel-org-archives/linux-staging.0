Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E010EC;
	Mon, 11 Apr 2022 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FOBs68t0KVI0qXLT8la2zQwmhmCXZUna7KSoFebLIfE=;
  b=AObvLXY1It9crVZ1clqtsPTDr0EYbAY/1SJdxOgXQzknabQ92qW+0qFf
   aOFVafbPdKc4dklbxDLm0cDgJ/uNN5AzIqMszHUzLQsaZsbjzgePiVDCk
   dCx8Ey0vqjj+I5TVPqY70T2HSYtZx3h8cAP7i9CzC/kQUBrK4TohbzzJj
   o=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; 
   d="scan'208";a="11138563"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 08:47:25 +0200
Date: Mon, 11 Apr 2022 08:47:24 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: aliya-rahmani <aliyarahmani786@gmail.com>
cc: outreachy@lists.linux.dev, florian.c.schilhabel@googlemail.com, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8712: efuse: code style - avoid macro argument
 precedence issues
In-Reply-To: <20220411064143.45300-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204110845280.3197@hadrien>
References: <20220411064143.45300-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 11 Apr 2022, aliya-rahmani wrote:

> This patch fixes the following checkpatch.pl check:
>  CHECK: Macro argument 'offset' and 'word_en' may be better as '(offset)' and 'word_en' to avoid precedence issues

Your messages say "avoid" and "fix", but they don't explicitly say what
you do.

>
> Signed-off-by: aliya-rahmani <aliyarahmani786@gmail.com>

This could be better as:

Aliya Rahmani <aliyarahmani786@gmail.com>

julia

> ---
>  drivers/staging/rtl8712/rtl8712_efuse.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8712/rtl8712_efuse.h b/drivers/staging/rtl8712/rtl8712_efuse.h
> index 4969d307e978..2e1ea9d7a295 100644
> --- a/drivers/staging/rtl8712/rtl8712_efuse.h
> +++ b/drivers/staging/rtl8712/rtl8712_efuse.h
> @@ -15,8 +15,8 @@
>
>  #define GET_EFUSE_OFFSET(header)	((header & 0xF0) >> 4)
>  #define GET_EFUSE_WORD_EN(header)	(header & 0x0F)
> -#define MAKE_EFUSE_HEADER(offset, word_en)	(((offset & 0x0F) << 4) | \
> -						(word_en & 0x0F))
> +#define MAKE_EFUSE_HEADER(offset, word_en)	((((offset) & 0x0F) << 4) | \
> +						((word_en) & 0x0F))
>  /*--------------------------------------------------------------------------*/
>  struct PGPKT_STRUCT {
>  	u8 offset;
> --
> 2.25.1
>
>
>
