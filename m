Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E04133D4F6
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 05:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769752590; cv=pass; b=FpYIdUHTqxkJT6AE6kfvExrKJEdL/AyIU0qfjUJZb0zQ7GUo3obdKnduAYEboji9XQToA/WwKgmaxuC0qm0tPITZXbZFQ9GToS4F6QxARly2YvsGoxf6vr82JXYOrXeHVNrlNXlmi0r16PNdRm7wrVoI95DT6yksGP13By200hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769752590; c=relaxed/simple;
	bh=PVwMGNmcLYyFpDdZrVu+/rxN+2lMfs+tzu+FcpUUbag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZI/aJdNH+0r9/m4/a5vzrI8HthT4CTSneY4WtCnfHSo5e19j6igubMgh3b3zTmOEYw+H5Yd6jXB6lrVUNZjcKU5XFgmH3BsrHq7UHFjg5JFOti+fQMGCdL5KXq4BfhBJpm6drR/Lez4Qa3AiOUFzeUruPZQfRRRA94ZaaOXKjQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6VQTnXA; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6VQTnXA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c626bd75628so621738a12.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 21:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769752589; cv=none;
        d=google.com; s=arc-20240605;
        b=hLNRz2TvkcpmC8woPXIinmuXKG47rgiaJBp0Y+NkqO7okTLql+AvGq3zB8m39JCbM8
         tf2XmYaLWiYQkRO8fk3vam4eT01k/95JwzXuKe124EbcHG1RGf/8Q9yhvsKDd72kEwPr
         UFl+lie+JbYoJJn7S6zE2BjfdkHgkjoAFnv1oXMWHa3gx76JbLTM1QcPnVSbVrkPN/wA
         mLFuwxi/h4/RMw8rvSprQ+9YBGL73eFK3Xs2j+kU65b7sKmKO2sJFK4zGB5IkfBSjppu
         GQ9V6mEKZAuqX1/ORZDydlQB97C/naoaqLAg8G89Jgv/+Oyqb/aytcsXgW2o95XQfl+m
         tU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVfZXlEsx5qHhGtM44YDy4BKrfHI0lSH4U1MLRwvu8M=;
        fh=XYXub+R0zWFTH/JSVoCalL37XLKXCD2cHrF5OX5kHfU=;
        b=X8H0fZHhfd8Q1EI7FnSY2bUAjs/3oQ8cKqCTO+eq4hNSPeJpzHfi1ZdAzBWJZ9iekV
         Mgi1RhWyrDMcLHgzd6czTNv77pdihc80Vn9lAmAo+M7BCeGoSsAP8S5yyfKHUcoCKJVg
         a6L2do12FWeT+tzPPAE5gfIh8gg3NsfTZrtxnidgcbsaUeTVdINGtiI6KmOo448QO0hp
         VUrsjEZl41iOW9pl8RB2n0horurv2Vc9VuCnjMBs4nEY51ScuvfEEEu6WTaa2Trv4A2q
         VTkb47cbOeSsoPN0omHTdL3fLrSdeITofOAwBFs1E7o1+MM6c4SY1vUt34Cm7E9KmlBR
         rf0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769752589; x=1770357389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVfZXlEsx5qHhGtM44YDy4BKrfHI0lSH4U1MLRwvu8M=;
        b=O6VQTnXA2GZs+mao4eqV7OFBGh5n2heDr7kZDXuGCnmtK7Jt/oHphvac7yfbYnUGKd
         mgzOrrG0vTWp4Tgtx35AOIrv2stxYltFTsq6LFtCegIZuu5gHktTvs9A+2+hYlXoyn6s
         U68L07MuLlsiqlUySpmsvZmc0g7XAHXMuqQfts1hczWJySa6sv4Rl2qVUXpyEOAOjuSL
         7fqlpLrs1Qs+lfHdJMcRaPeiQTAv3kRADbQlsFHz0gL2yWENr98jTEqZbPb1hSjXkYk3
         R7e+2apUzgpz42YcQ7AUOZG9aVq7sCxM2wjzg2+3+8BR5hw77Qyvbex+pjJhouZVRq64
         8Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769752589; x=1770357389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVfZXlEsx5qHhGtM44YDy4BKrfHI0lSH4U1MLRwvu8M=;
        b=jV5hnq3GlC8hPp/z4o633Swf8L4tMHeWjXBwhE5++DRYwsF71HKNU6RuX2/rhynXuy
         xSCeoXMOuxz1eU+LhEbX90C9urXutoIm8qDct382Axs4a4FWQRopGlB+W0jMcrZzG/DZ
         CeyCv8ZHdoxTfYV88IWGtDsS41E5+MLci07zEEaz7RzVU5eDsuWzHQ3aF7HMmI+h0n+S
         zXuGmMYAkw/zy4YcrHmlEGf+otfDjvVu8jIiW0RQOOxXRPtaaMpfjNeTytggSLTRHLo+
         RnkdzvXhqpj5LAE5Na/Gv8qyp3Lx9L2RIukZPRT8tTPOVmf9AYXLGXy2cOZSrZf+qPgz
         lC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXk1M1eOFG8NE7rks9s/w9snSc8/yK/V4wbFe0kvuVDt0zUnfJBhVjrgPULOvaIxvwS2dUwNMhltZNuzxDL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/BovdWU7zyPCWSkC5Oqrk2OMk/W7fmHd6Ui6qDJ1EofGyvmSz
	qjfQblOF/lDO3ENhf3TS2AaLyQ4Uv5NONFblU0W3YXstB+TGy12qYT9E2/zO1blpb/6hN9xWjJh
	xzbKMWPmvD4gA6t6CtKmEMwlRo4OEHg==
X-Gm-Gg: AZuq6aJ4LT4c+Zn/wj69dWANebb1a/YUgDQ4jiJPTYd7gSejp4fcSRMarUlMg/W2C1L
	8PlcWD/3RnTBmma1lxhk6hzTm6I7tJF6wEo6ame2LXpnABF6wH/T+/Z+qbEFYsM7Jhy4pMgc//W
	Cihc5P1iMEda8vnCdqHbiGtPtOHdof0lnywvYPDE+2CT76UpcIckLiJftzAoXYOMOlclVXU9ckm
	bwiSeR+4RfGhluEyEaF/cgiP5N3QjVvVi+Dc1Lp5LnuQw6PxxzeZqXTbTtixlNWGTHjf3SZSRwe
	tkomWEeBbjQFPZTJetKUfKFxr0JdWyvDD2oxaQ0yOhbTT2PEQ/5x
X-Received: by 2002:a17:90b:3bc6:b0:34e:5aa2:cf68 with SMTP id
 98e67ed59e1d1-3543b3d7ce5mr1738782a91.30.1769752588629; Thu, 29 Jan 2026
 21:56:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129132352.14615-1-lukagejak5@gmail.com> <20260129132352.14615-5-lukagejak5@gmail.com>
 <2026012925-emblaze-barrel-46fc@gregkh> <CADRnA91+NQ=DLRSj+9SoTMBAEKDmzFiX98XR1+YCM2tgBiyDTQ@mail.gmail.com>
 <2026013030-suspect-chatter-02f3@gregkh>
In-Reply-To: <2026013030-suspect-chatter-02f3@gregkh>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Fri, 30 Jan 2026 06:56:16 +0100
X-Gm-Features: AZwV_QiVdErwjhBXHmxmmoSg_hh3LATdaClXDAc7jdVNzCRiRP0aWLW5-bLmUsA
Message-ID: <CADRnA92+uALjFwg1V2FF0SwSvGaCDanF8bHij0bY_q17wLgF8w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] staging: rtl8723bs: fix out-of-bounds check in rtw_restruct_wmm_ie
To: Greg KH <gregkh@linuxfoundation.org>
Cc: straube.linux@gmail.com, dan.carpenter@linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026, Greg Kroah-Hartman wrote:
> Is this really a bugfix? if so, it needs to go first, and be tagged for
> stable trees.

Yes, it fixes a potential out-of-bounds read. I have moved it to the
beginning of the series (1/5) in v5 and added the Cc: stable tag.

> Also, why invert the i+5 check?

I moved the length check to the start of the condition to ensure
in_ie[i+5] is not accessed before the buffer bounds are verified.

> And the memcmp check is now messier than the original.
> Very odd indentation :(

Understood. For v3/v4, I have dropped the memcmp change entirely,
reverted to the original byte-by-byte comparison style, and
fixed the indentation.
IMPORTANT: in v3 I haven't deleted variable i that causes error
(-Wunused-variable) upon compiling. I have fixed that in v4
which was sent on Jan 29, 2026. I would also like to address
label issue you mentioned. If you consider it necessary I will
remove the security fix from name/label and submit v5 with such
change. I will be able to submit v5 if requested at about 13:00 UTC.

Thanks for the review,
Luka


On Fri, Jan 30, 2026 at 6:26=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jan 29, 2026 at 04:35:29PM +0100, Luka Gejak wrote:
> > Subject: Re: [PATCH v2 4/5] staging: rtl8723bs: fix out-of-bounds check=
 in
> > rtw_restruct_wmm_ie
> > On Thu, Jan 29, 2026 at 02:23:51PM +0100, Greg Kroah-Hartman wrote:
>
> <snip>
>
> something went wrong with your reply, sorry, it was in html format and
> all mushed together and not in the in-line response format, which is
> rejected by the public mailing list.  I'll be glad to respond if you
> resend it in text-only and interleaved.
>
> thanks,
>
> greg k-h
