Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343E2571B8
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395664; cv=pass; b=SAu9XAgi0a89Kxk4Z5YjkWqxrnKMrGGOgYi99ZPKCDWsXFaVJIBsBHCRNmItxXkZAnVzpt8yvmYvYWq48KEwD5FJsK57r+BeA5tSo7i70Vf3GvhEweKU6lxR61mk6xr4WDm67Ta7jI1AezoalVdHCaPY6WKlVxENjhvp0dp9U3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395664; c=relaxed/simple;
	bh=exgUaAZQnv+sDAe/1ZIE03rG7GIBXwWQE7aAfcKYEdI=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=humggbv6KS9ofjalZl5Cf2kOwpAiohM7vD5MxMf1K1zm12B6s5jNzM6ehn2m5UcbE7OWsmHNXjwyWfdR0nfRhxvBZBF1Eg/Wlq7FR72ta3rdZevsaFbNOP03oC5j6RYo9i215Vn/Ydj8SgVm+j07oIKXpSgWbwEWOB515OHLnXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqjgMkiG; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqjgMkiG"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80b0cd40dafso2261707b3.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 06:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782395662; cv=none;
        d=google.com; s=arc-20260327;
        b=SIz6BU84ZIkrJhLopg6mD6MhUIdyc11bpxbdSJhieqri4I0U0uc4qkzZY8Uorhjq6x
         /772RExWBli5ha0yU0cTrgdfUOSkf6Nd4gQ7Hk3ULlinVWAhB2HPmKmHTScLCYMY4O7Z
         EGh94c/LjStjoTR/DkamoisyMFLd0GmtufuDTUT6UTH8d0DmljXzDBysVYnoKnHJyqqm
         nnmzaLMoguNSvl8YCC84ztpYoWXz12HxLAdvIplo0yipJs4EsitBZ2lI0MxtH/ZgEDzO
         c0pT4aKlohsvewfSkuUvNVlbWArwrD0fAZ/xww+dnDRv+iZFAp7B4QUhmWOGkuFYLB0y
         nUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=exgUaAZQnv+sDAe/1ZIE03rG7GIBXwWQE7aAfcKYEdI=;
        fh=1tlw2kSxhpV8lNAZUxfCn7wt2bmEPwTOyqcLP+XGUP0=;
        b=GTdFLKsz8dVe49tLiXwEMSCxHh1/Q/VAIgSqcilouklM4cuFNAIuiRU/BNqGVGHn/p
         g1lRC8Thou1CeRJ3M3Gg/9JaFbNXFImGstAadcRfV1jrNpzE1AArdEJljHTYJ5iHHL7E
         XYqWF8yNq76NF9Ncm5tHIUj9jIjRgs3YMmj3oM4bAQMy6kOHIUthXAHlgJhUIJYBymww
         Z5uHgpwT0zZTMBoQ5TdLkOhY/neyxigtzmkEsdLFumtam2DkOScli8xVu8y/gNctgw07
         OatJw5VgBckDo3qQDl7caxOXiUhtY2R/OO5gFEmhJfwQiL2RfzHQK7zPY88CP2+Ixibp
         Oybw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782395662; x=1783000462; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=exgUaAZQnv+sDAe/1ZIE03rG7GIBXwWQE7aAfcKYEdI=;
        b=qqjgMkiG+6z48NvspdkKxUFkuOuCp4/M6WUFKYbHDAZa6WmsiqFpS5wnmSZuoTx8+8
         ToDby0IVGqVOO3/rogdqCKbnKVFLcZtFFEANL9+E3prGyWuANYks33okeVXFOxrW+cf7
         TSEPkDEWZWBhi3MYxouVGj3UDk7qVIiX+xlv4B6TKZsdDYEnU404FpIFs2ZdVO20yxJ4
         nVvlF2wlrqkP54iwVSDjOYuzC2BDQF02DNDtuYZJB7BZysg7UXTxbcdte2O4QMdjjrwc
         WbuHvGer0Z9pfdEiMHvTBnD854UAVDJ8na2RKkYW5NQYaYdSA2DrPSNbvHmNrvsQsWOM
         WxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395662; x=1783000462;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exgUaAZQnv+sDAe/1ZIE03rG7GIBXwWQE7aAfcKYEdI=;
        b=k4hK7uLu+IBSvABtIAIy6F/NIXxZWtgi5Rad8zeJlYZFxGEJs5zEZW7WPIQq8C8XnY
         nzzfMzU9OHDLrj+1ElCY1KpDKuEdi1VsB7Wrxx2YZTcmZTWZ9RAPcufMw+K48ap9oxv+
         cvkSY98tFKqLUCMevnD2rJblD582QKTomyEcodSwc93/wdGo9jAdD6X0i8LZXPvTgQ++
         E/8L9wQY5rBpfRpvefzCci5glZwjPTz1RIQ0kRmtkd5SHsps+cfWDjvASVQ1Gs9fhmIf
         k2YFyqD7+oWCHbafVr9HwWjiTfydYKi4/gC7gJ+/9itBKtQgNbAjjWmQmUPTpHVjTTOS
         jKKg==
X-Gm-Message-State: AOJu0YxV4aQ0f5N5PzDm2b9csP8HsJg407WqiLtdTZbr4UaUCFQ/0HvU
	XhXLdREAlWgJvOl+vi8j/6dEz7ztOy47DxX+5UUEMm5ZX41rSnDnDy0tj+6+0usi5U9Wemp8G88
	KGac/qXN+CZOqCxZJi2XR/jWdvqd2HJE=
X-Gm-Gg: AfdE7cl4hIqhaEyAP3WgKsBP66nLee38swi2pGupqWVsq2ekAWEMiS5lmU8AxLAUc1t
	S/iCV5+M4LDC2ilPtEwOuezR7wwpU1TtB32T+OBz26NKA6FgRvlSqKhY4hD+PZYJUzdGYcuYrE0
	uud/iYcXyNU442ENFBgq3Wv07H1dTveYo+IwfPwKMiYOPbFBG7z8iKZGMdAlKJDgX6QRQKSNH/3
	Ce99JuyhM5jbDiljJH1G3gqHLXKoiJ42qn+uYK7FhOBqwmHyXVA0UWqIzQUmUV+1s7+6a3D6Q==
X-Received: by 2002:a05:690c:112:b0:7ea:3cda:4246 with SMTP id
 00721157ae682-80670e4828dmr106738537b3.3.1782395662030; Thu, 25 Jun 2026
 06:54:22 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 06:54:21 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 06:54:21 -0700
In-Reply-To: <aj0X1ltvBoJDEbES@stanley.mountain>
References: <20260625093137.6589-1-alhouseenyousef@gmail.com>
 <aj0WWwiOzjLGbY5z@stanley.mountain> <aj0X1ltvBoJDEbES@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Thu, 25 Jun 2026 06:54:21 -0700
X-Gm-Features: AVVi8CcwJezX9sRXDHZ-0zSVAKUEJwIWpnmaaKb4Bt2-UPr55a63XrSYc28Lezs
Message-ID: <CAMuQ4bVXuOpXqiiHsxbqVdX8kb_bj7-JqpQ__R6OAzRDWNnHfA@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: bound slave windows to DMA buffers
To: Dan Carpenter <error27@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan, Greg,

Thanks for going through it. Agreed, this version mixes separate fixes
and the helper is the wrong shape. Please drop it.

I found it while reading the vme_user ioctl and read/write paths.
Testing was only git diff --check and checkpatch; I don't have VME
hardware.

I'll rework from the core/bridge side and split out anything that
still holds up.

Thanks,
Yousef

On Thu, 25 Jun 2026 14:58:14 +0300, Dan Carpenter <error27@gmail.com> wrote:
> On Thu, Jun 25, 2026 at 02:51:55PM +0300, Dan Carpenter wrote:
> > There are two bug fixes in this patch:
> >
> > 1) The driver allows you to set any value for size.
> > 2) The vme_get_size() function returns zero on error but nothing
> > checks for error.
> >
> > There is a third bug as well which is not addressed.
> >
> > 3) The slave.vme_addr is not checked and it allows you to read/write
> > to any memory.
> >
> > It sort of looks like bugs 1 and 2 only affect
> > drivers/staging/vme_user/vme_fake.c.
>
> Actually, no. The bugs seem to affect drivers/staging/vme_user/vme_tsi148.c
> but the variables are stored to registers instead of variables so it
> was a little more convoluted.
>
> regards,
> dan carpenter
