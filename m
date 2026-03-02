Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23C37DE9A
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487092; cv=none; b=hMUW1D+9QKv0feWGXZg3MiMvB0Am0C68EsjxELk/8YlPKHssqb1SdwqC4cfH57YF5bntwi3Wdr+tRWjagacxBXHx70J+VRczeUdHta11GlUKpVVEk07pkBDdbNLCDy7h14gjlww8Tw8LZEumtAQxQMlqoaOCjJ9mdTL5aTqz64I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487092; c=relaxed/simple;
	bh=8vjXCMFvKoYet6RdZlOIQF49Zx+rittPuU7DdbDpz20=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f+aJcNpLz1rhiBcokVvi0XKKA1Apvmc5+PQzRgDpvZ/nS4GWAxOWbFNYmwBk3qdx9ZVBX5eZQ/h88ezzeMT84d3qvGb6bSNjQbTUuR+4FCsH8foDEOFC/DgSBrVI01lIeGnpUmXK2XYAoQGx5JI6+f9nrlfr5gZ+WXr5N6LOiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZO3Sc8b; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZO3Sc8b"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7986a347d4bso48938077b3.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 13:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772487090; x=1773091890; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vjXCMFvKoYet6RdZlOIQF49Zx+rittPuU7DdbDpz20=;
        b=lZO3Sc8bIk4CRSslH8BLi6SmdH/da1VC6iHTSYdPqQNcfJsVElNYV4XhfagFaD1Lbt
         T7IOPu4Qpn4E0wbFdj55nQJfl1p0G4gSobjcCFOAh4kQE3Si5bv7pB7GyMuXLEJZdHGC
         XSpMFvj1OI/IsUjfoa6c1kgj/mhFYsMajZSnBCZILY75sN7zaKmz8NVI+haEgMHe/11M
         Py8zpS7CsDRQOzgHVydMEVmpQEzV+LGh3v3OoEwXlv/A6NPionKthPJeYwagncWLp0GF
         dZKzOqbH9r2MOepN8UW7jQVRMwIg7vEQzoH49SA/VjUEpVOtsCjgxVXap3votmvAo6H4
         xesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772487090; x=1773091890;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vjXCMFvKoYet6RdZlOIQF49Zx+rittPuU7DdbDpz20=;
        b=RjcmMTz/iQe1s084NkrJmtLfx4CJjKR5jnUYjxgn9k1IwpQydWnVDXBXnbdbbWdOXY
         qNP6bupeoIct5wPSF28oy4A5OGu5R5oHrHKqVknu7USPzsRs/cIX5X0bgmZNxSs3llAk
         lQunhxr8u9Fw2FaqGUKsr/UYrSG7Xv7jM5djg/A+jyDFqXp+eue50lavA6Rs6E2LlouZ
         enHGRLpex188BYAwbbGbGlsjtigoB8kJYVF2DgR8eU7oCPs9WIMgNqCswLrtBvJDdqqH
         MuqrjDEU/QPI2U7Os9B7/HeV+jdpzsryAJBnn+s0DmUzdyekMKCd3YyrtFwh9P+UIqE4
         5n/w==
X-Gm-Message-State: AOJu0YzI4p34SWlNpTOA2FNm7Uo8U4Afj4PB3xL2GfID6b48uR+0Y3kk
	pAKkERzLVS0fNjvqhzhEFSsxgCkS8JWgMqxBGp64x1KqeW3/0My/z+YQ
X-Gm-Gg: ATEYQzzin92TgDCdaVaBxBI6qUAV1Lgt3GElhBU3qLU5tzjXJDUjSJHkrYrdvizaeBR
	nPK5i+WGUfU1fls1Vuu8PvrpqBidQa/N3zh7fCFgkd5MMdMo+u/2h20Id9o4301vnHLh8nOeQmq
	dSeD4jWdPkZFpTe6q91JT64l2vstVOpCyP9L2V91T3U1tMRsHEd2Egn40yJwzzi1NszADImMmOX
	w712VgU8swOuw6mEc08SlnnxN/kX8A7hp45RXRFVCe9A36JD/hA40qnvi/NJjppXwKgGoLWVlyM
	SF+jSf6qFKQbCi0pa67jycuvaqpP028V8TjynTezZ2FtKR+413WAbrARhMijIRawZI8Rdli6nC8
	j5UvcbTv2r+Wpu8MZcmn2jxj1YtFCkJtEPentqJdkf2Z1+xrS4S0C4zCt6OglXBK+uE3JywA3z8
	zQRxPQA9WSV+4pS9d1rpdR4t1K6wKW2U8K5B8TvbKiO45JIyo6tS4cfwJcSWO83lH4Wr93sRHvv
	tyrune5xsZQpy95X6MQOilbK2+s1LDR
X-Received: by 2002:a05:690c:7405:b0:796:371c:caa4 with SMTP id 00721157ae682-79885605fbfmr135407067b3.52.1772487090440;
        Mon, 02 Mar 2026 13:31:30 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a93ee7sm55445467b3.2.2026.03.02.13.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:31:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:31:11 -0600
Message-Id: <DGSM87K2CH4Z.244A6JVK7ZSK9@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Josh
 Law" <objecting@objecting.org>
Subject: Re: [PATCH 1/3] staging: axis-fifo: simplify resource mapping
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Josh Law" <hlcj1234567@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301005519.2512706-1-objecting@objecting.org>
In-Reply-To: <20260301005519.2512706-1-objecting@objecting.org>

On Sat Feb 28, 2026 at 6:55 PM CST, Josh Law wrote:
> Use devm_platform_ioremap_resource() to simplify the code and remove the =
unused struct resource pointer.
>
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---

I've already told you your patches will *not* be accepted if your from:
and SOB do not match, there is actually legal precedent.

Thanks,

ET
