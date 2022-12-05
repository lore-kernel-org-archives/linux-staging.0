Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45617E0
	for <linux-staging@lists.linux.dev>; Mon,  5 Dec 2022 08:52:33 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id k2so4434901qkk.7
        for <linux-staging@lists.linux.dev>; Mon, 05 Dec 2022 00:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fUiX2BOgIO3kRlBD2IZGFHz0fAiTgFWiM9Mfq43ZtE=;
        b=Iu8La7KAMGXv2lzvqMK5pz9D/HZQT5PlYat/572Xn4V5dMOdBjpgkghdtK1tX660iO
         nl3XDrTnMjQijpo9EDWFCpDMFkOAi+7Gya4MTz+fNXcxUbCBAGdzOtOy1sP+MEH/1TsD
         qdzXBXl+y94HF19w9iQSX9AW6SHYmUPanbO8IxAqtxv1MigmglOGEO4MDr6BZUnHhW52
         fOtw+A6tN3+jeV6ATO+nj2qHG4In5qP81Etj7BFhJALNi90v7ShSzmrK0b2O6Wbkzljg
         LuWjgAXdRTiUKJ2xvivQwTXMaFMUa0l5oqOel+Ilq2K2Rb1ZRPMi2krUWNflIarJlHLx
         EtrQ==
X-Gm-Message-State: ANoB5pkLQmUY+hghZOPB4FNjHrYVLZ8Zo222bAN4amj7IiaQwNclHgjV
	EynAFsHCAiW5sVXGpewq9aZL2yCkhzncQw==
X-Google-Smtp-Source: AA0mqf5o1SVYg1HHwCFQV4bA4csqSpF6nzeEZ6pfIwqSH/VpNdhxAF99Nst2cBn1a+0FmV3tSZmgKA==
X-Received: by 2002:a37:4642:0:b0:6fc:a03e:fcdf with SMTP id t63-20020a374642000000b006fca03efcdfmr18094639qka.139.1670230351931;
        Mon, 05 Dec 2022 00:52:31 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id ay40-20020a05622a22a800b003a57a317c17sm9224678qtb.74.2022.12.05.00.52.31
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:52:31 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id v206so13579388ybv.7
        for <linux-staging@lists.linux.dev>; Mon, 05 Dec 2022 00:52:31 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id 9-20020a250009000000b006f929efa5eemr24512006yba.380.1670230350890;
 Mon, 05 Dec 2022 00:52:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221203030544.11543-1-jwp.linux@gmail.com>
In-Reply-To: <20221203030544.11543-1-jwp.linux@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Dec 2022 09:52:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=8zBgY-Nsq2W99X1XCn8v17w5mScFixVOr8vrDpEEvg@mail.gmail.com>
Message-ID: <CAMuHMdW=8zBgY-Nsq2W99X1XCn8v17w5mScFixVOr8vrDpEEvg@mail.gmail.com>
Subject: Re: [PATCH] staging: board: Remove control flow from macro
To: Joe Peterson <jwp.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joe,

On Sat, Dec 3, 2022 at 4:08 AM Joe Peterson <jwp.linux@gmail.com> wrote:
> Adhere to Linux coding style
>
> Reported by checkpatch:
>
> WARNING: Macros with flow control statements should be avoided
>
> There is only one return value possible. Remove the checkpatch warning
> without effecting functionality.
>
> Signed-off-by: Joe Peterson <jwp.linux@gmail.com>

Thanks for your patch!
But please try to compile it before submission.

> --- a/drivers/staging/board/board.h
> +++ b/drivers/staging/board/board.h
> @@ -33,12 +33,10 @@ void board_staging_register_devices(const struct board_staging_dev *devs,
>                                     unsigned int ndevs);
>
>  #define board_staging(str, fn)                 \
> -static int __init runtime_board_check(void)    \
> +static void __init runtime_board_check(void)   \

device_initcalls must adhere to the initcall_t signature, regardless
what checkpatch says, cfr. include/linux/init.h:

    typedef int (*initcall_t)(void);

>  {                                              \
>         if (of_machine_is_compatible(str))      \
>                 fn();                           \
> -                                               \
> -       return 0;                               \
>  }                                              \
>                                                 \
>  device_initcall(runtime_board_check)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
