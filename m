Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120828F3;
	Sat, 22 Oct 2022 08:29:04 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id a24so3014043qto.10;
        Sat, 22 Oct 2022 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IdLhdqZd5jMuGhUlOGaIRaKi0tmcMH8Qv7JaFOJC9E=;
        b=g2JDkIm9iqwOd5ul/PFvbxFQ0KVH6dqNEpQGDpQLgoWia1h40REPOMcjc1exETkDeB
         hXPC85D3AtRyHnNcsT2P7FuhK8a9wFJf59uIa6otT/lJREud0IosAGsLwLc4w9g08EWz
         wPxJmv8zOK+lwOOcZOA6meGdffR2SPxmk4e0BLEK7iyTfBWetK5eLHhtkD1UW6EtTaLE
         h6quAoH73eDJKWB+yO8IlNNnH3liRRzhJRABD+oesjYqWmeRcA0KAznFVn1aQl8nzigU
         AhQTcnijDbjYrTGmKqXZpFAv4CgKLi6XyoV9EjZb32zPEva2MJPqHzAMg/2DkMRTq4he
         xTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IdLhdqZd5jMuGhUlOGaIRaKi0tmcMH8Qv7JaFOJC9E=;
        b=vKYct2/TQNeOQU/1M5M/LGafL/4VNhqrQ/S3vtxXyQbI70/eDLAXjhd+KyP35GBC0x
         DlS3Qp5SmHn8uqLYC257yL889YPakQBKpEtotKxQIcZoMU+USFCBbV8mn5Cy/uQ9/aG+
         Im/An30NxfmkN3Q/Xu4QEdYe0KbJPTRXEKeLZOTzWDO9LfZAfMpMlJENlHWspmWbC2H4
         AyzXb9G3QS+9WRguwzY2LHSy2SAhRBUs7xsm9pHVuDeLCw098hh1tGnxRw6xpVTG8JIA
         mtc55q546ut2aXsx5m3K2Myu5/MM5Rqy8DnskWMtwDjeNJck3JzsQ7gaCd+3WAIE07Nm
         AwwQ==
X-Gm-Message-State: ACrzQf34gDNhNijeeJG5cKrNNk5ILhqBLGyb/lBQmtrvCgm8KKhCXsFE
	N6WZe0Cs7cKgF68BxDkXmFpQpM4zjyJnw/18A2Y=
X-Google-Smtp-Source: AMsMyM4Ikc1bXKT06XWQVfC9PiTj6AT9wUKPOHo4GcmQKnaf7HrPQns3zMmhg+NBoPNzcrjn8zGr58F/qX2iuIvDF9Q=
X-Received: by 2002:a05:622a:c5:b0:39c:f1c2:6732 with SMTP id
 p5-20020a05622a00c500b0039cf1c26732mr20225224qtw.588.1666427343453; Sat, 22
 Oct 2022 01:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-5-tanjubrunostar0@gmail.com> <Y1OmXf0Zn2eTo8us@kroah.com>
In-Reply-To: <Y1OmXf0Zn2eTo8us@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:28:51 +0100
Message-ID: <CAHJEyKW0mctANMnV77yuYu6ZYmyC9tCGtHd50eW11=ym=R70kQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 9:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 22, 2022 at 07:06:10AM +0000, Tanjuate Brunostar wrote:
> > fix checkpatch errors by refactoring long lines of code in the function: s_vGenerateTxParameter
> >
> > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> > ---
> >  drivers/staging/vt6655/rxtx.c | 67 ++++++++++++++++++++++++-----------
> >  1 file changed, 46 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> > index dc853b83459b..951d4172e9f2 100644
> > --- a/drivers/staging/vt6655/rxtx.c
> > +++ b/drivers/staging/vt6655/rxtx.c
> > @@ -839,7 +839,8 @@ s_vFillCTSHead(struct vnt_private *pDevice,
> >       }
> >
> >       if (byPktType == PK_TYPE_11GB || byPktType == PK_TYPE_11GA) {
> > -             if (byFBOption != AUTO_FB_NONE && uDMAIdx != TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) {
> > +             if (byFBOption != AUTO_FB_NONE && uDMAIdx !=
> > +                 TYPE_ATIMDMA && uDMAIdx != TYPE_BEACONDMA) {
>
> Don't break lines like this, this is now much harder to read.
>
> It should look like:
>                 if (byFBOption != AUTO_FB_NONE &&
>                     uDMAIdx != TYPE_ATIMDMA &&
>                     uDMAIdx != TYPE_BEACONDMA) {
>
> If you want to make it more readable, right?
>
> And that is the main point here, the coding style is to make it readable
> to us humans, the compiler doesn't care.
>
> Your change makes the logic harder to understand, not easier, which is a
> step backwards.
>
> We write code for developers first (as we have to maintain it), and the
> compiler second.
>
> thanks,
>
> greg k-h
Got it
