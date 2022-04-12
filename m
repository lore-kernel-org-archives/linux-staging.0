Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45846A6;
	Tue, 12 Apr 2022 06:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ApQqvHX1Fx8sflvlvQmwRhONGqWTINNRm0+wqk9JS6k=;
  b=WcszQplcsf1aF1TsDapBD4HbNua+g6tpGjQthHkOPuKdit2MxOQyIoBZ
   gBgA4HO2vrLlfhzFh13dK9Z7wNqee81ynqgB5xZXuePSWQL5fFZH5GPMJ
   2Jh3aPMKowPhV52MBrUQbSjTKlurrUcgtVRtqxfO/v05UMlZW8pVhYn7v
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,253,1643670000"; 
   d="scan'208";a="31240623"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 08:26:31 +0200
Date: Tue, 12 Apr 2022 08:26:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: aliya-rahmani <aliyarahmani786@gmail.com>
cc: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8712: efuse: code style - avoid macro
 argument precedence issues
In-Reply-To: <20220412061442.32536-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204120825400.3122@hadrien>
References: <20220412061442.32536-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 12 Apr 2022, aliya-rahmani wrote:

> From: Aliya Rahmani <aliyarahmani786@gmail.com>
>
> This patch fixes checkpatch warnings of precedence issues. Added parentheses
> around macro arguments 'offset' and 'word_en'.
>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
> v1 -> v2: Updated the description of the fixes.

You have a lot of messages labeled v2 now.  This will be confusing for
Greg.  Make a v3 that is entirely correct.

julia

> ---
>
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
