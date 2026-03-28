Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D23A5E9B
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774720214; cv=pass; b=ZZ73MVjG+Ing+42EWnYj5iooKSnnLsi5dsrLD5STDQswz2MSdQ3cs7orRdrNV6HwoyD3Wp+jElbOFSHINNaN8nG1iWSv6hSrq7jFHExfHfN3Y726/SVrPvAzGg+yVlJHf7XKr0jZrsM9nauHMbhMHWKxTGkyVH2C28EzWDzDqmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774720214; c=relaxed/simple;
	bh=/MHuV8XVqKwYNXoPzgoq+11DEhh4eCt8+xddHnvccEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIF9LDCafqlVb7BhtRy8L4S5vORuOJ3uQe8oMdZVou01jf76OtG6ZMiXwkyGQ31JKzDtkbnqoZOMrv+k21HTEobcTz250Vmtj047kWZFfRf0Wf+R9cr0bHEs9U01JBfEEt/e5hG7e5Att/fW/yJUDxW6V0VOb3wART4VY2zu2rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmRLIkJb; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmRLIkJb"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso447096566b.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 10:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774720211; cv=none;
        d=google.com; s=arc-20240605;
        b=crUcWjqho78EvhkhtyKzRYLqyGMYGz4bhbPEgAbkG24vqPdvylWrmNEHAtE0UPXPL0
         BgnU6oufLZQeJPY4RePkJW6eNLuLxh9vgAZKWCSTZTkE6WpxB2GfL80MGlsG7Xakg0NX
         doIrfyn3XXDQUOn2HZcHudUvd+ilcGD2MpqITXo9gal+vPUazXWrLQe1lfiXsvwGtOPY
         fAwxVLaqayv072o2iwfMLrQ54+0r1j5JOiCuIe5ZGdWGoPDotov6d1k4FojRSJwEgVPi
         2DKvZWlEp0BrLc3BIkfuZtjDsDHVK6ReVaI9vk7AirSBjiwwP/QAXpj9nKYPJzYPWtYD
         m9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MHuV8XVqKwYNXoPzgoq+11DEhh4eCt8+xddHnvccEQ=;
        fh=020UYHhNT58ryF+N6CAs/Eykf1x2zwVcAl9E2gq7mK0=;
        b=Jhj75t3tgaye0g3JA3kaTy2Tfzn5zUBRxSaSN6P3JHHH3WpLxa5q1i6DEBpk3uJxot
         lukIgXB2PmEiiuiARQaRvJdOrqh21mCD9yjN+sVE5XGmLUnHxfek9mMpM2WezRx74nIs
         IA1VbTKglPqo4yEfQzWj3+YD6NJtn0Q3D+pyOksS9TWdb4chJ1OOg7kq3MTnWksgb94i
         2sTIhDu9wf9kgNY3sE3gSrnI91HQpRQZVf7ZYIsEiIaJv1n4l5U6pzWDH0WuMkpNnBeD
         2F0jaYx+HkaEhDLHJAVqz3hZ50mXkUXtckg0dc5btKV53MDstWL27d0otK7xv/0yLKjK
         tkxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774720211; x=1775325011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MHuV8XVqKwYNXoPzgoq+11DEhh4eCt8+xddHnvccEQ=;
        b=pmRLIkJb8ImQIAf+6e2ePoHtW5bSoGfypxM/ovZV3S6YJNexaPo14HnXW43KEVgTfE
         OUjBEGEqbI7Zkd4XROd6TKto2ZsCleLQiiY2J6B1JNPFCRku5H7G4iRSP1jSsoKYh+Z5
         ZZEJ4CAV5OYvUzT+btsjUMRajLJPkwjIbexfceRmCKLYX3MA0Zw2p1Zq8r4I/PTfXOFH
         rXSvHzMYVU4PExDn9P45BWOkVCWQkXu575KXPdcEOoGzs5HeLR5S69n6sDsLxtta02Yj
         2gWBtXvgeTC82I8RvoK9ie2HnaPqy9kOb8mqpRTFGos5u6tsIlZJ0WEFopya5D3S/6RO
         UbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774720211; x=1775325011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MHuV8XVqKwYNXoPzgoq+11DEhh4eCt8+xddHnvccEQ=;
        b=Xanq0lf1m825/gv8pxoIulggfSvgXUVRwJ0NcspaorlgLPxlYvl1nghNv/tiRZsHQ6
         /lB2iL119AF+u5VcZ8sXXA12nxfq5yBanCUjplt/mGFhSPvoX6AVcV3xlcBSKUIrzgTf
         lY/pUHapqVFFpICyb4/4sfL5o1RmeCSRBEZ5QUeZQ/QsNcfEgRPBk2lS8RhEQQi/WwiT
         nLzR04iGDivjRxErv6GO9/qsgapnhkZAxeHQte0GpQsP5LSqaqBcxZvgQS1y0EXZ4bUt
         DPzFfrrNurMOumH/f1RJuEqyGlftwj87T2+BzWsDooC7XxmI3/mkRwwTryXxcplWtFBe
         qI7A==
X-Forwarded-Encrypted: i=1; AJvYcCVek0M/itkzwUo3UCg08DoDQ5JrPMzzm2BRwCrgV2STw2UbzdY57aRRchq+jXkTZslY8OgcDaeiYWSBhFOi@lists.linux.dev
X-Gm-Message-State: AOJu0YzbWwxq7XpcMOcJEwt8HRBhGhi944PzxmtYxCYNNztDouWae0bJ
	FG+T5yZXw9YGeDgnZ7zrJtE3lFADnhPh1bT6fojcEQc3OTlXErLSyy0eKDTuVD1dklcl/gFlyvB
	P+Picu3ceKEt1h1hz0eBSqJ9AZyAD590=
X-Gm-Gg: ATEYQzxUBndYP16/y50DQ1UgCwZ3K4dTsN3D4DL1FwMzWA/ubundGdwzKLgOvQVohhQ
	Rfj4JNcTaRU4N2NvD15dYbikZc83SqQxIHR6seV1lVFmdUTcs3YDs2iIujxFc111OcWFrj/hrfk
	YQHw6SuLEHbF6Et4I/anuAs9jaQ9yDh968fzZ91IiG/UTjcFiIaS8RukcClIljwMqvomndlXVQQ
	yiOOuYXu40wfkYAOXr6NUIB43le2Hp9AHjnvH6m9FoMixZtR2Ut0I4ySWWXKRtTCJMZq03atsnQ
	xhVfjVVvjeA+C0QNmeWC18Oql722vTVIdt/ox0HDXFEVmtMwKD0ZAuM03ZzfcwHGyyfDOopFRHF
	93WI6arE=
X-Received: by 2002:a17:907:846:b0:b98:51d6:883b with SMTP id
 a640c23a62f3a-b9b502bee4bmr483537266b.4.1774720210902; Sat, 28 Mar 2026
 10:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328160114.1143108-1-caiyuhe80@gmail.com>
In-Reply-To: <20260328160114.1143108-1-caiyuhe80@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 28 Mar 2026 19:49:34 +0200
X-Gm-Features: AQROBzAslN_ZWujLGMIjg5dfPBwHz5pbP2BKbO1h93l6if0I00QuCKVboVXLlB8
Message-ID: <CAHp75VdGieY2qTZ_HeODxLMW8P2E3O9O27K6RRJoujxB3NZ-DA@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: avoid empty macro argument
To: amanohina1 <caiyuhe80@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 6:02=E2=80=AFPM amanohina1 <caiyuhe80@gmail.com> wr=
ote:

Read Submitting Patches documentation along with
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/dri=
vers/staging/fbtft/README?h=3Dstaging-next

Act accordingly.

--=20
With Best Regards,
Andy Shevchenko
