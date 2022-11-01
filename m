Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C17E;
	Tue,  1 Nov 2022 10:35:00 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id c15so2030365qtw.8;
        Tue, 01 Nov 2022 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2aaGLKKXcT3j30MpIDyxy2HNmeZ1E4qLEn3KEfbdC2E=;
        b=cx3LSgS0miVBOswaIFOKRNQjF55iGsu65SdP4m1PqTNNWLvZImGG1LSc647FTNZHXm
         XW5UnjFDCxXV9N/vKS0vvBbHWfwhkuF7KzoenqHVksvfQPsz2zIXkhQMvGYSKR1RliFR
         nsRPmXVieOb/NjiCwsThAglShVRJEUgLCWbuS6kzwnLpfGRkZbulqKjucdtZfqoZLcWv
         Q08VStTwlCqVNIfnzc3L474VXyH0zZnDP8uWNUOe96HQxLNsMhKZiK9MKfTHc0mPZ149
         i+4gBOo7hJeRBJdTQx4pYYyUIGE3tDqXZvC0sIcX0ge9DztESv7u2THXFilP2CAKNGym
         u5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aaGLKKXcT3j30MpIDyxy2HNmeZ1E4qLEn3KEfbdC2E=;
        b=EVWp4XaXttOPkVKiohic7U9KnSsj38xJWNfpPu6jOOer1Ho5xjECVPU+W0V4NAmmXo
         +pBdK1WDMhTqS76esJMzo5Aj3SF+pJ4a5NHksXY1uR6FSh4L9sIpnylbAByGpYRA6UPx
         XmAqtxa2K6MY6m/G/pgLEbkHIPveFYbWOkryQtKOy8x5bzoJCknQEXIrfmRTvs1C2JCb
         u5w+4NQNjQm6ur+OrZPZgLBlcK4QY4nHQFkujCjeBTWzi29mxpwYLBknDfHhyg7t3uRC
         3eFylEIRpP14irBA/Gxgkm5W/wUgZkdRgN1Iuf8Miqofkvr9i/TtyhksuOqI/tsUvJX6
         yUag==
X-Gm-Message-State: ACrzQf2c7e4ZhzgMIAHmnuGR6z2qnhC2dIWWDILGGTZyMp78eiEEu2KA
	0RoK1tp87nMaeDK/QiDTFVHFRP8PAmxjUKB5q4bfoRKuc2jsmQ==
X-Google-Smtp-Source: AMsMyM7UV3u7zRqR6wGPLF4qbbQbM86yDXQPB54lE++xeoWkG/RqZ5CMpMicLcFNZ7JRXuQmB5WeU3DbsGWCzf2nCDo=
X-Received: by 2002:ac8:58cd:0:b0:39c:b865:8c71 with SMTP id
 u13-20020ac858cd000000b0039cb8658c71mr13955440qta.38.1667298899772; Tue, 01
 Nov 2022 03:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221101080006.GA63438@rdm> <alpine.DEB.2.22.394.2211010938240.2834@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2211010938240.2834@hadrien>
From: jovial umwari <umwarijovial@gmail.com>
Date: Tue, 1 Nov 2022 13:34:48 +0300
Message-ID: <CAMk1CBNsheLvpw=jvZrbyK3MC1VJjoBNeuoCQsmCutBTat3jmw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] staging: most: dim2: hal: aligning function parameters
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Will do. Thanks

On Tue, 1 Nov 2022 at 11:39, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 1 Nov 2022, UMWARI JOVIAL wrote:
>
> > According to Linux Kernel Coding Style, lines should not end with a '('
> > Fix-issue reported by checkpatch.pl script.
>
> How about something like "To improve readability, start the list of
> function parameters on the same line as the function name.  Issue reported
> by checkpatch."
>
> That would more clearly explain the intent behind the change.
>
> julia
>
>
> >
> > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> > ---
> >
> > Changes in v2:
> >     1.Resending this patch because it was sent multiple times earlier.No
> >       functional changes.
> >
> >  drivers/staging/most/dim2/hal.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
> > index a5d40b5b138a..6abe3ab2b2cf 100644
> > --- a/drivers/staging/most/dim2/hal.c
> > +++ b/drivers/staging/most/dim2/hal.c
> > @@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
> >               dim2_clear_ctr(ctr_addr);
> >  }
> >
> > -static void dim2_configure_channel(
> > -     u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
> > -     u16 packet_length)
> > +static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
> > +                                u16 hw_buffer_size, u16 packet_length)
> >  {
> >       dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
> >       dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
> > --
> > 2.25.1
> >
> >
> >
