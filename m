Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA46F2949E0
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287301; cv=pass; b=t1YqkQYZceROhvpbePUgNr1hljB1YGs/jQlIgm2tDSyUrfTddOuMLrnelcUjfZMWf9Dslxl1/eB/HYj6mIrQfydFJmpvb2qrmj99oRUSuO7EYlws6LdbPvr1SFjxZDyx/hxPQ/8jzclqdWu3ak5bng2BPHCxvLGWO0NFstnElns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287301; c=relaxed/simple;
	bh=+Us3tBybRJCBSTTW1YdnB3bEFJzwgnVfjj/pboxdz1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRYBnP0p6mUyuBhOcBBFgYFdXtAPJLusgBvkLVbfIa8+5mhXXT1D9adVwwpD8cHg2pEktsyOzplxSNwiNcmJabJ1yu3/nKTpDjmOdMQrIuYzuDwrXmmk0Z2Qb//852s3VFrz/s52t0EJYGCfPmnPH4iS5tXOHgXCIHE8FR6NOEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDH3ZthW; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDH3ZthW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66f727d6849so10573900a12.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 14:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776287298; cv=none;
        d=google.com; s=arc-20240605;
        b=k8xL0MgO2TD1i0qV0i46PYmibytMGqNgZs4l6uS+78nPSIXjOmAsB0TjjVRoUJVFuT
         91lM5YyE75qT3Q0/VPo5KOvjX4OP/XXkqb3JYXXY9iJQK/bWPsRdfgaIO8knq6N3plHv
         g8trcf9f6lfEJz045f6bsN9rLEyLF7eOL4iFBvechoC08y1FMb/oYRc0o8x2OMHrj5Oa
         2XkyHWGFskKo/r62bLKq0oh2E1LgvYJp/M4xu8xTd+eEX0D/o2P2Nm+ge3ZDpUCfD84t
         1kxySDsT/1PS0onEDDRjMpDr3IqAPHHy3rmX4N+R3YdXqjdCGQkl+uEaPjIFRMPtf5Hi
         uRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a1nJcRPJxVSw2cTzOcFRmVrJ+zex5AshjrHhOcuSWaU=;
        fh=kyXTVOHmDiaL+3JmMQOgV+TxIveXwSFF7cAKdxK21fk=;
        b=hBLo43kCAb8d5z12/c1w8wEfc+st+HBPfTSN4rz1hqMfCKvElgk1qNrKUuHB4Lo3ek
         uB3tyyMXjYTB9Re9NwchBbOPg6C301AKQ0H3KRrSoyOK3lfC9JDPX0X0VIJbqj8aBZUJ
         JLizHSmbgBhuwQ/+Iduu1mR3MYNWgixb1o324o/QDvekus3dwaf2aUTJdu5y/MFLZYOD
         eIXsxNMyFzBaFqzddqyKcTaOs+P44098ciFV7QAYB1FB0tcOqJcfGd6kBpfyE5H9TkGy
         IysR2JlyOMJ3UHsYaVDDsNKxSpMIxjvwGroCYAB0/oBVILV6KGniExf3Tn/8Z/SJybxP
         Tnpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776287298; x=1776892098; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1nJcRPJxVSw2cTzOcFRmVrJ+zex5AshjrHhOcuSWaU=;
        b=mDH3ZthWEOmzDRJzkNvV6gNdhbhMK0R1G1+0Fj1WQr2MmmXL1drxia4en9XHD7Nue1
         VlZIpqTbSxYItpHD8/t5cbRieNL3caugAE63nHrm1aXPqSKMsWrMHAoWba8nVXj8evUp
         bzJ/iHxms1du9IB9r06iIOaJcSI5SWC+E8aOdGRmjKlE2bgDS50SVCIe8fVcGKgZA3s/
         Ev6dRNuHdBBH2wbBgk6U7zEHXC5tplud+/xggktNpKdpCStPcFZrwi0cKhshQ/meTDB1
         hYvdHiUm+WXGoi+OBdBx2KUtdKqXZqCELrOtkO/4rbRHyZGLY6AW0btv6a2JrhJTp/6y
         qbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776287298; x=1776892098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1nJcRPJxVSw2cTzOcFRmVrJ+zex5AshjrHhOcuSWaU=;
        b=CbaQeundVlts0L6cFLa1msoEF+/oMlL7T8ofgADayedPjLrHWFMa1Joxh3iZGv5G+/
         FJIaS798WxQUG1ySHxMRu1EnELCxWqEKX5Aocllmk01uBHgoX+79so7C9scArf8P6V89
         LfHtjo0DCMO+J054J3iLU0hjJbeN1Gye+cQt2VD4C8wCIuRG/fLijafAlM6dWuuh8qeS
         bbhWQMdQnLzkeycEIhv1gqMEeCeSqlUGMCoFJdPYRxPapoHj7UZd134fKjLSz5u54+1k
         QuVcE8neJgFf8s7HqHYGpYImGzkzGSzbCqL+rA+bqOzeZZIvH7lMXzQQMR6uQ0fq894O
         oNdg==
X-Forwarded-Encrypted: i=1; AFNElJ9/VVzRak+jV2DRins5CAjczQVb4Ioxnai8HOoRLbgroa6UCMuKXRoemB+RBWCeA6o1arMx+whPperYdlIt@lists.linux.dev
X-Gm-Message-State: AOJu0YzK/xA2RhdJCaztb9twyBLtHcGJEjnCSneEGvcEssMT/SyPsYUu
	6w6shJCJroimWfcjibZJP9a5F6zOlrvYs8cXIOeumkrOYj+ttVrk/nmkD3quGAWDUmiW1Yf10JC
	AO7hukJmhSCZdzY1o9au9dwfnXF3lm+RIL+7bAVU=
X-Gm-Gg: AeBDieubF9ejIZf6bfu8iLHM4OVxm3fVICwby9bu/WxXQvisI/FsadOUBIUL5UK5HgS
	YzK7wcuN3unKEGF5468fGha3tDL23RymQlUuy1Kl5QyeMH2Q9D2mft4wCCwvMVz6nXMdnugIVrV
	4dlHO0uKM2FAjcokxAKz34ef9IIfvAvWsfPlL1eGZGO8bQRz2HyLHWcyPHjYYCe3RNsQSoxKuiG
	mpuyLBmgC5CzZ2HxHmDEaGRuJfE2ZOCMm90fXO9JU32xAAanA16ioNjLCxnscsmc6wgRQ2f02lS
	dyx3TqvXmjyVhthpkQU=
X-Received: by 2002:a05:6402:e07:b0:671:dffb:f450 with SMTP id
 4fb4d7f45d1cf-671dffbf4b3mr4708035a12.11.1776287297992; Wed, 15 Apr 2026
 14:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403002319.12771-1-dbgh9129@gmail.com> <ad-7dDQTF46ijzzb@stanley.mountain>
In-Reply-To: <ad-7dDQTF46ijzzb@stanley.mountain>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 15 Apr 2026 17:08:06 -0400
X-Gm-Features: AQROBzB8H4edPDD2ryNrleiuTEUaEEZHy0ALn58VPs1GIR7_e92vCm0Nn_kjsVM
Message-ID: <CACrCO_VeStLMOZdkyg+ybPLhUV=J5ZmKtSpb39vE0vjtkC6kBw@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
To: Dan Carpenter <error27@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Kim, Taegyu" <tmk5904@psu.edu>
Content-Type: text/plain; charset="UTF-8"

Dear Dan,

Thanks for the review. I do appreciate the LGTM.

Best regards,
Yuho Choi

On Wed, 15 Apr 2026 at 12:23, Dan Carpenter <error27@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 08:23:19PM -0400, Yuho Choi wrote:
> > gc2235_probe() handles its error paths incorrectly.
> >
> > If media_entity_pads_init() fails, gc2235_remove() is called, which
> > tears down the subdev and frees dev, but then still falls through to
> > atomisp_register_i2c_module(). This results in use-after-free.
> >
> > If atomisp_register_i2c_module() fails, the media entity and control
> > handler are left initialized and dev is leaked.
> >
> > gc2235_remove() unconditionally calls media_entity_cleanup() and
> > v4l2_ctrl_handler_free(), but these are not initialized at every
> > error path in gc2235_probe().
> >
> > Replace gc2235_remove() calls in the probe error paths with explicit
> > unwind labels that free only the resources initialized at each point
> > of failure, in reverse order of initialization.
> >
> > Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
>
> Thanks.  LGTM!
>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
> regards,
> dan carpenter
>
