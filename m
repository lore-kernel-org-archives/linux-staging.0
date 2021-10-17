Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B322C80
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 06:51:36 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id l39so7136134vkd.7
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNAUH8TjDFzaFJVIqct55AXw+xWzukjzRr3h7rQ5J3g=;
        b=jJnBGNwZTUy94l7GdW/7dM0ak1B4tPtJ3KhbRlQWbODnhUIthJ12JuiiwR4fKmuJtO
         9LSrUXAmgtlcTCB7za3Rsi2OLP1C15ibRn3HKP9pDc3QT5Ujzy3Ijt2qvBNFobY8NAF8
         RPULzytg0lGnBxU88Q7L/z8VwEAQ6hLlpG3npFUhgmC9SgCtNCmifibrxRemZnsrHMHG
         lgnpgnO7VizudOxTfl83luUQu4YeqNl9uINzRNw195NY+Ywd7ajrGsrMCsU0PucP+nrQ
         zbuxQRL/VBUd0kqghB1nTWEq2DI7EidGIdaoY09/XTnUcr/OfDUwWzoi0oNP+6jbAdcP
         ktuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNAUH8TjDFzaFJVIqct55AXw+xWzukjzRr3h7rQ5J3g=;
        b=fzTSquRLtsiLPJyCRvNMAX5+Xs5j2d6ZUSG7Iozj+Jjhp15fTlw/uO2DBDBXO6o8tq
         ek7TkzikGio5i36bMldJVJTZebJswchI667sail1ORM+TdhdtVwZ2yjQFhT6DT57uJNE
         okJuT6YQ9y6fji0NpTOvxvaURE2CWsc00sWj845wl9j/7VJ47nmzmYIcoTOifT5l32jJ
         BCCSiddWwhVme+hXcB9f85sDfPrAukLddH1HENOkdNDZz7uLuxmis/viw1ZC8O4CMiPF
         lF5oE7vjJgCrpJveubov5sr01Lca1rEkH6KPXKhDaSrmAXoIxWv0evCLolrsuvWgecwQ
         9A6Q==
X-Gm-Message-State: AOAM533CC/QxJ3u1xfAKmt5aCledr0Iaeh3y/Y0BWaTbOzOvVPsarrvG
	KiAOo45ZhyE5IT3RVvgktfZWLi6AZ9gbxzjoTrI=
X-Google-Smtp-Source: ABdhPJzjqlVzjheCW3CWQHUGfh9ZnqaVFj9KCAFVcuoSJ7H0X4yDmYPUYvmOMSSKCwpIXOQEMoZLz8RsI4Fd5XUSG2c=
X-Received: by 2002:a05:6122:d06:: with SMTP id az6mr444750vkb.17.1634453495343;
 Sat, 16 Oct 2021 23:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20211006112306.4691-1-sergio.paracuellos@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 17 Oct 2021 08:51:24 +0200
Message-ID: <CAMhs-H_h9=sj5_p58WcqrYJuT-CGHp38xELwD1jvt=XzfvG2bw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] clk: ralink: make system controller a reset provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	linux-kernel <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Wed, Oct 6, 2021 at 1:23 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi all,
>
> This patch series add minimal change to provide mt7621 resets properly
> defining them in the 'mediatek,mt7621-sysc' node which is the system
> controller of the SoC and is already providing clocks to the rest of
> the world.
>
> There is shared architecture code for all ralink platforms in 'reset.c'
> file located in 'arch/mips/ralink' but the correct thing to do to align
> hardware with software seems to define and add related reset code to the
> already mainlined clock driver.
>
> After this changes, we can get rid of the useless reset controller node
> in the device tree and use system controller node instead where the property
> '#reset-cells' has been added. Binding documentation for this nodeq has
> been updated with the new property accordly.
>
> This series also provide a bindings include header where all related
> reset bits for the MT7621 SoC are defined.
>
> Also, please take a look to this review [0] to understand better motivation
> for this series.
>
> Thanks in advance for your feedback.
>
> Changes in v2:
>  - Address review comments of Dan Carpenter [1]:
>     + Avoid 'inline' in function definition.
>     + Return proper error codes (-EINVAL) instead of '-1'.
>     + Make use of 'devm_kzalloc' instead of 'kzalloc'.

Can you please take a look into this series? I'd like them to be added
in the next merge window and if something needs to be changed I'd like
to have a bit of time to do it :)).

Regarding how to merge this I guess all of the patches should apply
cleanly in any tree but since there are already changes in mt7621-dts
maybe patches 1 and 4 which are related can go through the staging
tree (if Greg is ok with this) and the bindings doc change and driver
changes (patches 2 and 3) can go through your tree.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

>
> Best regards,
>     Sergio Paracuellos
>
> [0]: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210926145931.14603-3-sergio.paracuellos@gmail.com/
> [1]: https://lkml.org/lkml/2021/10/6/204
>
> Sergio Paracuellos (4):
>   dt-bindings: reset: add dt binding header for Mediatek MT7621 resets
>   dt-bindings: clock: mediatek,mt7621-sysc: add '#reset-cells' property
>   clk: ralink: make system controller node a reset provider
>   staging: mt7621-dts: align resets with binding documentation
>
>  .../bindings/clock/mediatek,mt7621-sysc.yaml  | 12 +++
>  drivers/clk/ralink/clk-mt7621.c               | 79 +++++++++++++++++++
>  drivers/staging/mt7621-dts/mt7621.dtsi        | 27 +++----
>  include/dt-bindings/reset/mt7621-reset.h      | 37 +++++++++
>  4 files changed, 140 insertions(+), 15 deletions(-)
>  create mode 100644 include/dt-bindings/reset/mt7621-reset.h
>
> --
> 2.33.0
>
