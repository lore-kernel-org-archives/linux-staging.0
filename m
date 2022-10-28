Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D81C37;
	Fri, 28 Oct 2022 07:36:12 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id t25so11006520ejb.8;
        Fri, 28 Oct 2022 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKJ5r/q/Yy9VT78nV3w6gSs1ak2aEKG2uth6YZ5nlug=;
        b=kfW88ytyZRGIuzdkWXlOI8hTN0HeUNZDVaTTf95TWEIzVR1oEdKdD7+5ar/8xUsSPc
         zY3rSEP5d1yPgSReMtm9FPulegIYz2SEdADR64OU5jLE+fJ3drdBDNoze0V2Vtf+hnya
         MwFFznd7iQgvr6H5qJw4jdaxSthV0HZLS37JrEv8DKbtv9tDardqB2rKG17ikmtv+F0i
         F+uKeQB+Wee4P7/P2/AIQJOT/nb/Hk5RFdU2RxJL79s18asT1+Pr9RoFhS9tdTO4evaL
         um3VNIEhfH1RDxaxiNgVLLbbBf0zlnZBXiZjoGYkaP3/Rzm6DEBzHK5cPnWOiP7kwHJc
         erVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKJ5r/q/Yy9VT78nV3w6gSs1ak2aEKG2uth6YZ5nlug=;
        b=ORpaTRqebyZ6Q4kFfgisEkPTDfKYshIEPM5mhjr8twE8YlvyxJ7j6EgwiU55QsfNF9
         jdlZq1EpeafiPNnlzs+EvlSmGJI2h6wsXdROqXtkOrH35MjECjy/65Fmbunyn0vIm07D
         ooW1KPfSrJvQTWNiw28En28oM611fsi6fxE0Dy4syNQK9o+/h/uvzLNj3SVCahhcbyKg
         +jhDXJ9XkvQwjc30xwOhyY1pEdEQ5FHZEuZ+blCPnW/8vkS5/cNk+/PEG/rwVQ83KCkV
         7J0yUwGfi6w65J9tgPN90QGiKjykJSe5s79WSq7k0pNafwEG0W6nA+9kcJEmRRJ4NLux
         YMAw==
X-Gm-Message-State: ACrzQf1LfJS0ZbcK//1nWfaXwSVGzepwNthmQEBoXzurrLDutdEefTRN
	uIhtDJCJ1gm47l59nlnA2Fs1LYI4QE8=
X-Google-Smtp-Source: AMsMyM6ijVP5KqnURG30Tu2CTNcc2Vdoe8lpMcKLhjLAMugVyOYBY2bE3iaRPz8ZJUBKb5wM+wHorg==
X-Received: by 2002:a17:907:16a5:b0:78d:e608:f073 with SMTP id hc37-20020a17090716a500b0078de608f073mr45992011ejc.753.1666942570957;
        Fri, 28 Oct 2022 00:36:10 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id x9-20020a056402414900b004589da5e5cesm2199899eda.41.2022.10.28.00.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:36:10 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:35:57 +0200
From: Nam Cao <namcaov@gmail.com>
To: UMWARI JOVIAL <umwarijovial@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH]  Possible repeated word: 'very'
Message-ID: <20221028073557.GA42252@nam-dell>
References: <20221028070439.GA36889@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028070439.GA36889@rdm>

On Fri, Oct 28, 2022 at 10:04:39AM +0300, UMWARI JOVIAL wrote:
> Reported By checkpatch.pl script
> 
> WARNING: Possible repeated word: 'very'
> 
> Repetition of the same word in one sentence same line
> 
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> index 090345bad223..30a0276b8b58 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
>   * If we turn on USE_RXTHREAD, then, no need for critical section.
>   * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
>   *
> - * Must be very very cautious...
> + * Must be very cautious...
>   *
>   */
>  struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)
> -- 
> 2.25.1
>

This patch is an updated version of another patch you sent, so you must
use the "v2" prefix. Furthermore, you need to have to name of the
subsystem that change. So it should be something like: 
[PATCH v2] staging: rtl8712: <short description of the commit>

And I think the person who wrote that just wanted to stress it by
duplicating "very". So I don't think this patch is necessary.

Best regards,
Nam
