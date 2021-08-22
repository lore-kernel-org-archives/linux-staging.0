Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19F3FC2
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 23:50:09 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so5626700pjb.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hW+MyZ0ZhseMioQm3TJnaAAxpMc4z/kDYHdzPefnuLA=;
        b=LDrWH0/91yTsHyv3UOjNih8imjQ2zDPDWHLsEqZW4ozDdBhkJ19ctpnQ77XwisKuse
         XpzyYWM4H5oPJmzKlHfMAd+T9LSZmJD4Mw78dmJdFHYyih9AhfDwGdPnBSN74tGr9zTp
         2M0mWpZWSnoTJ14sjIhMxucRcD2r72XiVkPQp4eZTX6V8cdQ9Gbkvdb5+LCoFOEg/Pnu
         PWwqn81BfgghjJPQ+VnVrsTKMm4ZEAO0reKlA5345YPnn/uIOgINDnZFlM5iu7BiB9A9
         3v5XzaxtacORwlOpmOF8ZsFs+JN8d9/nSq+ff1iiH3CNpiD/RItpS3fVBoH1DBx15pKR
         hzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hW+MyZ0ZhseMioQm3TJnaAAxpMc4z/kDYHdzPefnuLA=;
        b=RkdW9eS9nff8dIEYBy0pkHVfKosUcnOueRInUOc1j7gzn8X4SvEOL0MrxcZrDMXXkx
         RzNgq0Mp5Gc9VmJiVKjHPeIwkZF18eZP5TDVpEG5IAvI3jNEVDZS5HD73xoURc+Bg1TQ
         wS8UCWMJf/4+FwuLLjRdOqc7XvDWHTegAqZYezch8wDkFLiHD+TuVK485H9CKk94UwNi
         8DrEIIMcSXp1v2zBOOtPAFLdewgohjo1B1tdYNGDbSji53f3Ep93bOswY+JnjsM9ruiH
         Bwy/hUqJM/7yBCXGlUxUx5YReKXj2kP+qea16NpQI+oj8KSSpk6KYTVdwcTWgYFwEZnS
         WT5Q==
X-Gm-Message-State: AOAM5323/Vc/yjcQRV32LSuR8PJbzIIkFFoIk0AaaTEYOuQ3dBl8CYRU
	PrzVejkrDsrirRg6wtXjHIw7q2HctLpDm+rThSmQJA==
X-Google-Smtp-Source: ABdhPJwdpi411jgZny+g6LtxpMNySmm/2TW3G1QiD5BPg0Pa3Vf3cjKc1j3mA8iiATCSfuADaedCsza/3kut37yyktI=
X-Received: by 2002:a17:902:6ac6:b0:133:230b:e8bc with SMTP id
 i6-20020a1709026ac600b00133230be8bcmr5455400plt.22.1629676209302; Sun, 22 Aug
 2021 16:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <CAA=Fs0mU0bkXPY35fkuudoWfAps2jp1qc3ga53LXgg6d+0bVSg@mail.gmail.com>
 <20210822170435.ijsi7ep7rbdu4i3k@viti.kaiser.cx>
In-Reply-To: <20210822170435.ijsi7ep7rbdu4i3k@viti.kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 00:49:58 +0100
Message-ID: <CAA=Fs0=3T_0Ypnm8E-Eq9sxZw+VU9Y2k_Pgtk4dcR3msRqoUoA@mail.gmail.com>
Subject: Re: [PATCH 01/10] staging: r8188eu: remove unnecessary cast
To: Martin Kaiser <lists@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 18:04, Martin Kaiser <lists@kaiser.cx> wrote:
>
> Thus wrote Phillip Potter (phil@philpotter.co.uk):
>
> > On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:
>
> > > name is a const char * by default. This type should be ok for r8188eu.
>
> > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > > ---
> > >  drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> > > diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> > > index e002070f7fba..72556ac10d7d 100644
> > > --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> > > +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> > > @@ -61,7 +61,7 @@ struct rtw_usb_drv {
> > >  };
>
> > >  static struct rtw_usb_drv rtl8188e_usb_drv = {
> > > -       .usbdrv.name = (char *)"r8188eu",
> > > +       .usbdrv.name = "r8188eu",
> > >         .usbdrv.probe = rtw_drv_init,
> > >         .usbdrv.disconnect = rtw_dev_remove,
> > >         .usbdrv.id_table = rtw_usb_id_tbl,
> > > --
> > > 2.20.1
>
> Hi Phil,
>
> > Looks ok to me, thanks. I would consider using a cover letter style
> > [PATCH 00/10] style approach as an addition in future though, just my
> > personal opinion.
>
> > Acked-by: Phillip Potter <phil@philpotter.co.uk>
>
> Thanks.
>
> This series is a mixed bag of things I found while poking around in the
> code. So I didn't think there was anything useful to say in a cover
> letter. Still, I see your point, it makes sense for a patch series to
> have a cover letter, I'll add one for future patch series.
>
> Best regards,
> Martin

Reasonable point for sure - it is your call ultimately, I like your
work in any case, so many thanks :-)

Regards,
Phil
