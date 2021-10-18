Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC1572
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 23:48:53 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id kk10so13355469pjb.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 16:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjJmB2kSFRa+PVzQW4Tlhv7PdsoaNoVuz5+nTON3mTk=;
        b=fBiLFwAZ1toZ8kccvHjc15v7lGeRm1qPJgQNuxQYag7MstqWTwMPXsna/pKlQgzyKu
         nffLzqx4o81C2miFc+mZlJOEqqdU6njnAQFHJSaLTWJ5PqPZY1i3CnmuzqXuF7uC/Yna
         4J/lGjZrZz+frWC69SsAhfe+nDQZq4rx6tr7IPOcbUV+8zhkObfNaNLgLMOmi9oS1Gt1
         8b+Yi0PWlVpp3qQAvLlvwBnGIV9j6j4hbrjLfyTMZfOPSzUPxrsnoiwHrItP0XaxUaT0
         PvrBE7qhXsM/A2fm+oSQh66bWiigV3aGnq3fWKJLKowelpITkPLw/576Dk+A6B1hH29G
         Nrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjJmB2kSFRa+PVzQW4Tlhv7PdsoaNoVuz5+nTON3mTk=;
        b=YnhUI1SXC17Nq6M8qrPp2A/L74RKuz5fxdPElaTquO/TAkxZXc6S7pYsAJW9def8sA
         XCDDGQcEMdaWVmYWaYFZpVkDNc5XzBUt3OBADJxpUyBLoEB/7Wssh1/VPnVkCK7HJCQT
         2Z+cJfwkaGA+EGIxY8u8WCDchseIswfSQGWYDBtoJIaYZ8q2+GlonDlwAf6BAOwg5nHj
         eXb+a6kiekYdmaSGF9Lb3oJX4kAtWowjo3EuFjzjUM/5Mp/tnUEH+h0rNhAvP2ADmtS8
         MoK3dgrwN40CeqAzfwhpZ7mv8IQ4lLatE9YkiuVUPjFeWTfoyJBJB8qcaLozjTT1LffH
         MM0g==
X-Gm-Message-State: AOAM530ynTSNh+v7rpeWDr2KE+KAxaRU2ss9I/AclCD3PWt7Vi71PaXO
	iToU2pU1pIqRmFj+EqT3YE/CDyGRJBjSApj21EAaKQ==
X-Google-Smtp-Source: ABdhPJxjqB0fQ1WTr+FNiWx+sYYdMjVhmtJgT2gl7LjwG0oRdPiz7rTQ/m09rKA/pAWBRrcOG0K9Pk9NyuyueRZs8sk=
X-Received: by 2002:a17:902:be0c:b0:13e:2b53:d3 with SMTP id
 r12-20020a170902be0c00b0013e2b5300d3mr30317072pls.86.1634600932965; Mon, 18
 Oct 2021 16:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018221231.7837-1-straube.linux@gmail.com>
In-Reply-To: <20211018221231.7837-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 19 Oct 2021 00:48:42 +0100
Message-ID: <CAA=Fs0nvM4qYx_tOvQ5uKLa24bje=APMV61DHwjvCbgX-bwJHw@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: fix a gcc warning
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Oct 2021 at 23:13, Michael Straube <straube.linux@gmail.com> wrote:
>
> Replace strncpy with strlcpy to fix the following gcc warning.
>
> drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function 'rtw_wx_set_enc_ext':
> drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
>  1929 |         strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The destination buffer size is IEEE_CRYPT_ALG_NAME_LEN and the length
> of the string to copy is always < IEEE_CRYPT_ALG_NAME_LEN. So strlcpy
> will never truncate the string.
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 51f46696a593..4f0ae821d193 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -1926,7 +1926,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
>                 return -1;
>         }
>
> -       strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
> +       strlcpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
>
>         if (pext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY)
>                 param->u.crypt.set_tx = 1;
> --
> 2.33.0
>

Looks good, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
