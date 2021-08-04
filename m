Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644970
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 18:38:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id x8so6108057lfe.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z3rdKtAtmpUfyg0lATOCk0JofX75VMc/F9YVDgzTlmo=;
        b=hL3kh7fJ702qfHXGRmuNiz3WpbcUAIrGJjPnBX5dl7IcYmyfOdz543UZqWDT9auUXu
         +VKOuEoya/RW3soo5yomR07LY2DsOXiifZCXUkIY4JBqSOvAdGB29LKMpJPtxEgPSUHR
         H++B0VlI83gfkmknd9OB6FSzqh5klIS5f4O0o4yySG8tzcz11ZqasKTe2ESGVrsYod1Z
         xm8x2moPh0FqBv8qLK9+EW15OlH9eSsWWrQsnVQLnXhNgf2SjdRb/Knf6kdg46Wt+QCC
         mAJLezw1X8dPuqC2g7ftR97cJZOagQQb3QqKIBdHNQkU6GCqg63/eg30usVvtY6OJ2L+
         FNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z3rdKtAtmpUfyg0lATOCk0JofX75VMc/F9YVDgzTlmo=;
        b=nEBmSLnIR9DPhxJrH//jEHtcT8tIioDvNetD9XMfdjdB8Tp6PgDO6MWSk97hBDeoO+
         5ucvn6Wxxo4hHT127XjfmJ8R6FA+I+4u2PDl9JlcYFggHlNiJkeR2gy7xKv5rruueLcc
         k9PPBl6TreCTJl4lMYoHAj0F4OaRtJxOgpiqRETjX4j2bc7k7VQsD+ozS5cnK2YCVGuk
         XD4q82AkZBMMzcSfxHaJmafTnmoBJlJfS0SmYV8VW/WMygggtX7nlknfjiTvIzC5kfr0
         gU1DZ+rnYxHE5PEvSvUW3OVFt1KZitOptHcpVXv00g/S07TTVwrwr/Nrv41mSYqBlvq9
         V5EA==
X-Gm-Message-State: AOAM531gKsLUp0T9HsFvehFN33tVFjS2VN81SaIuTZXJWeNO98COEeWG
	Lfn3a9HiVMxvpUORWwSsvr0djS5IjRG6QViWf3WlQQ==
X-Google-Smtp-Source: ABdhPJwmIgOGB5O+9dimurF7YRRNX7IZEMgxHnqzHkVp9BaLqeko7Y4HJz1/6ayQ0E/T76/BZdQ9QGAMvx4jBBfRMII=
X-Received: by 2002:a05:6512:2215:: with SMTP id h21mr413449lfu.543.1628102286318;
 Wed, 04 Aug 2021 11:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803223609.1627280-1-nathan@kernel.org> <20210803223609.1627280-4-nathan@kernel.org>
In-Reply-To: <20210803223609.1627280-4-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 4 Aug 2021 11:37:55 -0700
Message-ID: <CAKwvOdkehOWitL+o4s2jWiPk0eTmcjrntiw2rLbpiGynTqSfRw@mail.gmail.com>
Subject: Re: [PATCH 3/4] staging: r8188eu: Remove self assignment in get_rx_power_val_by_reg()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, 
	Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 3:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> drivers/staging/r8188eu/hal/rtl8188e_rf6052.c:344:13: warning:
> explicitly assigning value of variable of type 'u32' (aka 'unsigned
> int') to itself [-Wself-assign]
>                         writeVal = writeVal;
>                         ~~~~~~~~ ^ ~~~~~~~~
> 1 warning generated.
>
> Remove this branch as it is useless.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
> index 335b120ce603..77889dc05858 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
> @@ -340,8 +340,6 @@ static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
>                 /*  This mechanism is only applied when Driver-Highpower-Mechanism is OFF. */
>                 if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_BT1)
>                         writeVal = writeVal - 0x06060606;
> -               else if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_BT2)
> -                       writeVal = writeVal;

Hopefully the author didn't mean to subtract another magic constant
like they did above. This also eliminates the last use of
TxHighPwrLevel_BT2, but it's probably ok to keep the define in
drivers/staging/r8188eu/include/odm.h.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>                 *(pOutWriteVal+rf) = writeVal;
>         }
>  }
> --
> 2.33.0.rc0


-- 
Thanks,
~Nick Desaulniers
