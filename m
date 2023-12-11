Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5954C3DB;
	Mon, 11 Dec 2023 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLUGfhRF"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d855efb920so3674182a34.1;
        Mon, 11 Dec 2023 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702311199; x=1702915999; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMdTBUxR6AVwW86ExWMmPkNHggzo7L+Lz305ZVyo4xo=;
        b=SLUGfhRFZSNEDUJtMhruPZ9APcZXYQzYUTPl4JwFdD0MCuBbCRqEYeq+SrAxNTkJ32
         18MoybdaBn2GGc7EVsxNxUs+rTBaGFGSe3U1YTzE3N8ZD6XawIub4xjPZPNI0M1cjQgE
         IeI5QD61vI5tOLjxd2+QDOIlc3iW/gMr5Lgj7vuBoqr4mfIGlsMmQmP7Kk2BLeftKI/Q
         zwNgdgq39g+uvqEyJCNBCkCvUmuRXJk+TxprDnC1oLS0+RrplijcFu2Nb196SinWO6Rg
         KY4nGMILVj47hW7lqXP+mbn6mPDCyg2k4LhzL6eABWSP/zmoFAgS6P43HgzPQxDGX7s+
         cUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311199; x=1702915999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMdTBUxR6AVwW86ExWMmPkNHggzo7L+Lz305ZVyo4xo=;
        b=B/2DWoLu+aMDQv3WAXZKEkqgmnViplXGZ2TLNAGOuXEOtVe6pTe8VNr0SNASG8wzR2
         J+JRFxMqGMZ2vzkM4b/63Kj1XXqHIflVNs/Un2FStrrVzo/s+8e2G41l+3DQxyi98gp8
         +FmorjSfaxGroEbDb475ld4PAjvC38CiiIK3NEiHK2Y3RicCsvTxJRc9QB+7lg7lkNw5
         rdKNQ6V1BaInjSx50Qc1ElguFT9JGe2P5vTngI3JQz3HqvZNqNMQsCZJ4fituohegGdb
         5fo7YKtyqBdMZwp5GWzKtcfTJva5juDA/omkc3ti2/IGyiygM07bk2uDF7VX+vElFgu+
         EWYA==
X-Gm-Message-State: AOJu0Yxq4cJyHHJVgHonxNQ5NpJX8Q3JTBxNFbzbRG2kpUJfSPFXzS4j
	+Nh4H9MbHundfhxWyuKyKzQcXRjoF/VDdHJuJS0=
X-Google-Smtp-Source: AGHT+IHg2NZrh/AUj7ZQM9me8Y07vZ1PsqzHpRMkWnNDA4LpsvfZNr1RuQfrDp+uriHlNjKbyDxVqea4oc7CbrlMwvw=
X-Received: by 2002:a05:6870:7817:b0:1fb:75a:6d15 with SMTP id
 hb23-20020a056870781700b001fb075a6d15mr5806790oab.60.1702311197241; Mon, 11
 Dec 2023 08:13:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231211155453.105409-1-piroyangg@gmail.com> <2023121133-mandatory-idealness-d454@gregkh>
In-Reply-To: <2023121133-mandatory-idealness-d454@gregkh>
From: piro yang <piroyangg@gmail.com>
Date: Tue, 12 Dec 2023 00:13:05 +0800
Message-ID: <CALaNatNpBJ6a-hv3MiV7NzuJ7wYLwHRCs3ppKM5O-UCvTSeiGg@mail.gmail.com>
Subject: Re: [PATCH] staging:vme_user:fix the issue of using the wrong error code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, Linux Outreachy <outreachy@lists.linux.dev>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2023=E5=B9=B412=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=BA=8C 00:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 11, 2023 at 11:54:53PM +0800, Piro Yang wrote:
> > 1. the error code of ENOSYS indicates Invalid system call number,
> >    but there is not system call
> >
> > 2. unified the logging error message, when slave_set func is NULL
>
> That is two different things, and as such, should be two different
> changes, right?
>
> Yes, it's picky, but that's what the staging driver code is for, to get
> comfortable doing kernel development changes properly.
>
> Also, are you sure this second change is correct:

   yes, I'm sure .
   the vme_slave_set function is diffierent
/*****************************vme_slave_set***********************/
int vme_slave_set(struct vme_resource *resource, int enabled,
                  unsigned long long vme_base, unsigned long long size,
                  dma_addr_t buf_base, u32 aspace, u32 cycle)
{
        ...
        if (!bridge->slave_set) {
                 dev_err(bridge->parent, "Function not supported\n");
                return -ENOSYS;
        }

/******************other functions like below: *******************/
int vme_slave_get(struct vme_resource *resource, int *enabled,
                  unsigned long long *vme_base, unsigned long long *size,
                  dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
{
        ....
        if (!bridge->slave_get) {
                dev_err(bridge->parent, "%s not supported\n", __func__);
                return -EINVAL;
        }

int vme_master_set(struct vme_resource *resource, int enabled,
                   unsigned long long vme_base, unsigned long long size,
                   u32 aspace, u32 cycle, u32 dwidth)
{
       ....
        if (!bridge->master_set) {
                dev_warn(bridge->parent, "%s not supported\n", __func__);
                return -EINVAL;
        }

int vme_master_get(struct vme_resource *resource, int *enabled,
                   unsigned long long *vme_base, unsigned long long *size,
                   u32 *aspace, u32 *cycle, u32 *dwidth)
{
      ....
        if (!bridge->master_get) {
                dev_warn(bridge->parent, "%s not supported\n", __func__);
                return -EINVAL;
        }

>
> >
> > Signed-off-by: Piro Yang <piroyangg@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/=
vme.c
> > index 5c416c31ec57..e9461a7a7ab8 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -340,8 +340,8 @@ int vme_slave_set(struct vme_resource *resource, in=
t enabled,
> >       image =3D list_entry(resource->entry, struct vme_slave_resource, =
list);
> >
> >       if (!bridge->slave_set) {
> > -             dev_err(bridge->parent, "Function not supported\n");
> > -             return -ENOSYS;
> > +             dev_err(bridge->parent, "%s not supported\n", __func__);
>
> __func__ is not the same here as "Function", right?  "Function" is the
> functionality of the thing that is attempted here, so replacing that
> word with the function name seems odd to me, don't you think?
>
> thanks,
>
> greg k-h
