Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194D813CFB6;
	Mon,  7 Apr 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032937; cv=none; b=nk2lVm4IYvkR/Bj753iseUFTjRad23J3mMKP9H2TkM1EgVDD3deoSGy5+pAqS0bELqvzO+kAqw0MLPDwRFyGyoEFEbLFQmdLy7GStYcosO+ZhFwYTIqRE/RW9vKNDWlzwygRicEBy86SkpY6sRGRL/sm+clBUfzqSZXd9RbaVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032937; c=relaxed/simple;
	bh=hhyi8dWBqv6pPdIGCmIyoJaKk9HO9jZt55vwjcMp1Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUAE2MtSFlmmUE36n4/HpRD03ePloExFMiampm6a1eDo2Sw8uEbYoAaG2ucwk2/3+wGdGaNzTV8No3trTTyjA1+brzH6Af0zdQ7uGl9dwnwJvpqkXnYYfYjdablp9Gif3lE3+t+EomH5WXKjgnFiqZKa1E/37gKdN0OJ9SoVkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeDyXnlc; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeDyXnlc"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso2368326e0c.3;
        Mon, 07 Apr 2025 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744032935; x=1744637735; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pcbyU8j4eRGFNcrO4PgjvviVz4tVY0EP239CQPVrZ4=;
        b=EeDyXnlc4KbtjGdjHF6HLeOJ6LyOPSvYubLAJXjTJa2EiToqWpg9qX7YQSgoaMsVmJ
         SdjAdTSh5gkzK+5o8B9fG58c1Af4KKlhHR1B/mE/Er1It+IsjY7k1gT3uqRSV2iWHpNm
         yD4ntyaGMJsy7UbcRtCat0Fy9bAf1RneRK0ksRi5LvauGDmAiQvcDuZVM5/0KIhi8uaQ
         QkXZQuzirbEJtOoiMrJWTSzd+Jp8Q6djioRf/KkDMvEV97JJBYwcy9GxEDowHqc+ukRN
         fO5jyzXytMjh7llFBS/1J6pdm4vev6oNmzYEkzb8SCAdPsfGGbb3fbdczAjP3aRvKG2f
         plkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032935; x=1744637735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pcbyU8j4eRGFNcrO4PgjvviVz4tVY0EP239CQPVrZ4=;
        b=Vcos/Sdr3Hto0I/QycdJQCEHg1m1q948tbDv+NbSgePStZnkkONri1PvaKqvP3Z8Er
         Tg1xl3vCX3HVW3t/8kB1c7yIrDG6kJ42zDk+lZuIwlWiH+byl2odOalJn7ey0OGdzgvs
         uQeJAKXQj/XME+T3Ly+q39kd5ftJXiNb/cf+weWyIrY4SetkqeC1sMzg1Dq2R2WThaih
         ZiHx6I2tAvbW2waj5BgxD+pRGpYjErATaMgBmnmq6AiAmYc5FsWqhjT8VaS0EpGVmoQY
         XN6XbUJUkkQ7AwQ9kkNd3L0gzuFS6WcjIiXoYS9yT5jc4mZCr0q+WWqomIR6K+LpCk/h
         2++w==
X-Forwarded-Encrypted: i=1; AJvYcCXGReWs6VfZNbfuy5vGYW15pwnmw1QuFV/9BmgORyQeWvd7rsy+BD4d4xckCQnw8R1wV/USTbFQsxwg@lists.linux.dev, AJvYcCXLMaDET3rfZ7TsJpQE4DBYoOBtW3CjIvtSmjSwgKGtMq4bWzpcDVJALufrSkOeEfDUtVwGGUlrO+XcWqwc@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1iaYqS02zNRzsYV8iirntGSMez+BKltYBkbVVtMD3v9cCRx4n
	Mnk4jHSNkOvLmQP398XFeEVyWaEsMcGbWwtNHr+oUGlWPyZ7lRsThV6YwqQ6yQn+7TxxyGvv0J5
	dazTclEKqqMwO+JYgixkPI3XQYzw=
X-Gm-Gg: ASbGncu5ctcGJfslAfNJiLb2cloCoywHkVLmPMmrkaXC7x4ezK7VOnqvBx8JsiXD+46
	eozWT2RpXuLFgNiHyC2k/5tgNA+akH62shIBvPHuFVJ51MExwuBIh1Z7cMDax3eKIRgS5JKxeab
	6zfn5UdHCbgKreip2kBRyJBD/6
X-Google-Smtp-Source: AGHT+IH29f0G0JTTVZoLIcsz6rr3ElxV6ka40+6l1QyO+o3krK8zjFdkVXYvh730yTzUS+KkV1pK/ADCRg8rtzPcpNM=
X-Received: by 2002:a05:6122:16a6:b0:526:1ddd:8953 with SMTP id
 71dfb90a1353d-527642e498emr7332801e0c.0.1744032934864; Mon, 07 Apr 2025
 06:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/NxGilPLPy7KSQ3@ubuntu> <2025040757-clergyman-finalist-0c63@gregkh>
 <2025040752-unrefined-labored-8c8c@gregkh> <20250407132115.11ded3d9@pumpkin>
In-Reply-To: <20250407132115.11ded3d9@pumpkin>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 14:35:26 +0100
X-Gm-Features: ATxdqUHmcn-kk6OfgOoc7oRirxn5Jk9YZwKHHuVpQ2R0TwNOWKOe35UbDJ3aEF8
Message-ID: <CADYq+faDs-A6MB=JvfVi8jWznr3bLbT9n5HajKLZbd34+Z7Dog@mail.gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: David Laight <david.laight.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 1:21=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 7 Apr 2025 08:53:30 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> > > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wro=
te:
> > > > The sequence number is constrained to a range of [0, 4095], which
> > > > is a total of 4096 values. The bitmask operation using `0xfff` is
> > > > used to perform this wrap-around. While this is functionally correc=
t,
> > > > it obscures the intended semantic of a 4096-based wrap.
> > > >
> > > > Using a modulo operation with `4096u` makes the wrap-around logic
> > >
> > > <snip>
> > >
> > > > -                         psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 0xFFF;
> > > > +                         psta->sta_xmitpriv.txseq_tid[pattrib->pri=
ority] &=3D 4096u;
> > >
> > > I do not see a modulo operation here, only another & operation.
> > >
> > > >                           pattrib->seqnum =3D psta->sta_xmitpriv.tx=
seq_tid[pattrib->priority];
> > > >
> > > >                           SetSeqNum(hdr, pattrib->seqnum);
> > > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter=
, u8 *hdr, struct pkt_attrib *pattr
> > > >                                   if (SN_LESS(pattrib->seqnum, tx_s=
eq)) {
> > > >                                           pattrib->ampdu_en =3D fal=
se;/* AGG BK */
> > > >                                   } else if (SN_EQUAL(pattrib->seqn=
um, tx_seq)) {
> > > > -                                         psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > > > +                                         psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&4096u;
> > >
> > > This also looks odd, nothing is being "AND" here, it's an address val=
ue
> > > being set (and an odd one at that, but that's another issue...)
> >
> > Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> > the lack of spaces here threw me.
>
> It is still wrong '& 0xfff' =3D> '% 4096u'.
> But it is all rather pointless especially if you can't test it.
>
> Plausibly more useful would be to find ALL of the uses of 0xfff/4096 (I s=
uspect
> there is an array lurking somewhere) and change them to use the same cons=
tant.
> But you need to be able to test the changes - or at least discover that
> they make absolutely no difference to the generated object code.

Yes, thank you for this, David.

I will compare the generated object files for both cases and compare
them to make sure there is no difference.

Then, to check for other cases in the codebase, a semantic patch will
be useful, so I will write one to search for
such cases and change them to use the constant.

Thank you very much

Adekunle
