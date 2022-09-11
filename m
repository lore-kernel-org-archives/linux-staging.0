Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616B7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 07:12:56 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3452214cec6so65986347b3.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 00:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fOne5REx3dfFRIt7Ms5taiBcmpnVEiUY4XZ+R/6BY9w=;
        b=hMmnRYTSakinCEP6SGw6Jp7CEqe48xDiDxXrrMm2mZF3Sy1OsgVNst2xIKymbxYOV6
         2oQu0Hy3We9J4fpDH7fv9iGty1ia4qVy8DtkWW5sNMD0MRcDk7C88jmFh3HD0X32kqPY
         vk3zlQS+1hzrHiajSwyKJrLP8sf59eT7eKUAKhCfsQVR89vwE9VMgZWkXzum+fuSfy12
         oiCieHEb/xs/UNgCviwLRnc8RfILaTcCrT5UE4JiskvbEffD884O1AhwN5b/9HnT3e3t
         yb/OnSw4yGrtPojohdTF9qYb32Z1zjd21QjGalN734MnVJjn0NIOuJtRpzfc0pAkt42A
         pyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fOne5REx3dfFRIt7Ms5taiBcmpnVEiUY4XZ+R/6BY9w=;
        b=CMt+TkhArzeGZ8wFJfsNYfRbmRLAyf/rfbJ6QbxAy3lIN+kmU8wBRqqlsin54as1BA
         RJckGYSQuBHhn28XH433JxSiLJ2TtaVXkXg5Loqi4gEp19vaHm6gFibhnB5r9EEHSfzY
         8s3zFbp4Knew4HZNGM0ll4u4rw/xsyvrrbWN0j7QLbNegGkvs8SOTD4CmQ3cmVK7NI9T
         PNITAI1RyJ46kmxoUACUyeP2F4QcqnvSEp7GAT0h8W4vcCHYxjqIuks/F5lBXyBkF1m+
         x59p4l/2WIoYproDOiG8UTMXpjWcewwcK6Lce7XXgD2pzHP1ZP/RC+i2WnMafcjOWgE7
         0Fxg==
X-Gm-Message-State: ACgBeo3R+An9JujxIcFxZhuff08QrA5S6vN02Yj77un0s4KqlYOUMWtX
	CybpZ9mr5XXNyHDQRNqKcM0gA4EbkxmkNNIg8j0=
X-Google-Smtp-Source: AA6agR4f21MGHZ4mTrOOEls/7i4BSoXeuL7NT6r/8h1hYirpPlu2WDHgj/JOs1bcZTjLygMlBWiBtJohJT5jFNVUUi8=
X-Received: by 2002:a0d:c981:0:b0:330:dc03:7387 with SMTP id
 l123-20020a0dc981000000b00330dc037387mr18272329ywd.380.1662880375353; Sun, 11
 Sep 2022 00:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1662724786.git.namcaov@gmail.com> <c3a7d9963b1c38c5f493786d7268c430617412dd.1662724786.git.namcaov@gmail.com>
 <Yxt/3FOysEbwCm9T@kroah.com>
In-Reply-To: <Yxt/3FOysEbwCm9T@kroah.com>
From: Nam Cao <namcaov@gmail.com>
Date: Sun, 11 Sep 2022 09:12:44 +0200
Message-ID: <CA+sZ8B8Y1ZGou1Y4tQYJC1Wp_2MVdYKO0Bd3SfxMAU1DF+mz_g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] staging: vt6655: remove unnecessary volatile qualifier
To: Greg KH <gregkh@linuxfoundation.org>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 8:03 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 09, 2022 at 02:17:55PM +0200, Nam Cao wrote:
> > Remove volatile qualifier for the member rd0 of struct vnt_rx_desc,
> > because there is no reason it must be volatile.
> >
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > ---
> >  drivers/staging/vt6655/desc.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/vt6655/desc.h b/drivers/staging/vt6655/desc.h
> > index 17a40c53b8ff..3f0f287b1693 100644
> > --- a/drivers/staging/vt6655/desc.h
> > +++ b/drivers/staging/vt6655/desc.h
> > @@ -182,7 +182,7 @@ struct vnt_rdes1 {
> >
> >  /* Rx descriptor*/
> >  struct vnt_rx_desc {
> > -     volatile struct vnt_rdes0 rd0;
> > +     struct vnt_rdes0 rd0;
>
> You can not just remove this without describing _WHY_ it is ok to do so.
>
> Have you properly determined why it is, or is not, ok to use volatile
> here?

I did not carefully look at the volatile usage here. After looking at it
again, using volatile is actually valid: the structure resides on coherent
memory.

Sorry for being careless.

Best regards,
Nam
