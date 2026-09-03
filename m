Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45CB4AF157
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442206; cv=pass; b=fbNUJiVcmHiNyHIAtweDqDwx7LxGBFPPfM8RgkTVjBZNURt0N2tHKyze3XG/4lE5807Q0/zOma4MYWnVT+0NpvfHlEhObD5FHeliaVD8ZMHevgworTMt2niruVq64C4Gm2KhpxjdPdh7ZU46ToQJ9fh7Ob/RNCs0f7awtK4hU5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442206; c=relaxed/simple;
	bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvO0QTedAZruUeD+2QRa2UAbSNasu279UHmCJMW0OJKm73hJPLjZYob4dvhZsIT67paU66cnPE+dIpUzttBvcb8Vupw52CQPs8HDSiG0RgzzM0KYq3kTm83lopSHaenpw1D0GtMZEgY/H98zK7yRRvEkzDKHb9GT6BXcEwtHT6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM0Cm8zS; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM0Cm8zS"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-855a66e5b5dso23804767b3.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Sep 2026 06:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788442198; cv=none;
        d=google.com; s=arc-20260327;
        b=pTB9zcLmpY6yrYDUnGfTOpEHKfk7f1pRX1UiV3x0ZB1KxiIMo1O6/AWsMIf7u2n7eO
         rQBKm2jlRBYkWatF4pnCds499WkxW/2fONjhbUxbh+bC7nAItpwAtKMaBpuTNAXuJkdP
         71TKQBOF7cI8cUID/4LCXc6KG7J1uiymfF8I2DLp8QYXtwVW8U/Hyz/5ll6Ww6PlsCJL
         m4a6TAr84VkXBYExt+eTbKCa6tzMrljZVd5hGh2xBQKix/Ln39XvgkzPQ5eToZ72RpoA
         c+eClOrX21N8XRl80Yptv2/5UcpubGbBydHqta5Dq7mV7FY4IU1usTKo9QZyo/P+EFKi
         RmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
        fh=sHrnkZGK17TEwsx7D+iaYSUC4tQlp9PGeJxF6eaCLzs=;
        b=rzEfq/NziCY0hkvkOvyLuBfYTNDnKrv9biBOhg8w1yLr3ugA2DR4wIKwWovGDAioi0
         KHBVdVnmlPEtdpb341teSV/h0hYnaLnS3uaHnVxUgCKv+l/PS+VaJFAYkj4m4xOHAe9A
         tpMQtxesEDCEInZYRF8WWZ9CDlazHaprBMHPwo4uWVFfmEqZ19RkU3bILkLtponzxGuI
         WfoaKToY26M2vMOJKA2ve7l6uDeVbcWABgJolezDDfVU8BCVCpzkGUows+p+gm6gEAuS
         1LzZD8z+42/aPyOZypTyzkIStmuItwkhx4a5tSJgr1pf7irtypFt82HqWl52FsbAVjkw
         uAkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442198; x=1789046998; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
        b=PM0Cm8zSM+PBMmrLaZySZ2vdJU8vD2mf+6uAavKJOtPY853PzGyVIEU8cdV+HS2WJf
         vhMX690/i4VLMDTOLgihRpOF9za4E6cnpOy/+GuwyB6iyK1JiHYUpPyvKdKzrYNd9Ktl
         dToM5hRrCciEyVnysuQeLjJzF1+ZeMkjSEgCpcB/mMT0sY39fs3Iwc9ou9fuC31trX98
         q96PrnJIv7Du83tvAxAIvkvONui+QGVOuggmjlB8sdSOXjA0Ys2NBOIVusZVS/GCN3KH
         ECUPmQdOHWlTFIBGfxw+iGm3h5ilyWaIhHCt6WframIAlpTAge+Vwfuq2idCq/g4sDB0
         w0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442198; x=1789046998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+9iWUUfVvpgHDxhWaB6L8Xzv4+wpLhoVtcYqh5MFms=;
        b=BjrjVdJBJVhmb95AZq3UdWZCFtRAYB79ygpqGwoBy3vqf8JIs4Kf/5e6KqXNm3Iefo
         BKlzV508Wowr/466oivc3omwXcWVolzDIzziI20siD/8JXIeAwoIVyOj9DU6Targ8MUE
         Xtgc217HzgPzn/Kat1kxksfWTNFS1cccFdMjibh3EL85dLKhATbCHuILwtDeB0vH/mDw
         ZMVmcZGfM0wvgWR2If/hmkXOGtjVi+CMBYcv1OWd+tyCDUYaik0N1oyfZoJJZ+6wYgNZ
         yBSxlUhF7SwUCMBPJIt2KM8qjYFGf3NAF5kGD9ChynYkZSmoGQ4S76DZ2GDnD5jaSMvr
         iatQ==
X-Forwarded-Encrypted: i=1; AKwUvBykO2W/6qSyZvAuGvDRJV7FDsnUOYixI1u5jPJV9mGoEsjR0D0E44SMSYmfnsY7bnaciAEyhOxKwGNInIw1@lists.linux.dev
X-Gm-Message-State: AFuF++nE6YShSe/vcYGRL6cpsWNvoFbgNj4ZgwYsD23MMfuniLNd5WVk
	UOwCPThPKMtp0AMRaop8KQqyCAX0mvEZoPX8qYfS86RGaSrYlCjK5XtsT+C17IZW/7fqlBm1F+m
	VUK6OBSJRIMKxRT2Zw9X93JkRg2K+dWk=
X-Gm-Gg: AYBFou1eDmSPQkMAxD7zrPmEHX8VrBMWBnCVDtD6KhiioVQwaOzo3adea5+51rbuhi9
	R/S7cxiGhl/x1m7L9k6cnhDf+v6tNlXvk9SxpdYtZh33OLNzk4uwIUg6gRdB+M/ZKyiceb9sSBw
	IR9LiCxaXMTbNpdPHfKLI1uqrgqOSXYXEiDtH4yXuRmGpR4BdHY8HGfU7idt1Vc0l6sXRIpcop1
	oG0jl5SwiQRZVcLkO2zjIASeFUTDhtfDS4WBmTNf6ApndjW2Scu3t9aYvUO1tBa/VTc6sAMOjEN
	VtKZw8McjV97IrSnpaHmxiuRI6AaEWq15UryvXzCgXIAiSR292Jn1pglSUgLVS3Wx7DwtfjN0ta
	ZhcU=
X-Received: by 2002:a05:690c:6e87:b0:81e:f5ac:e40 with SMTP id
 00721157ae682-86c51486d45mr52226857b3.20.1788442198498; Thu, 03 Sep 2026
 06:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901172055.53889-1-godanaemiru@gmail.com> <2026090351-trickily-churn-6635@gregkh>
In-Reply-To: <2026090351-trickily-churn-6635@gregkh>
From: Godana Emiru <godanaemiru@gmail.com>
Date: Thu, 3 Sep 2026 16:29:46 +0300
X-Gm-Features: AcwNN1XYP2Te-2BOmPlDnFSd4ysvl0QLMBXWTqT0ifU2nimM-5TExyVN70CqDQA
Message-ID: <CAKODxtuWpgpXqS5N6SS9Qu4Ng0gD83aAVCbg7J3S0ojXrGn5RA@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: document the locks in struct most_video_dev
To: Greg KH <gregkh@linuxfoundation.org>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,
I used an LLM (Claude) to help trace the locking and draft the changelog
for this patch. I reviewed it and sent it under my own Signed-off-by, but
I failed to add the "Assisted-by: LLM" tag required by
Documentation/process/coding-assistants.rst. The same applies to my
earlier rtl8723bs patch. I apologize for the omission.

I'm happy to resend with the correct tags if the patches are otherwise
useful, or drop them if you prefer.

thanks,
Godana
