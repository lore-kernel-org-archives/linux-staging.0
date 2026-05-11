Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399544A724
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518478; cv=pass; b=IINwY/NrjWRX+kDVR8qmEo71rEKGg33jJSCPzoYid5H1Go47jWb25T/ch3tCAxSXM4SvzTAoldx2nIDhrbn1s8CzNE7UT3+TG2KZigAQVTtoq+DH6jIZLHZCfrogUhNSr9m2uueI0aMVvRHbdXkedNEHfrP6flLcdMDvoO/hoHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518478; c=relaxed/simple;
	bh=e6FDBEd3LrmM45eIjy/3dsqGlQFiiOvHzbrL7PcTNNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHxbJT+Aah0z6iPcAbSOz5w+G1fz5wsMLyc3VkETVhi/Q6WRr16ZRq1bp144w387qK0A2yUDEXQdXFvedcbITrkZ4ENTdtM/ZBXVM3Ylg/KjYZTh4QOYK88SnhBNTt+KqE2ggNRZtHD193fGbvs6OM5+zMoZ2istmxoiytRp7Xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZodtbwXJ; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZodtbwXJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so41438435e9.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778518475; cv=none;
        d=google.com; s=arc-20240605;
        b=kgSAICoVSzboECYG1X7kpTVTnvOgQC49pJ9XrXfhshmD8GY5gEKONPmT/a0vncYWeE
         vE+OIuoNhIjMubC76fNmnbo3ud4YnUajxy66zQu4fQq3roDl5ktz+PA1ogGUuqOXAVgL
         kI/OvVKJg4ni+vVYfpykByoJaU+fYmbtlBgLhHdbWA0NpfGtQI4tmUgGyaluEZBx3j7i
         gZockEPOEsrxwlVngaOS2CoSrqhnWXzHl3x7l7mIZmREbgs5La5W3rki+0V/078zIm7o
         6hj4LdxrYE2MV0c23LWuG8RXTmZiE/sPHpN4NaO09YXWuvov3TlJ0ZKDL/yxR4Gnl5fN
         w1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zP20j1EFtYc/u3CIAPYtiBA2MJ0zdnfOr3uVC/DRl0U=;
        fh=2LRm6e1ocmftl2yM+4u49MdXVhav7bay1LTILDW7W9c=;
        b=Vd0KWovs9XGy2uxDaYyPJn2VtMMhZkozazbr/HwP6HXIxd1lKEcLJLMLW+CsmkHwNo
         PMaUYvckwuwiCycRgdE2zyW1zlD4JD4nGuS9NlPFDBXTXeoyF0XzhxKboiCj3dLIn/ng
         J4vNi6wta3gve0Z/Jahae9updyx4c9emrrHcoS4H4L1q6YwmskaedptbvXqoYBAPap+l
         X/4mKq87trCd65riJ7NJ+ajNUgXCdxXgquwYu1cazxiwy9cJDt4iLJrxzq7XvMglVnrB
         zAuQIyyAknkIYzNxIomPB2di7xxNz5PHBYxohjkQGPkCsySQQxvlaUKVVkBSuo6kN7GV
         ESqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518475; x=1779123275; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zP20j1EFtYc/u3CIAPYtiBA2MJ0zdnfOr3uVC/DRl0U=;
        b=ZodtbwXJWZMOihS9sNLnppvNEDSCNGWKLHYV9vVX6oqqsY2xM72vRHHYnlUkI8jIpB
         UB/MyW1lULAhleATCgzNHo75FZI3ppTVytnb3YpRjaS+gJpKkKK0VMyDx+O5sUMfdWeI
         EykT3tM4fd9XilVfE/Xu1FdwFQatEtcaTdU3oK8EZV217oYpW5qA+BqNQFTxTpuRV0FQ
         aWLKdObkitNdAye6f8OHWRiU0iSLzYWTxfObPa48GPvrEW0r1u739ICewDVZNywyvPpV
         /ocNruAKRi8ojofzzqfgz6xxvUdRI1KaZR/1WAcfnfEySVVyUNyr2O2FPZD8yx/jeOCM
         LYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518475; x=1779123275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP20j1EFtYc/u3CIAPYtiBA2MJ0zdnfOr3uVC/DRl0U=;
        b=HVCgyCmVh0TFmkV+1Nr9kW88bdMtmTqH0i3YMkhJaWguCENPJ/8x5nxPBGVeFykGjr
         JH1kupyIPYNFWpM8S2HxGdl2Gq9o0EzlaRAQmtowMfBelzAqccPpnLz2l63+J6lEDsuJ
         Efbrw4qp0VC1jB/IQpgTRBmfWD3OHrwXbt9mBAjdD0FPeSZ/5pAvOiTvqc25RgyfBfsz
         cmMixlHhP0y13FaeauGQBN02dQRYIheoxb5B1a1JcIFGao5KJB5RdzHdfFtK4X6JcmmU
         MxwrUdCUSyAGwogfA0m1XEf8r2Ni3GJYpT6XYIoNafXgQ7WnhCsytUC1/tFzsY3zmZFy
         7gAA==
X-Forwarded-Encrypted: i=1; AFNElJ/nd8wc1i+6eOEVK5KtH4KEB7ZDPgy+91u8Wvc72S7UDFmwl3a1yEUoUhKX4fiqZnwo5HqoXcpStxT+W6yM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3J1/7Ouq7wBro7J2RhCsY4Pd64iNyFiIgflQQDnHM4ptw65ue
	YKb1Eie9OVF/aRJz3GgzSOqBqkSx69fHcHdQaqQAjVB3sRBgzqTPmH9Unj7/QS3H+V5pdFgRAYX
	/SilHX0/KhIL9fmWwe3T2p6UoLPkJH0D+HqZx
X-Gm-Gg: Acq92OHjhwclIPcgtUgfT8P6fIxihrP6IPUG/+0CYXMX9GgmNGU6KJd9irJmRuxjL1L
	LjnVmF/rnAdGCqSxP8kwGh0SE6qnFC/LE4xCRKe2cGn87iI8jWETlJUUq4n8fDMbDjSNAmDNjJ5
	g1QRYMWXOVHJGZRUEoWO5TaCt70+bosUd74XMsxsRN+tFBkJeaI119W0DYT2GDRGjv1PFfdsP/f
	Yk0BC5BERBTcCl9wdyHH6akgdvJ16Y3msxmXuAUDyM5NmYZJSfGkMavvh1EBoAq2G+0xa/J10wD
	tewu/beQkw==
X-Received: by 2002:a05:600c:c107:b0:48a:52d4:888c with SMTP id
 5b1f17b1804b1-48e51e0bb23mr291405675e9.3.1778518475142; Mon, 11 May 2026
 09:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505205746.227144-1-shyamsunderreddypadira@gmail.com> <2026051125-cost-calculus-2a6d@gregkh>
In-Reply-To: <2026051125-cost-calculus-2a6d@gregkh>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Mon, 11 May 2026 22:24:21 +0530
X-Gm-Features: AVHnY4InAGmCcNa0j5dqETNX1xXtW54GuXXW1zEY2jUZUzh4alNqs7G-t_DdlYo
Message-ID: <CALx+fbYaZs5psqp7VJwVb1f2mdXw7FNjgGV3wDW4JsYk7-wkkA@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: check find_bridge() return value
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for the review.

On re-checking the call paths, the resource passed to find_bridge()
originates from vme_user_probe(), where it is allocated via
vme_master_request(), vme_slave_request(), etc. These APIs set
resource->type to a valid VME_* value at creation time.

Since find_bridge() only returns NULL in the default case, and
resource->type is always one of the valid types, this path does not
appear to be reachable in practice.
Given this, the NULL check I added is unnecessary. I will drop this change.

Thanks,
Shyam


On Mon, 11 May 2026 at 13:16, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 06, 2026 at 02:27:46AM +0530, Shyam Sunder Reddy Padira wrote:
> > find_bridge() returns NULL when no matching bridge is found
> > for a given resource. Some call sites dereference the return
> > value without verifying it is non-NULL.
> >
> > Add NULL checks before use to avoid potentail NULL pointer
> > dereferences.
> >
> > Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.c | 63 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> > index b5c66b66ce32..2ed2f1fe502f 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -82,6 +82,9 @@ void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
> >  {
> >       struct vme_bridge *bridge = find_bridge(resource);
> >
> > +     if (!bridge)
> > +             return NULL;
> > +
> >       if (!bridge->alloc_consistent) {
> >               dev_err(bridge->parent,
> >                       "alloc_consistent not supported by bridge %s\n",
> > @@ -107,6 +110,9 @@ void vme_free_consistent(struct vme_resource *resource, size_t size,
> >  {
> >       struct vme_bridge *bridge = find_bridge(resource);
> >
> > +     if (!bridge)
> > +             return;
> > +
> >       if (!bridge->free_consistent) {
> >               dev_err(bridge->parent,
> >                       "free_consistent not supported by bridge %s\n",
> > @@ -136,6 +142,9 @@ size_t vme_get_size(struct vme_resource *resource)
> >       dma_addr_t buf_base;
> >       u32 aspace, cycle, dwidth;
> >
> > +     if (!bridge)
> > +             return 0;
>
> This is an error, why not return a error?
>
> > +
> >       switch (resource->type) {
> >       case VME_MASTER:
> >               retval = vme_master_get(resource, &enabled, &base, &size,
> > @@ -332,6 +341,9 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
> >       struct vme_slave_resource *image;
> >       int retval;
> >
> > +     if (!bridge)
> > +             return 0;
>
> Same here.
>
> Also, can this ever actually happen?  Given that the code seems to work
> just fine, if you look at the callers, the function does not seem to
> ever be able to return NULL, so be careful of adding checks that are
> never actually needed.
>
> thanks,
>
> greg k-h
