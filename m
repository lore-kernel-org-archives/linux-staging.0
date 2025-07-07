Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1D27587D;
	Mon,  7 Jul 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894812; cv=none; b=N0GqTpAD7eFPmuuV0KiKi7iC2+8ohS/T7t4u05SIdoNEs1/jIIGzhAKbzk5EA6PcYhFhR5wAflbx36K1fdv3wLgSLudSTHD52yU+KqEDteiRMn5YBktMIpEHnLfRb7DLh8XdrIjRjawFpj0QAGHujI4S2WF64zCs1+wISwIoXMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894812; c=relaxed/simple;
	bh=+eDQoI7Ih5xCp1XC5oM2SFOUr5/BpsbWEEV8qr+fx7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGdzFVp9Jwdpw/L0RrJDqcqMnzDq9SLxrVgkmjMxVc6oBRA4VvqqPk9jw5Knk9cuTRjU8i0xiQOM3bZiKz2OcQxdyRg1A4dHZ4PsXfJe5eayn+lJt4cMFPEab8zoA3gNvf+gzZ+YqCINK4slsMXRt340Bj3MPdsfBrQwzeypUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOtrFwbD; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOtrFwbD"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8187df27f8so359315276.3;
        Mon, 07 Jul 2025 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751894810; x=1752499610; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eDQoI7Ih5xCp1XC5oM2SFOUr5/BpsbWEEV8qr+fx7s=;
        b=aOtrFwbDYv4ibkr3FABa0cj5PK+7KfQ06bUu1mEr872lk8olBGOy3U7zbisHEN459J
         RtrR3Z3PUTtD8NZYALkPdsKsWz7fmW2zSEKOfYNP0Oj6UEN/EmKGjzMNumFkEdEpyFKc
         lJC5MbncHElA7yHU4dBLD4u2ridNfIO0eLQSEm3MgH5kAX3mohnRQLupcHWIDDjFIBmW
         p0lfhjcmbZ6B1YZE2oNB+QrMFRpAZM3FKJe9f9lKa9p5FGwvsUVPRU2eAj0TDxk47Nzx
         i42ka2vanjj/M7SxwCCes5Zgm5m3qOxZqu7g42VBvPPy+fILPXJia7s+YsajgnD2vCnc
         SK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894810; x=1752499610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eDQoI7Ih5xCp1XC5oM2SFOUr5/BpsbWEEV8qr+fx7s=;
        b=Sgkf4jlWKd5aUFzcqyxaC7w+bsrh0oZp3V9103FRDFgrccnbilhTJj+Vgfqt1nnRwa
         1E/ta7xUOERbmgm1w5IQZyBFncbt0zx0r1wbHufijeYaS4fTf0il7nQeZpITLOV8yLqD
         L0TAU6LyGs+AnLf6eVUyR7LeazlB6W1bfME/1OfZfp5pqwBqg/cxIp2sS0cVWhfX6CNU
         d1TVVMvMLe7Ei5vrYEyblCYN3PqQ9QB+e+RduXTmv9UK3aLNoKzEX1rdBeuhN5VaWO7R
         e0YyQ3+d3lKaC9l4goYyLQQKx3LaCEfzlGHL9Jk4hPOjsY4bkAGANWHMcX4jnTQ5IqeW
         sDtw==
X-Forwarded-Encrypted: i=1; AJvYcCWdFBPgdnwKVy2813lJ35LZ5AvQ7xCmhyy0ZqcTxotKisiZSe4RNq38uaIsUgmNE4Cf5NGu3svlDJfVyTllDw==@lists.linux.dev, AJvYcCX0GhUfx8wK4Uh7ZXFWuf6ZKxZ3k9PbyRKDhsDRSN1sEvZLWEpsEcvx8gWlO6banWYyo2T/HpAERWCMGBeQksYCDsLHTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxu4xqPak0MlkXsDBq/0nj/8LStlouCOn/HYqsAQcUkrHFSln7
	24HIAN3ocu/aFWB5ni8NdX0wMA+QwuaX0/mbEs8SQEcIm4uWvSxniKBu6RixbXo77lBrZIKhGCY
	N6rd1U8KVP1b5/TaEsAm96eucNYmkjQI=
X-Gm-Gg: ASbGnctzUT+FmXuDmE/XbL6DPrlnhzPioYZg+3s0jlcpHnwbQyG+g3BDjNz3k3/A4uy
	UhuwSSuF9x9Yc8FHwCZv7np4cOCBE1kiGTkU5dWAV3YlEWRPC06u6KutuNjfHBu2Oz0Nz1suy9p
	3tRgL8xAM2yUgLZdw2kxMtVXtbDR/nZsfUDXVjzjBJKs4=
X-Google-Smtp-Source: AGHT+IEsKVW5JtW0RfRAq3tfnMDl8JVZLWNsI8dc7R+PLM4F6s/NZqeVQ76z6bAd0IbxM3Q0haEdHbKUvGerwwkKP3s=
X-Received: by 2002:a05:690c:6713:b0:714:305:7c74 with SMTP id
 00721157ae682-71669ed6b45mr81445977b3.3.1751894810104; Mon, 07 Jul 2025
 06:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
 <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com> <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
In-Reply-To: <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 7 Jul 2025 16:26:38 +0300
X-Gm-Features: Ac12FXzBqmNuWj7ejiaKXMMV8TVKT4LYL9tFZe6Npx2f8doOsoH6QUPVop8Pawo
Message-ID: <CAGn2d8M5+5ErZd0YF_hQ75j5FWEFC60qCPX6U7G5j2HgDmz1PA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Hans de Goede <hansg@kernel.org>, hdegoede@redhat.com, andy@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans, Andy

On Sun, Jul 6, 2025 at 9:25=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi, Abdelrahman
>
> On 1-Jul-25 5:45 PM, Abdelrahman Fekry wrote:
> > Hi Hans,
> >
> > On Tue, Jul 1, 2025 at 4:54=E2=80=AFPM Hans de Goede <hansg@kernel.org>=
 wrote:

> * And maybe you'll find more possible cleanups while working on this

I was working on some cleanups and i found something that i really
don't understand.
how is the error checking of hmm_alloc is handled , some functions are
checking the
returning value of it using mmgr_NULL and other use mmgr_EXCEPTION
while in fact, when __hm_alloc fails it doesn't return either
mmgr_EXCEPTION or mmgr_NULL in
most cases.

> Regards,
>
> Hans
>
>
Best,
Abdelrhaman Fekry
