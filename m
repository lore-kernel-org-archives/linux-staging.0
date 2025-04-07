Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EFD1A315F;
	Mon,  7 Apr 2025 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012290; cv=none; b=nDvmCPr6grm4k1hgWThueje1ZLXMo/yP+iVtWq6z54QPYhIuwys0dyWNqJZ0owF73rdCGOQ8gdk5Vkzj8FMxzOvwOens6u3aAm9xGVXLrwgKuwGrdlq55KO1Y9ABRKV52MgBNRJCOphvwv4FkN8B2Qdu2yokwkMZ8oU7expPmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012290; c=relaxed/simple;
	bh=o79E6iz8ZvmNeQP4Cpdd8X6btgIvg0exYvYyzn95SYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g38ZvEGwY7OABfXsiVhL3by0LhCI7PK28oyIMNpYsPNFph0gIjyEOaGyuOUafYCu4xZsk0Dm6b/jiYs+qbk21vQMgBfRZgYvAHdgIoQGDs8UGcq4eEQM0o7zvvCSThUkksKV6eGofjbsxJmYeAHJ2/L56+bENQY7up3d9gFKS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq6pu6Js; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq6pu6Js"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-525b44ec88aso2004932e0c.3;
        Mon, 07 Apr 2025 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012288; x=1744617088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtZuEG+pnGVzzK4h3p2dQVU+EpheroOcxlaBk0xAm9k=;
        b=Nq6pu6Jsvh6QQ+WeU8CMynsgMOll8WQoBNLdcULV/egsuWI9XBI79iMafpOOFdbIGD
         jMA7C3tSLE86CJMAnbovqwUsHuFzD3z1eTmgouid6T7qHnTnbH1zlrCuz6Gt+imp+YyW
         Iw8zb/6+7nYqAOVpKO/H9S6su6QuKiBqdOCC0xbDyak6TvarRA/9+PLiyk1OcDHG4N8d
         FQN8WnB5ly1oVoNEqzBpyknbuYg0TrKZ7eNKHBFcjXkQblSK+nonwoUDZU4gfMYvo5t/
         lRDzXdeMD7fH1x8heeo0nwQIkrvzf5CDQksmxuujfWHYeCIyVnwXUuldxBKRS46QLepS
         OYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012288; x=1744617088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtZuEG+pnGVzzK4h3p2dQVU+EpheroOcxlaBk0xAm9k=;
        b=CQcCHKd0NdtrlttjZUzvySUnwnWpL998gzZ/zGw5Kk+OROvHdZUqTycriD9JHVlT50
         fIhy+jf/xx+2NY6lOXuBUYrKcLmhFoJDxFB7x1ms7Rqhilq4kYKuDKe4MYuNqtMF0+0t
         ubxl2UyBWMRKb1g+jfBzD1Lknwbv4jtgh8NlFx95ZKbFDN+omVFlI/Fx3fmqjAf30Jke
         6eoMNnSN1VCgncAppqlSnRKLaP/Bg5dahkhZYJ0eiDFKTtOaRz5T/aZj5xF5Ri9Yowss
         aWuir6Ubxx1JDrVvu9jUof/x0/mxW49Au3ji3k8lQXoQCNtF/CEc1IoARVH3CgHQxhEy
         EhVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXoqlF6XgmCF/dhWvtL96RBj9WXcaisqNnuEo7idhonlb4ReZEC+8sHVZN0P7L8SfdM98Iv8Em5ndwxqW6@lists.linux.dev, AJvYcCWgH9D6WnS/afZQCLvckHnDxExup71qpZjNn/qlAMR5NgkFJShS5axHuOwqOR+9qrRpu/1HinKi0w/l@lists.linux.dev
X-Gm-Message-State: AOJu0YyvfmAyrORLLYWz4+EXtZb/iqhkFOSlbuRhJxnm1FuXRpRMVHf0
	a+i14+geUGpB4y8EGmEt1XHVvvIhMqGx/blFsh8NcyLJb+bdFXBCSeDAvoHYxmdRDL0obg7Okyx
	PhJ/FAA+d1n4H2vUW1LLMnIwySbY=
X-Gm-Gg: ASbGncu9F8CVh+ExmBv6Bk4tXEJUOukQV1AurkjWN+1mKTd3TFZUEiRr//rugpKVH9v
	H5I21Rw+SEhxOLhUv1yUFMaUDTB8zZe5lYOc4mlMUV4rspRRyD4N/P6IRnNL5iVe81mYK0KpTpE
	bLe/vh15DRSmD+zmB3LXFreTsOS5JTp30grALWkQ==
X-Google-Smtp-Source: AGHT+IEAhKw6pvZfmPU11eW7Mu3LcNdcjaDj2yQ40iqTe/wDunpLy0Cg0y3QthniLyQYYJJKkqC8V1utCVDnjNxAHfw=
X-Received: by 2002:a05:6122:1816:b0:523:9ee7:7f8e with SMTP id
 71dfb90a1353d-52765c5444cmr6470357e0c.4.1744012287790; Mon, 07 Apr 2025
 00:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/NxGilPLPy7KSQ3@ubuntu> <2025040757-clergyman-finalist-0c63@gregkh>
 <2025040752-unrefined-labored-8c8c@gregkh>
In-Reply-To: <2025040752-unrefined-labored-8c8c@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 08:51:18 +0100
X-Gm-Features: ATxdqUHhyM420ZVP3BEml1GrGZKTTewJQJc6Tjl2jKwdFNU2DbODlPxG2XuGm5I
Message-ID: <CADYq+fa0nJdq2+kMkwwb-s0ePH_8qN_R5Lu6SfNpH1pUsdRksg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Greg KH <gregkh@linuxfoundation.org>
Cc: julia.lawall@inria.fr, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, andy@kernel.org, david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:55=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote=
:
> > > The sequence number is constrained to a range of [0, 4095], which
> > > is a total of 4096 values. The bitmask operation using `0xfff` is
> > > used to perform this wrap-around. While this is functionally correct,
> > > it obscures the intended semantic of a 4096-based wrap.
> > >
> > > Using a modulo operation with `4096u` makes the wrap-around logic
> >
> > <snip>
> >
> > > -                           psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
> > > +                           psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 4096u;
> >
> > I do not see a modulo operation here, only another & operation.

I'm sorry ...
> >
> > >                             pattrib->seqnum =3D psta->sta_xmitpriv.tx=
seq_tid[pattrib->priority];
> > >
> > >                             SetSeqNum(hdr, pattrib->seqnum);
> > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, =
u8 *hdr, struct pkt_attrib *pattr
> > >                                     if (SN_LESS(pattrib->seqnum, tx_s=
eq)) {
> > >                                             pattrib->ampdu_en =3D fal=
se;/* AGG BK */
> > >                                     } else if (SN_EQUAL(pattrib->seqn=
um, tx_seq)) {
> > > -                                           psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > > +                                           psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&4096u;
> >
> > This also looks odd, nothing is being "AND" here, it's an address value
> > being set (and an odd one at that, but that's another issue...)
>
> Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> the lack of spaces here threw me.

I want to add spaces for readability. But since the changes occurs on
the same line,
I am a bit confused about the best approach to take
Do I create a patchset, a patch for adding spaces, and a second for
changing from & to %?

Also, should be second patch be based on the file after the first
change I made, or it should be based on the original staging
tree file.

Thanks
Adekunle.
