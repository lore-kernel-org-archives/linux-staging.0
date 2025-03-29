Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A3A1C1AD4;
	Sat, 29 Mar 2025 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743260448; cv=none; b=KlY+67mAgz0klJfrqNORDAhwhsj77Lw4vg5XYl7KkEqkq2Z0pPLTdFQc52lUfnmBo9ZN/tO2+z2T1bFLuHQfmjhV0pUH7ehNPwdfv6DxnRUSfV9RDF+mG/OKThaDi/pweQfuiG2tbtdbL/GD/+7hkt2wCzp7tMJ9vGeeMD29hC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743260448; c=relaxed/simple;
	bh=LPUDW1NitMxYuVP92GrG3X0y6888glJ2eapTQi3wo2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzyBv0pIiiB/b5BPp3m4qfPSvrbLZPNyvoyvKq5AUxZnjQVkBiZGFnsIFbDFmhCD12dFUmrMhfaqzx/WAW1wRsdgJUNiLzN4oHzFOrMyRujqBH2/MkRFtE9j4wlPQ5UuANYO8N5L3e/J5bkmRunVwmmyUhfP7J968sUn86kpoQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG+SAIVV; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG+SAIVV"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-524168b16d3so2920367e0c.0;
        Sat, 29 Mar 2025 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743260446; x=1743865246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVWiBvhuoTVLqVnDfxxtfAWc9NBumPt6nM37fEg/cak=;
        b=UG+SAIVVUAwa0wjczS990+ptXvYcBwdB9LAcNLCVhj03Vam+sQE8ohHJvqGuE6Xisf
         4wD/9CGC3Z4Vk68fIoWDOsZEMIcGeQwEbrIB7KC0EYK862ijmD5Q8Uhu4hxgPl3+pLAl
         lfqkbD/ui+hDOvuqkv8XpYoFo4WaxWF8SwH+p4rMNghr+lMqxudCoV2VECcT8ZwhOfsF
         0XJGulJJ5+atfDtxVWNQ2g5RVhT6IPNworsAPpXZG8M81lZBIN/GwrNeQbOUUObE+pOa
         E9GpL2st6hl2QFMTX8xu+0Oov91PeKpjNo0+JJ6xs2VbEfjJUVSUj5tNXUNij8qrptuV
         f0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743260446; x=1743865246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVWiBvhuoTVLqVnDfxxtfAWc9NBumPt6nM37fEg/cak=;
        b=IVAmGHfUW4xkDOA/oWae4sIpCfTQFX9Xpo6VdXRyF+9UkE5pgFTwzJQaP97H94tZgf
         yo2klm9aVxeKwtNxaqIOq6LBqbUVGfxv7L5hdjY0MjlDZB/HdCRNvYZXop43utiBcMwy
         7+Zp1rQ0p1JkIxcAql8qHP4IBmZzceZPswikr8qEQ/5LaQXNguX6X86F7oDlEFPtF6uw
         ysP+ZG0ZkXjZOvDEz1uLiCml1d4LO+Uez3q/SIoxMsYChr+Y8J9jJrNZgeiAaFWPty9N
         O+CkfG+SnftGjRnhRukm9H2DWq7ehAoJnRQV+g6r3z0LlwM2PHjnYU6fafvWnyLCS7rK
         5gjg==
X-Forwarded-Encrypted: i=1; AJvYcCUGoiyeS8i8z+UEuwuF9v/mwmOgFlVilSN9dYD0nRZbJR4Tiri/kVoWpdjz2/tqqVPy2QkCgM6T1UIszW7l@lists.linux.dev
X-Gm-Message-State: AOJu0YzY5L2Lj0c2oPFtGy/9j2MUMoQD2cm3NqC50m6OtV3/udPW9xZv
	vPVe9siSlTZXDzzbQdLMg14S3mWL9oqeEvTRlqX2p+4kqEM3bTsTxfX/zo6emo+EfyezzLjBAe5
	UjFarg0fBDVzBBwcEIWkVvgHQ4No=
X-Gm-Gg: ASbGncv0jlYfazdPMKEz5ZS7iThJcnS0wUXskyNryxSiy5ldHwTv/3ckE+0b5Oc3Sgs
	k2dDg/CQbkhBVigUgcfSZzRft9rGyOdZO8GhZiZ6WwEXixBZnqrzimg6nT64Bu73kCykV+MUvfC
	XZxiampDBb5CpPsK/gm4ov/61ojSYW6LkJci8cbzs=
X-Google-Smtp-Source: AGHT+IH+vIYJLLuNaNFniFoKfrQtjatMA140NtsHVh56zcNetzxXAmW0iEvEZ/zfMtsEgQpD2gnONlKxRj9lB199+Xk=
X-Received: by 2002:a05:6122:50b:b0:520:60c2:3f3 with SMTP id
 71dfb90a1353d-5261d37b81cmr2530519e0c.4.1743260445675; Sat, 29 Mar 2025
 08:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z+fTJRBOZ+66zmsh@HP-650> <alpine.DEB.2.22.394.2503291210090.58211@hadrien>
 <CADYq+fYizY_eRozZkKYzsD00biQMTGfhOcuqiQ0RzXApXiAF6A@mail.gmail.com> <alpine.DEB.2.22.394.2503291515080.58211@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2503291515080.58211@hadrien>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 29 Mar 2025 16:00:37 +0100
X-Gm-Features: AQ5f1JrWNvI7HzmWL6gB8B5xmxwM8piXqgz5DZzpwIA1lXotNWu_fEdENmY9USg
Message-ID: <CADYq+fagp5TdrGL0ozd_=XE-nKQBeo2QVCX3DfAMN=LFxRBxZA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary type encoding in
 variable names
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 3:20=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Sat, 29 Mar 2025, Samuel Abraham wrote:
>
> > On Sat, Mar 29, 2025 at 12:13=E2=80=AFPM Julia Lawall <julia.lawall@inr=
ia.fr> wrote:
> > >
> > >
> > >
> > > On Sat, 29 Mar 2025, Abraham Samuel Adekunle wrote:
> > >
> > > > type encoding in variable names are not a standard in Linux kernel =
coding
> > > > style.
> > > >
> > > > Remove redundant type prefixes (e.g, `b`, `p`) in variable names,
> > > > as explicit type encoding is not necessary in Linux kernel code whi=
ch
> > > > uses type definitions rather than variable name prefixes
> > >
> > > You seem to have also gotten rid of capitalization.
> >
> > Hello Julia, thank you for your review
> > Yes, I should have added that to my commit message. Thank you.
> >
> > > It's also not clear how you have chosen which variables to update.  M=
ostly
> > > it seems to be pDM_Odm, but there is also pRFCalibrateInfo in some
> > > comments.  But you haven't updated eg bMaskDWord.
> >
> > I chose to update the boolean and pointer variables which have been
> > declared in the source files
> > I was working on. pDM_Odm, declared in the source file, is a pointer
> > of type struct dm_odm_t,
> > which has been declared in a header file, so altering the pointer name
> > would have no compiler errors since
> > it is declared in the source file I modified.
> > Some function prototypes have been declared in header files, so
> > altering their names in their definition in the files
> > I was editing would result in compiler errors too if the headers were
> > not modified.
> > I could have modified the variables in those header files too in
> > drivers/staging/rtl8723bs/include
> > but I was not sure how many files would be affected by the change and
> > how long my patch would be,
> > considering the three files I modified already made my patch over 3000
> > lines long.
> >
> > RFCalibrateInfo(without the p) is a pointer that is a member of the
> > struct dm_odm_t, which has been
> > declared in the header file, so altering that in the source file would
> > result in compiler errors too, since the header file
> >  was not modified in drivers/staging/rtl8723bs/include/
> > >
> > > I don't know what the r represents in rOFDM0_XATxIQImbalance.
> >
> > The bMaskWord is a macro defined in the
> > drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
> > as `#define bMaskDWord 0xffffffff and also rOFDM0_XATxIQImbalance is a
> > macro defined as
> > `#define rOFDM0_XATxIQImbalance 0xc80` in the header file; these two
> > values are not boolean values and are
> > also declared in the header, so altering them in the source files will
> > result in compiler errors
> >
> > However, other Boolean variables declared in the source files were modi=
fied.
>
> OK.  It shows how confusing the code is.  Normally in the Linux kernel
> things defined with #define are fully capitalized, unless they refer to
> some name from a hardware spec.
>
> I'm a little surprised that there isn't some generic macro defined as
> 0xffffffff in the Linux kernel, but indeed I don't see one, and I see lot=
s
> of masks being defined as that.
>
> julia
>
Yes.
Should I make any modifications to the patch?

Adekunle
