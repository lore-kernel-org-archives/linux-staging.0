Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB4259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 09:49:20 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AD8yUR6pWVhvFbSZEUUvkrlMaV5qReYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnzhfykjkcQzUNntqHNamGTxrnmqJdy48XILukQU3aqH?=
 =?us-ascii?q?KlRbsD0aLO4R3FXxf/+OlUyLt6f8FFY+HYIFBmga/BkW2FOvk6xt3vytHKuc77?=
 =?us-ascii?q?71NACT5ncLth6QARMGqmO2l7XhNPC5Z8NJf03KR6jgGtc3gWcci3b0NtN4Kvm/?=
 =?us-ascii?q?TwiJnkbRQabiRXjTWmsDXA0s+ZLzGomjsYTjNT0fMD3AH+4nXEz5Tmid/+5j/w?=
 =?us-ascii?q?vlWjiKh+qZ/a5J9iKaW3+64oAwSptg2lf8BAVtS53QwInA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,304,1610406000"; 
   d="scan'208";a="501509798"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Apr 2021 11:49:18 +0200
Date: Sun, 4 Apr 2021 11:49:18 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deborah Brouwer <deborahbrouwer3563@gmail.com>
cc: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org, 
    straube.linux@gmail.com, unixbhaskar@gmail.com, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8188eu: replace goto with
 direct return
In-Reply-To: <20210404054008.23525-1-deborahbrouwer3563@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104041148590.2958@hadrien>
References: <20210404054008.23525-1-deborahbrouwer3563@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 3 Apr 2021, Deborah Brouwer wrote:

> To conform with Linux kernel coding style, replace goto statement that
> does no cleanup with a direct return.  To preserve meaning, copy comments
> from the original goto statement to the return statement.  Identified by
> the checkpatch warning: WARNING: void function return statements are not
> generally useful.

Maybe the comments are meant as TODO items?

julia

>
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  drivers/staging/rtl8188eu/hal/rtl8188e_dm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> index 391c59490718..d21f21857c20 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> @@ -139,7 +139,9 @@ void rtw_hal_dm_watchdog(struct adapter *Adapter)
>  	hw_init_completed = Adapter->hw_init_completed;
>
>  	if (!hw_init_completed)
> -		goto skip_dm;
> +		/*  Check GPIO to determine current RF on/off and Pbc status. */
> +		/*  Check Hardware Radio ON/OFF or not */
> +		return;
>
>  	/* ODM */
>  	pmlmepriv = &Adapter->mlmepriv;
> @@ -156,10 +158,8 @@ void rtw_hal_dm_watchdog(struct adapter *Adapter)
>
>  	Adapter->HalData->odmpriv.bLinked = bLinked;
>  	ODM_DMWatchdog(&Adapter->HalData->odmpriv);
> -skip_dm:
>  	/*  Check GPIO to determine current RF on/off and Pbc status. */
>  	/*  Check Hardware Radio ON/OFF or not */
> -	return;
>  }
>
>  void rtw_hal_dm_init(struct adapter *Adapter)
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210404054008.23525-1-deborahbrouwer3563%40gmail.com.
>
