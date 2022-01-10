Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9843173
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 09:39:42 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id v12so22271514uar.7
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 01:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lGrJMU2mwu0fhNFQYYVjFh5GQMFij2+6pzvwpPSmMUg=;
        b=bZyww6cN0axjDXR2tDv6wNDKfXNYWrhvCLxt09BnYp9x2fFM7Z1Wp856Ff4XuEZPwE
         0hL6h81L9nNRXmlcpfHXPYK4/4W5KlNdGw4bmjAyixexEzZYbafhuqrmJfmuUdP+rLV/
         NFvcEoVxtAvFjixht009zeoN/XrBqU7O9g2lr3IqMk9Gg0PMU8dD8dDpXZxfxQPefVAK
         uLDvPsqQJvtcsn0R+QWlPrazd4QgPd6mKt8c8JkyE3KOlvqFNnpIsJAW8fUG26CCFXrJ
         0/+74W7fnX0mr0fKNnJytvuGkDRXbn9yb2NobN+H5wX7Xe/j+z262t864+r62RfTao1O
         g2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lGrJMU2mwu0fhNFQYYVjFh5GQMFij2+6pzvwpPSmMUg=;
        b=lQoeHeJkNpIpKwPq5D9KKiuzsMsC0HBzIqsdq8rIyQRRaA/iJhiGQKeR/ezDSjsiDr
         RJTB2win6w/CLqiWh8N5Er4NYve+aYn4kktAfVLS/BcjEOSgHpnlLE872ToWT+8tetzR
         6fntlD9e8q7HyuVfa+ebpkwJkkY2jAJAV3Xe+c2q9eiijDsFWf1I4jW1ms4O/xsRNqQN
         k64ara9PzY0gnb++gP/EIB19woJZS6sjzao4nSUG9mvSFoYtlS0uGuXWF27H1RfsROf5
         yvgOqVwCLiaGCW09xlHDpahL2KQJUl81XZlMaggjBlUhYEsD2IgsyTrsnNo5V98OJAFt
         5htg==
X-Gm-Message-State: AOAM5300uFDLkwhOAqZ+1yfKzazuneZT0uIeiRP/3vbbvCtdF1Pdfeua
	IyLEzZRw2HTpIyrIjwl+cmYx829x50Pmi4TpqQg=
X-Google-Smtp-Source: ABdhPJx4+2OwV0Y0Zm3EhlAfuLuJxsdQE/hK2p2Xh7sWMDKPVtYLJq7YsdptYm//WdoGA+x0cCBEiXl+vStV3JOM8hg=
X-Received: by 2002:a05:6102:3ec1:: with SMTP id n1mr3722110vsv.1.1641807581584;
 Mon, 10 Jan 2022 01:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
 <20220110083910.1351020-4-sergio.paracuellos@gmail.com> <5368e89c391e1329ed2be6496655f1bb50acfd19.camel@pengutronix.de>
In-Reply-To: <5368e89c391e1329ed2be6496655f1bb50acfd19.camel@pengutronix.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 10 Jan 2022 10:39:30 +0100
Message-ID: <CAMhs-H_gjW_6p6yBWf+k2PBym4N+k+rBEXR9S8c13NU-UWD4VQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] clk: ralink: make system controller node a reset provider
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

Thanks for the review.

On Mon, Jan 10, 2022 at 10:13 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Sergio,
>
> On Mon, 2022-01-10 at 09:39 +0100, Sergio Paracuellos wrote:
> > +static int mt7621_assert_device(struct reset_controller_dev *rcdev,
> > +                             unsigned long id)
> > +{
> > +     struct mt7621_rst *data = to_mt7621_rst(rcdev);
> > +     struct regmap *sysc = data->sysc;
> > +
> > +     if (id == MT7621_RST_SYS)
> > +             return -EINVAL;
>
> Better implement the .of_xlate callback and check there instead.
>
> That way it would fail on reset_control_get() rather than handing out a
> valid reset controller that just doesn't work.

Pretty clear, thanks. Will change this check into '.of_xlate' callback
and remove it from here.

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
> > +             return -EINVAL;
>
> Same as above.

Ditto.

>
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
>
> Is this known to work for all possible users, without delay between
> assert and deassert?

It seems it is. This is based on the original reset implementation for
ralink. See:

https://elixir.bootlin.com/linux/v5.16/source/arch/mips/ralink/reset.c#L55

>
> Are there any users of the reset_control_reset() API at all? This API
> was added for self-clearing reset bits, so if there are no users that
> need to pretend this is a reset pulse at the hardware level (there may
> be), I'd prefer if this was just left out.

I am not following you here. What do you mean?

>
> Apart from this, this looks good to me.

Thanks, I will include of_xlate callback changes and send v7.

>
> regards
> Philipp

Best regards,
    Sergio Paracuellos
