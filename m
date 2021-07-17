Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BDF72
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1626558741; x=1658094741;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:cc;
  bh=1yilOERNyPcoY3A26m/nt1Y2t9Ypa4x9Ubo3GY7XWj8=;
  b=D5KJ8gufc9RJ1ezF+VSBs1w8nXf7PU5IwsIAIm0ntXS/dBVvyklHNQEC
   jYi/b9ygTxrUK6kEMiRNs4WNNfkSuP2zirgYg6vqpgBcOX2ptgFKJf58d
   +VphBwT08mf57WqDoBlRJcYucv+ZIRDYinK4iVlv/FLBXnSHdusWfzhCb
   XI+MdgQZoghJTwly6AtbHaYVjdwhzdpRSjSccGM9tGLsmh7s8XR0f418b
   nEH//+do9N/H8xFiplLdfcQ8n+VyCXw4Fm5fLTPae30DJloma/X3TDk2d
   b2sQuHj2VyUVt9hkykxxXO26PWj1yE1oWTGZnKHpZtPZnR02TKmKULxAp
   A==;
IronPort-SDR: 7YajcKUv0z6jgmSQKMYEhS7RLpmefm6DUKUiAEG1lSRqw3xw87RLHy5gKo9MtMajNJzS+CHoA+
 HItTEVS/9eO0E26FEffol7Buy/UisKH/kpdb8vI9YVrRDGpor7NOrjAANqF8Hon8LhZcXwITBu
 N4nudmhlCgwwAG3WzaUaKHyrH5lJPL/lzIgcDfOVfWGP5HuNPSGVv8VXTO/4ch/0XpmEq8Adjg
 AV/vtL1nFXbfnmEYRdCTbFGMvZXDoAUvFyplWcDuCFek11SLU4tsdbATolxCymMVxjltTyCld6
 mhZmnbpK3Vhh5yldXQpx0U5k
X-IPAS-Result: =?us-ascii?q?A2FIAwBOUPNgf8bSVdFaHgEBCxIMQIFOC4N4VhaESJFgi?=
 =?us-ascii?q?mKBGoZ8iGaBfAIJAQEBD0EEAQGEVwIjglsCJTQJDgIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QMBAQYBAQEBAQEFBAEBAhABAYEMC1kLY4FPgXkGBD2COCmDZQkBAQEDEhEEU?=
 =?us-ascii?q?hALCw0CAiYCAiISAQUBHBkiOYIXgwebDIEEPYsyfzOBAYd8AQkNgWMSfiqHC?=
 =?us-ascii?q?oZiJ4IpgUuBBYEzNz6HWxSCUASDF3sTW4JIVgEBAZAvG4MGiz2BJptjAQYCg?=
 =?us-ascii?q?wockj+LeiuVPZEhuysQI4E4ghUzGiV/BmcKgUFNAQIBAgEMAgECAQIBAgECC?=
 =?us-ascii?q?AEBAp0LJC84AgYLAQEDCYw7AQ?=
IronPort-PHdr: A9a23:DPoIwRBuQ/dYQUfaSuTgUyQUmEMY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZua81ygWUFtWDo7Ic0qyK6vGmATRBqb+681k6OKRWUBEEjchE1ycBO+WiTXPBEfjxciYhF
 95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba1uI
 BmsswnctsYajIh+Jq0szhfFvmZEd/5ZyG91IV+fhQrw6tu18JV+7ylepvUt+tJaX67nZao4V
 7tYDDonM2Ax+sLmsATIQBWM6HUBTGgYiwJEDAfZ4h70WJfxqTb6ufFm2CaGJ832TKs7Viqk4
 qx2VRLnkiYHNzo+8GHKlsx9ib9QrRy9qxBjxYPffZqYP+RicKzDYdwaRHJBXsdPWCxHHoO8d
 JYEA+4YMepFs4Xxu14CoB27BQmtH+Pv0T5Ihnn53aYnzeovCBzN3AIhH90QtHTbscj+OKMcX
 OypyaXFyyjIYfFL1jfn8IXHfR4hrvOMU7x+csTf1FUgGhjZjlmMs4HpIy+Z2vgPvmWd8uFuV
 fivi2kiqwxpoDevx8YtionUhoIS11vL9iV5z5w0JdalT0N6Yd+lEJtKuCGbK4d6Xs0vTnp1u
 Ckm0L0Ko4C0czUXyJk+wRPUdvOIfZSS7B35SOaRPSl3hGhjeL+nmhu/7Eeux+74W8S0zFpEo
 CVLn9vRu30T1hHe98aKR/hy80mu1ziCyxze5+JGLE0wiafXN4Asz6Ixm5cQrUnOGin7k1j1g
 q+Obkgo5PSk5uD9brjlppKQLZF4hhziPqg0h8CyBec1Pw4TVGaB4+u8zqfs/UjhTbVPif05j
 7fWvYjBJcQeuq65GwhV0ps/6xqnDzepztAYnX4fIVJAYh2HjozpN0jWIPD2EPuzmlqsnCpvy
 v3FJLHhDZLNLn/MkLflY7lx8VJTyA02zdxH5pJUDK8OIO7rV0PvqNDVCgU1Pg+0zur9Ftlxy
 58SVXiSDqKdM67eqVqI6fguI+mIao8VojH9K/096v/ujH45mUUSfai10ZcLZn21BelmLFmDY
 Xb2nNgODHoKshIkTOP2kF2CTSJTZ3GqUqI45zE7Dp+mDIjaSoC2nLyOxii7HpxQZmBJEV2MF
 Xbod56YW/cXci6SJs5hkjoZVbmuUYMuyA+htBGpg5R9Ke+ByywKtY/knOp17uybwQAg9TV1V
 5zG+3yGVSd5kn5eFGx+57x2vUEokgTL6qN/mfENUIMLj84=
IronPort-HdrOrdr: A9a23:8uGdeqFlb3wgpNDPpLqE7ceALOsnbusQ8zAXPo5KOHpom62j5r
 mTdZsgpHrJYVoqKRMdcJW7Scq9qBDnlKKdg7NhWYtKNTOO0ACVxcNZjbcKqAeQfBEWNdQx6U
 6jScJD4RHLYWSSRPyUjjWFLw==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,248,1620716400"; 
   d="scan'208";a="54771232"
Received: from mail-pf1-f198.google.com ([209.85.210.198])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jul 2021 14:51:11 -0700
Received: by mail-pf1-f198.google.com with SMTP id s5-20020aa78d450000b02902ace63a7e93so9906553pfe.8
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=24ruHgKdRqiISpvE23HRNMHuYpAUJ+UGSln1cmXL8UU=;
        b=U2mobty8OPQFbWdwpb3WQXnGjPfqBA5AvMT2I8+q7uCM/I9KL3q1NchwHBBjKxG0Eb
         IAZbTA7xWgF5Bvvut67kGc+zPqI1HlL3mu2GaVZ3xUwxusi7t/cJKPbBdkIreJcCNrUR
         kxuCHSOlEnYzo8eJmxsk6ajoRp7jcSoYHT5akcheHEzyw507hnmUSZjPkzEP3vq0a+y3
         IOcrKPbnNEEuy662vwhNYqakf7i/qtTb6yJIhd4RYvaHahqDmWQofK461viovYe/npJh
         //Vg2ZI2oHLrIGwEkXp74tcSnncEALyQ6CKlY2mbZMRlUgUYWUzbQipHKzfL43HcWUSN
         5SmQ==
X-Gm-Message-State: AOAM533YfAR+DFFPBXcXcExOBvjL2+umbhXMhMenz2SiyuGlLZnDUFie
	WZokA9OLvZ9UW3c3yZYM258/Tzwj4qS/qqoPyQqAVjqIWG4c8d36XjgVslXmmh0qeSTu3Ze6YIT
	RLF3TSOlcscWu7uGULZ6T47/fg9+3Wuvmse6t3Rs1u5I=
X-Google-Smtp-Source: ABdhPJxbB0uouHwhWVVYEaJHD92ybiYX3UbNOas9w+r4tSn4Ho7SeUO4BceypqMBT7vpUX2u560hsb+CKa4oGQTRITk=
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id w125-20020a62dd830000b02902e8e511c32fmr17145133pff.49.1626558669968;
        Sat, 17 Jul 2021 14:51:09 -0700 (PDT)
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id
 w125-20020a62dd830000b02902e8e511c32fmt11615346pff.49.1626558669672; Sat, 17
 Jul 2021 14:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210624031719.11157-1-yzhai003@ucr.edu> <20210625053858.3862-1-yzhai003@ucr.edu>
In-Reply-To: <20210625053858.3862-1-yzhai003@ucr.edu>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Sat, 17 Jul 2021 14:50:59 -0700
Message-ID: <CABvMjLRQdTzfPX8YRtAwsPbh=FjbzxRu7Hhun1gk0i1kka94nA@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fix the uninitialized use and rename "retvalue"
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

All:
Does the new patch work?


On Thu, Jun 24, 2021 at 10:37 PM Yizhuo <yzhai003@ucr.edu> wrote:
>
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
>
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
>
> Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
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
