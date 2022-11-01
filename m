Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3D631;
	Tue,  1 Nov 2022 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wM1mxNTDtcUairCqBrzy8WxTnxIB4SujjebDqIvqZu4=;
  b=WErk21H6rbeVJ2neJoBo7FqqC41EOY9IdoXV49POgQtG7NmEjnlFa2nB
   PJgv3VCZ1tZxyQn6453/9lGY58K39gCFYIfutFADcgjnDd2OvX8GGAAYZ
   08+UaKdovDIh+mGjtEAtzXJIYmEi0zrNyrAQFtlGgje3F9+p1yUyUdGM4
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,230,1661810400"; 
   d="scan'208";a="36158477"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 09:43:51 +0100
Date: Tue, 1 Nov 2022 09:43:50 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: change variable name wTimeStampOff
In-Reply-To: <Y2DXsnrQjQeP2PfO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Message-ID: <alpine.DEB.2.22.394.2211010942210.2834@hadrien>
References: <Y2DXsnrQjQeP2PfO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Nov 2022, Tanjuate Brunostar wrote:

> Change the variable name wTimeStampOff to adhear to Linux kernel coding
> style, which does not allow naming variables in CamelCase. error is
> reported by checkpatch

adhear -> adhere

error -> Error

Actually, the variable is written in Hungarian notation, given the little
w at the beginning of its name.

Maybe

"Remove the use of Hungarian notation, which is not used in the Linux
kernel."

julia

>
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 1e5036121665..9bdcf2337235 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -54,7 +54,7 @@
>   */
>  #define CRITICAL_PACKET_LEN      256
>
> -static const unsigned short wTimeStampOff[2][MAX_RATE] = {
> +static const unsigned short time_stamp_off[2][MAX_RATE] = {
>  	{384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
>  	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
>  };
> @@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
>
>  static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
>  {
> -	return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
> +	return cpu_to_le16(time_stamp_off[priv->preamble_type % 2]
>  							[rate % MAX_RATE]);
>  }
>
> --
> 2.34.1
>
>
>
