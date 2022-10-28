Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D7E833;
	Fri, 28 Oct 2022 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0kHs01PQa80TsHGmTZUZWsuUjTB6ZMnDZZBdpbxyknA=;
  b=kmbA+1YsZfLc5Zs/C/3vkxApFiJBMskkMPoxWrVI+g2B59zrCOE8LtdQ
   nw4rf0okywtJUeUa4lH00QjdggpCSf6buI5twHJK/aZCBVDFXBD0XLHXM
   LKf8REzP0hDfYaxd70T7Kn5SBauaHwOVJcV8h/7yMnsbI+3cMGH9AGuNG
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,220,1661810400"; 
   d="scan'208";a="35792117"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 09:22:33 +0200
Date: Fri, 28 Oct 2022 09:22:33 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: UMWARI JOVIAL <umwarijovial@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] Remove Unnecessary typecast of c90 int constant
In-Reply-To: <20221028063711.GA35659@rdm>
Message-ID: <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
References: <20221028063711.GA35659@rdm>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 28 Oct 2022, UMWARI JOVIAL wrote:

> According to Linux kernel coding style.
>
> Reported by checkpatch:
> WARNING: Unnecessary typecast of c90 int constant - '(int)2.412e8' could be '2.412e8'
> WARNING: Unnecessary typecast of c90 int constant - '(int)2.487e8' could be '2.487e8'

It's not ideal to just include the checkpatch messges verbatim in your log
message.  It woudl be better to say what you are doing and why, in
complete sentences ("According to the Linux coding style" is not a
complete sentence).

I also suspect that the checkpatch message is wrong.  Floating point
numbers cannot be used in the kernel, and the case of the constant ensures
that the value will be converted to an integer at compile time.

julia

>
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> index fdf867a5dd7a..4fc4fb25d8d6 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> @@ -41,8 +41,8 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
>
>  	/* if setting by freq convert to channel */
>  	if (fwrq->e == 1) {
> -		if ((fwrq->m >= (int)2.412e8 &&
> -		     fwrq->m <= (int)2.487e8)) {
> +		if ((fwrq->m >= 2.412e8 &&
> +		     fwrq->m <= 2.487e8)) {
>  			int f = fwrq->m / 100000;
>  			int c = 0;
>
> --
> 2.25.1
>
>
>
