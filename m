Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF263205
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 20:38:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id er13so81333102edb.9
        for <linux-staging@lists.linux.dev>; Mon, 03 Apr 2023 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3F5+gh390KLS9RWOvvtlrwxg2Y0TraLv5K4Hb/H8OQ=;
        b=NEMhvrK570NYfHKHHwOAfmuEeVZApvKpl8+iN1zZSaaAv5qDjNOQhvVITYO5nCMg4p
         AaMoUv7H9IJZKK6kbJGWgNlyr0gZ7vLYAiY4ojUYdjTpnShjdT8XqiwmcmTRAsD7J1Q6
         jbN9A09WoawGsW4SY6woOKyFOw2JqhSs03w649lwv9VLoLtAkjjsPdRQaBhMhowpd4oM
         VzoU/5XuIXc6TGBI4hz6C7Ao91hZJiQNTSWJSWKql/YMZcsPrxjCyIhLB/Z1LMpeQIr3
         vuU4VP5frHjMDHSpeYgwXGyLwo+lHzN00JCd3mTVuBdZ5WNjhLK0HG3ihpxPmR42HMmc
         /sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3F5+gh390KLS9RWOvvtlrwxg2Y0TraLv5K4Hb/H8OQ=;
        b=vTAkLrqlkH8683T3DEB7GdUCi2nYHSBfsbeHYAnw7VnygBDXC9f38pRr+KmHbuhdy9
         H15rua11ycnhdbkPmqRv5Z3OBTA+tZPMP/ujunpeAevv34FZbtXgL8cRg3uRBIbOvCKe
         50VvNHDsQ/STe6cwrz5CBTNH3vaiLui2usEXMl5sKZeviC7dV/VJ9SYRpOe89RY13yvs
         YT1ZcBMOCRJTFAxDJKW0wkz/8bd5dddeaNNhklCeDqwZdSGs0Vhlyl/EbLIZApwDM3gp
         o0feYxBVe4T3xyYIS0KJ/PPuvpRh1r7xxln7bFV05leieA62Ir2by4RGxi/Idge3Wxd9
         dC7Q==
X-Gm-Message-State: AAQBX9cZypjDS2yDDdgS5QRvwlTtW4OUFqXH2QmAy39TOP1Bd2JYA7cX
	1gMyfJEM2+EXZ2Okg7BrdFk0uYL6usblw7LL0go=
X-Google-Smtp-Source: AKy350aKb1gVyrTMlWc2SVlN/6Abvr+c2pXRCZ62TGHslwYEHjDydpW7wvfnTYk7uuxoUrkxTUA+BU0oyRYCGKRpts4=
X-Received: by 2002:a17:906:3746:b0:8b1:cd2e:177a with SMTP id
 e6-20020a170906374600b008b1cd2e177amr18564878ejc.6.1680554321707; Mon, 03 Apr
 2023 13:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de> <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:38:30 +0200
Message-ID: <CAFBinCAsiSLwKho_7M4XoLXCk64XriwmBuosmMnWu=a1z97A_g@mail.gmail.com>
Subject: Re: [PATCH 12/24] staging: media: meson: vdec: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 5:40=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
