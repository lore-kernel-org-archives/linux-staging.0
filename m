Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915AA38FA3
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 19:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771097040; cv=pass; b=X9u6YfhgylxzhXOW3WZztG5cpcBEnm8ImmozbQiKbUWleash+paW/oKS5iXBWxSVZWnp7JzR6g+UOYmNcmgj+XhnnTZPvThG759BDDSPmC6jDW8xKeXsczKHFUNMFl46XALY045RFKKp5jPd059Hya+aCsSlKh08luLEwatpe6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771097040; c=relaxed/simple;
	bh=MCJ5gtt4Ty5zM2qV1SEYQeU8wH0kKVRnsQWVltEUHCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrKxo8yu+wsLws+G/BJ+EEm+a66MZY1eeFkQpih0fVHIbCxeq8PCfEujMQxXNSdp2P1oL19fMyMG6G2j7AlqIbwc/YW1hrWnz8Zkpv2Tih4HF3UlBjxWzEfF0hjalRn+ipJ/8GkuNBAtsO0hqWHjGaEzyNlxGBMlXDLbb8+Sc7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPFuhPn+; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPFuhPn+"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b740872a01so3989948eec.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 11:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771097039; cv=none;
        d=google.com; s=arc-20240605;
        b=Tc2sWrlsDmRBiXydOEckBRJgjFwg3fdfZn4jQxzBmPc1uulYBlyFU2j8/Qs4sorgu2
         9zpEZMBJpJSy52UGk0Hu42zQAuT65L3WUBU5j3RkiYZvpF+WLOl6BPil9o9bu2X3p6S1
         rXG9SedS9zph6O1Op5O0AB/qvSpMm0O6FId7Hl/uR+7RUXHIIAQYQAGGuhnLorR8GJok
         Ls3ThSc1dj1gvP/N2yVdXLFpCtPCRta8RrXsjWiMQzSEoLTJ9+lFJCNqdCuJfaJe6XLJ
         29L68nib4PkbaxLvAY9moq4/DHo58qLiO841rXAAKzxedojbb4so0GFYjWKMMr/WBFYh
         8uNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrwiU21woGv/WJepSUU1ixMD3ScNsEwhtrDRoQ6fLIg=;
        fh=TZrmHiXzwsNBGR7hYrBd6xwpGWDuEjYofB3vS2pqeZs=;
        b=gByq9lwBFP+B5shYfy6nzC8Tz/s3Xf1fYMLRkFhHgbL/JoxDHDSDp2dNgPAhlhlf8B
         UjL91WtHGzTK2CHINV5YWZ+mxQsDs9ffx4yEcq+oTsM4MU3AAwPfeiUlsXtpreYC7ooE
         5uENkx+4K/ooaUPW/NsG7u0fCjycBlOGq1I/5nEfbFcZPnkoGSfoFL8uIZorNLUUSi15
         XKMdClrM8n4OnfWpwEwsWrJiYGJInLJXYCLW9mdmpfOxFELl/4r/ztDyVnqHJkVOadhD
         w1LPCBdFmKJVMDrFJhkFPaBSFOm1v6W+s4dDXrQOEFNAYyugh4aUmjvAhhvVGOjPPDqQ
         mSoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771097039; x=1771701839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrwiU21woGv/WJepSUU1ixMD3ScNsEwhtrDRoQ6fLIg=;
        b=TPFuhPn+LZBGHS9xwV9KHqx871X7Ns+c/TxcF9Hj6uQv4oXDKssD7VpyM2aNdroEHs
         H9GtsIj91gzI1aIu1TmsueYeldQo55q/NmYXc4pF+/Mi+FfGhOg9FMc/dRQakmYhKK4X
         h9rIRgBL09mLHo2IBgXmlY1DSqFQR4AXQLhid7TqaC3heHqsrdZhV7DpXBjxS/4nmJwd
         +7wT6Whuh3hLKt+ICBwnUOBeSxoqrN+SYoDECo6FXwLuHNo1ylZSBcHgMNOnUWj82dUo
         RtGD6E453Pm7Ulz+rabUyz02dfnfEcyQdXjJxDjfhGg+ckgAIAldxUy35s5mnxYQ876t
         DjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771097039; x=1771701839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CrwiU21woGv/WJepSUU1ixMD3ScNsEwhtrDRoQ6fLIg=;
        b=ao4gTu5Xx4JX6XW8+LUIT4EndPziphshxT3cy4IzfLZcuD9sPW479l0+rvNNhMVlnF
         UgPVYe4OnxfBYZJJsSCk2TU0bBaieayr+1ztAc2ORuUyhOO4+OKrmD1dB3c24qgxnUNb
         lV7/TUSrksUGWWx1Mo/3DnnRqLgSEGrFnXBdZs65Co/Uas0J7+psHYn6gnI/kS9QFmoC
         N1Vm/kk8yCq21UbChZWUmXqjRFUGAi1n9NLwHe6cl4W7JQ2k6F4INkv7jV8acJz7bcOv
         qPIzzvun1kODTYaBKs74z/cDQ3/OdHokBRcAQWZAec3FST2qhcGw4SvrOj6f1khQrSSt
         HIkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZqZNgT9BK4/1/iaoK6t+eVUI9cjEsGCUVN7LEz0wVMdEGs89lRwGAjPje703C21+ItI01jr2HOswyKDrW@lists.linux.dev
X-Gm-Message-State: AOJu0YwbBvExvADcfwxfCVk+9FnxYkRPyTy519aKbE9qI/GzAcvLvSDh
	ypr179Jw1vqWx3cpVPpxexLuIYlEXT1nDfBHw5TuzE/0/2zzoWv6moQO9ZxI/TL4RMdq6qge1Cd
	N2oqL/qcWrngprXdBmVUdiC7zyh+oTWI=
X-Gm-Gg: AZuq6aIs7w4lQ/J6fZUAyeMvGqL1RqsXfysEdxBYMs0YAoNujSo5krwORcldLpMlU5c
	WsLEMByTw8cSXc5+69DO3vDf/RNgH9jYEebAezifh589lXiCRaofyvDU41+2FOCmkWXzN1f85qi
	L3pg1PNK0PtAKPhw4hieoQYrD+BTntPqhVUJPErFBVarFmXfr2iKU1+4dy/3HNcEFoSKdKVbsAm
	Uj+Sy7aXx3FsPkJbxxVih1R9lii7wL9bH2wVHSeXH/XLDdPEyMjXC56rvR9G136+wrGYjGuM8SJ
	32O5EPoseQnnX+Mum+gjwAmQ/33oZL1UPkYFiMwNWUcFJpKfDmS/NFaJpjis/84=
X-Received: by 2002:a05:7300:e10f:b0:2ba:a661:8512 with SMTP id
 5a478bee46e88-2babc3dbc17mr2293199eec.17.1771097038605; Sat, 14 Feb 2026
 11:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214173139.49094-1-ofekalm100@gmail.com> <DGEVYFG99X27.1U7FPTF3YE7V6@gmail.com>
 <aZC95PE36l0k5TOl@smile.fi.intel.com>
In-Reply-To: <aZC95PE36l0k5TOl@smile.fi.intel.com>
From: Ofek Almog <ofekalm100@gmail.com>
Date: Sat, 14 Feb 2026 21:23:45 +0200
X-Gm-Features: AaiRm50v8ZyrAXz9BK_DzIoQpY_ixMd6xwUK_4uLpVrfnSfOLxQNTUhvtqTReJ4
Message-ID: <CAKXVhcLWrTq3vLyoyL7r_J-+3q1SZUtmaVYsC-ZHvYPUas36Lg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	s9430939@naver.com, architanant5@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resending as plain text, apologies if you received a previous HTML version=
)

Hi Andy, Ethan,

Thank you both for the review.

Regarding the fsleep() suggestion - understood, that clearly seems
like the right helper to use here.

Regarding the completion mechanism logic - I completely agree that the
current infinite loop polling is fragile. However, as this is my very
first contribution and I do not have the hardware to verify logic
changes, I am hesitant to refactor the synchronization mechanism
blindly.

Would you prefer I send a v2 that strictly switches to fsleep() as an
incremental improvement over msleep(), or should I drop this patch
altogether until someone with the hardware can refactor the logic
properly?

Best regards,
Ofek

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=A9=D7=91=D7=AA, 14 =D7=91=
=D7=A4=D7=91=D7=A8=D7=B3 2026 =D7=91-20:24 =D7=9E=D7=90=D7=AA =E2=80=AAAndy=
 Shevchenko=E2=80=AC=E2=80=8F
<=E2=80=AAandriy.shevchenko@intel.com=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> On Sat, Feb 14, 2026 at 12:11:16PM -0600, Ethan Tidmore wrote:
> > On Sat Feb 14, 2026 at 11:31 AM CST, Ofek Almog wrote:
> > > This patch replaces msleep(10) with usleep_range(10000, 11000) to pro=
vide
> > > more precise delay handling while allowing the timer subsystem to coa=
lesce
> > > timers efficiently.
>
> ...
>
> > >     while (pevtpriv->c2h_wk_alive)
> > > -           msleep(10);
> > > +           usleep_range(10000, 11000);
>
> The whole approach here seems to be fragile. It should rather use complet=
ion
> mechanism instead of infinite loop.
>
> > >     while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
> > >             void *c2h =3D rtw_cbuf_pop(pevtpriv->c2h_queue);
> >
> > Shouldn't we be using fsleep() now instead of replacing msleep() with
> > usleep_range() when the time is sub 20ms?
> >
> > I feel like I read Andy Shevchenko mention this elsewhere.
>
> Yep.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
