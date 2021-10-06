Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC392C81
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 10:02:24 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id e7so1343150ual.11
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uau9/pR+8X0YYImoS0Wg4cgXBZAlRqGIWfRwQoTAlIs=;
        b=FqojcO+6S1vzBTjYbWbeynWCuPHepeTAT1FG+f7XggYRcYHFl2NcgAaFsGUz/WQF/J
         osO5xGm/MsCLkelJrr/BzPvAv8HIa84pyjyLbs0KX3evk7wEGs80Qhe3mYmEiIgcN5uG
         TaThcXRoYFOIrfAFeFAgD12BzFzzmH/YHX8Zzmwd4remXoiWpHXVDeVD920edl5SR896
         rWR/pWGkDTTjHxc9pjNmdFsNB4Ikvq75kYEliY3zH58Wau8goW+mNCBtJwWynW42Jk2/
         hJeKDbd0ttf7WP1sTQqhwM5oZf7bBp7ZtULYYJQtBbSP+Ki7cmrSVGEdLKts7ivbVwXe
         uMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uau9/pR+8X0YYImoS0Wg4cgXBZAlRqGIWfRwQoTAlIs=;
        b=kQjisKPpj1cgkNv1U9MlVRRbEdrnPW6Oho44R4bR5grsIZtjC6DUCylhQgOTEoSqA/
         QFCa9e0aQBje97AdU1QhLTfA0f4bkrJ6OVv7kMpA7TEb2dWBtgdBUuUF2wfC9MYBNxgn
         a960r6z9/XWUXd/zSmCWKNDMT5UvhFmEpu+1mOb7CFshGSByTv/wQgonE6N/e55z8CFk
         QbvCbDEKh6Xd4zuPo7Wls9SdBAEkNGvQr7fMc9yFBHF98iUsUoxjcgJMA4zZOFl327rW
         xYsCwGBcgjT/eHEz5Wbi7UZIgdKqdbFrIQmlHHFevwqSYTePiX10f7I7uVYZXy4xv/fP
         guxA==
X-Gm-Message-State: AOAM5315CxjEMD9mmRkx7gViXC8cwAS5yN0EL1EUS1/Hpoyy5XQrW3mb
	B3/eiEPFnJxTCL3vmr7ZoyBf0cFk+kGvYVbAsUk=
X-Google-Smtp-Source: ABdhPJzfTPCIqF75XYHBa+La5Pd+QBvj9phqUfquQvBKUdk8ClsF1hEHLmwPcrVcniX/f0yPaOZWmW7JcncYMW+6iPI=
X-Received: by 2002:ab0:5548:: with SMTP id u8mr16315316uaa.0.1633514543473;
 Wed, 06 Oct 2021 03:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211006061204.2854-1-sergio.paracuellos@gmail.com>
 <20211006061204.2854-4-sergio.paracuellos@gmail.com> <20211006082903.GZ2048@kadam>
In-Reply-To: <20211006082903.GZ2048@kadam>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 6 Oct 2021 12:02:12 +0200
Message-ID: <CAMhs-H_qb=goRmfhO1P+mt_NKhJFuJgH6a483-6Wk8M9MA1cJQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: ralink: make system controller node a reset provider
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	linux-kernel <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the review. Comments below.

On Wed, Oct 6, 2021 at 10:29 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Oct 06, 2021 at 08:12:03AM +0200, Sergio Paracuellos wrote:
> > @@ -398,6 +401,76 @@ static void __init mt7621_clk_init(struct device_node *node)
> >  }
> >  CLK_OF_DECLARE_DRIVER(mt7621_clk, "mediatek,mt7621-sysc", mt7621_clk_init);
> >
> > +struct mt7621_rst {
> > +     struct reset_controller_dev rcdev;
> > +     struct regmap *sysc;
> > +};
> > +
> > +static inline struct mt7621_rst *to_mt7621_rst(struct reset_controller_dev *dev)
>
> No need to mark this as inline.  The compiler should do it automatically
> or it will ignore the inline.

Ok, I have other functions to_* with the same inline syntax, that's
why I have added also here. I think I will maintain it to be coherent
and can be removed afterwards with another patch not belonging to this
series.

>
> > +{
> > +     return container_of(dev, struct mt7621_rst, rcdev);
> > +}
> > +
> > +static int mt7621_assert_device(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +     struct mt7621_rst *data = to_mt7621_rst(rcdev);
> > +     struct regmap *sysc = data->sysc;
> > +
> > +     if (id == MT7621_RST_SYS)
> > +             return -1;
>
> Please, return proper error codes.

Current code at 'reset.c' of the arch was returning -1 in this case. I
guess it is better to change it to -EINVAL.

>
> > +
> > +     return regmap_update_bits(sysc, SYSC_REG_RESET_CTRL, BIT(id), BIT(id));
> > +}
> > +
> > +static int mt7621_deassert_device(struct reset_controller_dev *rcdev,
> > +                               unsigned long id)
> > +{
> > +     struct mt7621_rst *data = to_mt7621_rst(rcdev);
> > +     struct regmap *sysc = data->sysc;
> > +
> > +     if (id == MT7621_RST_SYS)
> > +             return -1;
>
> Here too.

Will change to -EINVAL.

>
> > +
> > +     return regmap_update_bits(sysc, SYSC_REG_RESET_CTRL, BIT(id), 0);
> > +}
> > +
> > +static int mt7621_reset_device(struct reset_controller_dev *rcdev,
> > +                            unsigned long id)
> > +{
> > +     int ret;
> > +
> > +     ret = mt7621_assert_device(rcdev, id);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return mt7621_deassert_device(rcdev, id);
> > +}
> > +
> > +static const struct reset_control_ops reset_ops = {
> > +     .reset = mt7621_reset_device,
> > +     .assert = mt7621_assert_device,
> > +     .deassert = mt7621_deassert_device
> > +};
> > +
> > +static int mt7621_reset_init(struct device *dev, struct regmap *sysc)
> > +{
> > +     struct mt7621_rst *rst_data;
> > +
> > +     rst_data = kzalloc(sizeof(*rst_data), GFP_KERNEL);
>
>
> Can we use devm_ to allocate this or do we need to clean up if
> devm_reset_controller_register() fails?  Also a free in the release
> function I suppose.  (Please, use devm_).

True, yes we can use devm_ for this. Will change it, thanks.

>
>
> > +     if (!rst_data)
> > +             return -ENOMEM;
> > +
> > +     rst_data->sysc = sysc;
> > +     rst_data->rcdev.ops = &reset_ops;
> > +     rst_data->rcdev.owner = THIS_MODULE;
> > +     rst_data->rcdev.nr_resets = 32;
> > +     rst_data->rcdev.of_reset_n_cells = 1;
> > +     rst_data->rcdev.of_node = dev_of_node(dev);
> > +
> > +     return devm_reset_controller_register(dev, &rst_data->rcdev);
> > +}
>
>
> regards,
> dan carpenter
>
I will properly take into account your comments and send v2.

Thanks,
     Sergio Paracuellos
