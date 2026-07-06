Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B94302E2
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331478; cv=pass; b=OcEhuTnPpssgO7QPt9CNscmllLSwUOCPj4UdgtTU5GGLeDPE+ijwz2HMfbGSM/pSK6UwU0GfmTyq1NYl/wn/vDFKGmdxRQmLoHts+raGCvxYH38NzS/pcQxFHcoo+huxSZrlb4DwI8jswgEiIMDwkO/0zOsOBDYm86A1nusEwck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331478; c=relaxed/simple;
	bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gbWNGjdeblFajlx4c2CxqqjuE3hmppuf/Sezf0zTmHi3LcdsbhY+LAeWWPrOdHgVpySABQyOeIWNfpuq7ICbBgyKFzMtFEjLnxAH4rB/06+naIJjmgo5bkxp1Naw+7u1OuG88jBYdpUNflLnCmIf9weuWKmtpAKudq18uhEG0cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDB10C0F; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDB10C0F"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso5670513a12.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Jul 2026 02:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783331470; cv=none;
        d=google.com; s=arc-20260327;
        b=To5/c3zsotrubSKb7rEEaJCiJxhnc98G/mZrxGzwZlYDWO0G8Ht6raKHaANG+WB+3t
         GciHbhRpSE4z984IllMoKk1LAy6qlazNuYMRipvwx20YY3FBgQnVJt9bQsEsxmkbNy4D
         djpKopVUat+0BvnrKt5wV1hRHymxZcSEmvAq+rpzAiemDBUwYV2+sQIpjWlDzPRNRHq4
         oIeug7ojJDsQzfSrLTWPkVs7R/6CxGHIOO6NgRB0JFzsmjns9oozQvTRUtEg6HQV9HXN
         HfZzVTESqxV8eWuddqFf3vb9bQHmXGiXGHVuAt5208df7I+X8K8ns1rpwWyh7znVPHxl
         tLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
        fh=uI3/af3GCOwtF9fgwXz2qmRwY8TmxeEgnqzM6GkYiM4=;
        b=GMdEuUcewz5t39EUwTPHP1FOJA2T6umNFoID820z/0cf6OWpYX+MzqqpB2TGYpCHqA
         hbFvxdYcb0UFrTp5QhElYuFcg1llixgmAQDpiHAKksLWKa6npcoSunztPL1ptlGSbAZP
         JlFPBtfCHrhdGRKShAb/1RZkkk406E6mVGiXeyt9Yc6m2mw0UCpU3DBA1oYQLr1D1UVe
         SrJFL9F0F8R1PmX462lh2mRd/c/EZnGmbGsWWyqgFaair35UEQhe9HUqwtLMhTZtUE+6
         XWbxSsRE1pVUKdVnyfhRm3REzHSmNr4wKtKPtCry8GqBHB9bJsgCIrKQY6QUGjFWKryl
         fr/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783331470; x=1783936270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
        b=rDB10C0Fb6WC2WY8/xpQXxQtEtApOZe9tfohqkDjCRUVaOlFrRnnfs0m0mKuuetXxE
         Ukli/0j8iL02F6jBOnOp05CyR88xKPBDim/nffH6TsvjyKCnNlcQc1835elJvIjvP7Vw
         4Uf76FMiWNidZvAFlJR+WXZ9mZOKP/czNrQrOBukExGRtn4Y7P3xaGu+DqTpeifTb5kb
         FnwT3emiIJoQIsL4tDiZD87N1x6GVErb1PR4tWPDULUh2Z6N5m8ZJtm2sSDUO8zjFuar
         tzk5aJqUGsPOjQeW7m+FsRt1OTF2edDvHahb2EYd0Eo4jrk6z4Xa4N/s3l078x5LoC1+
         fVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331470; x=1783936270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iahDzT5i5SGNAo4kex39xnwemNvckDKqa20uXv1E5AE=;
        b=CphQBdOLafVVQuvkHOTi3Rc/S/X3V+jW2ALudy4LfyOLsWevMK+ovrUXsnd6Waw8lq
         mZbJF4Oua/waTwwDJqyOrt2HMk/PaCAOJXgIhsETTyZ62147agp6x5gTVNvtx0ZjK8zu
         fjC7kL7t5XQ/0wo8fL2cEmS6c2yEQBjuqX6PsciFqUIS4UIiUTO4F02/heA5WmQmMYrq
         Shfxfnbe+3qupkSV5Sk8RlM8lhb5EFxAqCxpFknqLuNsylVr+56UPz90uMfQ5I40zPA5
         AltPEqBpraWcjJcH5mXBrn91VsiO/mATtgEJ6/hdtrniBvmXXyZL08+3+Mw7UKq6lbGu
         B9+g==
X-Forwarded-Encrypted: i=1; AHgh+RpzKJ1jYigCvVFt/n/hKt03rM+fCrIuEthzQx+nLnPLMjmWRERLZrPTKYPf0O6h1UzIuSOH+4HwAsuegzBA@lists.linux.dev
X-Gm-Message-State: AOJu0YxQQX/QbK4Hy4427RMFiFz45ks6g7XtkB89ZD9JFCSwGT/GF5rM
	4/6v/YvEXXuLuQK0fcYt/cK1Ce5y2w8ynTajDAg13DAhbzj9dIb5IxCaPdEnCo0yj6d1nWxyceH
	mySNzbYvAOl+dkxQYFswwCMGFRJU2rTw=
X-Gm-Gg: AfdE7cn7cZJpImZhxPZn6++gv5vaOr1OSQb9z2KO5kO44BGopM+e2Nmjaq+yI5GhSHH
	FkG8ph/NaSwxAGo22elO7C0qWW4dgCafh3BntA64bs+vi1bSLhdrHNUCkNfPF96FoisNggN5b/d
	qih/XJ3niYsk3RPSJR+baMIefgEe3d5/2gB5sNLyHk9yYfSQI0MUGFySAThtZaXvKkZsObLGYJF
	FRstG9pSNjnl1f+AuVkX/d7oWwcDvRZksF6V5kxmG19AgtZGc379nyep3ryx06RrbLKhchKobel
	Y60oeC4NOhlB8CKsfUtIBKTWnX8RdNujNY+I7OkfzjnZbeqvKaT+TLXsqQwjomMYAMmlLQji
X-Received: by 2002:a17:907:8d8d:b0:c10:10c9:6d8c with SMTP id
 a640c23a62f3a-c12c9ef80ecmr561127066b.28.1783331470033; Mon, 06 Jul 2026
 02:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
 <akkOdQ1oT0hIc0tz@ashevche-desk.local> <CAHxc4buoGJJ4ZUbvCz7EtcosH3mZWXp0NqFMfDBH1QV__0qDpA@mail.gmail.com>
 <CAHp75VfHKcW4BfgWht5wN=SY1u8=Jw4zAo=Sx0Fm_n0=D3pNWg@mail.gmail.com>
 <CAHxc4bt4ix2O_T6m4c9y+k8hqmx-C+iRd23mqVS-8Zns0DFa4A@mail.gmail.com> <CAHp75Vdh5crSErhWQ+pvEQcPek+H81hvoTeJC_2oxAE65ijaKQ@mail.gmail.com>
In-Reply-To: <CAHp75Vdh5crSErhWQ+pvEQcPek+H81hvoTeJC_2oxAE65ijaKQ@mail.gmail.com>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Mon, 6 Jul 2026 15:28:59 +0530
X-Gm-Features: AVVi8Ce7iwUyrsEwHvTqrYdzrnQMNe8BuEwAuAp8a-21GaLZ75nonaPy1ao2znA
Message-ID: <CAHxc4bsSmMeagAK=Wrzu2DCCaxt2xCgKXoJcAS_xgKFAn9LmbA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Remove unnecessary else after return
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	abdelrahmanfekry375@gmail.com, error27@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 2:55=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> I see, but please consider that to have in the future. The driver has
> tons of work needed to be done, but most of that needs real testing on
> a real HW.

Sure, I will try.

--
Best Regards,
Dileep Sankhla
