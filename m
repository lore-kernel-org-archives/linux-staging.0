Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E15110D
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:17:21 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id y17so980759qvr.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/CLXWmHJ6o9GzTXfwc4vxGDnhRk54atQzmIaN3qEtc0=;
        b=aiIg2vwbq2lYIKYezPqVtu82cVFAflPM/AJvaecG7SjIjW47CEmtN0mKeB5FJVc8U+
         0uoMOLVQPgdajPi3JXK8V1rfYJtEYN2lDMRPcHlczMX/9J92/CqVnDKG3Lc3GWe2W+SP
         5sXhtTOVNCl0ol2KLiJtRCWSV3R+4/gZlYJNgLTrxPtHAB/33U2Toaq7X/bOaB0bdurA
         cIu6aeOqDCX9j+ufN+tw6aWRdnmslF1YaRqCU+CF/wzBrN6Nm0it0R+EdvHx9Mcr9YkY
         Y9/cu23Gc0oXEkGdnvSiskLRf03TUJS5kZuGc2amvVh6BWp0AwzvYADGZLhAVWaLfraN
         UcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/CLXWmHJ6o9GzTXfwc4vxGDnhRk54atQzmIaN3qEtc0=;
        b=FXJTGKHvrUVa97m/QgoWJZJmn18e8HTa67SbbCz21IrvihXk3yAQR/+Dtp2wUzRjmR
         ptmIkk7t9ylzHND7QbdMmYyaV/GnIPw1IOVvaOkKcmY6F4bo5m6iKm/oNl/pbK5q/wMc
         0RA8ZSOn4R9T8MQ0DbZ76upFQzsgjWTyN9nM/bivP1sic0NPNQidGAQFeDxAFD7rGVNa
         OZ7q7ZFVRdhqSOjnumYG4F6UmG1PSjG06aNiGHujHC0Jz+2Ahbnf+J3Zq819NvmoyNcd
         PbUGhx/j+Lawfm8oWyQ0j4JEIYA+DGPd/40hL1kE0uBOMhUhEwjwE8otQAqBONwYj9yi
         ryug==
X-Gm-Message-State: ACgBeo1oP+Bop5cooCpyC7AVygDr27NGG6jT10tCW9JyzH1kvLViOftH
	xPGpjH2M3z8X6Qc0U5o+0Uabkh4Ek73e45wABdM=
X-Google-Smtp-Source: AA6agR6n+ip7Pg5zxgzqYVXK1CtYlEVqQcso0bP3IxjZNKJDKSmoWhcJyeToQ4D2ZC0zNjgaWXYWS5A2BMx4I4gcuEU=
X-Received: by 2002:a05:6214:27ca:b0:499:95f:6379 with SMTP id
 ge10-20020a05621427ca00b00499095f6379mr18910465qvb.82.1662110240626; Fri, 02
 Sep 2022 02:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220901094626.11513-1-hdegoede@redhat.com> <20220901094626.11513-11-hdegoede@redhat.com>
 <YxEOhy0YPnBuZiQs@smile.fi.intel.com> <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
 <CAHp75Vf=_2yJdPvpkx2iYoYOPzxf6sNMBD4EizYc1WAnFMWYtg@mail.gmail.com>
In-Reply-To: <CAHp75Vf=_2yJdPvpkx2iYoYOPzxf6sNMBD4EizYc1WAnFMWYtg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Sep 2022 12:16:44 +0300
Message-ID: <CAHp75Ve4hUKd4me8tgG+tc4sO4f5wyoLOFMrxH9iC1p2x=RS8Q@mail.gmail.com>
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 12:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Sep 2, 2022 at 12:04 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 9/1/22 21:56, Andy Shevchenko wrote:
> > > On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:
>
> ...
>
> > >>                      for (; i > 0; i--)
> > >>                              atomisp_subdev_unregister_entities(
> > >>                                  &isp->asd[i - 1]);
> > >
> > > This...
> >
> > I presume you mean the few lines above that actually:
>
> No, I cited a not modified code in the upper part. That said, it's a
> remark for further improvements, but a helper can be introduced in
> this patch due to the below part.
>
> > >> +    for (i = 0; i < isp->num_of_streams; i++) {
> > >> +            err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
> > >> +            if (err)
> > >> +                    return err;
> > >> +    }
> > >
> > > ...and this looks like a dup.

Pushed "enter" too early to send.
But with your explanation I see the difference now.

-- 
With Best Regards,
Andy Shevchenko
