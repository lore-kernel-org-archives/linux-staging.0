Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79C2FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:12:07 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id q2so15904428plr.11
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NhNQ3d1S2VyVbXFpk6PnraqJwxymJZt+vRaCMuxw3ck=;
        b=tO8GYJoOrj09sNBToZdSMHpLt5lX5x0MyEfXU3RTw7Un6sECKeQkT4kNXi+NDx2hwb
         /VtGZaiICvXiTr6Ykjsth+a9tXFaN2bV1zODBk458fo6z8CJarTtVqKj6rxrdmF+5gYW
         rMBQosC+utUgdAg8R3Ykn4qrHMZLWA4UjVrTJt7gWUS3OgQe8SL+RWeekYY4SzE+sxMo
         k/MCJ32zrRsu4V/tLK2kcq1XTotPXcwSjPxJRDjK7KHMuxm0+aENmik+wQGUTmT4gpif
         edIsH9cqVI2yyrnetQOnnksA+SygXejIQoN/s5vNDgYNxkVBenhH3hrTg9h3BnduUpOS
         5QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NhNQ3d1S2VyVbXFpk6PnraqJwxymJZt+vRaCMuxw3ck=;
        b=cRh4rmNsSKDZ9TnMRuP1hkridL11E78xk4nxnf9brMjUTOTz/PgU+oXgHmILd99MfG
         vIIoXE+o/I0tdKNT5RVk9IdVSy66qY2BI7+AMulY6Rh/URLbApdkjtr6/ZTP/lrGGKuW
         OnnBS/VYlRNA/FcuqgyZHzdufqqTNGd0bBdFmu4FbOS+2aW+elN5ZHFGD5LdTsM1Uy97
         NO7OiGtHIQGgG/6tBfku/j63KH8pE5ImeBZntlaVIuJgxn1RGyEL2NIS1V7wKuH5avZE
         SukqEHzHom9k2GEVQyHMgEhOqwKMGxalEYsFNgSdXHy7/hhWejPstiA7I/rOFcPDBqbZ
         HmZQ==
X-Gm-Message-State: AOAM531ahvFasTuifIGtn7I1Z1mnEa17qyCKMsVKlr6mGQAx2wRY8dcB
	4spycXJAZbDSNFw5MHF3IJlvAuqpxFqssDY9J91OAXGJXr+EDEJ8
X-Google-Smtp-Source: ABdhPJwk6IRQHz8dyy7/VfLN3ZhOBlV5/7KQqbE98v7+lFYZrNtigyOeWahiW7+nTAUdtd9NRf10W0kelq8/lfJdBKs=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr6412260plo.37.1628961127429; Sat, 14 Aug
 2021 10:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210813073109.25609-1-straube.linux@gmail.com> <20210813073109.25609-2-straube.linux@gmail.com>
In-Reply-To: <20210813073109.25609-2-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:11:56 +0100
Message-ID: <CAA=Fs0nkTO5PyQasfRNNbATs-HuN1GAz1gWHjhhARFh8-PEpHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: r8188eu: remove 5GHz code from Hal_GetChnlGroup88E()
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 08:32, Michael Straube <straube.linux@gmail.com> wrote:
>
> Remove 5GHz code from Hal_GetChnlGroup88E().
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 62 +++++--------------
>  1 file changed, 14 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index f0560c15387c..634a0a022727 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -2062,54 +2062,20 @@ static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G,
>
>  static u8 Hal_GetChnlGroup88E(u8 chnl, u8 *pGroup)
>  {
> -       u8 bIn24G = true;
> -
> -       if (chnl <= 14) {
> -               bIn24G = true;
> -
> -               if (chnl < 3)                   /*  Channel 1-2 */
> -                       *pGroup = 0;
> -               else if (chnl < 6)              /*  Channel 3-5 */
> -                       *pGroup = 1;
> -               else     if (chnl < 9)          /*  Channel 6-8 */
> -                       *pGroup = 2;
> -               else if (chnl < 12)             /*  Channel 9-11 */
> -                       *pGroup = 3;
> -               else if (chnl < 14)             /*  Channel 12-13 */
> -                       *pGroup = 4;
> -               else if (chnl == 14)            /*  Channel 14 */
> -                       *pGroup = 5;
> -       } else {
> -               bIn24G = false;
> -
> -               if (chnl <= 40)
> -                       *pGroup = 0;
> -               else if (chnl <= 48)
> -                       *pGroup = 1;
> -               else     if (chnl <= 56)
> -                       *pGroup = 2;
> -               else if (chnl <= 64)
> -                       *pGroup = 3;
> -               else if (chnl <= 104)
> -                       *pGroup = 4;
> -               else if (chnl <= 112)
> -                       *pGroup = 5;
> -               else if (chnl <= 120)
> -                       *pGroup = 5;
> -               else if (chnl <= 128)
> -                       *pGroup = 6;
> -               else if (chnl <= 136)
> -                       *pGroup = 7;
> -               else if (chnl <= 144)
> -                       *pGroup = 8;
> -               else if (chnl <= 153)
> -                       *pGroup = 9;
> -               else if (chnl <= 161)
> -                       *pGroup = 10;
> -               else if (chnl <= 177)
> -                       *pGroup = 11;
> -       }
> -       return bIn24G;
> +       if (chnl < 3)                   /*  Channel 1-2 */
> +               *pGroup = 0;
> +       else if (chnl < 6)              /*  Channel 3-5 */
> +               *pGroup = 1;
> +       else if (chnl < 9)              /*  Channel 6-8 */
> +               *pGroup = 2;
> +       else if (chnl < 12)             /*  Channel 9-11 */
> +               *pGroup = 3;
> +       else if (chnl < 14)             /*  Channel 12-13 */
> +               *pGroup = 4;
> +       else if (chnl == 14)            /*  Channel 14 */
> +               *pGroup = 5;
> +
> +       return true;
>  }
>
>  void Hal_ReadPowerSavingMode88E(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
> --
> 2.32.0
>

Dear Michael,

Looks good to me, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
