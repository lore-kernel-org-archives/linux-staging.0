Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A482253A7
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529167; cv=none; b=OPrOdjQ5lF0IHioMcyFERcY9vQxDQTDtrlm/AbF+N0POjCgeU0KBnxuZ9qhCkuA6jjFq7zi8/YNvqpGFu+f/LvOcemHIG/FYukG+A+6+2leYIkKCGIWxtPVToOD0V4Opn8sdrJ529jUaE4KK8SC7fMXlH8XUD5rkigkMgUrQ+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529167; c=relaxed/simple;
	bh=m6TGmVdROEh+kbr9yjIZqVE6jmbuJqMSbTa5zUKTw6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvzFx4g0zat7bW733rB2a4HxdrtVSbeJ8dVUQoXqTICIUGMeFabOLHtmz2CzNakBLQ/sC2VJhy3cgDCsqTlS4SYStT9NTsmG6yCP+eHY2h0fuYn8csr9TuGSoDC9FPDDtSgwkq9vJAvMEXcNKxjuPPOZZTsf0S3ie+fHCgPen0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPxMfmKO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPxMfmKO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so938383466b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 14:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752529164; x=1753133964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6TGmVdROEh+kbr9yjIZqVE6jmbuJqMSbTa5zUKTw6E=;
        b=EPxMfmKOOsPOPqkhpMzKIM/YkbySl6NgpS6P9y+ajaOVpflgYmcp9Hppd+Y6mqZBFs
         yak4c6FlvipUnQAZauOq4LofidasXRfwm4X1HL3K7tImQg9j/TFrhM92GZmsxUFxeyXV
         gKi3i/HOaybqHc83+0hfu/Ty+hM2npHrtwzM8Cgwvq9tGUtNH3GrFeh6HDMg1buMi6QJ
         05WLShaidHHjpYiupnEDJlBu5BG717nlcFqh9DJuIboFHzXyfMa+nK/0Nt+wvxKZUS6G
         g5nidele56lj/mPKNTXQX2cQIqpN0uQgCK5Ol7qaPsaGtKK1M/zd2m5YGq1yy/7ZL53Q
         sxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529164; x=1753133964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6TGmVdROEh+kbr9yjIZqVE6jmbuJqMSbTa5zUKTw6E=;
        b=j6zyaaRxJ11irTnAhp03nZJ7DhUo4UzJX0MSEL23Ey4eJOwvCh16b8WSmbDSTvHQ5M
         PJs1ylTgd3HcWNwNilciMRmvsjmvt8UOoEY99X48OWhyviycxI8W3dkdNXtfKPpv7DYQ
         cvu/pUSS+9VextpTwaDteiyNrGph/73EepKQWs4MVerBJJ53ZIw7F74esCkMzPw9l7ir
         Rr2GCbIglNRLdBRIPrpmHsxWDFP3eq5mGMYE6CWy7Hjq9k+omEIv2gsC1A8WRX7xfaO5
         jhASQ+5mjBnvC5IOR//4f/NFcc5Csp3ZQeON5zqgLh4phKnueMT2GPY83AEcOt7gdS6q
         MR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuSw7Y+L1lHXMb3sbaO6peyC+mBslTq/Pop7p3RDKBXX1Cb3zJl9JiOAFsJTQhARgZtnJJOoYRtXkyvEKp@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc5SBzsBkF41yVVmh2sMWJ7hritYodCF1OAYeirCpuM3jDtNq8
	44FpULfY3rc5pZoNJq0Yf6bsXAiAZmFZrd0zqCEetghJtJhznENAPbNoGtdVSjaWCAbJmUPo/md
	C90fDB0kaY+LwXSyKkw8jE8aJC0S03eM=
X-Gm-Gg: ASbGncuT3Ec5enzWmjZtzWWq1l/W1F/rlX2R+kV/YFGyZle5UJbs8mRqRd6fJ9ZOwyb
	IaWSw6uRgj4/va2R5mWAwKTsSHVIECCY1fBILyXmriWj7FEOpndo77cP4DAKQU32YFreek+Z1sQ
	wUmPdggBF/pQmVQ0iCXrMH1x5mlG+mUe7c8rXOKnZiSA24BEuRXwy7dWljqi/Er31nAQNB1LL1E
	Za582Y=
X-Google-Smtp-Source: AGHT+IGqzqAHU3cihRnjsSirtSa0RUPFO/bTodaNwIqpvJJ4wBL31wC4fLkgA29xwEsophl7ajbmtbgb0wMGxRzw7Pc=
X-Received: by 2002:a17:907:1c1f:b0:ae3:75e5:ff7a with SMTP id
 a640c23a62f3a-ae6fbc8a3dbmr1549421766b.19.1752529163641; Mon, 14 Jul 2025
 14:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc>
In-Reply-To: <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 00:38:47 +0300
X-Gm-Features: Ac12FXxzi44zF7DDDz-kYM9sXM188FyUQbg6w51QqTLshWgcl2V0XFPc0QnHSaA
Message-ID: <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@weidenau=
er.cc> wrote:
> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gmail.com=
> wrote:

> >Guys, please, coordinate and issue only one (or a few) patch(es) per
> >an issue. No need to send zillions patches for the same problem
> >file-by-file.

> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@weiden=
auer.cc> wrote:
> >>
> >> Fix checkpatch error "ERROR: that open brace { should be on the previo=
us line"
> >> in ia_css_dvs.host.c:277.

> I deeply apologize, however this was the instruction of our workshop in D=
ebConf by Helen Koike <koike@igalia.com>

This may be okay for the driver that consists of let's say less than
10 files, AtomISP consists of dozens of files in several (nested)
folders. It's not a good example for such an approach.

> Here is the link to the exact workshop:
> <https://debconf25.debconf.org/talks/55-submit-your-first-contribution-to=
-the-linux-kernel/>

Hmm... this really needs an update to explain how to work with the
drivers that contain many files and literally tens of thousands lines
of code.

In any case the problem with your contribution is not the code, the
absence of coordination and possibility to clash with somebody else.
Also it looks like a DDoS attack against maintainers capacity. The
smaller patches are and the more of them --- the less the usefulness
of all this activity as at some point that floods the maintainer's
mailbox.

TL:DR; (always) Use common sense!


--=20
With Best Regards,
Andy Shevchenko
