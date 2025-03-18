Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112F1DC9AB
	for <linux-staging@lists.linux.dev>; Tue, 18 Mar 2025 05:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742274905; cv=none; b=QfJoX2ztHaWv6DZM8f0pylROu2rvd0x7SGoZhAY1qsBhjjyQJXiuslS3v2jxAaKD1U7C/vOHvmjsBPO74T4RgO3cafoocKdT9FbcYSodVHDAoRRUwjcQbc/9UgJdAX5f33jOuDKs4Y3mNee8ERA7ZPflPu4yraPWLFQ3gqgc++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742274905; c=relaxed/simple;
	bh=sRo5AfpTLLl4UggpWPfYVdiOTjrouYBCBc+ap4nS8bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJlg5+ChB0uUUfn2qiHxiNQQF14Ud/Klc79+7sBh5lkeJkLo3+jSL4Fvju+URRz8W1d2JI1G7bx/L3C9pXThMZz7joy1P/tEZP3RNwzTiejmkIF0qTWfldt42/N3B6A/BOkHHWn0Z4bMFVxFask7eceC0IH9EJoew2QeaWCbk6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hm8kMHoa; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hm8kMHoa"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff4faf858cso25854657b3.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Mar 2025 22:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742274903; x=1742879703; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AwVcmAerm2I3agFAoKgR6VMg8KZgC4Z3oXuKqPYpdD8=;
        b=hm8kMHoaPIm+CmuKlYcYMtsGgL/d9Rix/jWINIz3qXf2PA9VZ5jbjJ3My0a1a8fl2s
         oNbhUQIjzSyxXHadOsWXTECB5EwFWJ9g9sBwxMZoyhAaa+JJtt0VrOfbld7PxoWPEu3L
         m5ivD4p4CRoiVN45li/aA9hcFwVxg7Car9nAPu3po/SEuvWewVksaQ9zjyNKt+o8WaQE
         Vv5M+/dz6e2+VJb2H7ZIk91TJ7O8NElltFTIV44wz4jWUDKEpBQa5t8CyurAOPRy2yMy
         AmysrghryaIzhyNL92Cfk9++IZzC7TtDlXcEiDbgeFg/Qj2trnHxw42rnLOJRcEFLinV
         IaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742274903; x=1742879703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwVcmAerm2I3agFAoKgR6VMg8KZgC4Z3oXuKqPYpdD8=;
        b=WYRsN8TInyi3CdGmV+96cTg3a0Sk82WTB1vfiV0iqtOyoZ987nfT43sTEjTHVXfHeG
         i3ZIZ6H9xeyrxmgaFSg/g86QbA9LW07K3QEuuPZxYzvynQO8RrPpXlVWlyJGv5qQFE2r
         SPFyU3iS0+HQjJn6QbZZ3aQMmKf2AYvGZLSzuVoEU2FiwDIZajEMY1DhrjpY3LXZe7L7
         HSsaKMb/mMeZT4HRwXjFFI19nT/aCifZ2+F8aJsG5ON1QH9kMZep+9YraWfY6dBqKwj7
         LLSaWtyZE13eRXSl3n2LBw+1bkQWJlFHadcdAd8S3XWxvbUH57rhiK3rZOHzonVEEWuT
         lkLw==
X-Forwarded-Encrypted: i=1; AJvYcCX02oLhDiTYrZAb0+mhynwPfvM84kLA6T5lwn99Mlkg+MNOaRyZx2hUjSmoVTB4AdrbDQq+UjsiUW675Fml@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlq9VfJC8gATbkMnrdk7arnA+mqIRp2ii3V/pxctiYRAQsxkZv
	MBc/zUHHI1OxcIlmd4NwmyAVqRAAlYSMMf8q1s9wDMSsaHODoRkxxnIdNjzHLEMtb7nXMAIpP/I
	vpPHbYnFd3f27Is/bVbPlRQobaMc=
X-Gm-Gg: ASbGncscAx5N3kuASeJ+kFZYC4cZEDt20bdZq1Of8sGBzP3tCrSPlqFY7+LHaqp1sAO
	QhZgbMR0RvhaJa4feTQ5HCzTf/vu5CnbOwYldGRC0zkGS6jW2OrilVyirziVwbYVwlX0k6aWMGN
	0j1RurBdIbPikW8y4NAZHmAuA/gRw=
X-Google-Smtp-Source: AGHT+IGG/1GbRgvoVaxsGWyKRWfKIbVXYiO6rz0S7vikJc/SuS85IPUmS1Xp+tx3ddDJGAUm34NArPeLmt/pRGkfhkM=
X-Received: by 2002:a05:690c:4d88:b0:6f9:afa2:acbd with SMTP id
 00721157ae682-6ff46025a67mr174369027b3.38.1742274902874; Mon, 17 Mar 2025
 22:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317173355.157536-1-simeddon@gmail.com> <Z9j52jGqft2jvT2O@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <Z9j52jGqft2jvT2O@debian-BULLSEYE-live-builder-AMD64>
From: Siddharth Menon <simeddon@gmail.com>
Date: Tue, 18 Mar 2025 10:44:26 +0530
X-Gm-Features: AQ5f1Jr0fox1K1wNfHQ3MOYiau_4uQjmxtx4DQjmQLB8gvNqc53ard16Ia1hCp4
Message-ID: <CAGd6pzPFdPGSxn13r4b8mA+do1KCpjBgGp6iCDfkHuAyb_nCeg@mail.gmail.com>
Subject: Re: [PATCH v2] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Mar 2025 at 10:12, Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> Hi Siddharth,
>
> On 03/17, Siddharth Menon wrote:
> > Refactor code to use the FIELD_PREP macro for setting bit fields
> > instead of manual bit manipulation.
> >
> > Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> > Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> > ---
> ...
> > +#define CMD_MASK_2   GENMASK(15, 12)
> > +#define ADD_MASK_2   GENMASK(11, 8)
> > +#define DATA_MASK_2  GENMASK(7, 0)
>
> DATA_MASK_2? Did we already have a data mask?
> What about adding the device prefix to the mask name (e.g. AD9832_CMD_MASK)?

I'm sorry, I was comparing the values in a custom driver and copy pasted
the wrong variable names.

> Also, this patch fails to compile. Please, apply your patches and build the
> kernel before sending the patches to the mailing list. Also, run checkpatch on them.
> E.g.
> ./scripts/checkpatch.pl --terse --codespell --color=always -strict my_patch.patch

I shall send in a new patch after testing.
