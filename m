Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87AA246788
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783183698; cv=pass; b=jOcjRqIN0hTA1U3zht/y3e25McNhmntLwGxoCn8U87YvEIYFN5RU8i2u5cmArHaV4TsbOdY8IVlZZWSFC7pw/PeKcesHHcfxlLjw2fKNAL6qHIb858p/YnGQMG0hkQCMPW7Xkmdth2rfoktVhoVMS/eOiCHzjuEcy/EREk634zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783183698; c=relaxed/simple;
	bh=6u4HdF/D8Oe74jbT858It60RPJgVighEcTUvgQ1cukk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKRNWCWS5kyDlHVSuUdgGQ3qzW92+y7KDbYzoKYbBxaxZvMFEz/8cjWGUQ2FV2U9xN/9rKViPRPoarSpIAvJre7BZddGaPulzqQlRFwd8YlU31b+EkRBPqFTKN9Wctn3iz3Q4WtacWdsaP8QaXmNWz+fUYe4+sTSBCfGe8JtRgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO9R3Uls; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO9R3Uls"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1276b8c7e2so146234166b.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 09:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783183695; cv=none;
        d=google.com; s=arc-20260327;
        b=Nr6xyfSexG2/NY2TM+GzB/GgPzc7WGBj1ZpDb8KyhJ19OzBG/eTh42zgGbaRtSKpR3
         y5djT6YMubGfA5MFwA6PZXChHFPHdOUOL6OX0CLUQwzF/G/VqHbXClwTBIrKDOOZA4rN
         fcVs42+vGYRzc7JdipYQkNI2OnN+6tm7JUkITBne11bq9Fk+0KjCh9MZ6POrbrBPoFMO
         7TVdMSY3wigzWxzuqDze6J1Ii2onsB+y5NVQFprZzT3uuvMuglNXy7vDVw+Kabmx/7A6
         LAuJ+2oAhhhUANvIXyp6z3MNXOQ1MCO5kXkCHXf3M/wVK2laS2Xl0P5A7i0/eGm/ulOW
         gPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtFcRccVXWV3jIWFIefXiUO2EXyRDVKEhdr6p8e27VY=;
        fh=9gHEoU+HFZN17rilYoLwhc2KPvHqNZQcu4oe4ne4uDg=;
        b=AxcnM7Nj8h1Czpp7OXDbO3WXKZ9V37+owAJVr+VHDAp3dYYqVnqJW2zZsLLYDASRn+
         kiMCozRZSJqGZFlKLDi5V8y1jbv8464H7DYF35jCIBffEpWgilf8MqdVx8Gk7EwH+YSW
         jt+czcOZBbAsNB3ThsPruh6haMum3wkJ8x8+jp71cGsoel1cqDWMWt+89JUmR8pnnjTl
         sltjIR3kCLvEga027jg6sz93Qseb3qdINizwl2y75OUfJqr1YIQKMyQ/xP+ujjNZmGgx
         1FILW8gAR7f6Nm5YS9Yl9kq5KSKhLKzAEKceyDXj6BqApXC8jRz5XVOJAjRWExgxgTvx
         nrbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783183695; x=1783788495; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtFcRccVXWV3jIWFIefXiUO2EXyRDVKEhdr6p8e27VY=;
        b=XO9R3Ulsm0Z6QrMVQgnqizVYX9EWLEvcoZC/EFDR3RERvHPoWe6VvKnvmUWOwWPTq0
         RbCOvVDDoAdGf5F6OaMlRIZsVoGIky8grEihiUHaFtIqPw1ON/xag5XuszObZ5E4kE8E
         /8k6I7DltSSxt3XFXq34RQkpA+qZW8k35nY/rEBXSlGfKC8Z3qdBeLezfk0W+ON9ldAm
         EEEzDBcYBmJHRdaT3hjNKJj77lKcPRgWjEcNeCF+5U9mA+vrPDhPHz6pUy1eJ33AwJUZ
         n0me2Oklstymz9kYZ3LPXrqLzm2egONJmTYlfL7gVFgjAm3qjINT5x/e+BM5HOQocpbl
         fdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783183695; x=1783788495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFcRccVXWV3jIWFIefXiUO2EXyRDVKEhdr6p8e27VY=;
        b=rL1MouHkt2RX8I94r2yeH2xxD8wPkpZpc7SCM73fS3Nb109q3Sh2GY6+8rahclUwpy
         Pf7n60RG/SgR47B09MktLIVYtq1YWikiQmvLpln5xgWRX2S0Vs1hU9P6jNJfrtg6Fwck
         Jff8ojUz6FILwV7AJCH0IIljVf4e0noONAe7ZIUCz3HIJCofsUe1nSqG1E9n3/N+Q261
         sT3oNWK1umo6poU5Kznt4LK6M0Wfac0UstlpVfoF7KwJ9Fto4XirSY6O5hqkmFXm7C79
         fKIYDE9oEuuaK3R8zevah5tEBso0WyL42U4c0docjI5yRAbTT34WNxOANh2aaj6q+D5b
         cY9w==
X-Forwarded-Encrypted: i=1; AFNElJ99OyzDXJY//GUcNk9o+EOnkljLiopPUAN58ZHkMCUPMExSeOi2ChNL7MNLJNdz+FNlozRCS9UzenBbYlzX@lists.linux.dev
X-Gm-Message-State: AOJu0YzKhmOOrVJH1B24bUMHqFZniTSFP6v7GiMfPe4q1TmlNrX0xUIY
	SRgqPM2Y0Dx/BxG1+5BuRtGiMJkMiaGnd1pQs5jy/1uFxpRRsnSq/fCbnjVzxzoYEwB4NBBQBuw
	ot0qb46unwv97oehoHnft47Yw1ChBvh8=
X-Gm-Gg: AfdE7cnkPu8lKbugBxPieGO4R9O4W4znKyQ57bFmoAJlEYHKNQyyc8owhd1bi9ZnpCR
	KCcxY9A5TjrAV1u6oDv0SioGTC04v2JXVOe/Q0NW+sjyTzdL61OtMB7isTDvFJPIJZPPtT5fDuc
	ezKrXapl8BzoRmd056Hu5NAKiVBrAS2JQZVLC06VLV5TWOU4cPdr1qvW7dtU8xnKbKhnZSAY0Th
	3U67Swf1OWAbux9y+MamNLPcdz1uypy/xIMgbi+fFHl1iPhU4gjyVaucMBhR2at2WraiyuHq+w7
	PYFAh5JFVme/MSPiDIAXLHUUlrighxjJGrwDEDlAt8szl6dj0gBvP1OZHeHPcqwGFAp/PMGsRUa
	MIQY/ebgQt80x2geZqw3wFswY0OjIJ6cjV64koX/fYmmScRptuDjS65jaVA==
X-Received: by 2002:a17:907:1b08:b0:c0f:cbe8:7832 with SMTP id
 a640c23a62f3a-c12e6c773a6mr112448366b.48.1783183694777; Sat, 04 Jul 2026
 09:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704140055.88080-1-miraly.dev@gmail.com>
In-Reply-To: <20260704140055.88080-1-miraly.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 4 Jul 2026 19:47:38 +0300
X-Gm-Features: AVVi8CckRQ48RpwOmD0TBUNdiWh54ywDxlO-NJIYdI6QAynFVo8e2ykyMTUBNRk
Message-ID: <CAHp75Vd7-nLUnM=76Lr+G+sBxw2aPEBAwBJXqkM-JNRYHqx56g@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: clean up atomisp_v4l2.c style warnings
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 5:01=E2=80=AFPM Ruziev Miraly <miraly.dev@gmail.com>=
 wrote:
>
> Fix checkpatch.pl warnings in atomisp_v4l2.c regarding unnecessary
> ftrace-like logging and redundant else statements after return.
>
> Remove dev_dbg() calls that only log function entry, as ftrace should
> be preferred for this purpose. Also, remove the unnecessary else block
> following a return statement to flatten the code structure.

...

> @@ -468,22 +464,18 @@ static int atomisp_mrfld_pre_power_down(struct atom=
isp_device *isp)
>                         __func__, irq);

^^^

>                 spin_unlock_irqrestore(&isp->lock, flags);
>                 return -EAGAIN;
> -       } else {
> -               pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -               irq &=3D BIT(INTR_IIR);
> -               pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> -
> -               pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> -               if (!(irq & BIT(INTR_IIR))) {
> -                       atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0=
x0);
> -                       goto done;
> -               }

> -               dev_err(isp->dev,
> -                       "%s: error in iunit interrupt. status reg=3D0x%x\=
n",
> -                       __func__, irq);

You removed this one and the above branch seems to have the similar
one. Be consistent.

> -               spin_unlock_irqrestore(&isp->lock, flags);
> -               return -EAGAIN;
>         }
> +       pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +       irq &=3D BIT(INTR_IIR);
> +       pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> +
> +       pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
> +       if (!(irq & BIT(INTR_IIR))) {
> +               atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
> +               goto done;
> +       }
> +       spin_unlock_irqrestore(&isp->lock, flags);
> +       return -EAGAIN;

--=20
With Best Regards,
Andy Shevchenko
