Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAFE2C82
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 18:53:18 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y30so34500584edi.0
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BtprXbIXI7MxDDg305llgHuCQHHKqelf16xVT32hzUo=;
        b=CVblfMWT89Xi/F9ZCMw95Kryy9Fz6VM+qCdOtBzVHBKRyur6SAhmnX+AbQpXIbrshk
         qD+SAbNgeCF8Qi5npkgRFrL6X4NGD/acLCMfs76D71UkqGBwPEpCHsW7zaPuUq9aT1UA
         JHEItwD9/wAdMSfDpljk3CEuGLudNSsTwW0wDCbQuF1sMJG5ej4gDKhsMQC+pbAb3/Be
         GSPooGr2Gm6nirr7arZKjCwOIFCamxwk+IUCHmP7RLAPW6Eiq3aW5V0zzD2CYOm4D5DJ
         FvFKjTUwVvibw6+wcPymw3EfKFVFYUEoxkDDFiInzCLu2lsY3bR2UXG2SkiwuEBVgmsQ
         cYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BtprXbIXI7MxDDg305llgHuCQHHKqelf16xVT32hzUo=;
        b=KwXRTqrIfx/pNStBe+wlYLNjkph21w4I8ScCIDB2spe9cazZjMbkXlfzJYSpwPBbcO
         CyRcJlMt4U++zLk97d1hPxvOil4EsOdzKpXsPM0wTUVhsDw2EXu1cItFZ1FUxmJU7uxp
         W8R6CNQeZ3u95Z/Qpb3k3cOcKmmXXo9gT1mJq2A6sjO+9RDq7T0ujwW5XJEr5sqHHfNF
         gY6xMvYJAfjMLD9MTzl9KW9KYy1MJedV2Ixbl4U4w5arIUTVWmk6L49469zj79uA0iU2
         SmGh/3K4JSPh56STsnmFKtSmsulYIOdk7px/P+vshcyhGka7Ly5iIneUfLOVZ2NhbDii
         x5jQ==
X-Gm-Message-State: AOAM53199Iq3ibRfwsDY4CPSFB5UNL6C5I5y4QHmNzHgJSKNo1NqCTj1
	cQU72rZcWfuyfrEiYKaUyOU=
X-Google-Smtp-Source: ABdhPJzJKdn04DV/MlmrAKI3JAm4LATUrizAG7uwuzhNB9krJAR+31IspcdkLt++CfckUkFfGUBVPg==
X-Received: by 2002:a05:6402:4311:: with SMTP id m17mr28643646edc.368.1634410397223;
        Sat, 16 Oct 2021 11:53:17 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id x22sm7142450edv.14.2021.10.16.11.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 11:53:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Date: Sat, 16 Oct 2021 20:53:15 +0200
Message-ID: <2409617.cBYgoVRs56@localhost.localdomain>
In-Reply-To: <20211016181343.3686-4-martin@kaiser.cx>
References: <20211016181343.3686-1-martin@kaiser.cx> <20211016181343.3686-4-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, October 16, 2021 8:13:43 PM CEST Martin Kaiser wrote:
> At the moment, our command thread can be killed by user space.
> 
> [root@host ]# kill `pidof RTW_CMD_THREAD`
> 
> The driver will then stop working until the module is unloaded
> and reloaded.
> 
> Don't process SIGTERM in the command thread. Other drivers that have a
> command thread don't process SIGTERM either.

Hi Martin,

This is _really_ interesting :)

May be that you have had time to read my last email in reply to a message of 
Phillip P. Soon after writing of the arguments in favor of using 
wait_for_completion_killable() (in patch 2/3 of the series I sent today), I 
read your patch.

If you are right (and I think you are) I'll have to send a v2 that replaces 
the killable wait with an uninterruptible one.

Unfortunately I have not the needed experience to decide whether or not to 
ack your patch, even if I'm strongly tempted to do it.

Let's wait for more experienced people.

Thanks,

Fabio 

> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c          | 2 --
>  drivers/staging/r8188eu/include/osdep_service.h | 5 -----
>  2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/
r8188eu/core/rtw_cmd.c
> index e17332677daa..b834fac41627 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -243,8 +243,6 @@ int rtw_cmd_thread(void *context)
>  	struct adapter *padapter = (struct adapter *)context;
>  	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
>  
> -	thread_enter("RTW_CMD_THREAD");
> -
>  	pcmdbuf = pcmdpriv->cmd_buf;
>  
>  	pcmdpriv->cmdthd_running = true;
> diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/
staging/r8188eu/include/osdep_service.h
> index ee8a64bb3126..886a1b6f30b4 100644
> --- a/drivers/staging/r8188eu/include/osdep_service.h
> +++ b/drivers/staging/r8188eu/include/osdep_service.h
> @@ -160,11 +160,6 @@ static inline unsigned char _cancel_timer_ex(struct 
timer_list *ptimer)
>  	return del_timer_sync(ptimer);
>  }
>  
> -static __inline void thread_enter(char *name)
> -{
> -	allow_signal(SIGTERM);
> -}
> -
>  static inline void flush_signals_thread(void)
>  {
>  	if (signal_pending (current))
> -- 
> 2.20.1
> 
> 
> 




