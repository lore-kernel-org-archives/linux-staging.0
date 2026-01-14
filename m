Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B39331229
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414495; cv=none; b=SUOUqOxgmJdQpYIcnnBPiASQThh/+YLzcfDfQ7LYLKNK/TXk3RuRoPX6DVIO2+ATUnwiYs/MdPsrry4tFx59gyC7jTQQ06J+kWafYupe8hFIYVJ+/5H+t5weAsm4N/TxjCuOSOBVt9bBfM5JZC7ljqni7ysWLMDhK4GDTZ32cRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414495; c=relaxed/simple;
	bh=2TMISfcCRH4RqSp/8q/QKrB1RBHPgX0yGcVvka779JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enuHd6jnO9N2NyvMe8y7l2U2GfLcQ5ISNaNsLKIiNEhxOJuCVaAOJnTrKEbmb6KvQasoghAytEfZ0mEOQvWvCBNFLMw+O9eKyvh2V750F5BQlfVnxH05Rb0a4Vb4GYMeKI3c4T3XqC/B9NcjY5AvvjgyBrwwP2jMti1VmcqLdU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTKXmMeP; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTKXmMeP"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7927261a3acso481327b3.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768414493; x=1769019293; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ft4iuhqn/cPSFAeuprUPgPrV/TeO1+yAqgQXKgkSaUU=;
        b=RTKXmMePRTEhK6YVj5y1dhFQOPEJMe/Dnxe7wLVBB1fuMfv9KLXRKm0wu5/7PYOZc0
         ztVtkF63wWx2vmMCDOvbgi8XZvKeqGlPmEkupa8QmvnXKHJ7c1sxSC+M+rHgUpobI1Om
         WqOvBJnL4OdxOuTElTyRmh1U137njhYmFqMU9B1PODhQMzkkTdsjMx+IWmFW32C+ZfeK
         9OAOp5ZnZeEaNCUzsSkotoX1O5afEC4lCYhjwc/grpK7WB9ANieq4sTjwSzUN7n0xHaS
         eRWe0tHKRRclRobOc1wakQT6La7+bgCqKeiqUDDSv3WtH+EoFHGZP6Mb9DVrb52rf2CH
         TUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768414493; x=1769019293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft4iuhqn/cPSFAeuprUPgPrV/TeO1+yAqgQXKgkSaUU=;
        b=tKfw0xLab+IC+4QbJgQENkRs2+YyRIks4C3fYtbT/0gWIYOAOjDKUfySajjfRoCPz2
         HdJb/io+485PPION/8Y6prc4lo2zjs/5DWEvdZEU+/gRKyx0DjqeN4qDo5a4MY/Is1aH
         i7i+eZ9jIi4s4ivdf5OIpOoYPmifFaAz13pmoidfLn96QQyQWcxOzVr+XjlypBuREygQ
         55IMFeLOFQ4Ww1tiODGOXf0SsR2C3J1ldgf5JF6bCu2NWk7vJGLMKRSR8Z26i+KAnYtI
         etIjMnq0iRKR2zF2D/fugWejj5L52AEhKEgUMJYI9iDtEcXFq6dcZDyw7QLlLhIi/1NW
         QPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWBaKN/i2FondqGFgdQmsooWK/E30/9zSLwfS58FU2g43yuYl1C86pCf1QGMv1xjy259SIAEkpVGAzEJAm@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5PaUp5+/sl/Nu/mNVCd4DqJBDvh6HaBt/P/al6v8anrTvRjEd
	bJ4ul59JtCYUzjMgLsuGJOysdcQo8YuOZRIdFTTJBoG2bQREKeksLbSc64xsYgpBdpILAmFj6UY
	cUW0f1JatGSyB52FqW+fXDHj00pFEPtA=
X-Gm-Gg: AY/fxX4OsBJ2syJSi+ii+MGijCfhiDQj35ue5Ab050ltPVFnCdpttM0PtitiQ8OnXH6
	tMezU4nmkkst4QsRzByOcZX0nmNz3UmG34Hb3OftKm3CdJBda7kkF4tSPteml4GagKEoa623ObW
	JMxm87bUE/qunFZNLLNPOVnUcYyP6sxOR0/XbpA+1U4uwdU+YUiFlaQC8N5/Ab8o+W8JIuN8TJb
	NhaazCw7exKknuuwdsgD0nDDk1TXjRdLrypXVxZ+OIkQmGdnWDWUSTB9OPPQ8FqMxwMTrbhKw==
X-Received: by 2002:a05:690e:190a:b0:640:c9c1:a347 with SMTP id
 956f58d0204a3-64901aacd0amr2970919d50.7.1768414493113; Wed, 14 Jan 2026
 10:14:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112102518.19926-1-karthikey3608@gmail.com> <aWTWBksLJcxg4W6f@smile.fi.intel.com>
In-Reply-To: <aWTWBksLJcxg4W6f@smile.fi.intel.com>
From: Karthikey Kadati <karthikey3608@gmail.com>
Date: Wed, 14 Jan 2026 23:44:40 +0530
X-Gm-Features: AZwV_Qjo0gCAQlj4LEUhW11V6aB_3EPi0y7yGWVHYAPMp8dViiOwVUZkv7-SHgI
Message-ID: <CAPsOcum0R6VrZc3W+TNQr6A9bnmwb0Xya719Mf_i07nBL+fz+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with v4l2_rect
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Unix Antigravity <unix.antigravity@test.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

I checked the code as you suggested regarding the signedness change.

The 'left' and 'top' members remain signed (s32) in v4l2_rect, so
there is no change there.

For 'width' and 'height' (which became u32), I audited the usage:
1. In atomisp_cmd.c, the multiplications fit safely within integer limits.
2. In sh_css_params.c, the logic assigns these to 'unsigned int'. The
existing bounds checks (e.g., x0 > x1) correctly handle any edge
cases.

I verified this by compiling the driver, and the v2 patch I just sent
reflects this.

Thanks,
Karthikey


On Mon, 12 Jan 2026 at 16:37, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> > Replace custom struct ia_css_region with standard struct v4l2_rect
> >
> > to align with V4L2 API.
>
> ...
>
> > -struct ia_css_region {
> > -     s32 left; /** Starting point coordinates for the region */
> > -     s32 top;
>
> > -     s32 width; /** Region resolution */
> > -     s32 height;
>
> This is not equivalent change as the last two members are unsigned in
> the generic data structure. Have you been able to test this on real HW?
> Independently, you can audit the code for the multiplications and
> divisions when the result put in these fields or the values from this
> fields are in the calculations for others.
>
> > -};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
