Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D6399A6D
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481464; cv=pass; b=PTSM1h6vn3/iJC/YGU/WCziQAZOIaU33tWvi25ck8O0jgndEMA39XXGv481A/YDamZObg/qonR+ALj1c4a24lL6l0xYpiKGz25mETuP+TDWpvhXJOLbi3v7ZX4z10gDN6jq4C3KiXmm/LTIidlTXN96KCMmI4zctPV42bUVC3f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481464; c=relaxed/simple;
	bh=Zarl2LJ7UY5ioSJLPlpaoAe/GCT8sxcR4I2/Yn6UV8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bU+jOWHChClPL4UXfuScK1spbRdLj0CLz37yZkBYfnOfPT5u7iS34dnkhHyoUAgMtQjChBLx4SqxUb4CnA3E3GEED6ZzT/9a6GcX9tLeYo7qfybZh6L9d9R5l1GCO6rzwChxoQ5YoFp5TjS1aGWH8BWo6eOzRY3cUx3b86yZClI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3ew2HDs; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3ew2HDs"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6481bd1763bso745773d50.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 04:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768481462; cv=none;
        d=google.com; s=arc-20240605;
        b=PHcR1tfz9FFdVIDnaKe9U4wNlbL2G0FOvr2GlmfkR8rNtZcTZQZfHv/OXMVL319wqM
         pZSA0YkNkWuFKT95+SMrxRHZRHcZtLtbPnM6m9Mx0DA+Ge1zdbPH426RdQxG30FTFpEh
         JzKIL2Z0Fxb1q7G9MCiudWwK3KhNXGXxzzdBjXLd8GFbZ6wa/8NOrHjuY/6NH4FMT7Rb
         +v5WGbbW2OIw4zep1hubcFE5d0jm7Xlv+m32UPJI3o20LmXyPutiBR9sF5HZmr3+SyPn
         f2YhjShMPRj66HystRyoAdi7V/T6V8dqKVgGL+669kQvc9dxG7Lm4p81XInmpUXuHebe
         YZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8ihpgU/XH8/vMbQwTuQEOstZ+MAwMnZDme5L7jGlj1I=;
        fh=Q4fWaHeMGFoATpyAi8vgpyJnqFSQBd7Rrk2YtIRDfL0=;
        b=P404YP7EmXETDA93I/eEr93AJPPjfMkPvpo3YUzSTPyaoRcs4TyJkFiTHi2bA88pAP
         VLYOMBluPAgthrR7kuKk3qErm3StmfrKqjsLA09cjIKNkau99piAzZNAgp2k62m3EkpD
         /fVMKbfOJxzX38McVL8SCMcasW+LG/LTBp65dFJLBJSxG+NriExqHA4gaD2yEIdjQsTA
         7KU6LntuYtZ2GFoMI0OYgPL0x+oPPJ/i42wneDCyfhnos145uN9E5MXTyKHZsT6KrVqm
         PrwsXRvOnzpgIQ47Y8fEBDjExyYUDYc6fqZx51jNLK7wwMHbcERGtT2IlrJnHApVoXqq
         QQBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768481462; x=1769086262; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ihpgU/XH8/vMbQwTuQEOstZ+MAwMnZDme5L7jGlj1I=;
        b=j3ew2HDsBIp+uPEVL32J34SFsrRF7B2jETEsVB2tJ0xpOGH4nFMALV/Oak9ctoHEiW
         gzo/QzyrmiFwHgU/N4hxoTSnr80fvw0w0qSnSkeRZ1XtDLiLMQJif+HIZsNg+h0CDlm2
         4PQ3FqcAMbfoC2tHggzYMwDYvS66Stu+CL2ZAy1fY7/GuHnsyeKSZ1GabIegNUU60ZEF
         znN2xHjdCkf8MW5fit7spG2/exhS8x73T4lXpOMj1L96aD6pDTGuvScQ2SpGkqvvbcpD
         dehKLTQsgrOU+hF5XBPdsb9v0316KkOm4WsRQkMFDaEWelccjHWQwBPYSebLdZuT9oUX
         FExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768481462; x=1769086262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ihpgU/XH8/vMbQwTuQEOstZ+MAwMnZDme5L7jGlj1I=;
        b=l6fCqNYrkM7jL0t/CpY8j898z1w/zNv0w4HmBaUOwiZkRV1KJBokpGNE//X1rAGzWe
         VyonL261+6uRLLYiEvwsjHtyz6K58plk+4ovxwu1r0lP/9aTGvGoOQ0AGw+qWbZX4pZl
         OHd+9fVpALiDjKhQdrkWhUl1FuP5tLJxw11KCepnjmqz5CZSGfS3JTk0RhYZLcNhOVBS
         YJg8BoT23NP5NjYWMyL3a6z9K71txY+VXdWedBUPwNQWuHAjbd+JGM1enAw5oP/bFaNE
         tSLKLu3IruOPJB+qRzGL0wHGfJ3I3NoOEyjxfjtFj8pIf+NqKSan8c3eJLt5BxtgpTv2
         CFzg==
X-Forwarded-Encrypted: i=1; AJvYcCVYID9+ED2hyzLaeT9a5t3V1pLm5mMK9brAGZz6d8AVNBiO+CjYMp3huqylw4PqxfSxSFZ7Uzg/EbFxqqr0@lists.linux.dev
X-Gm-Message-State: AOJu0YzuCtn/eb8dQeD4HnS20VfApUZgqDN/ePZv53/pCmo+/ZdUTQp8
	oi24zgBri62fN/ea34v4yMFZl8npuUQYU4prl14kVH62b7bXumHSgx6Kh4TMFpDJFUj12PRRVkx
	nXnFJb+zPW06esTtEyuZAmMPpuFmPM7o=
X-Gm-Gg: AY/fxX5qWD2Yi1FDz1wzlGekdtpZH+dR6QRd9MbmeEvKKosCI6znZyA+Dp93P1/xPwt
	9oFUtBLFipNJK9ab2S5O39EP3R1fpc89nf7oz5E/2iyZ7UzJ/eTxoXkxsI5CfFanUFJDCbZvU00
	0kdIyTAsSvNUv1tRod8m/D49eFTULtrwFsPWM1mslXUp76U/RzDIMeIiZm+NIjDJomvMSxjFUjd
	0rUUcjJsouvxxfiCPNDj89aw0mN7D4dp+6hIiWsqFfIpan50LrWTwGGf/dUsKqZUbqE2D/8tA==
X-Received: by 2002:a05:690e:1699:b0:644:6b68:f126 with SMTP id
 956f58d0204a3-64901b1b0ccmr4522816d50.77.1768481461993; Thu, 15 Jan 2026
 04:51:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114171748.34767-1-karthikey3608@gmail.com> <2026011521-regally-lunchroom-5602@gregkh>
In-Reply-To: <2026011521-regally-lunchroom-5602@gregkh>
From: Karthikey Kadati <karthikey3608@gmail.com>
Date: Thu, 15 Jan 2026 18:20:50 +0530
X-Gm-Features: AZwV_QgQmeHSK0Y9SpY85bGiY58cjpqcX7XggsiI9jfwAkSE0vGXDVRNFOR3Tgs
Message-ID: <CAPsOcum71Rt7i+CcMR9-ZZOxjkfJBrL73gR7UppTrE5Wgz9wKA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: Convert sw_i2c_read_sda to return bool
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

You are right. I overlooked that the return value is used in bitwise
shift operations used to construct the data byte.
Since `sw_i2c_read_sda()` returns a raw data bit (0 or 1) intended for
shifting, `bool` is semantically incorrect here.

I will drop this patch.

Thanks,
Karthikey


On Thu, 15 Jan 2026 at 17:02, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 14, 2026 at 10:47:48PM +0530, Karthikey Kadati wrote:
> > The sw_i2c_read_sda() function currently returns unsigned char (1 or 0).
> > Standardize it to return bool (true or false) to match kernel standards.
> >
> > Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> > ---
> > v3:
> >   - Add version history (Reported by kernel test robot).
> > v2:
> >   - Fix invalid "Unix Antigravity" Signed-off-by.
> >   - Submit as standalone patch (detached from unrelated series).
> >
> >  drivers/staging/sm750fb/ddk750_swi2c.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> > index 0ef8d4ff2..9d48673d3 100644
> > --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> > +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> > @@ -180,7 +180,7 @@ static void sw_i2c_sda(unsigned char value)
> >   *  Return Value:
> >   *      The SDA data bit sent by the Slave
> >   */
> > -static unsigned char sw_i2c_read_sda(void)
> > +static bool sw_i2c_read_sda(void)
>
> So how does this call:
>         data |= (sw_i2c_read_sda() << i);
> work with a boolean?
>
> confused,
>
> greg k-h
