Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DD72
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 04:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628655642; x=1660191642;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:cc;
  bh=8+2MFUiKTr6YMmCUjLtaAbosp3nC3TfZco3vRdKPf+I=;
  b=rR3ukmN8z0/zVUaH6Q1MNQvfCmgdaUP+m+rYKZzkCk5FKx9Dm5gGGl2A
   xx/Iwvwo8bDeT4zOSYGBUUvD933FsUg3cKrFt9aSKH1c6+Tkj/4m7il4d
   5wdukl24SSeBhTTMPhInuhhuwRD9PloEpRK2Nh9deyCN0pS+ESIeBOZ7P
   VkbNehfHW2oXiYcT/jje/iYo7NDwDHqRYNoqra+lgMRtVq2k8OHciG+gc
   CHMBxqprYV6izkriZ7E99eRBm0xKFbgbqdIs6z0bnszrerw9UjDeqfPJG
   r7LpRDslsSDGXR/CIod/kvRE4Fv6q4s7uxdZy9MJPoNfErnu+svsIXjyS
   A==;
IronPort-SDR: WZXXbPYt+PKtN07drs2BttmzRMH3riSfCWAbpH2KJzz+capbvQRlzKFix98LOL/N7THtP3/i9x
 QQIcBCWGAyJOS8jWt+5XP+yYlCfn7xSGMfUeKob0EpB4jO96ccUScQnTq7JMPsQDQD6wPgyZh1
 pfwCqzgYc+LZFfwM0xZnZyPs2gKDBNnFGMvR9hsr84VCWD+ZSZHcqbkUMgw+DM48FTyVV7aNlq
 wG0koMZOYcgYHm5+lREr7S3G5r3dvlgitg0IapXgtZaSagRskrwS6u81L0CUtl7tSGas6FvwCI
 QGfuGRTy9VMFYuZ2oRaedgp7
X-IPAS-Result: =?us-ascii?q?A2EJAwBXThNhgMbWVdFagQmBWYN4VhaESJFtimWBGoZ8i?=
 =?us-ascii?q?GiBfAIJAQEBD0EEAQGEWAIjgkECJTQJDgECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBQQBAQIQAQGBIgtZC2OBT4F5BgQ9gjUpg2UIAQEBAQMSEQRSEAsLC?=
 =?us-ascii?q?gMCAiYCAiISAQUBHBkiOYIWAYMHnR6BBD2KOHp/MoEBiBYBCQ1OgRUSfiqHC?=
 =?us-ascii?q?4ZkJ4IpgUuBBYEzNz6HWxSCUASDXHsTW4FOgVABAQGQOhuDBolJggmBJptxA?=
 =?us-ascii?q?QYCgw4ckkqMASuDZZFgkSqYLaMWECOBPYIVMxolfwZnCoFBTQECAQIBDAIBA?=
 =?us-ascii?q?gECAQIBAggBAQKdCyQvOAIGCwEBAwmIeAE?=
IronPort-PHdr: A9a23:CbvHxhSxNjoyYoKpn92ofV/d8dpsoq+fAWYlg6HPa5pwe6iut67vI
 FbYra00ygOTBcOLs7kb1aL/iOPJYSQ4+5GPsXQPItRndiQuroEopTEmG9OPEkbhLfTnPGQQF
 cVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZvJuTyB4Xek9m72/q99pHNfwlEnjmwba99I
 Bi0rAjaq9Ubj5ZlJqst0BXCv2FGe/5RxWNmJFKTmwjz68Kt95N98Cpepuws+ddYXar1Y6o3Q
 7pYDC87M28u/83kqQPDTQqU6XQCVGgdjwdFDBLE7BH+WZfxrzf6u+9g0ySUIcH6UbY5Uim54
 qx1VBHnljsINz8h8GHWlMNwir5boAm8rBB72oLYfZ2ZOOZ7cq7beNMaRHFBXt1QVyxHDYO3c
 pUBAfMcNuZWronyuV8OogajDgWoCu7j1jpEi3nr1qM4zushCxnL0wMuH90MsHraotb7OroOX
 u2u0KnE0S/OY+9K1Tvh6oXFdA0qr/GWXbJ3dMrc0UsgFwLEj1WQtIzlOC6e2ecNs2eB7uprS
 OWiim4mqgFxuDevx9sghpXHi48O11DL6T95zJwrKtKlVU52eNipG4ZfuC+GLYV5WN8iQ312t
 yYgzL0LoYO2cTUFxpkkwxPSa+CLfYaH7B/hSeucPzZ1iW9rdb+8iBu8/kaux/HgW8S30ltHq
 jZInsXSu30R1hHe6dSKR/9780y82jiPzxje5v9YLU0wj6bWKJ4szqQumpYOvknPBDL6lUH1g
 aKQa04q4PKn6/79bbXjvpKcMoh0hRzgPak2gcy/BPg4MhAJX2iG5eSwzL3j8lP9QLVNlvA2l
 7PWsJHeJcgCvq65BxJZ3p8t6xqiCzqr084UnXYALFJCdxKHi5bmN0vSL/D/CPezm1WskDF1y
 PDaJrDtHInBI3zZnLrifbtx8VBQxBc8wNxF+p5ZDrIMLOr2WkDrtdzYChE5Mxazw+biENh81
 oIfWWKVDa+YLK/erVGF6/kyI+aQfo8ZoijyJOU45/L2l382hUcdfbW13ZsQcH24GvVmI0OEY
 Xvjm9sBCnsKsRAxTOzrjl2CXiVeZ3KzX6In+jE7E5iqDYPCRoCrnbyA0z23EYBIaWBYWRiiC
 3DtIrSFSfcRb2qgIsZg2mgVR7ioStd5jjmzvxW8xrZ6eLmHshYEvI7ugYAmr9bYkgs/oHkrV
 6yg
IronPort-HdrOrdr: A9a23:O+FYI6sfksenwF/PyvjLnC+x7skDc9V00zEX/kB9WHVpmwKj5q
 aTdZUgpGbJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIsJISNDQzNzJHZArBjDVQ2uxOruW6zA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="59656998"
Received: from mail-pl1-f198.google.com ([209.85.214.198])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Aug 2021 21:19:33 -0700
Received: by mail-pl1-f198.google.com with SMTP id s6-20020a170902b186b029012cbebe7236so577213plr.11
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 21:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=xTux7jQgzWsX3hb3coGUGgC9dvVrQ9GiczNsYL/eB4o=;
        b=jLQQGn5ClpGLgyUU7L5z/lMeRWtYBewdJv2wDEF3lEo5Ht61+pwFkEYsgQETnJqbuM
         xLWGZBeGuLKonwxFWj3CN1siK0kCt+4YJUbY4vV02oEaLZNro9jRlUGtMZAnx4Cs8eDz
         Ysq6t2cmBMqTwqee0EBTWGGSHWGLPmm5EgGrsUZYmUrF3yRoo3KbK45yyt6AARAfk7Gr
         mBP4XR9AlfZ2sSDyPJ3/osoGp0kvi2GwEp46mcUoY2kIAeEsl7SwNimSGIvbZwU3n6Y1
         uMPRi3jtAv5cun7Zt4/KjSP/OaCau/SNH/b+vXDTXSyOSZ2fdahnhGf0ob5qmGdqUimb
         0K/Q==
X-Gm-Message-State: AOAM532l3NaKA5Iu7e6qDZCAl1LUJggGKH4tuRN5oBjuzW3JbIMrq8De
	8cHCm2EEkmpptoaTE1X9pOjx5LzwlrLQ0Ngds4k3lNhgEzdSjlBxH91nGBhAmwFTvB3g9p/h2q5
	KVyHpY85TGy/FdR8Ocu2lz23xTiEcqmw4DHvEklc82PQ=
X-Google-Smtp-Source: ABdhPJz6Vl8vjo93YwI7zD8lDkGdK0UwwlYRPcBsZqyZ673OkLs8lzS3f66BdISLcPZsXZmCY2nJvmZ1hjT26rmtNEY=
X-Received: by 2002:a63:f242:: with SMTP id d2mr151332pgk.384.1628655571938;
        Tue, 10 Aug 2021 21:19:31 -0700 (PDT)
X-Received: by 2002:a63:f242:: with SMTP id d2mt121406pgk.384.1628655571687;
 Tue, 10 Aug 2021 21:19:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723003607.64179-1-yzhai003@ucr.edu> <20210811035405.17382-1-yzhai003@ucr.edu>
In-Reply-To: <20210811035405.17382-1-yzhai003@ucr.edu>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Tue, 10 Aug 2021 21:19:20 -0700
Message-ID: <CABvMjLRj-ofVoNpOvT+DPOdW-=L52KbsRYeaKv=MTYfSJPZNBA@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi All:
For your information, I update my signed-off zone using my full name
"Yizhuo Zhai"

On Tue, Aug 10, 2021 at 8:54 PM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> From: Yizhuo <yzhai003@ucr.edu>
>
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
>
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
>
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Yizhuo Zhai<yzhai003@ucr.edu>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index f5de81132177..77293579a134 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
>  static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
>  {
>         struct i2c_adapter *adapter = client->adapter;
> -       u32 retvalue;
> +       u32 model;
> +       int ret;
>
>         if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
>                 dev_err(&client->dev, "%s: i2c error", __func__);
>                 return -ENODEV;
>         }
> -       mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
> -       dev->real_model_id = retvalue;
> +       ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
> +       if (ret)
> +               return ret;
> +       dev->real_model_id = model;
>
> -       if (retvalue != MT9M114_MOD_ID) {
> +       if (model != MT9M114_MOD_ID) {
>                 dev_err(&client->dev, "%s: failed: client->addr = %x\n",
>                         __func__, client->addr);
>                 return -ENODEV;
> --
> 2.17.1
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
