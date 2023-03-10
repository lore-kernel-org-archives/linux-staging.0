Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DBC957;
	Fri, 10 Mar 2023 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=C22Vv52YlLFXDQAzrVyEnZsk3nV/t8HWy5YvoTmURaw=;
  b=INf9NsDQos40foWQCkzV1iCnlmTywX09p/3WTixKooa/ojJMhXBJtikJ
   7QJbnFV4orp3M4cMuX0E0InFfuBC5jpOTeHuZ4MFI/4/S89bvpnVkcYXp
   GvXLa8WPgDjX/0vv/qAFVVfhz5CE3ZgdzJRGW3r8v9XagvjkYrs/I6mXf
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,250,1673910000"; 
   d="scan'208";a="96598247"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:40:43 +0100
Date: Fri, 10 Mar 2023 22:40:43 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Khadija Kamran <kamrankhadijadj@gmail.com>
cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, 
    Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix exceeds line length
In-Reply-To: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
Message-ID: <alpine.DEB.2.22.394.2303102239560.3199@hadrien>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 10 Mar 2023, Khadija Kamran wrote:

> Length of line 182 exceeds 100 columns in file
> drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> line.

Try to rephrase without using "fix".  Fix doens't give any information
about what is actually done.

julia

>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..0f0fbc263f8a 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,7 +179,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
>  					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +						WD_STATE_COLDBOOT_TRIG);
>  					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>  							       flags);
>  					return IRQ_WAKE_THREAD;
> --
> 2.34.1
>
>
>
