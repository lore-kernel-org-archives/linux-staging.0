Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE6F7E;
	Tue,  1 Nov 2022 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GG6G19Dw61h46cRqgKoqpHdx8HuhrH5txfbi2tDzYa0=;
  b=o50ZRsW5a6aRqDm2z0d+OD1yrE5QszV6+XSLcDHVWyDU3J4A9E2t3yK7
   RqT8PNLupgvRAySYQACD155IrfZT29vcZGouRsAJJR9huwFyriFMoa/IJ
   Q4IfZr0vLt3+vUvdShbec7eVXjMnwWABPr2mUmETbGpAg28zkWS8+LE3/
   M=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,230,1661810400"; 
   d="scan'208";a="36170369"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 12:33:40 +0100
Date: Tue, 1 Nov 2022 12:33:38 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 2/2] Join some lines of code to avoid a line ending in
 a (
In-Reply-To: <1da74119d5a50ef97e68f26c82c9c9e429f8d0ec.1667300134.git.tanjubrunostar0@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2211011232540.2834@hadrien>
References: <cover.1667300134.git.tanjubrunostar0@gmail.com> <1da74119d5a50ef97e68f26c82c9c9e429f8d0ec.1667300134.git.tanjubrunostar0@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Nov 2022, Tanjuate Brunostar wrote:

> The code line ends with a '(' which is not allowed in
> Linux kernel coding. Joining the lines and indenting
> correctly improves visibility

I think Greg discouraged saying "not allowed by the coding style" and
instead encouraged thinking about the reason why the thing is not a good
idea and the change is helpful.

julia

>
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index d7e439cd8675..df7473155704 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -555,19 +555,15 @@ s_uFillDataHead(
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
> +static void fill_rts_head(struct vnt_private *pDevice,
> +			  unsigned char byPktType,
> +			  void *pvRTS,
> +			  unsigned int cbFrameLength,
> +			  bool bNeedAck,
> +			  bool bDisCRC,
> +			  struct ieee80211_hdr *hdr,
> +			  unsigned short wCurrentRate,
> +			  unsigned char byFBOption)
>  {
>  	unsigned int uRTSFrameLen = 20;
>
> --
> 2.34.1
>
>
>
