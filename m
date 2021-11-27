Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2E68
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 03:04:49 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id j14so22101241uan.10
        for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 19:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oyWJQWZmbfuER+tnH7hXXM9xMHEX76X7f2PIAw5ys7g=;
        b=RJlpqjozN8GtRyGfwiU+98EVeqpYC7fcdGsjuVzmhC94O6cw8cHARyEO57+UW3zX/p
         Z/PsMi4bISVP4wKJMBcGguC8zlUujFhmkLwTItkOUtvLIxUmr0cKYYo/UHPVgWFiU4hx
         3i579kRKb0oQrg1R3Ovnix8fVMIrKzpNNYBgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oyWJQWZmbfuER+tnH7hXXM9xMHEX76X7f2PIAw5ys7g=;
        b=iJ5fdCKpSmVEdgtHKBbIgCY+Wr+QPNLwcy5ugd5objm+LXHniqdxyUP9PJFG3LCi+d
         bs0KX5y6K/mlMsQ2dxAKyzZPzND5exf4wgbPR0NO0CqzK91jHpw7Le2riloxF6Ai6s46
         /zO952Zzot+lwGFirU7L1MGuRIR8on6599zrbnfwC2hB7iVALCB+mFUsElNHn0X2zada
         iFqLf14is/vacQ/BLtk0TBmJWoS+lpDM1pjV5EVgb4R7iNNWndqq8tlYhzxEpP+dmgOv
         /4m6tx2w2jlHxeGhpW/kq0qyfffgpAxP7nlWkqDFEuJMpjHUZO20VTD4kagevLSgYV5c
         RLVQ==
X-Gm-Message-State: AOAM532TqGLzoUpQKZD6DdIz0apD883ifIGEDrY/xDxQeM+6qw8JIZjS
	rsnJxPj4y+Y1+Vr/KYrTQL/AQS/k17gv/OL4s369fg==
X-Google-Smtp-Source: ABdhPJz7vuAW3+erNMKOIb/TqxtVk3nKq/lN/Dx0qMFXvJkuorDmH4b541/XRA3RSYATnlUJTF4AJuFxlg3Pj7miHcU=
X-Received: by 2002:ab0:6ecf:: with SMTP id c15mr39743087uav.113.1637982288212;
 Fri, 26 Nov 2021 19:04:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211110120910.12411-1-dafna.hirschfeld@collabora.com> <20211110120910.12411-4-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211110120910.12411-4-dafna.hirschfeld@collabora.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 27 Nov 2021 12:04:37 +0900
Message-ID: <CAFr9PX=FKnuv_YzadHxZTbwAU4ruuwTiUsN6WbwdjD8wF+f1rw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] staging: media: wave5: Add the v4l2 layer
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, Robert Beckett <bob.beckett@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hverkuil@xs4all.nl, 
	kernel@collabora.com, dafna3@gmail.com, kiril.bicevski@collabora.com, 
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim@chipsnmedia.com, 
	scott.woo@chipsnmedia.com, olivier.crete@collabora.com, 
	dan.carpenter@oracle.com, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dafna,

On Wed, 10 Nov 2021 at 21:09, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> +static int wave5_vpu_probe(struct platform_device *pdev)
> +{
> +       int ret = 0;
> +       struct vpu_device *dev;
> +       struct resource *res = NULL;
> +       const struct wave5_match_data *match_data;

.. snip ...

> +       dev->dev = &pdev->dev;
> +       dev->product_code = wave5_vdi_read_register(dev, VPU_PRODUCT_CODE_REGISTER);

You access a register here..

> +       ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
> +
> +       /* continue without clock, assume externally managed */
> +       if (ret < 0) {
> +               dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
> +               ret = 0;
> +       }
> +       dev->num_clks = ret;
> +
> +       ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to enable clocks: %d\n", ret);
> +               goto err_clk_prep_en;
> +       }

but only get and enable the clocks further down.

For anything that needs a clock enabled to access the register and
doesn't have it enabled when probe is called the CPU might lock up.
I found this out while trying to get this code working on another chip
that has one of these IP blocks.

Cheers,

Daniel
