Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE73C30
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 16:52:24 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id a67so18704288ybb.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CAUHAKvsliDqt6Bith7BoZVpURh1bCvkOtmvTYLFN94=;
        b=GEgSCNg5HmYJ4ERFLxTXHVSrDewcSpNo6KSQQtQd4onLJNSCMdYM0UgxwjfCxZSqjl
         ZMLTaEGWcQFtF+qiAH0g8YpfD5lStrL3EJ28Qy2KuTx3ipLWZ1/CVx92UI8GHlS86yfW
         CoYE+eZhVkClgNGW9t5dXws31eOi/5RQCIY6ZdCqw6OdoogqVsZ7du9r4EdBu+e+Yvhx
         CfBfmWZHeF9W+oeCgpNL6xNwu62QOsfm6CA6MH4ZrbmQkZsZjigM85CMF/Vgl7o43MRP
         IyWBn9JsLuCRJFDHqlEbyGMp6uq+LtI4qIsswrb1FoYi/cWD+ZUiCT7rq3IWGvQQyugD
         ZH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CAUHAKvsliDqt6Bith7BoZVpURh1bCvkOtmvTYLFN94=;
        b=wP89jUvifuP0q8wwknfVDSaFm+YM+gvLE1BCjwmYhM+glGSl+dWBqT9PH/q0YYzenK
         +5VwdN3VXaZ/kWB89+Z4s37qoE0pfxM8QbcyOCk4v6t3vGOu9nlJEdTDvq0N1ur+O++N
         Ey2B8XQCDE37pD9yd4+HG5AeOtsb0do9I96nQhEPSwCyP//vpSKNCboQ6KbRxDBFpEBF
         X/hNGFzP7LrMXViHVOXwkXAAZVznslC4N/uQNe/Xpvq8fAt8l8iaBQI69yrwocNFD0T1
         3FyYjX4hEothKDaAGJEtE091pXbhNaICHiyy9iVYyNsNARVNy1j/1rgh3XTsfFtiV2qB
         cEgQ==
X-Gm-Message-State: ACgBeo0SSN33NmakdkadcvFjY66wBNY5TaTiSgVxTDZm5CkHR7ggF9t+
	e0Qq1N9DoKbCoVqg5r3iKRkBZMfXcJetZs8wKwc=
X-Google-Smtp-Source: AA6agR6W986Sl3YkCKIGso9iEy5VyE1ic/Mx10Iso5iivFtJnBsPgRN21CKXWch+AY1iGVom6ZR0doWkpT/b6MOU390=
X-Received: by 2002:a25:230d:0:b0:6a9:1d4d:6594 with SMTP id
 j13-20020a25230d000000b006a91d4d6594mr28014766ybj.616.1663087943592; Tue, 13
 Sep 2022 09:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1662724786.git.namcaov@gmail.com> <c3a7d9963b1c38c5f493786d7268c430617412dd.1662724786.git.namcaov@gmail.com>
 <Yxt/3FOysEbwCm9T@kroah.com> <CA+sZ8B8Y1ZGou1Y4tQYJC1Wp_2MVdYKO0Bd3SfxMAU1DF+mz_g@mail.gmail.com>
 <Yx2NY0RBWLqH3rDK@kroah.com>
In-Reply-To: <Yx2NY0RBWLqH3rDK@kroah.com>
From: Nam Cao <namcaov@gmail.com>
Date: Tue, 13 Sep 2022 18:52:12 +0200
Message-ID: <CA+sZ8B8-hsNXY-nFffvGMLJXmsAa9L+gnEK1ZdC7PztG1dd03Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] staging: vt6655: remove unnecessary volatile qualifier
To: Greg KH <gregkh@linuxfoundation.org>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 11, 2022 at 9:25 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 11, 2022 at 09:12:44AM +0200, Nam Cao wrote:
> > On Fri, Sep 9, 2022 at 8:03 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 09, 2022 at 02:17:55PM +0200, Nam Cao wrote:
> > > > Remove volatile qualifier for the member rd0 of struct vnt_rx_desc,
> > > > because there is no reason it must be volatile.
> > > >
> > > > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > > > ---
> > > >  drivers/staging/vt6655/desc.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/vt6655/desc.h b/drivers/staging/vt6655/desc.h
> > > > index 17a40c53b8ff..3f0f287b1693 100644
> > > > --- a/drivers/staging/vt6655/desc.h
> > > > +++ b/drivers/staging/vt6655/desc.h
> > > > @@ -182,7 +182,7 @@ struct vnt_rdes1 {
> > > >
> > > >  /* Rx descriptor*/
> > > >  struct vnt_rx_desc {
> > > > -     volatile struct vnt_rdes0 rd0;
> > > > +     struct vnt_rdes0 rd0;
> > >
> > > You can not just remove this without describing _WHY_ it is ok to do so.
> > >
> > > Have you properly determined why it is, or is not, ok to use volatile
> > > here?
> >
> > I did not carefully look at the volatile usage here. After looking at it
> > again, using volatile is actually valid: the structure resides on coherent
> > memory.
>
> Are you sure?  That's a very odd thing for a driver to need.  Looks like
> they are allocating some dma memory and then pointing structures on top
> of that memory.  Why would you need to have "volatile" markings on a
> structure definition for that?

These structures are the ring buffer descriptors, which are dma-mapped and
their values may be changed by the hardware. For example, the field "owner" of
struct vnt_rdes0 is set to OWNED_BY_NIC by CPU, and then set to OWNED_BY_HOST
by hardware when new data arrives (at least that's why I can guess based on
the codes). So I think volatile is needed.

Please let me know if you think I'm wrong, because I have just recently
educated myself on DMA mapping.

Best regards,
Nam
