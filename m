Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AC25B30E
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353473; cv=none; b=ARIHg1VXvcyJiFzxDCQfh9TVw7YeoEfoNdwnsjfYfjbq1hjLxKkYvs+3DGY1XkRIAxI4AJOaoR32skdy/ceMP+fsDhNQ57L3/Np+s2aK027fmTu2E1Fg//9qHXjy6PA9VmIbw5Hpt+08U3lTiJzq30td7HMLvuLCVkKpZP841WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353473; c=relaxed/simple;
	bh=UagSGBSZzp2xfhzIQ1+gXUlqJxjsVWQev43Alxz480Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keMdLqbK/P2u2rG+SHPb4l32pFSQbGWP7vO00KvbsvZP/H324sloGoJiPw6Br2aucbwtBC2QxpPLeZ4tEz2Q5BULipxql4OBRoT4+LSrJpPdy0XMCeKPnBTU2NdXT4rKlRy9TCiy28B+CusUn/iAmLFdVCdBaeKoqsejtvQHE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7WnwLcA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7WnwLcA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso5857459a12.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751353468; x=1751958268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtkdV26JdyrvlELIn9L73S5AOvwqd52zjPqfmNSwWoE=;
        b=J7WnwLcASht7sgdlRnKXAwFSkqTpq+QniPCIOauDT/axoPt/vLu5AE0ENCsDC7j5jg
         lbGAvOPMWgWjyjPDU+yR4mehJMEF+5i+/JhkIBSPe+gViYKS+4Ft21avVdoI7h0sWBBR
         0Q1O65sxCLtTzOboaNZEN3aj1JkeAxZkCEA80fwpfXhAwcX0zosdAHNDbtHSB11V2Czt
         JbKQ7fHxpR+/srC8C6ThOuUgUJbrTJZiyi+9ZrxzRlKNwoFS21lyhLDN/YSCdgDS2Bd6
         tSNE7Ka1iaYTwiR8T1jIol5xxA6HtPdKPcbepQRFZWL3dbjrd63yVbFVEh7ct/+zaPSY
         kstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353468; x=1751958268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtkdV26JdyrvlELIn9L73S5AOvwqd52zjPqfmNSwWoE=;
        b=WKA1NvSwMFXHhlYv/qqZEC2gUDsYZgOzqfxiMTqhRYmmLfqHUG7uDd7rDd3A9Ti+v4
         H4/5jj55AD2PSWPDyJADAyfbY4x+6e54K9+0X7GJNzMWGzp34tHlEaww4J8BA84cvJ+I
         IXBS0mOBzPjUKB0yD31C9coxj9Iri2LtuBWSl3NymanCucKIzfBDZE2S2JLOd8E3tUvb
         HblAUVcENR58gQztLkI2I3aVeuJ7STcuvF6x0ADeZPjtGcdNyQvRkgGvEBLcQqRVZ58o
         EAEEZzU5H7BCybECDVeb7ZfN9+yfr7AQnW2JhFEAxXPJJxZWgiwQxD/v9dISRO/x3QEE
         O2zg==
X-Forwarded-Encrypted: i=1; AJvYcCVEgY6VSHmrt+Pg7lS6Rd8CSvxq1pmEsIGpTPx6vuaxNbyybzJrpV9Ph1/k1trhhVVry4shXSuFJ9iH74eQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwDphfK8vv1+KNigwOUNdS4WFs8Wqptb2TbtKhqP7D7DbhB+UCP
	MRUf7yZk+RkxnJtpAsjSewei1Zn+hApfya0ZTHKvbt8CTHgkngBkLwfyfmNT1U+jqtwNOSrb9KO
	jZjYZIJ+mZW5oFBfwyBJGNcxin+8dWiU=
X-Gm-Gg: ASbGncvPyOB7kiJcKKaPjbwqFVekU9lZk6cFFHUd9gmMP1wsWb2/hY2ZcZTQhX2Gr1G
	LEtReaFBHpCWr6Q0zeYU6y+AWeknLrw87tcobFuio4uha471Ep22GsA2PYBfe9xQa2Ag1QJmOQ4
	kuIMIINCg8alE3wQcG7oi1HNNk7eO6NfyJjCrcgwgItx4=
X-Google-Smtp-Source: AGHT+IF2+HM0p/+sceoU1c+3whqC05j4HvPLfZJnfenCjgGoYh8hMBXpjTFpo+2kGoTr2+M5pONrn+2q4hzQNoObX48=
X-Received: by 2002:a17:906:794e:b0:ae0:34d4:28a5 with SMTP id
 a640c23a62f3a-ae34fb3adbbmr1606500866b.0.1751353467351; Tue, 01 Jul 2025
 00:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1751207100.git.abdun.nihaal@gmail.com> <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh> <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
 <2025070128-amplifier-hyphen-cb09@gregkh>
In-Reply-To: <2025070128-amplifier-hyphen-cb09@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 10:03:50 +0300
X-Gm-Features: Ac12FXxldltjux8AFKky_4Qin2Xh3bgbPQD68haJQAgS5edrcwzBqWRO4khaIHc
Message-ID: <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org, dan.carpenter@linaro.org, 
	lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
	willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 8:14=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> On Tue, Jul 01, 2025 at 12:47:22AM +0530, Abdun Nihaal wrote:
> > On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> > > This patch does not apply to my tree, can you rebase and resend?
> >
> > I think you have added both the V1 patch and this current V3 patchset t=
o
> > your tree, that's why this patch does not apply.
> >
> > Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtf=
t_framebuffer_alloc()")
> > on staging-testing is an older version of this patchset, and so it has =
to be dropped.
>
> I can't "drop" patches as my tree can not be rebased.  Can you send a
> fix-up patch instead, OR a revert?

I think the cleaner solution will be revert and v3 patches together as
v4. Abdun, can you do that?


--=20
With Best Regards,
Andy Shevchenko
