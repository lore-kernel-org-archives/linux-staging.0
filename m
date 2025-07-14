Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BC5265CB0
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515573; cv=none; b=bgAye07bZFIoDN4Gmlnkh+O4F/012/jsn65h6wIGEKoveS8Igqcxl2KcnhxPVHaGCtnSvKe+ss/lau1BrMfMH4NyGurgZ7XGEUI0Pi14VZ3cMKPwfd2jKH9zw8eNvlbweag7uCprOtZYBA5af93NS93b+8FAQAlxDG9w7TU+Hi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515573; c=relaxed/simple;
	bh=zCq/2mZHq/ntY8oalHFxYBS1i74/ZzELTNGs31STKs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOE6zxSGbNlYtdFWlwf7LWD5pfTbz/BJhyxiWrWvi7kv5Zjrw5bhGJFbE2BfuDaEFbqoj0X3LETngMs6wsh86kM2c9tje5K2wAxLwBoarhFj05dJlNvNNcw8GApos1XZ4lRgB2nW9H3uzEmMt6dxZy/T1tDKzwOyej2esksTheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9opT41s; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9opT41s"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae3b37207easo938402966b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515570; x=1753120370; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCq/2mZHq/ntY8oalHFxYBS1i74/ZzELTNGs31STKs0=;
        b=j9opT41sPJ8bNdbT3ky6FZO0P+ZLW/SE6NKel/eIeU+J/bE9TS1N0hTah0stc3yrqU
         HzQRvTplK6f0OXodfszxEeFNp6PQiAelkVtyi+0YM423GSzIAq/bOvwfcDr98Xyrs1um
         SKhRHbQXJcQH47jXZMtjeirV3Zj/26M7v20mlwKjj0HfO7h3KlmJd6rJgbYvQVWpaY4M
         mCgpELNATVLWnSG8ddrA2G2UEO0zAwTfuP+dIsq+BEjP092iUQpTVweUIXDCRertmxFQ
         UrWkh1dv8kKR0o2OaXadH1RMuQdFzyWzkG7JxtPCHVpiVq3AvAQUsH3u0zBJE73gqj8A
         UtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515570; x=1753120370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCq/2mZHq/ntY8oalHFxYBS1i74/ZzELTNGs31STKs0=;
        b=kNixAJIO7xv6OEQWmtcqjg/9C3n9ETJ4KkbFq1brlBjNP5J8mws+Y6oRaxak8zCERt
         FsTELLvKCssZvR3XuaBErodBHuHAQYaKG8KFsAUWlRPQvkdnbOggs7pAJVNQqKbMUUTm
         ydKK2YMi3KEcPCLA8ixM9NaXZ4auFTTzNhL7HFTDruSLNqqcj5sZuS0Uv4ONiWYt+jIJ
         +fIklZWJ1hgKHwX43geoK1ybcJ0BJPE1+mKXbGParZSiBwyOfYHBH0kUj59A+KA6607Y
         E0eZ8haoDRvd3xFKOYyWATCqzpL+TQKjjoWEVsGcydWOd2qtz9PftILqp5LlM+Dc1paJ
         xSdw==
X-Forwarded-Encrypted: i=1; AJvYcCU0LE7D03TclYXl4xu5WvKKci2AEXxFbRImcef0f6p1nraJK/RHxF5Ax1cXaGvAN0UxeuYhRT3OPbI9k2oZ@lists.linux.dev
X-Gm-Message-State: AOJu0YypcOjFrWcsbm1BTVlCiV0xpF8Xqh26FqkRfYQ60xNFzy/Trzu7
	4PNKvuCbuzzA1W2Yz14b7jEb5Ii/8ptceHUDhfxPbHx/u66ODx99oghcdIhvv1hUj2TjOfKjg5C
	1KxOhVjEvzBR95fBcGuDy4IsScbTRFtc=
X-Gm-Gg: ASbGncuayyAoPdE4LuZ13rdGIx1d6kPHap8j3BkJVH7zOf3PRdBScakaE1Jmlg4QkJo
	RdA94ZXZdkWm7o3IiP6GgsRAeymoM8vV4zCLGWLw1oy80FqAGxY6gx3jDQQ1HA6Venm1pkFbLIH
	2ogzhz90DB9AA56XuREf/IoFN6080Vyi5sESpjSLLOb1UHf0xp+vq9z9zfwPpbNxifKYp58+Ox1
	IlDlhg=
X-Google-Smtp-Source: AGHT+IHppmuBJAVnvU7iD2yEiRoTb2WqiF3hIcTYGCn0GFws3kLiMzGHRtx8vpxsrnEuQFvdpQLsnXvCatsqq/89dgg=
X-Received: by 2002:a17:907:7208:b0:ae3:5ff2:8ecd with SMTP id
 a640c23a62f3a-ae6fbc8878dmr1449677966b.20.1752515570314; Mon, 14 Jul 2025
 10:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714132221.4611-1-devrtz@fortysixandtwo.eu> <CAHp75Ve6ejJSH3X4fMJ6MimH9On_V7Ors8xVWtcjWyp4jx+VHw@mail.gmail.com>
In-Reply-To: <CAHp75Ve6ejJSH3X4fMJ6MimH9On_V7Ors8xVWtcjWyp4jx+VHw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:52:13 +0300
X-Gm-Features: Ac12FXyJlqXKvwAc4CMMsV7GL7RdezTzq5kaHgCSaCWC_-zIt3Y6q1lh2LXK7Hc
Message-ID: <CAHp75VfFDWi2RVBsk3G0oW1LRrpVjjK=_Hn+DRzRSPO=Dj6EbA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: put trailing statement on it's own line
To: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 8:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jul 14, 2025 at 4:22=E2=80=AFPM Evangelos Ribeiro Tzaras
> <devrtz@fortysixandtwo.eu> wrote:
> >
> > Fix checkpatch error "ERROR: trailing statements should be on next line=
"
> > in ia_css_formats.host.c:47.
>
> Is this the only single occurrence of such a problem in the whole driver?

There is another patch floating around targeting the same issue,
please coordinate and send only a few patches or ideally just one
against the whole driver (perhaps excluding i2c folder as Hans
actively working on it).


--=20
With Best Regards,
Andy Shevchenko
