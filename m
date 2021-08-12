Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF56D13
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 21:08:33 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id lw7-20020a17090b1807b029017881cc80b7so17327162pjb.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s7RmTXV1rtgfdtsCI73hdM+Qxlp56ePZYyS2TvYXHy0=;
        b=Jsgo+mi3WZrTSDyt8q/ESmF/EHxj9yFPwh/0j+7GpcvhIIk8KCAhIgloZNrMrqrIv7
         c4/As1N7gjjkh8Y7ESiMlOkKstFJSrY38qG7p5YNlGuY6pLRhR/onBnG5t19gW1SLpVX
         m/D+E6jfSS3i9vRN7/HxUGzMyp5JQYX74hpLuXc/olkzPW++Rd7Xev+oaAzXquocDyTG
         pPMZsyduHZyXGm1wIjhpgzRMY1Th29csXIkS7AwHUpRsGonFcLTxmP0VFnj04t63ykJy
         QFc2al99bWzRhQwwR/FMoXT3341qapOHjuGi9C66QxqOjN1Ce0nTTVafOTbcRx4v+ns3
         KXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s7RmTXV1rtgfdtsCI73hdM+Qxlp56ePZYyS2TvYXHy0=;
        b=QtQ6aMU++ka7Nq4ptqwzOfprtctCMnIDKcJu8ATAIkf+d6k4Jvy7yPuGKr+iI/+QpW
         ohd7xo6M0/94HKCuvEDyU0VzQP+MeKj1XLi9M+BTTV4WKCeiPUK7Eiura08oDHYAhpec
         A+d+xJc/25pkQ1283cgH2mqotPRVls8EbVV+Pyxer/lTJcjr1gDliQDNAWDWbyYTbbls
         /k2JANKVR2oBngNJ6Nb/ZGuX/h9VKFfaJmUAB/rAODuz97lbF2ETHxbVRB6/VspbAVxj
         9ZIW7KUR/D4B1HTOieDJNoPbSzjHQek0k5z4LJF9+wDk4caT3Ywn0QKcrk4vegLHHTR0
         9ZMA==
X-Gm-Message-State: AOAM5331yqHclmVWnzyRVklzNYM1fRhejXi8lmxxO9E4SZtMuk3HlJXe
	Un4Ce5bpGLm44qjK1gchJjST5y0FZryDltdOHF9Pn3FeP5w=
X-Google-Smtp-Source: ABdhPJzjHg3RbpWAOODxYFtknhA8PmgwNEs6HNL11CCJvjnYP1/m1/T+UJm+zQXMjaue3di5tN4RJ4k5WrwAgdPg3VY=
X-Received: by 2002:a17:90a:1f49:: with SMTP id y9mr18061147pjy.225.1628802512865;
 Thu, 12 Aug 2021 14:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210812204027.338872-1-nathan@kernel.org> <20210812204027.338872-2-nathan@kernel.org>
In-Reply-To: <20210812204027.338872-2-nathan@kernel.org>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 22:08:22 +0100
Message-ID: <CAA=Fs0meOs0uzN-3AS2a_Gwzs5eVvD6+xxPUkjhNFZ5L4WNx2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: r8188eu: Remove unused static inline
 functions in rtw_recv.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Aug 2021 at 21:40, Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit 987219ad34a6 ("staging: r8188eu: remove lines from Makefile
> that silence build warnings"), clang warns several times:
>
> In file included from
> drivers/staging/r8188eu/os_dep/../include/drv_types.h:22:
> drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:395:9: warning:
> variable 'buf_desc' is uninitialized when used here [-Wuninitialized]
>         return buf_desc;
>                ^~~~~~~~
> drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:391:25: note:
> initialize the variable 'buf_desc' to silence this warning
>         unsigned char *buf_desc;
>                                ^
>                                 = NULL
> drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:412:52: warning:
> variable 'buf_star' is uninitialized when used here [-Wuninitialized]
>         precv_frame = rxmem_to_recvframe((unsigned char *)buf_star);
>                                                           ^~~~~~~~
> drivers/staging/r8188eu/os_dep/../include/rtw_recv.h:410:14: note:
> initialize the variable 'buf_star' to silence this warning
>         u8 *buf_star;
>                     ^
>                      = NULL
> 2 warnings generated.
>
> The functions that these warnings come from are not used or are called
> from functions that are not used so just remove them to remove the
> warnings.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/staging/r8188eu/include/rtw_recv.h | 46 ----------------------
>  1 file changed, 46 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
> index 857269ae4209..81594e7aed51 100644
> --- a/drivers/staging/r8188eu/include/rtw_recv.h
> +++ b/drivers/staging/r8188eu/include/rtw_recv.h
> @@ -386,52 +386,6 @@ static inline u8 *recvframe_pull_tail(struct recv_frame *precvframe, int sz)
>         return precvframe->rx_tail;
>  }
>
> -static inline unsigned char *get_rxbuf_desc(struct recv_frame *precvframe)
> -{
> -       unsigned char *buf_desc;
> -
> -       if (precvframe == NULL)
> -               return NULL;
> -       return buf_desc;
> -}
> -
> -static inline struct recv_frame *rxmem_to_recvframe(u8 *rxmem)
> -{
> -       /* due to the design of 2048 bytes alignment of recv_frame,
> -        * we can reference the struct recv_frame */
> -       /* from any given member of recv_frame. */
> -       /*  rxmem indicates the any member/address in recv_frame */
> -
> -       return (struct recv_frame *)(((size_t)rxmem >> RXFRAME_ALIGN) << RXFRAME_ALIGN);
> -}
> -
> -static inline struct recv_frame *pkt_to_recvframe(struct sk_buff *pkt)
> -{
> -       u8 *buf_star;
> -       struct recv_frame *precv_frame;
> -       precv_frame = rxmem_to_recvframe((unsigned char *)buf_star);
> -
> -       return precv_frame;
> -}
> -
> -static inline u8 *pkt_to_recvmem(struct sk_buff *pkt)
> -{
> -       /*  return the rx_head */
> -
> -       struct recv_frame *precv_frame = pkt_to_recvframe(pkt);
> -
> -       return  precv_frame->rx_head;
> -}
> -
> -static inline u8 *pkt_to_recvdata(struct sk_buff *pkt)
> -{
> -       /*  return the rx_data */
> -
> -       struct recv_frame *precv_frame = pkt_to_recvframe(pkt);
> -
> -       return  precv_frame->rx_data;
> -}
> -
>  static inline int get_recvframe_len(struct recv_frame *precvframe)
>  {
>         return precvframe->len;
> --
> 2.33.0.rc2
>

Dear Nathan,

Thanks for this.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
