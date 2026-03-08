Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C40D16FF37
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773011915; cv=pass; b=BgwYsuSVukT+U3lt9IJSGsow3fyBs7DusaSCXGUjkt2GUuVmnsipR4EGSSYehn1mSKnxOmvMWl4QYkwjLk7Wprr/Xkdq+ziBB4xNF4uWVzOyl0CUlIOQ2oO3UpCrtzwVJ8rSXmgiwMmENpKWmjKGj9XLHAg2FvuwYcvujxcDpTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773011915; c=relaxed/simple;
	bh=5Z2KSyJ/QFZ0lsOHEdjn3KSNPTbNcENaH8pqymvmgRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtZN+HaG5vXNOyGWBeE+U//pXAAB4AxjdXOIWrsWCj7NqkjfJ5GaHnq3YopRGgxgF3K+x6p6mqVzT8U5L8ueDQg5CxqEcp42ZTkyX+XHWXATE2c4iIxInTSq6eF9uwJqgHjILq72E5n0ssDaY8ne3phSWiNS6XpYwkchfu8ZmF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItJujjYS; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItJujjYS"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-41708e43f61so471685fac.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 16:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773011913; cv=none;
        d=google.com; s=arc-20240605;
        b=e4ahzVwyzIyqM00hsQsjUE3ZLl1uLnVbEQHIspJOAC8CES4zIAoK/CumI1DAN2r2bj
         3aeRb6Yd01/Xykk/LSpLtDxRtLOTugyQb1pddqAu1BKSlkxn4ZpdF5FH8byJDfVo0Ba0
         p9L+5q/nnmjdkQLpNAlIvr2KyAATK3BYTCOsMLIJ4K4xobqvSxaEe0Qy6fz9eJVRHq4u
         ebs4YIxsyE479IcejO1jW4bH2ftiHc0M84oguFJtd+w74Cwb1kS9j+JVPmGPzSxe+3Mm
         peHxTZ9SmDKaZo3iaF6tDgPgwxvf+NH5jNTx27z4PJ7C/9mUfC6qQeEISoeI8nb9gMQE
         5oJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BnhkC9qbst9MqLCbQ6WeJOM+fVp/M+vMnJljWxRqQaw=;
        fh=itMBzo7P2V1aF+mvDktANC9j7SCH4COpmnnSoYBdV4I=;
        b=cSYopE8/iRMO8reEfSLsMarEpH2fOgOaQFXzKEi+/Awf9EDhJlypr9/Sk8EUYiSaIK
         A1XupvJMs0xhDns9IvJ2uUDBFKsCOJcPENEQKcxlKXVv1Xs/5gSyrc1y5G+1L1fSKjTD
         zaqu9fKquN0wCvW+XVmDXNToz7+dju5AoNfEeKR8akxzvthUCodR2iGHGrIDelkTOVGy
         ZrQ9zJWPVqRSDveL71ZUyhfJaXH64avLTFmWOQUO98nJ6AK8CJjDRYFcf2KwnOmpV+NM
         FMVAzjorru3nyQU/fqC2THX8A5gGDeksOKZgI4UZKBbQdDGC6x+EDXCttLc+1ohRlVPX
         XJ7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773011913; x=1773616713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnhkC9qbst9MqLCbQ6WeJOM+fVp/M+vMnJljWxRqQaw=;
        b=ItJujjYSS/k/YTFBrUJ5tsZnxzjPIIM0VQn48FP9KHNezJ7Z4LsVNZiMyugtImNzXD
         SKRclwrD6tyoGQNol8QwEQv5/nB5wxUYtBADt+rmQMkFrAwpqsOPvAOLcrRChM0Vf0TU
         qubnjlrPGFZaLADpUUyGedU59ORk9UQp8oHoFtt+bm7Omc1exONpWss287J5C2aaicb0
         lnadVW5/Ef1Ph8Cmf5a+w4aHqjPHgAWYvdeuAbVwBlKdcUSTs7nx8vvHUagby0FMlfWE
         mQ9O00FYOYqemVyRLIepeijWlN22bdo1PeJQci/ZS73nQ3XpS+ZHmzh/iBq/ooCxUH64
         BsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773011913; x=1773616713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnhkC9qbst9MqLCbQ6WeJOM+fVp/M+vMnJljWxRqQaw=;
        b=s7I6dk3ooeTGaV3YqSI+KBFZmw24ugG7lCyWZN5Q6pv+qbNAkh8NunKPAEsEaS8Pc/
         3cyiScWP6kkJeT/xSi4IkPjffAP1i4t/WjMtqFndoN/74m8VbhkGn6YQQZ0sO7M/8jrV
         oWWpZk30KXXaa4aTxTeCqfph/vGrsn34Yf1DlmTTDUfha6L6HxJP2bV8mOxAzHWFOXPY
         5eGS/0Ob/1BO03N3UwJV3wpRY2gq7NrZ9H4f2kvyYNKtO+xLW+11sie+8og9DNIh+xl3
         oUor56mP9LXVSMXJCcyGz5YutMu99jMGSYD7n5lx78GiGAxZq2KOEO3WK3m7iXMYAQNb
         mEAw==
X-Forwarded-Encrypted: i=1; AJvYcCUOrRRyAPwKdJfILesODGd9UvvLquBHXfBu6Z2Wdh8r9rWDKwCovgpFX/b6DEOBxbH4BRV7F3HOyf8jIcoF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4tZ9L2Ds15GLrfeCh23bOB/wtCtZaHDXE+p/1ZIiCR4Nr0Ef8
	iyfKYccvcf24H1GhMt22xq0qFyPENihxWiTCwkbhXYsp+Zwv8lxOJf4W0+n4sXJqUUUdBPEeSqi
	gnMSOsfcmyhmuYbZvrDuSYN5M1K4YfHs=
X-Gm-Gg: ATEYQzxqhWKzmtiOYi/DfLt0blyargWN5Ihp5oMLpNGUBaA2c+JsfhWMVTEsD3WHfye
	WBB1HcdWYbWDsjrvmy6PRtqY0RId0F1FZGC44bozNYMQ2H56wrv3S6CtOO+afgjF+ocaP3lnP+R
	p6rJl21mgitM+UiY67yaCYFhJVnEJTKuTv8OblUi6AwwKk+ql+eN/2sb3k7BOXT3P+5T6QMu2oL
	gn/Z2DypVhsUb+LkAJSVw9ihaJGG0bOb7x3voVS4/0ltvHTJPwCjseGCymHNwb8D9yyL+oN3L/X
	KH23QHXUVjggpx16ACDvYMZ6NrQNJ58H9kh+54dTKw==
X-Received: by 2002:a05:6808:1790:b0:44f:ff2c:f65 with SMTP id
 5614622812f47-466dcb0d34dmr5206797b6e.38.1773011912676; Sun, 08 Mar 2026
 16:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305210347.120446-1-rougueprince47@gmail.com> <20260308183135.1de38062@jic23-huawei>
In-Reply-To: <20260308183135.1de38062@jic23-huawei>
From: Bhargav Joshi <rougueprince47@gmail.com>
Date: Mon, 9 Mar 2026 04:49:01 +0530
X-Gm-Features: AaiRm5334ij4aXgd_dki-Lzt6To8PVZT7xd1ejy0lE_PZ1R0F7_UCokGiCzNeeM
Message-ID: <CAPC4XCQC_JqdFXf5_OYBPk-KOcg_xDBo0N-s0uQie-t7wZHoFg@mail.gmail.com>
Subject: Re: [RFC PATCH] staging: iio: ad9832: modernize ABI and remove dds.h dependency
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	tomasborquez13@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jonathan,

On Mon, Mar 9, 2026 at 12:01=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Fri,  6 Mar 2026 02:33:47 +0530
> Bhargav Joshi <rougueprince47@gmail.com> wrote:
>
> > The AD9832 driver currently relies on legacy custom IIO macros defined
> > in dds.h. This triggers checkpatch.pl warnings (NON_OCTAL_PERMISSIONS)
> > and, more importantly, exposes a non-standard sysfs ABI (e.g.,
> > frequency0, frequency1, phase0-3) directly to user space.
> >
> > This patch removes the custom macros and migrates the driver to standar=
d
> > IIO API mechanisms:
> > - Standard attributes (frequency, phase) now use info_mask_separate.
> > - Non standard specific toggles (frequencysymbol, phasesymbol,
> >   pincontrol) have been migrated to an ext_info array.
> > - Remove dds.h header dependency.
> > - Pointless frequency_scale and phase_scale attributes are dropped as
> >   suggested by Jonathan in
> >   https://lore.kernel.org/linux-iio/20251231180939.422e9e62@jic23-huawe=
i/
> >
> > NOTE: This patch introduces an intentional ABI changes. The non-standar=
d
> > attributes (out_altvoltage0_frequency0, etc.) have been removed. They
> > are replaced by standard attributes (out_altvoltage0_frequency and
> > out_altvoltage0_phase). Routing to correct register while writing is
> > handled by checking currently active frequencysymbol or phasesymbol.
>
> Ah I think maybe the discussions around this bit got confused as this was
> not the direction I was expecting it to go in.
>
> This doesn't align with the existing cases of how we do symbol selection
> devices.
>
> Often the last thing we want to do is change the active symbol before we'=
ve set
> the value. We could have done a multiplexing write function but if
> we had it would need to be separate from the controls on which symbol is
> in use.
>
I initially thought multiplexing would help perfectly standardize the
frequency and
phase attributes, but you are right. Multiplexing would break
hardware's modulation
leading to unwanted glitches.

While we can still use a single standard attribute by introducing
separate freq_write_target
(and phase_write_target) selector, but that will overcomplicate it for the =
user.

So, for v2, I should drop the multiplexing approach and keep
frequency0/1 and phase0-3
separated using the ext_info array.

> There are a few examples of existing ABI for this in tree.
> e.g.
> dac/ad8460.c which has 16 different rawX outputs and a symbol to pick bet=
ween those.
> dac/ltc2644.c which has _raw0 and _raw1 for similar purposes
> dac/ltc2688.c is similar.
>
> We've never added more 'standard' control for channels with symbol contro=
ls simply
> because there aren't that many users yet.
>
>
> >
> > Testing: This patch has been strictly compile-tested. I do not have
> > access to physical AD9832 hardware. I am submitting this as an RFC to
> > see if these changes are acceptable, and to ask if someone with physica=
l
> > hardware could test thisg and provide a Tested-by tag.
> >
Considering David's valid reply: I would not be able to get hands on
AD9832 hardware
to validate these changes. So I am not quite sure if I should continue
with v2 or not?

Thank you for the feedback!

Best regards,
Bhargav

> > Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
>
