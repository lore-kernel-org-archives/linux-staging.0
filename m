Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ECA43E4A2
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919320; cv=none; b=KMUKzqqhM09ACPUZIDPOmDU0ND/kR9QLvSnU1cn1m3Siy12Pdsaz185angmN7slxdjVAgMR3FMP3tzLv4w4xYPGbnuqw3HIspnGpvOO2WWTkH7x+BCRMQD4JU0gzGfHPsdqN2q//seZpZ8V0kjvPeY4rc/y5g6mH3igBiwl8L1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919320; c=relaxed/simple;
	bh=eXrO/+Lv9kcvXNS0yQHUCRs4IxpxjZmLMXpmTR3PiCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWZOIRqV2AkoVgNq/rueQ3+fXtOfwXGutG4KdzveHWIY8z9W8+o0gNSSpWLuZagLgjLtlhx2QfrvQGDITyFmCi/VXGgI7PBgF91gmYAi9Epn8S+uOD1slhfyNUKeYHXxtNO132N1j/oFPzVqJ328WkTiZAAPNo05DyoNXbln994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6gL2fXt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6gL2fXt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb2314f52so3047916f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768919317; x=1769524117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r69MkI6qi4cfDqEweV3mhgjODj8YEt6I3Ihd8bK8bz0=;
        b=w6gL2fXt/qHhkbsQwIZnkEw+SE2wBDveMds7wk/QboMUQnjDu5rceiu8ig54p6yzrM
         mXTJrJozw+K9cyxtVWmzHSfacjyh2HTBdY/v0X2u/4BLRDuNGuZVUeZLjKqfBS0LpOE2
         TzM4ggDtNSY6paCqCC1pKeKHYrST8CeMgyGlrT8FEvBOMPDpDgVRXFVdUmjAuizLbyxc
         Rwe0a4mGEsgvPo4rAPDKTsUbmqBVThCnh7jSkcfb4ny4bCXrKtC3n9VuoOgtkRCRpa3m
         un5bVkBUq7npdss7Nq1gB3oAfnAgRgPBKCHu6AzIjCIrZuPaRBOYV2Mho426PoZL3Qom
         QJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919317; x=1769524117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r69MkI6qi4cfDqEweV3mhgjODj8YEt6I3Ihd8bK8bz0=;
        b=nsTHHTTA3x6puaR9XnafL1RIx99ehliTdQSrSdZBkaPDuU19mjRwoHRQ4iS0PTvbDt
         ojdwyI2HypI5rDvKMp4UcE1uZ4LacifaqlV6jOaNxgvD/nM0fCFH/MVrWE1TNtgRhXM1
         jUKhmtKpRPIa3lrAE6kagcc91Roy5U/tWazqD8z2BV17b9GZ9HOrsyc2N9O+4c1jiuIr
         hAjdrAU8dyGkN3V+hK7mfaW0C96f8WI+mhD7CKsBvSf/DC7xCmt2yqud3OWyDQz118Cl
         X/YuU8solTVP0WvTQywvbQ6nOYAROaVuu6NepW4TKk0CZntWy3mxqtDMaMOf7XKI4SkR
         bP8g==
X-Forwarded-Encrypted: i=1; AJvYcCUPKdK05peMnpiSrqxo/l8FX9cIGg5DcV10QRqx4/Kugn0WzzXnh00d3JLC5NHu4Ro7wkBoVW/QDPxSQu3+@lists.linux.dev
X-Gm-Message-State: AOJu0YxzRAMxpEv8ttoOyaZV4RL47uEpLxuukBFSzlWepQEC55UZszW1
	zXkj1XF4lC30eYnCNoPD7LFDyA+NQN71fN44eSGWy00U5qdwTJ2mfogMCPRozLkcVH8=
X-Gm-Gg: AZuq6aJoClZQnNs3/+PX6ARoqYv/DwWBEy+zdH01XJ5juGakqcaiUlI9AaL7Pg2DKCF
	B+zetgXtSPyqHUkUgZe1/IqnUvBbaeRYp+rIhFUI5bsWWLyjZIZ3zzVhiMjACuiCtRfbt99nfxg
	7+fTJAM/WJZbqeUPiLYAakXLLJ9q7xX46PKRH6Jsvgg3x8N356wRK1GyAF85CeYpIRM+41GciF/
	NBM71ZiyF/Q2JhloSGvQpllF1+OcgVN9d3WURKxoRXIa1yuPm/883GML+WkRC9Dy3lEYehIprSr
	svFVp57KYjpm+hCOHjbDVEvm6RupS51wI+gBmT6jzScniPUwxqdmefdHwTxbpAyy0W+JZ7dJ8OG
	x2aTn1l6g28+gqX+dLOm47+l8MNfbfBR7al7XXdWxhHW1ycnNAB2uzfv8AQADIpD853ZnDB2R34
	Q8eDte2PAaGsd6NUJf
X-Received: by 2002:a05:6000:2284:b0:433:380e:cd84 with SMTP id ffacd0b85a97d-4358ff44142mr3201035f8f.14.1768919316896;
        Tue, 20 Jan 2026 06:28:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb2asm29968072f8f.37.2026.01.20.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:28:36 -0800 (PST)
Date: Tue, 20 Jan 2026 17:28:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <aW-REdQ9BAKA-GC9@stanley.mountain>
References: <20260120132241.2119454-1-s9430939@naver.com>
 <aW-KQbHblIy-MTIu@stanley.mountain>
 <aW-LOZdXo6zLhT_x@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-LOZdXo6zLhT_x@smile.fi.intel.com>

On Tue, Jan 20, 2026 at 04:03:37PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 04:59:29PM +0300, Dan Carpenter wrote:
> > On Tue, Jan 20, 2026 at 10:22:41PM +0900, Minu Jin wrote:
> 
> ...
> 
> > > +	signed int ret;
> > 
> > Don't put a blank line in the middle of the declaration block.  Just do
> > "int ret;".  Everyone knows "int" is signed.  Don't follow the local
> > style when the local style is wrong.  Also only use s32 when it's part
> > of a networking or hardware spec.  Just use int.  Do people imagine that
> > we'll change int to be unsigned?
> 
> Not in a far past we changed char to be unsigned :-)
> 
> *Yes I know that it's a bit different case.

Heh.

char was always unsigned on s390 and the s390 devs were really militant
about avoiding declaring variables as "unsigned char" so they'd write
all their arch/s390/ code to look like:

	if (char_variable == 255) {

I guess they were annoyed at the rest of the world who declared their
variables as "char" when it should have been "signed char".  They stuck
to their guns and defeated the rest of us in the end.  It's some kind of
life lesson or potentially a message of hope?  :P

regards,
dan carpenter
