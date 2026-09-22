Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CC54CF5B
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087163; cv=pass; b=hSL4RLJVN/xWku44PPZ28D57ZtcdIFFqtI0jRA0yBrksuUE/6FSe0XJaI2eJVNrsRad/tS2nZhwAvJgjwhRRjmXTM3tClCUR0UAqJe0by1AwYkCzT6qVfrDeSmBN8t3Qq9/O25ls/O/O1pzOMpTyzn5XjJq5w2ZSGAzNXIiiqjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087163; c=relaxed/simple;
	bh=R2qBxqr53zWYaC1RJCIbgPO5t5bIKtz6ByZLfGYSt1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HB2QalW/7KlRe4mVwXGt/oHpdcuP2vBZPhqc1PKX8g4qVjY8MLwmv0EPEIfeTgiqDCnZKdwMFie+gl1cn5IppQW6OJHOZAuiw0V1q35+UJ8U/qXfuImWxxr3xmpFrAjFqzrVNXEQu7Zl33eZgzbBwpVdU/HGiC0dTBAlAJJI65M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZWGnhbj; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZWGnhbj"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c83be8db39so2405738e0c.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 07:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087161; cv=none;
        d=google.com; s=arc-20260327;
        b=emY8d+iAmLjNFr90MqrwZ5FT4bDMWUa6rIfRlOFH9oci5KIK8uKWnv8Ya5tfq5vRjy
         SGwqR1KKPHt3Klpb0Ky8fu3ahPjnV8XeTW4NzzH+mQ7rQGe/XJWakGVf3RvxyGXGW5o/
         TZtyxAFLrSjCtuvd3mljdw2AyfujcF4Z6MffM3jwcPcTVGOZb8aoGoJ2x5AYyDNDKW42
         xMrOnmV3WaTyEpqRyU2+N9wwoBLnOSk/KsuJu3JoSoC4uiql9mkon/Agb/5R4jORqJyC
         FpWbXYB134buj4A8IUQ3YtwZxgvpB7SyHjkmie7l4bOVX6v6dS7SWT6jvw2CcvKoWPG4
         oACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6WDR0oNQbCaq9G/Y+cUlOUH1iVOQA7T9qH2RJoZlMM4=;
        fh=f1M5Jq9HK/X9K3LhTpsZR4TVNC1DtrmwVcR8Xxo/kHI=;
        b=cmETKA7euOXpJMw8x/cy1t3x8p+p+sNMRJ245tWxFQPDgPc1jJrEJy3y72VzsHSRVW
         o4kE6o+SZhhH4VL1KGrjuMXPwLjakQqGamzAghEiTw5hGBpzbdTU5u09OmFcC3RD66WT
         NmCMtLlM4Ny9KHf5kk60kKeIeZYIbdMVBFceMe0rYfOlea/ZhdpwViznsAw2SclhFNMm
         MaBbF0ILeHKjo0J68xXxyWmHoalvPp3X2SACZMmqDccWztb6piZrfHL9EtlhNLCsbp7H
         hQeDWMXUb1BzOhZUzI/0KoE51YDHvom3WSwOdUedY4JL2w7wXiHp8BVDvO7RSdKW7lv4
         U8pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087161; x=1790691961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WDR0oNQbCaq9G/Y+cUlOUH1iVOQA7T9qH2RJoZlMM4=;
        b=DZWGnhbjTlJDbOmw9YcsYxf7a+90QpAIY+MbjmLk9yE6unUJAha2EhaHlahJHhAdnH
         4NNcVbrKBx/m5lMxwzmrgjpARQI9+/6TC5Qz8+nIqVbndwtPuPqV5y+ELSqKYawRR6JP
         LUj9B0njyRHuGFSZm8/F0BA+ffFcnSoh6arEDGahG+n7uZm4IobYpZbfJAQjGnoaqtqN
         ry12OnEDyQm2Sr3+GpN3earW0fXvn+aH/8WajhCL5ClWz+kUxyGWxBdV8X8T89zmtmoY
         N7tjioYKAkUuB5xhecAoHWVnvW3gRysvJ/iEUX0KDc+sX+FKiToZf4gaDiqP+/BTSzuA
         yyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087161; x=1790691961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WDR0oNQbCaq9G/Y+cUlOUH1iVOQA7T9qH2RJoZlMM4=;
        b=rkhqfQ1qbAsYZyEbDMuUdvQa1lpFNJMyk3Le3986w1LC7LQKNXpu28HKwJICk1u1z5
         T8s4AqfKO6++7AeRssG2UPrb6QKzIohz9GWls3OXcTX6F7IEH9IOhRD9KpWyvpx3Ers9
         we+XNh1tg8GhrGYHgNhRzBsxDxFSP2LKr2MSzINx7FlImKGuMbWO+uq/LhmlcwViNngo
         eaUqlAOe705LYAbQvjFTfhEGTKOiASvREP/plDqv0NYyBhidusNRe/hHz8YmUItWsmcy
         b0R/XVrn7grqUdEclLbQtaeR0PBuYqTPh9+wUJ5EYIO+ctddVSKgaoHT33mPKkVjfeBb
         p94w==
X-Forwarded-Encrypted: i=1; AKwUvBzRMB8qxLq02szohngKB1dtpRri9/pUcegXDgvxEn0j+G9NH8UPqxJIcQ6nnGuX6PQYm/jDiFTcoIkKX1Zu@lists.linux.dev
X-Gm-Message-State: AFuF++kZWaC/nV+6q9OhqiXxOZOU4zMp9LivDMBxMHSr0rjYRuH0wP+o
	dqVbJcRKv8lT5YLUUJl1iNRV8ARxN40jgZ4+XjK6OROyEyeWTpYJ1Wokdq/00SUKdHzGvN6yNd+
	32wN1I+h9O/TvzrSq29pmPaAB5zMdfxE=
X-Gm-Gg: AYBFou1AluN/TVHZFYPhlcYIhXSbcgnCgyMBszIN2VN1qgfxNqkoEZd2gbK2cPFQHqQ
	ASoWvXFPSAw59JH1jq6ft01/PUy0//RV2eh3DYRTA6fdbZeYS0LtCRpggj2uNz6udqw3U5cHd9q
	41cBpRJUNYBKs0mchurl+KXTFJDPfWdTpOmZdvUkcoaY9lpWdvCdIO/ssO5bVSNm544HRfS1HCJ
	pfy8DnzWPKq9c6Q5hHGgs47TzabRScwvrzBvtkuDUR1Bs1VOYAYvIfIrw73Q/ZKqUIAbbi/g01y
	ScgQlGEdia0OmcNuAmhyxXISExtgVX4ol/i2UpMNqV4SLKjavxmWsW5RRmCj++pgVhgud/Nj269
	tYbJ39f8nULubC4D6CBlpN+XSOJf3JsS4fVE/04ma4O70Ku6x+0eUYvtcv7w2V24PkkmazoFhYN
	KoTZsfGyy7QIkK2gjZ0ofeLz6bMcL+9k6UhB6J4tfzbngvH6hSWnZu7To=
X-Received: by 2002:a05:6122:8c8a:b0:5c9:a60c:2739 with SMTP id
 71dfb90a1353d-5c9b59c143cmr8717109e0c.17.1790087160739; Tue, 22 Sep 2026
 07:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922035302.167378-1-2000.costalucas@gmail.com> <2026092214-corset-unaligned-2cb2@gregkh>
In-Reply-To: <2026092214-corset-unaligned-2cb2@gregkh>
From: Lucas Costa <2000.costalucas@gmail.com>
Date: Tue, 22 Sep 2026 11:25:48 -0300
X-Gm-Features: AcwNN1VIqNxrPM8IkvNRf8clUfXVQ1DCxuz8v2KE3ex5wE-SuoBeR4i0w3V-_nw
Message-ID: <CAFxsxbpZ7weuZVgdY2mRQJJ+DCAkDHdjwsh3eQg1NBB+9h_qmw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: free cmap on framebuffer release
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Greg! Found it by code inspection only, compile-tested it. I don't
have the hardware available.


El mar, 22 sept 2026 a las 2:41, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Tue, Sep 22, 2026 at 12:53:02AM -0300, Lucas Costa wrote:
> > The driver never calls fb_dealloc_cmap() after it has been allocated,
> > so when the buffer is torn down we leak.
> >
> > This happens on every unbind, and when an error is detected in
> > sm750fb_framebuffer_alloc().
> >
> > fb_dealloc_cmap() gets called before framebuffer_release() in both plac=
es.
> >
> > Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> >
> > Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 8b93bfeb217b..92412534239c 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -910,6 +910,7 @@ static void sm750fb_framebuffer_release(struct sm75=
0_dev *sm750_dev)
> >       while (sm750_dev->fb_count) {
> >               fb_info =3D sm750_dev->fbinfo[sm750_dev->fb_count - 1];
> >               unregister_framebuffer(fb_info);
> > +             fb_dealloc_cmap(&fb_info->cmap);
> >               framebuffer_release(fb_info);
> >               sm750_dev->fb_count--;
> >       }
> > @@ -943,6 +944,7 @@ static int sm750fb_framebuffer_alloc(struct sm750_d=
ev *sm750_dev, int fbidx)
> >       return 0;
> >
> >  release_fb:
> > +     fb_dealloc_cmap(&fb_info->cmap);
> >       framebuffer_release(fb_info);
> >       return err;
> >  }
> > --
> > 2.43.0
> >
> >
>
> Nice, how was this found and tested?
>
> thanks,
>
> greg k-h
