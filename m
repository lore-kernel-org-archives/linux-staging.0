Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7062F50;
	Fri, 15 Apr 2022 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nvgyd7nsErPK5Hx0ah3eRawHie2tosHU2RZ1F2LRT7A=;
  b=lDY/j+f8+rRy90He6KlcCcb0HaxWpUYyLiTeKHIQrwITCBoxPMGsBKrt
   lRenY2U19AL/QJ78ZUBcjBq8kAqoFsB6pnHi/TeKPEUj/arnnoBoUKcWs
   V2K2eKAJCI7iKZL93g3S8xMFUKWFLjjOvt24qBtziBVIcFqAQcATuGlSZ
   k=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,262,1643670000"; 
   d="scan'208";a="31878846"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 13:31:58 +0200
Date: Fri, 15 Apr 2022 13:31:57 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: forest@alittletooquiet.net, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: vt6655f: rxtx: code style - Fix Lines should
 not end with a '('
In-Reply-To: <20220415051900.5801-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204151330260.3175@hadrien>
References: <20220415051900.5801-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 15 Apr 2022, Aliya Rahmani wrote:

> Code style warnings reported by checkpatch.
> Improve the layout of a function header:
> *Put the first parameter immediately after the '(' and align the other
> parameters underneath it.

The subject line should cover the whole patch, not just part of it.

Similarly, I guess checkpatch just warned about the (, not about the whole
thing.

The log message should mention about static void.

There should be no * in front of "Put".

julia


>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
> v1->v2 changes: Put static and void on a single line.
>
> v2->v3->v4 changes: Rework commit description.
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
