Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471DEED8;
	Sat,  5 Apr 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863022; cv=none; b=pPhKoF2G/07saBnYTsBPNpCdR7+vI9GC4nOBYFy3AQew1BGi6Bmn7NmNy8STPTqmBu/ktSuF4/47p5q3yaocdRczfe8GPjp/hyWpmPKKkXWlmBCw3C6mSK1qLtcwmDEQoLzEkDETyqmEPcN+37QkVJED81VZ1u6XvcQCwTL9I88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863022; c=relaxed/simple;
	bh=Fb6nWConfM+SUWjQ8BRZyfSFDinOwn/Nox294oZsV6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUtFt2BAVTPpkXltQanr3jfpXMMRhAgPB/H0I+B+s6LGI9UpolVETP0K9cAYUutbaBPwcg1wnoa4q3K93T+xzoqg4YUqPgc3TgnNkOQvPRPm0C69+K0xZmGGo/5wb09W60usddvEO9F7+qAizBLyU2mzTgWxeyh6ro5QQHYJ/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tgwe5sbR; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tgwe5sbR"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-524168b16d3so2717991e0c.0;
        Sat, 05 Apr 2025 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743863020; x=1744467820; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p/4bsPFAwsntA6dFF/zQ5mVNq7asuGZ7eLM61oyzaQ=;
        b=Tgwe5sbRdySINTbrfllphqOEJgeArqA/Q9cBWXJlokv3kYToLAoLTosTFUFJ8e1bOu
         eg02ZOjobqudxvgW+/wufuLtQ2MrVVIRNr+ppBuTPPL9hXlKRMsmOeGtIep3v16tOaDm
         3YC1rXz3FnE4pbsZfPfq3J4Zno4w0K/drymF3LP6/ROp3yWLtqNIrEbqjRlmym0i788l
         3zwvcE2t9Z6zDmY9fQqU86Ud1t06ri811iV9kvjvykuwJGSA9sZcB3pP9FeMwGiuNvRm
         rfE/yBrIlU327y0rMTB13G+WaYW9cMXa2ej620YY+USfft6PJQwnwkMCQUO/aZdWbdI9
         i8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863020; x=1744467820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p/4bsPFAwsntA6dFF/zQ5mVNq7asuGZ7eLM61oyzaQ=;
        b=JErQi94DQIm3REIwLBBQ23M7jfI89fjnRLQFX8wmoLGEbSD06lHD7u8hlLkOmVL1gL
         wRDf4KEOxYzCTa0C39vwdVjoDUFCThn7Ttd03tT/pI+eFh2D8BZj5HN06zqZppyLKSs4
         1NFOTj8mB7DNN2lHovmQK7pjzJxL3ueUBmcuYqVJxLkT4fE0QUAgOsQ1ryHGn0ZDnZKJ
         22T1mXwoIeXs2G1/8gO9bhPuCMBsLSakHOch0sHplwbtQLI7Efpft9cnKeDshdK3KCGm
         c7AXPRPuVEn3DKhw6zerowLoPeQP65Z/h3voxPPgYgew/9Bj4OYzAls4MQLKuM1uGla+
         dLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTQkkEpzplK2dufCCYJ87uuUv3iMLYAKfRrq13JnK9BH8HVm96JL3aFmEj52o1gzB1gCCHEpmGYZJhd/25@lists.linux.dev, AJvYcCX9lEZ+tpQsmbzhrt6Jzfj2+Ef7tIcAzuTnGdRVFzcgxvA6IAtZwUP8sbd5ZKVpgGbKqbwendEFJ47l@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnf0VHNzzm5jETDfVpAmRv+iItYah9Q9l7ifmYAMF7EehwJqL/
	mEjjK3DRMDKTn3zFitJRb/iVGviF3/yIHdQtjZ6SHU5pUDJG9eK26GzXDd0iXQ2VHL+69+xb2ZD
	al/861e1C/Q/0n54BoauBVrzlHnA=
X-Gm-Gg: ASbGncuGPtEMpbii7rIW777YU4DzP3HCy8icnua3RkVz59rJgpuIPF5F5qufmYfHpkV
	IeZIKJw/sw1cuzp9bXSZXsRNnIlZI84sa1Ejxg92JffClnyCDf+o53Wh6Zkg54Pp3PuFo3yi/KD
	nmqptIkNDxbL82arGdhM2PPOqvKi86
X-Google-Smtp-Source: AGHT+IHFtRTL3RqrMIPJ8vf/tHEaDt1ARljHgx7WlPToBdwqJ724tsN+pZxlRaKfRKWlCe/z7fwyCcOgbtVY3pZp2Rk=
X-Received: by 2002:a05:6122:168f:b0:520:5185:1c71 with SMTP id
 71dfb90a1353d-52765d2d188mr4284391e0c.7.1743863020171; Sat, 05 Apr 2025
 07:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com>
 <2025040538-breeze-espionage-dc6e@gregkh> <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
 <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
In-Reply-To: <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 15:23:30 +0100
X-Gm-Features: ATxdqUE8ROfu-fqiRiJp-D_rItN8bhudjw6IQvFtkopPWSBx-EbHPIFhi5qw-FY
Message-ID: <CADYq+faiOqMVsi6KDiR2GkYrU4FCqv7j0fo3fw_R=72=UL2oPQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Richard Akintola <princerichard17a@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 3:16=E2=80=AFPM Samuel Abraham
<abrahamadekunle50@gmail.com> wrote:
>
> On Sat, Apr 5, 2025 at 3:07=E2=80=AFPM Richard Akintola
> <princerichard17a@gmail.com> wrote:
> >
> > On Sat, Apr 5, 2025 at 2:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> >
> > > - This looks like a new version of a previously submitted patch, but =
you
> > >   did not list below the --- line any changes from the previous versi=
on.
> >
> > Please, how do I resolve this issue?
> >
> > Richard Akintola
>
> Hello Richard
>
> THis is the main message from the bot
>
> This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for what
>   needs to be done here to properly describe this.
>
> It basically means that if you made a change to a patch, you will have
> a new version.
> You will have to indicate the patch version and also what changed
>
> So lets say you have a first Patch then after review, or you edited
> the commit message
> or made a change in the code or something,
> you will now have a new patch which you will call v2.
>
> you will use git format-patch -o /tmp/ --subject-prefix=3D"PATCH v2" <com=
mit-ID>
>
> then when you want to send with mutt, immediately after the signed-off
> by line there are three dashes (---),
> You will then write what changes under these three dashes in the format
>
> signedoff-by: Richard
> ---
> Changes in v1:
>    - This is what changed in v1.
>
> I hope this helps
>
Also, you can go to the "Submitting a Patchset" section down the page
of the firstPatch
documentation for more information on versioning patchsets.

Adekunle
