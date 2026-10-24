Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792852007;
	b=XmYgfz80hP+OZU04VZQWtjxQbXA8SpLsbAFYymTENZOVBkcrfX63uyGZRmVjiUZnm1/q
	 y0sWxwVq59orgQDztAVwIx91A/HnGULc0cfQXr8Cn/WX5Zm1ffFVvxw1RTuAh7BzDuOxk
	 sovopBExMW+2zKEFHEyoeNQY5hQg4MBwrx+yzsaQLUgS5Reet/ZIZB24OrvEKXRkdrwk0
	 y6ThmTeUNq84ooEIT5E25NAUC3pIOp/BJlm4kXtxcZlG4mDYKa7lMD5lChmqUkUapBONl
	 0pDmlFoTTUwGHVvDyp1tytM2WlAwirpSWN9XbSAYpJgAAMPUWNXXiWLtu5FBDa6q3Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
	b=mvpDo09Ztt5RTYBQu+RB/CuIMFJRcfqa1F/cS2QHZoW/2KtQb75ioIeVR8hMo/HcSCtU
	 QToxrO6SxH+gj/lTcKZyiQ9eIPqViNH0QWhwvzXk5BQMVZ7NsdxtmR/YBLZg/NOH1lWYf
	 fo5bbzFLsavMTMqQXgZ9wWGUOJT18xWK+yJ0EqNQqj8aiqTANaVXBKz+neo5y+3rzCyQl
	 zZBkUjXajVtvkbvtyah6tAwv82Li83h1Uq/BcXIYb/gQPVJa7KVXGkeZ5lFvQT8/ICAaV
	 a5RPrSBsdsshtHkGsJ+EOt8gVFo8D6LgtvLvF3Tdg0guJmrhEfKC6xtigFWrgGLk+/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="SbyAO/yQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B2606A31B
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 14:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SbyAO/yQ
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-70b875f6f13so1031340eaf.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 07:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792852006; cv=none;
        d=google.com; s=arc-20260327;
        b=WDIte/A88iQmYnnID3wye0FU0yMflTFvTe6BsS7rPQPLG7lbzi9xGBUiORpUpDG/iS
         AfJWj78gR7zGOEPttkjkquDS0zCIDcq2KewDjFYi5zi69IVDKDUVRPvPutfpbPsIikoE
         +kjpAzYOqLZ693Mr+5FCDvz1KCWKKK62WsC624Opqd1E+iH4b4MA7QuN4mMV/slY11mI
         BXJUQTkoCB55toGorCDciXa8hFBBWKtfCYAYPLxiaX1Rf6aKNWgLJ7esdOWndzJGgM1m
         eajmyJC6FglDr3aKoSOvvQ5/oGfsTI/k0RLsKUgmeCuMypdM+0pfBvuqIOzyCUj2ITbp
         0Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
        fh=NvPOKVrxFmP3Iwx82d9VQkes35yb7Mkc+rnxrgIr890=;
        b=s/oajaUjFnsrvevl/HoP/6+k59URybEKrw6L8eIrPOf+09y8GJJKTbV4TdPETjmfr0
         q33uOkVZPQgTAYpMEc2VtCEDnsmtx/LGrruNkQv9CCXKVeRLj2HwNPbVrn4VYqTN72jN
         lSbV8LnX7eTvi14bDpKJsMCSn8nVrp7I2ULgX/rE63s+SmHvPLv7x/+f9/BdPSwl6iz3
         D0JGzxjySDLurP94CloYt1xQeA4aRxHxft8f85i63/PBfpbr7/cmV9bhEMNoKE03t1p/
         4c7o+AikZ+/PHnhfjcanZV1HNk4Rg7M534ZcVyEUcCm5ZuwHV818e2Mp0yp+PI7LgUnK
         2Pow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792852006; x=1793456806; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
        b=SbyAO/yQ2v9wEmiYj/2C9bfasy+JZxc00bYdjC60RBC1UFeIdCZyhRI+yE2ptrMUV4
         2KA5cpCIDpbFuPnVVbmj+/mPmE5FqoeRxCA386dQg7nsd2h2FHqU/jK7XN+JY2SOI7iZ
         8u3jgkZ6s6nrx+XVizeQP3IV/IJmRMJv9fFN0O5Gz5wUFMDdWlsZFpWf0Czn0LXq/34w
         b1i3B1O9t7dhOaBZhYJLKkKjaPS3u06ovKVPSHB8YmAmemuEVmhKT0FYBBK5BLzAIhpt
         POocJZUDbSBfoTf9mKKvk2JApZhoZJQvR2kJSHMHijMT0y4XVV32OGOBwraG2R5M1G2e
         JvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792852006; x=1793456806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93XTeLUJKmkMQYlViuECaN+uLdlXc1eW17xeu0ZWGzU=;
        b=RbuBGTXQXPAGNpl9RwZaInyWOlXJaUUPguGNxXfyoWDfPvoK1/dDoNPQx0bnx4Z4gA
         30CwFEvDRJ5e4HQ1zrEZnJ+hWdtCsMTFnDzvZfQpSGosFEuZxVT1JWWNWQfdfK2i26xF
         wo75yO2/vSpux4hwlyW9FZ13bD0SlGXGuns8TkLiCiygAjMXDFou00ckTqK+Zo+9t4Jr
         SFLAwbm6xMTapdGisIYYBGMvra9ipl+kdk9Vr1hp1qRDcaA85tTKOTwLfeDgo6TbvRjA
         XoSzURxzOed3WNkJlBHrmJRg1a5pWYjb8fovacHwYAI7r2x7d0m/YbLeJusLIrew+Cz6
         +j/A==
X-Forwarded-Encrypted: i=1; AKwUvBysegDo/fMAwrmU4YTEFESNnocS3i47R0cbyipBHESSodNKBzSxg41xyYwNR8nvQIrivuyTGQHYNhzN09iW@lists.linux.dev
X-Gm-Message-State: AFq9FYIuIjfVbI4b/SPAPVR9Y+3o+zM0iZtFdfUT24CfsfX5yS9OFsmP
	ayAEfIoacwwQ5YR650511uDoBjDkmo6Cc7jdPs0OSnA0RCp2gZN7kJwHAiylNlTHRmoBbJ40C+K
	DoxZ3cvo9sIEXZWQdvpkZbpjTUcE86Zw=
X-Gm-Gg: AYBFou0g3iLAdngSJiSbagBUXSFn5s/d309whEPOQZt4pazy5xvlp1hei4z/p6s+wBi
	rBRPitNGn3NbRfIVC5aJscQWwBJn8SUmWCcz9YRSdBHnU0GnIS0XcqTfuOuUT8HU6i9YCZoqKiI
	K+QL2ddAHslVcQkAAwCe0hs66+yG8cSTqbVWmDagkPQH36VA9N8No7ZhVJwBsxKzbkwUrNMEccN
	xOI2tWAQLI00fvdTvSXXeNTnMFSBnguK9LnoUBNWE356M3pPYaSceRkwckbzlF533be0iACOm8C
	l0Gerx04L6XB482wjNYEYELttKaAkilMju2DcgE9NXzRHFlisFQTMDv6jjtGhR0zcQhsupRaG2a
	rtIEIgVxYvpdLQSiohKgCv2c7by34vS2WxsWoLlUFUw9NGvVw29/0PLJpCRLcHnZkL46P5ymv0x
	jqJmMZQNpldaYGfspI
X-Received: by 2002:a05:6820:740b:b0:6cd:3fdb:fa6a with SMTP id
 006d021491bc7-70ba0f580e0mr687530eaf.85.1792852005887; Sat, 24 Oct 2026
 07:26:45 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024073549.29531-1-himanshu.bakshi478@gmail.com>
 <2026102448-tackle-footnote-9ca0@gregkh> <CAGLmz9+J-s98cT_ZFHF5EU7t=beK8m82fjq20+n5dmncdrMSEQ@mail.gmail.com>
 <2026102447-exhale-overarch-8ce7@gregkh>
In-Reply-To: <2026102447-exhale-overarch-8ce7@gregkh>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Sat, 24 Oct 2026 19:56:33 +0530
X-Gm-Features: AclHuK8JmRrrQFyrUfEN_DWwoARda0TGIesVXvInZouzCX2AOxXXYX-vfgnqmK8
Message-ID: <CAGLmz9JS1rGR+fM7Rm5FXsFx4aDZuMoYYXH1HJ2_8B+WT_n4Rw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: clean up PLL calculation code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thank you for the feedback. I have read the discussion you linked.

My motivation for this patch was that I found the existing PLL
calculation difficult to follow when I was trying to understand it. I
wanted to document the formula, make the candidate-selection logic
easier to follow, and reduce the nesting.

I understand that making code look cleaner by itself may not be a
sufficient reason to change existing kernel code. I wanted to improve
the readability and understandability of this function, but I should
have explained the concrete benefit more clearly in the commit
message.

Regarding the LLM, I used it to help generate a standalone
differential test for comparing the original and modified algorithms.
The refactoring was my attempt to improve the code while learning how
to contribute to the kernel. I ran the generated test, but I
understand that testing copies of the implementations is not the same
as testing the actual kernel function.

I am new to kernel development and did not have a good understanding
of the contribution workflow when I started. I used an LLM as a
learning aid, but I recognize that I am responsible for understanding
and justifying every change and test I submit.

I will also make sure to follow the mailing list's plain-text and
bottom-posting conventions.

Thank you for taking the time to explain these issues.

Thanks and Regards,
         Himanshu Bakshi

On Sat, Oct 24, 2026 at 7:40=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Oct 24, 2026 at 05:20:41PM +0530, Himanshu Bakshi wrote:
> > Hi Greg,
>
> Please do not top-post or send html email, the list rejects that.
>
> > I found this while reviewing sm750_calc_pll_value() and looking for a
> > cleaner way to handle the PLL candidate calculation.
>
> But why does it need to be "cleaner"?
>
> > I tested the change as follows:
> >
> > Built the sm750fb driver successfully using make -j2
> > M=3Ddrivers/staging/sm750fb W=3D1.
> >
> > Ran a standalone C differential regression test comparing the original
> > and modified algorithms across 2,010,084 test cases, including
> > frequency sweeps, boundary values, and randomized requests.
>
> Ah, you used a LLM.  You have read:
>         https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
> right?
>
> Sorry,
>
> greg k-h
