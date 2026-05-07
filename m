Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A262DB780
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187914; cv=pass; b=iK6EVCwyAT+6BLKXRaloPJrVS+qxYgamhz90st8e9qrl182Dma1zUjO6EVzdPcBfIwEEXjcpJ9kvzgs+HYaqwRpVpmPzovY60nn5DVI2rJGHXZklLjo9dU+7ImIr1t/QwMjikClyD4LPDddVlhzzeYRascRu90IG9qR5Aob03go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187914; c=relaxed/simple;
	bh=jE+/jUqv7pNoCfzauPI8lFa2VQ2OKNCvpXHgcRT4LRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2q4ZMzrmxDhHwni0S6czd7nhMBDOCv5vnBi0alEQEu7E4qYYEHRd4etbP7PqKoUkAiOAjRFhYAaqy9uKOf7yGAStIN+EbRLqivG1dpEay8yU795QQERfwDbMuKNDhByaDdVhd7H2qGC6qzN5eiAIQGK4tT/hF+omE5H4s1Cozo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjpuMQkH; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjpuMQkH"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so768304fac.2
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 14:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778187912; cv=none;
        d=google.com; s=arc-20240605;
        b=ftEOsCcMC4XmuXdUiqJkBG1TQJXTEkNh4JZJni3vGUFFnoWcYOZV05ZP8uMrfdyyJY
         Goh5P70GLBOUsxX2L/3ndL4gI7irt+fuckVfmxp7YiVeogEdFmp0CHXeGXz3n0H+Cw5E
         4aAboSJ9E6hgywKeNpWBTS7GNW9xZ/M5fEge5Z4ffUBtBSwXX7Cx8y7nGBJf741G/ZqJ
         X3M1xo/2GjVv/VMxL0yotapAFmjCLx+58eWm3cji2DmhDSm/1dO8aAnrK2qX9sReSNZ0
         nJi52++f/FbZdZ8EzhDB7nbZc/8fepa2GMrf91d6VUaNPde9uNbWnWQqj+WeLSTKx793
         YVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        fh=oGNB4AYpNq1r6kO95sN5UnppxUikkcbv9mfzz85cWNI=;
        b=N0ikN1bv9tD8B467V2mZ0CSrNMSlWTODDcAcwFGu/9PPCLbufna4c74nM7MrGIxqRa
         UdEjP+KwKAt7jddUZednGeVruQNqcId+T13pvGUCdJeN6Po5ylZCHPwBk/ROvfXf+37/
         w7xf9qM+R5GleYteYUrmSDcOoTTd7fM9WuhJH36Px0icQZ/ccCloaG+MWwpyHBkE6md9
         TMRcdyt128A2LEKBeeSfcy1Bje5fuYm5KqHL/+Gs/01sR+BFTyaMVELgs0u4PgC4Ov5m
         e4qsT+mcobZCbRE6uSFGLVliehDZEyAq8+ZuVb6Rx4blSRcgh0lqHjwFHegsSZjHeRMQ
         7bog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778187912; x=1778792712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        b=CjpuMQkHm562bV22jxLh2T7U0h/vmk2I+ViEYat1NyhNSorQr5xfQTp3Xw3VX/dbKW
         k83EwoUeOIh5XSGd3SksP3eun9i69xG2yQphbhd2dnjzfNs7K2SaUpFLTySg7nNsiakQ
         /aj4U//ypCjdbM3h1PNu3Drgc7QhYt3x5MTw2Frv8Y7mHob8fhp51gsNoDjNZR9bx+RT
         jQeV3Jvt4kms9TZTeanCCBD81iX2kPr6fAAtgMwdAkTg2JMEoAMisGbEE+V/0sD58h/P
         OpwiiSZLYwzAyJdXKU3233w7RcuS7ML/l/TXBggBESJb8sLlC6gfSzTSTuY1CsVjNX7m
         UX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187912; x=1778792712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        b=QbRSPlNNMfkrvwruchr2AVGHKEbdsGQNzrFFH4vpl8QX8WZs9KI3/ve0vcX4HpBD5K
         93uqtiH3xSKQKFW2fwgWF/qrN4AhaZBj6O4Q6UImnIByHXuIs0R8iieg2Zpz4TwDh7se
         eMGYVsuGA1T8wIXjvXn1Z1oi2KEIVT2/3bO3snTW321wnvqfKbx8K4b3F3JlTdtbqduJ
         tAmKcNsvKbauqqhcJpiydX5D/kpdSRpPRSwqZtH3hDKb+hPg/jsjs7xhYncxw9JMoyME
         7UUMnRVR2RGrTUe0Mnr65LrtsHui2Rv7VoNPPwOkU5v9vdVXNQbocy9rfigCWzkBkE3W
         c4iA==
X-Forwarded-Encrypted: i=1; AFNElJ8qjazFbME1XXkafgz1WozNahCy6tYTRny+NJzs6wrJJcxzEYAHrgXUbAMyZ/6gp4FCwGN7zlGh8FzvVJBI@lists.linux.dev
X-Gm-Message-State: AOJu0YzMyrJw6RTh/26/TYNHw1Lhku1Mx2VWHZc3/9FKksXakUc18pcx
	lEGylwFTxdMMY+dvwB8nWy2PzLF3JEfylcrpzTFGDkFlmMnGZ41OckHxHs8pV/CxN8Z0HgNKLYH
	8t1682K4bPAtrIrZ+xXf2L9CXM05yDaI=
X-Gm-Gg: AeBDieu4ME1TDfl7c52Qt3GqWF6e7HtXm78imBIixlg4qWykQelmJ2RK8zXMp/5Ghi+
	R98Iaa1KnghDp4LrNPl0DSiSVeyVpIZ2a0bLtuQS5c5UbSwXRjUtQUFUPzHaPtMSIlbvZBSyKLV
	buP/xQj3Gj4/QWE1WYIWanFOVP1jZUPjoyeDzlZNPHa7O0XrjOBBdPmJTo7pzJwyMvJkj4r4exo
	rUre0eTm4ZW91eXN6X3pa3P3CdWVddyE5GgHXQrTuCqGrFRk3iCPCPoMlBIhj4fGpX8htbVmt5t
	50pz3V3mrFZtkxA0QJbdcxVsGCLry0jDtepQjQ==
X-Received: by 2002:a05:6870:9120:b0:40a:605b:518a with SMTP id
 586e51a60fabf-434f64f0e2bmr6401085fac.27.1778187911702; Thu, 07 May 2026
 14:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507022213.29290-1-dennylin0707@gmail.com>
 <20260507022213.29290-2-dennylin0707@gmail.com> <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
In-Reply-To: <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 7 May 2026 23:04:51 +0200
X-Gm-Features: AVHnY4Jo1IyTHyb9HmNlTOZ-S9HjOMOViUseCpdHPNPhWjhasIYCpZvP3cqqYK8
Message-ID: <CAPybu_1RvjRQ5ySkJum3AzTX9-bxmNmkcMMK7Q-Q14tZPSQHnQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
To: Denny Lin <dennylin0707@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com, 
	thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	digetx@gmail.com, hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denny

On Thu, May 7, 2026 at 6:06=E2=80=AFAM Denny Lin <dennylin0707@gmail.com> w=
rote:
>
> Hi,
>
> The media CI reports a missing Signed-off-by from Ricardo Ribalda,
> but this patch was submitted directly by me and has not been handled
> by any committer yet.
>
> I believe this is a false positive.

It is indeed a false positive. Sorry about that

Regards!
>
> Could you please confirm?
>
> Thanks,
> Hungyu
>
> On Wed, May 6, 2026 at 7:22=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com=
> wrote:
> >
> > tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> > signal an out-of-bounds index. This results in a large unsigned
> > value being returned, which may be interpreted as a valid fourcc.
> >
> > Returning 0 is not a valid fourcc either. This condition should
> > never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> > access and return a valid fallback format instead.
> >
> > Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> > Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driv=
er")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index f14cdc7b5211..456134a9e8cf 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_=
vi *vi,
> >  static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
> >                                           unsigned int index)
> >  {
> > -       if (index >=3D vi->soc->nformats)
> > -               return -EINVAL;
> > +       if (WARN_ON_ONCE(index >=3D vi->soc->nformats))
> > +               return vi->soc->video_formats[0].fourcc;
> >
> >         return vi->soc->video_formats[index].fourcc;
> >  }
> > --
> > 2.34.1
> >
>


--=20
Ricardo Ribalda
