Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D640406834
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831978; cv=pass; b=tzQIaU5qWKV64M2C+qc8WKJyhCsM9ZfLLRAY22Yr9ugZXrPd36RTgXKT2IWpH1VficjaU9pTAuwu8SpekqT5l2k4blgpPuDAs2q54TWFbrMSX5Gk+UykGgj+/z2kPrnFnKTKqeeqyvxndW3iLceC/8bozoNrA3UKX8HWc1NEt3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831978; c=relaxed/simple;
	bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRMxkbtWxEWj6KBuRzP3oEew6BefXaDv1RtmbUnMcahLk/KRwJAmQ50jKdxc8g4sbkjztNhWm1lF6P+iNKbx2KRqAYPAqLXUIvSRgQoEOIK8fheGLrmOksGD2EqCu8/qSYTTLGHU/Zgu/rP0HgMtshdFtADnCWHcFA2McIuOxss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCTZ+51T; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCTZ+51T"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so32891271fa.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 12:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831975; cv=none;
        d=google.com; s=arc-20260327;
        b=bk4geAuPyNri5BqmB6LLwR12kG546hsocnxHWsfeykQiEHSbHnR0IPEGtrOk1MRC93
         vLfOt87nlGK/CIZz0+rAZR7bAufESp7cgxYiZMt4ovTGoYCWs6uenELjZ4VL68EFY5s7
         8cbIFJgZtCfueraE31h164sERB212pCqs1pueYRIZ9sSGfaNTsW6D9UHU5T+OM301hTZ
         3FOxiHuTzGcat3HBT7j8yw/xng2iqNUVvSt1DJH28FYTZF7BZTZfwEbDTKX84/RalG1W
         qBGvTIFHA3VBZPkujJHhtLav/sRWYaDdNjSTZPuKpMmyw6FYU11NmfuJrvVPuPMM6ro9
         jGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        fh=PvLeRFHuMlp3u70GCSjmmib6EE2tHbzoUT4LpdWqgLQ=;
        b=TrjOMsWdkIKxq1mibopOQv+tPZD14oVDQhKddUkFJwoLrwzOJUwX+EsFtol0qpu7+D
         0oowKgmDn1fBAQzpUNtyQQbvSThuUqyZMSBVamRkWQ5typUm/y41VM1yy9PQoDHCB3Yy
         ga+lGakol6JEPMx++fmF/bO58UjKJFzOoXNk8zPcDUUZ6Hl+ERL4x+9EgSrtQGxfuXQi
         svCkC4+xOTHwhTupZejS9dtrRd3GM3k6AxOQPk1Aq+fu9S9KekHR/HpV7QG21atTaAR4
         uPvBMKcsQhhS/hTOuyThL9yNA95zabRH8MBqe+6uzvcs1dVuAqr9AgqYecu4serlfAq9
         3clw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831975; x=1792436775; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        b=OCTZ+51Ty6ZxxctlxCdaEbNPRGFov6ELAbskTQztLXL2NL+1jRFNqTWBgWSginMURh
         SAMWTG3qGW2WdD6b+0iuBaG4SwpWmDwxxfAg2+ZNF8CqGDMW3p465f6GQvHhA9z3OHPw
         3G3RvqqP/HaagBGuLi8rMklsy4sPtoOjEpkpvjrk5JqKkYInVQmQtWXxSse5yhJTFVXe
         vRStVh5g/1C3+ghJ7PKm4vcI9zM06x5DpzLdHnVKjRT+i1yUTtNj+bUr0jydwmabO6ei
         8gNJOWgHPdRd1W317snL8fykxkalOXQCpPhvNVHEyTMRafdGORZO+YH+FA+FvJpvd8Ri
         aaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831975; x=1792436775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        b=loZSykIdKHnNWa/UyVVBlLaE+xEwv5zwD1z+8ejaR7lMunQ6si494MlxBe7jUFXxJF
         HUhT4iHbu6XRFWwVcCWMYfktJTM++eJy0fFAjVswxkJ213q50IVwZ5+Kr+s//Hk26bKV
         DJccaiAsxZDpDQT7T6FX7Us0vgXtFIf3MRd6ztmoYhsMBNS2yI0cgGo50o7xQlljoFvT
         HVyVwPe8AtC94lVoMN9kracVu3fIbRGGHyUvrimDZ8vUD14eab/NRPijXaJj4HFVpU2f
         +s4EP0dtRaLPFhw6h8G6kZ6kVsI1YmE5yZsnoYIKFk2mrkQIk/fCMfw5MJ4Rfl4T7teZ
         WEiA==
X-Forwarded-Encrypted: i=1; AKwUvBzX4uQmz942OgGFXZ25b+M8gvZVFPKI0KjcK54VAXVbY3wQXbENXMlBHXS+zO+rHFnIMDqBmodGWZm6qbHt@lists.linux.dev
X-Gm-Message-State: AFq9FYLrct34Pcgzdu3PSCim5IsAWnUt1QFuMvJU75AJiy05pdqJqCcl
	MFOGoJSgTiYxuL2fc87qGd+BHKcgV3IODQHAUGQYG7arcuwKMmhQ1brw8ZinsSifMntsLkH+7tv
	WmVERtqci3AtUr0gmHzLI6hzCgfnmfoJgDSGJ
X-Gm-Gg: AYBFou14V8Muk1/nRPHOwL18XjT4kYWHzEiY9dsosWfnuPMnzprzi3UfRGF4JFyUFLn
	P0w23XYE348RbLyTPLed54KjlxsAessFFJXf8XJFPCQEuaiz3vh942B3ksG2kYUwqek6x+syidN
	m1CIo+aI8Oy2LuJ8I+9abxscBMvsli/hASJnARuK0RS8pVMmKz2BBwmUb4Ux3wWrDqQXnoneKSM
	O0wFhfp7k3U/6Le8631aP3huEdA9GsG0RkVQmZ98XWrVdG3BXWUc8Ze7BTs0QDQ5E7Bmx2q0TMU
	ZWt7n0bFPi2qEv3ijEBaFUrD5JcmEQ0tLO/Q4qheS9wXX5dwHQwS568jJFWUFtCcrVNOhhs3Tal
	OY28c3tIVT81xkLhA5AsQbzJUFFGx4hFjT4L4+9M8c3NUkF3BnRLX/LOmirhTCo0jcUZfod26K1
	T2LhZ2ryKiiJy/+q9IlYMI13tis1U2DCl8IaC7AiP2
X-Received: by 2002:a2e:be88:0:b0:3a9:9eb0:de86 with SMTP id
 38308e7fff4ca-3a9c2b2bec4mr24167141fa.16.1791831975227; Mon, 12 Oct 2026
 12:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com> <20261012161322.930099-2-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-2-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:05:35 +0300
X-Gm-Features: AclHuK8fAF2fSWnfjrxj_cT8t7W-huCmBhhYSwYrfd_UWmKMMD4Pm4VmZJDTQS4
Message-ID: <CAHp75Ve0jonWgyAQrXXa3L84zw=ZsgW9U80UYpkKtWVaMYgjjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: media: atomisp: Remove extraneous dev_dbg
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Remove dev_dbg calls that (per checkpatch) are duplicative
> wrt ftrace.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
