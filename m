Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E850FC17
	for <linux-staging@lists.linux.dev>; Sun,  4 Jun 2023 19:23:47 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-75b08639930so276358785a.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Jun 2023 12:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685906627; x=1688498627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVbMV4Fyk+vFfbDJVfsuWuVIXsZc0/kefuV8qHtnk60=;
        b=cFatySjHtfCAJm6h2k+kQ62t7EZrdLAIyMHwqGIH5L3N/3PsJ9GrCplQ7Ed4Kg7ROD
         4I77cl9GOsrkY3USyZEkdbpa1fOpFzbiYA7IC2jZhCk0rv1nFRXbnxsMSspmyLAiJ1IR
         yTZX3/SYmw7dCfwwAlv75Pi3rNwUhGeeyWoGUXKRwR6ot9y325AnRmxxr3NiBrN3n6bH
         7ols+gFCcbPzVhU8lAx7gWyEzlczay5zv+n9dJYEEnJh0iam4I51WAnVA3ZqcebWn/vM
         RtF6Gzx5K8scP6G1RPfHWqBvlu5cwPfEhrzmXj6qxF5sESMtTZJ6DAEsS0UPP+yGTMor
         mPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685906627; x=1688498627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVbMV4Fyk+vFfbDJVfsuWuVIXsZc0/kefuV8qHtnk60=;
        b=J8FI1/8hyOuZBngYBx68NVFI0k6gGuGyLVvIHWQzf4A1W9j4g4A/o1r7fAS8xdZXhl
         JZNZD1XnRGE9CdLz4JniAvw08nI0A0HtZSxyEIHKGDJMaR3B69sPce57qsFzl6vkDKLw
         zZlZd9iteo7w0zd51O2Nk678PgWs30T01kFcmWVk9EQlF2khxtYQmV6tBH0hyiiR6p6a
         l1cwYehOMx26yFAMS5X+jaZZi+2G9UaRWEEDk/ZRuSpwnwio7enuV1s0sa1V+VTM50Xh
         27HaXM+r3SlbCHNsMGK05fB6F/yvH7OfpMl2+QNARQZNC5jBu+xDl/XJtnLiedb6SX0y
         cH4g==
X-Gm-Message-State: AC+VfDwFkoe4If/2bjtmW8oO6KjCZuTJ1d/LdYSPiSKu78hpjmDavdR0
	0i072DKw7+iotoRWRlrRSaI0NTVJFgPWcdDNKVM=
X-Google-Smtp-Source: ACHHUZ6m2Hw22Ii0/LYh5nWdQjyuwunuh/Q3gu2+gA+HvsTfu94X180CxrN5dD5F7/QuKL1d3nglkJEeS0GKtSBu2lE=
X-Received: by 2002:a05:620a:6844:b0:75b:23a1:d8d3 with SMTP id
 ru4-20020a05620a684400b0075b23a1d8d3mr14854800qkn.23.1685906626770; Sun, 04
 Jun 2023 12:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230604161406.69369-1-hdegoede@redhat.com> <20230604161406.69369-4-hdegoede@redhat.com>
In-Reply-To: <20230604161406.69369-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 4 Jun 2023 22:23:10 +0300
Message-ID: <CAHp75VciVFzdUAkcGJO66ZCLks8qKmE-_TCp+6pnhtkGeiYurA@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: atomisp: ov2680: Remove unnecessary registers
 from ov2680_global_setting[]
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 4, 2023 at 7:14=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Many of the values in ov2680_global_setting[] match the default/reset
> register value for the ov2680 sensor (verified with both datasheet
> and actual hw) so they are no-ops.
>
> And there are also a coupe of others which are later overwritten
> by ctrls or by ov2680_set_mode().
>
> Remove all the unnecessary entries and add annotations to
> the remaining entries documenting what they change
> (in sofar as things are documented in the datasheet).

My spell checker suggests either "in so far as" or "insofar as".

> This also removes the double writing of OV2680_REG_SOFT_RESET in
> ov2680_init_registers() (one direct write, one in ov2680_global_setting[]=
)
> instead add a short sleep after the first write to give the sensor
> time to reset.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        |   1 +
>  drivers/staging/media/atomisp/i2c/ov2680.h    | 117 ++++++++----------
>  2 files changed, 56 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers=
/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 1db2eb9f9e25..dcc06c725544 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -175,6 +175,7 @@ static int ov2680_init_registers(struct v4l2_subdev *=
sd)
>         int ret;
>
>         ret =3D ov_write_reg8(client, OV2680_SW_RESET, 0x01);
> +       usleep_range(1000, 2000);

Perhaps surround this with blank lines and s little comment?
Also does this sleep is anyhow required by a datasheet, or is it
purely empirical?

>         ret |=3D ov2680_write_reg_array(client, ov2680_global_setting);

Side note: this is weird for an int returned variable.

>         return ret;
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging=
/media/atomisp/i2c/ov2680.h
> index b6c0ef591c69..6a71de55600b 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -172,82 +172,75 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct=
 v4l2_ctrl *ctrl)
>  }
>
>  static struct ov2680_reg const ov2680_global_setting[] =3D {
> -       {0x0103, 0x01},
> -       {0x3002, 0x00},
> +       /* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_la=
t */
>         {0x3016, 0x1c},
> -       {0x3018, 0x44},
> -       {0x3020, 0x00},
> -       {0x3080, 0x02},
> +
> +       /* PLL MULT bits 0-7, datasheet default 0x37 for 24MHz extclk, us=
e 0x45 for 19.2 Mhz extclk */
>         {0x3082, 0x45},
> -       {0x3084, 0x09},
> -       {0x3085, 0x04},
> -       {0x3086, 0x00},
> +
> +       /* R MANUAL set exposure (0x01) and gain (0x02) to manual (hw doe=
s not do auto) */
>         {0x3503, 0x03},
> -       {0x350b, 0x36},
> -       {0x3600, 0xb4},
> -       {0x3603, 0x39},
> -       {0x3604, 0x24},
> -       {0x3605, 0x00},
> -       {0x3620, 0x26},
> -       {0x3621, 0x37},
> -       {0x3622, 0x04},
> -       {0x3628, 0x00},
> -       {0x3705, 0x3c},
> -       {0x370c, 0x50},
> -       {0x370d, 0xc0},
> -       {0x3718, 0x88},
> -       {0x3720, 0x00},
> -       {0x3721, 0x00},
> -       {0x3722, 0x00},
> -       {0x3723, 0x00},
> -       {0x3738, 0x00},
> -       {0x3717, 0x58},
> -       {0x3781, 0x80},
> -       {0x3789, 0x60},
> -       {0x3800, 0x00},
> -       {0x3819, 0x04},
> +
> +       /* Analog control register tweaks */
> +       {0x3603, 0x39}, /* Reset value 0x99 */
> +       {0x3604, 0x24}, /* Reset value 0x74 */
> +       {0x3621, 0x37}, /* Reset value 0x44 */
> +
> +       /* Sensor control register tweaks */
> +       {0x3701, 0x64}, /* Reset value 0x61 */
> +       {0x3705, 0x3c}, /* Reset value 0x21 */
> +       {0x370c, 0x50}, /* Reset value 0x10 */
> +       {0x370d, 0xc0}, /* Reset value 0x00 */
> +       {0x3718, 0x88}, /* Reset value 0x80 */
> +
> +       /* PSRAM tweaks */
> +       {0x3781, 0x80}, /* Reset value 0x00 */
> +       {0x3784, 0x0c}, /* Reset value 0x00, based on OV2680_R1A_AM10.ovt=
 */
> +       {0x3789, 0x60}, /* Reset value 0x50 */
> +
> +       /* BLC CTRL00 0x01 -> 0x81 set avg_weight to 8 */
>         {0x4000, 0x81},
> -       {0x4001, 0x40},
> +
> +       /* Set black level compensation range to 0 - 3 (default 0 - 11) *=
/
>         {0x4008, 0x00},
>         {0x4009, 0x03},
> +
> +       /* VFIFO R2 0x00 -> 0x02 set Frame reset enable */
>         {0x4602, 0x02},
> +
> +       /* MIPI ctrl CLK PREPARE MIN change from 0x26 (38) -> 0x36 (54) *=
/
>         {0x481f, 0x36},
> +
> +       /* MIPI ctrl CLK LPX P MIN change from 0x32 (50) -> 0x36 (54) */
>         {0x4825, 0x36},
> -       {0x4837, 0x18},
> +
> +       /* R ISP CTRL2 0x20 -> 0x30, set sof_sel bit */
>         {0x5002, 0x30},
> -       {0x5004, 0x04},//manual awb 1x
> -       {0x5005, 0x00},
> -       {0x5006, 0x04},
> -       {0x5007, 0x00},
> -       {0x5008, 0x04},
> -       {0x5009, 0x00},
> -       {0x5080, 0x00},
> -       {0x5081, 0x41},
> -       {0x5708, 0x01},  /* add for full size flip off and mirror off 201=
4/09/11 */
> -       {0x3701, 0x64},  //add on 14/05/13
> -       {0x3784, 0x0c},  //based OV2680_R1A_AM10.ovt add on 14/06/13
> -       {0x5780, 0x3e},  //based OV2680_R1A_AM10.ovt,Adjust DPC setting (=
57xx) on 14/06/13
> -       {0x5781, 0x0f},
> -       {0x5782, 0x04},
> -       {0x5783, 0x02},
> -       {0x5784, 0x01},
> -       {0x5785, 0x01},
> -       {0x5786, 0x00},
> -       {0x5787, 0x04},
> +
> +       /*
> +        * Window CONTROL 0x00 -> 0x01, enable manual window control,
> +        * this is necessary for full size flip and mirror support.
> +        */
> +       {0x5708, 0x01},
> +
> +       /*
> +        * DPC CTRL0 0x14 -> 0x3e, set enable_tail, enable_3x3_cluster
> +        * and enable_general_tail bits based OV2680_R1A_AM10.ovt.
> +        */
> +       {0x5780, 0x3e},
> +
> +       /* DPC MORE CONNECTION CASE THRE 0x0c (12) -> 0x02 (2) */
>         {0x5788, 0x02},
> -       {0x5789, 0x00},
> -       {0x578a, 0x01},
> -       {0x578b, 0x02},
> -       {0x578c, 0x03},
> -       {0x578d, 0x03},
> +
> +       /* DPC GAIN LIST1 0x0f (15) -> 0x08 (8) */
>         {0x578e, 0x08},
> +
> +       /* DPC GAIN LIST2 0x3f (63) -> 0x0c (12) */
>         {0x578f, 0x0c},
> -       {0x5790, 0x08},
> -       {0x5791, 0x04},
> +
> +       /* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
>         {0x5792, 0x00},
> -       {0x5793, 0x00},
> -       {0x5794, 0x03}, //based OV2680_R1A_AM10.ovt,Adjust DPC setting (5=
7xx) on 14/06/13
> -       {0x0100, 0x00}, //stream off
> +
>         {}
>  };
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
