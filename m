Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066128E0;
	Wed, 13 Apr 2022 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AiOlOTi4kd93VIB1Dhwkfi/PkUy839QTBbC90+pL60M=;
  b=mRZ51PLVNTfP48j/2woL+fRoe/NZSgxj/gbcOnMQGKitwYPBH9+Jx/qD
   2Ne+KzJRMZ3SIFLPwksN4J9kScpvj0f5ASz+uKPlMbmT/ENKQy82wNsuY
   NmLvLnKOb1dE2vgF1vsagvLME9aRPPp+zTR32U/CLpbA/+rEjZha7f+vQ
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,256,1643670000"; 
   d="scan'208";a="11389089"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 12:26:38 +0200
Date: Wed, 13 Apr 2022 12:26:37 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: tomm.merciai@gmail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655f: rxtx: code style - Fix Lines should
 not end with a '('
In-Reply-To: <20220413101114.23992-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204131226160.3091@hadrien>
References: <20220413101114.23992-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 13 Apr 2022, Aliya Rahmani wrote:

> Remove indentation to fix the checkpatch error that lines should not
> end with a '('.

This comment doesn't completely describe what was done.

julia

>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>
> v1->v2: Add Indentation and remove the gap between static and void.
>
> ---
>  drivers/staging/vt6655/rxtx.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 53506e242a96..01dc83b2f4bc 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -567,19 +567,16 @@ s_uFillDataHead(
>  	return buf->duration;
>  }
>
> -static
> -void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	void *pvRTS,
> -	unsigned int cbFrameLength,
> -	bool bNeedAck,
> -	bool bDisCRC,
> -	struct ieee80211_hdr *hdr,
> -	unsigned short wCurrentRate,
> -	unsigned char byFBOption
> -)
> +static void
> +s_vFillRTSHead(struct vnt_private *pDevice,
> +		unsigned char byPktType,
> +		void *pvRTS,
> +		unsigned int cbFrameLength,
> +		bool bNeedAck,
> +		bool bDisCRC,
> +		struct ieee80211_hdr *hdr,
> +		unsigned short wCurrentRate,
> +		unsigned char byFBOption)
>  {
>  	unsigned int uRTSFrameLen = 20;
>
> --
> 2.25.1
>
>
>
