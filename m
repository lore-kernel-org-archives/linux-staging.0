Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF162F24
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 01:57:46 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id s11so10035472ybl.7
        for <linux-staging@lists.linux.dev>; Sun, 06 Feb 2022 17:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6jB5unxCOG3OGPVEmlfiBcR16mWOiuXX5uTcKkbUQI=;
        b=Zm0HO44MuTh3Ps5IZZv8ARTzJUHAkn0gmuSgse19xSu+4RBR3xXWtUFMhDlpZwnpNL
         oeHCrCy1Y+J6yEEwQotcYLROd50usnIe+1sdVWddcJPzilfVgSQwqzNOYXrwYLP0i/0T
         yPysrrH5XxK3Vgqo75kJnst7+hTTyAOUf69xZcLrQ4wnFEwP03pZUP/qBF8qO2QGVOg3
         qtJ0zqAczc/7GPOss4fS3lwXdFhrYr3CG1cTrKzZVwfgmSQ+N8SrZp75scLK88JLn3n+
         yTIGu3bLb66Z4z66xS/8gKPKECIgOSTmEpTKOY7tY1y8HOP+zFY5r5IsB4akL+geFjWt
         +YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6jB5unxCOG3OGPVEmlfiBcR16mWOiuXX5uTcKkbUQI=;
        b=tdd4PfOMk4wuksY/YZCDb2U03qjVrOV/2q7aszML1bYS6m5DHXi4YydvlassdVrN1d
         zOuMjouhR2iVdXuqBJpyptuu+wNzynhwvi+YLimZeO9x4K4nhppOg41ADDO8pygAPOT3
         P2ZwAkOPg89p9YS3oYUzu2iPv76KJDcFkwr/zndPWucPa3GmzcA0ysn1caCvilIhYygb
         oo12YhG7kITib/1koJEIUSAcJxJuKLNfPaV76yfUba5KgK0HNOGNK9JzajAKltWZSKEK
         T/Dwoqu7u4sRBCus4X32cOyUGFI6llQdG9U22OupnbqWlGqguNzjyCB9M4N59mSEU14e
         /eRQ==
X-Gm-Message-State: AOAM530/7qCVPGL2rFOVg/oOwbPEUN7pOWDbiFrOXFE26yQjaXBzpC6s
	Mfnlnm07oxkoULe0XviBLXh4P5Vfeirj1ETzQ7s=
X-Google-Smtp-Source: ABdhPJxfztv/wBcGEPXfgrgrXn8ooNS5PkjWrqePaC+KxO3p486LI47ivujmNuL3yE1MnPf7NdaDnvArqLVBhY8Q5is=
X-Received: by 2002:a81:de4c:: with SMTP id o12mr8984374ywl.109.1644199065562;
 Sun, 06 Feb 2022 17:57:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220206074615.3527-1-joelcchangg@gmail.com> <c0b504dd1f254f19b6ff60948684303b@AcuMS.aculab.com>
 <8536ca17c2945cb77c506d99eff5ccc42e71f2f3.camel@perches.com>
In-Reply-To: <8536ca17c2945cb77c506d99eff5ccc42e71f2f3.camel@perches.com>
From: Joel Chang <joelcchangg@gmail.com>
Date: Mon, 7 Feb 2022 09:57:34 +0800
Message-ID: <CAJ-=yTE7mZr_DtCE3HA4ruqexo1gH+LPCWzHAeSmivzj5H76Gg@mail.gmail.com>
Subject: Re: [PATCH] staging: octeon-usb: Fix 'should not end with '(''
To: Joe Perches <joe@perches.com>
Cc: David Laight <David.Laight@aculab.com>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"gregkh@linuxfoundation.com" <gregkh@linuxfoundation.com>
Content-Type: text/plain; charset="UTF-8"

The hunk has two lines that end with '('. The hunk was rewritten but I
believe the logic remains the same.

I agree they are longer than is 'nice', but they are still under 100 chars.

Maybe I should submit 2 patches instead of one?

On Mon, Feb 7, 2022 at 1:17 AM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2022-02-06 at 14:16 +0000, David Laight wrote:
> > From: joelcchangg@gmail.com
> > > Sent: 06 February 2022 07:46
> > >
> > > This patch fixes the checkpatch.pl check:
> > >
> > > CHECK: Line should not end with '('
> []
> > > diff --git a/drivers/staging/octeon-usb/octeon-hcd.c b/drivers/staging/octeon-usb/octeon-hcd.c
> []
> > > @@ -1792,23 +1792,18 @@ static void cvmx_usb_start_channel(struct octeon_hcd *usb, int channel,
> > >     case CVMX_USB_TRANSFER_INTERRUPT:
> > >             break;
> > >     case CVMX_USB_TRANSFER_ISOCHRONOUS:
> > > -           if (!cvmx_usb_pipe_needs_split(usb, pipe)) {
> > > +           if (!cvmx_usb_pipe_needs_split(usb, pipe) &&
> > > +               pipe->transfer_dir == CVMX_USB_DIRECTION_OUT) {
> > >                     /*
> > >                      * ISO transactions require different PIDs depending on
> > >                      * direction and how many packets are needed
> > >                      */
> > > -                   if (pipe->transfer_dir == CVMX_USB_DIRECTION_OUT) {
> > > -                           if (pipe->multi_count < 2) /* Need DATA0 */
> > > -                                   USB_SET_FIELD32(
> > > -                                           CVMX_USBCX_HCTSIZX(channel,
> > > -                                                              usb->index),
> > > +                   if (pipe->multi_count < 2) /* Need DATA0 */
> > > +                           USB_SET_FIELD32(CVMX_USBCX_HCTSIZX(channel, usb->index),
> > >                                             cvmx_usbcx_hctsizx, pid, 0);
> > > -                           else /* Need MDATA */
> > > -                                   USB_SET_FIELD32(
> > > -                                           CVMX_USBCX_HCTSIZX(channel,
> > > -                                                              usb->index),
> > > +                   else /* Need MDATA */
> > > +                           USB_SET_FIELD32(CVMX_USBCX_HCTSIZX(channel, usb->index),
> > >                                             cvmx_usbcx_hctsizx, pid, 3);
> > > -                   }
> > >             }
> > >             break;
> > >     }
> >
> > What has that hunk got to do with the patch description?
>
> Nothing and this should be revisited or explained much more
> as it seems to change the logic.
>
> > > @@ -2121,17 +2116,17 @@ static void cvmx_usb_complete(struct octeon_hcd *usb,
> > >   *
> > >   * Returns: Transaction or NULL on failure.
> > >   */
> > > -static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(
> > > -                           struct octeon_hcd *usb,
> > > -                           struct cvmx_usb_pipe *pipe,
> > > -                           enum cvmx_usb_transfer type,
> > > -                           u64 buffer,
> > > -                           int buffer_length,
> > > -                           u64 control_header,
> > > -                           int iso_start_frame,
> > > -                           int iso_number_packets,
> > > -                           struct cvmx_usb_iso_packet *iso_packets,
> > > -                           struct urb *urb)
> > > +static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(struct octeon_hcd *usb,
> > > +                                                           struct cvmx_usb_pipe *pipe,
> > > +                                                           enum cvmx_usb_transfer type,
> > > +                                                           u64 buffer,
> > > +                                                           int buffer_length,
> > > +                                                           u64 control_header,
> > > +                                                           int iso_start_frame,
> > > +                                                           int iso_number_packets,
> > > +                                                           struct cvmx_usb_iso_packet
> > > +                                                                   *iso_packets,
> > > +                                                           struct urb *urb)
> >
> > Those lines are now far longer than is 'nice'.
>
> True.
>
> This _might_ be better with the return type on a separate line
>
> Something like:
>
> static struct cvmx_usb_transaction *
> cvmx_usb_submit_transaction(struct octeon_hcd *usb, struct cvmx_usb_pipe *pipe,
>                             enum cvmx_usb_transfer type,
>                             u64 buffer, int buffer_length,
>                             u64 control_header, int iso_start_frame,
>                             int iso_number_packets,
>                             struct cvmx_usb_iso_packet *iso_packets,
>                             struct urb *urb)
>
>
