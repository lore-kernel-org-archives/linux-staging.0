Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427041D120
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633497; cv=pass; b=Jn7waarVRxX3IXaxmF9yMgLbKKNJXCF1OShWTY/YInghjgMl3yrdAXHuMnexZTYnMau0kVbvc3/wsf6cku/PQ9TYcmX1l3V3JR/enKtg+CZxXU1gXeuYnUDn7hokVPTN1jFOatK4QJwnfhYkF3E1QT4euMW2kw3uyVeV3ekSA6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633497; c=relaxed/simple;
	bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G14dsRt6xPapeSCuAG7APIMc1xTjpbc13xJhHAdOPeOyU8Qond/LkJZ3Sg0U6wMiUcIxMw5tzqURUDcNkoB7ePHahtRO5FNsPomD1aPIbQ2w3/O+VIJV5IvLFvjUbQ95hJF4tR2IbzFTJrXF39MezcsSGsC9fH69SuRFiVjPYk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFpD08sR; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFpD08sR"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5308fc4b716so2902111cf.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 01:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633486; cv=none;
        d=google.com; s=arc-20260327;
        b=QAejF3X2CH9Z+IHV5WZ6G0DEC+3Lb0mCC4RCa1D0PMqWa83y9kHyxeTidZXxFFSWeZ
         LD/JdsXWRXHVaII5SWJwTiPWmzbHT14Qwf50o2u0GpFMwbeYk8Cmi/AP91VBB9nhVHt2
         5E/aSrwic1tsYelOq3pleXcyfJ6wlLZS2dIrz4FVPxcI+yef3Huq3VPVM326A2WQgPyE
         4hAXq63/NcaeSALzAsNjqTIIEAPJf4jpHKFKCGtHaF/M/vg/1RCBMlHsOx5ioFnvrWgx
         WIJTNFCIlfELN85D96CPpEPmnlpd5xLSX1SaMK/+wETaBzXtnhgxjTkepzOPiF0zBQfs
         ofUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
        fh=kyAoIf2WJexMY9Jf1wGyHYNBAiysi78D3xH7WXfZEsU=;
        b=rAW1qJwmkPEt+T1xd/5kx7gOhtwTAFXWUmcSDPTzs8aCItCWD3cWxnmI4vUCjX0Fvl
         dv+gy2DtFu0OngOGNGi3dYkGRRLA9DRz3+JRa8NaAbVgrow9lu0FGlQVtcgi/3BNSxW4
         FFTkt2GH2OxTfkt/if8XWKNPs7WOQ587CRK0YG530EwUiF453yMCoYj1pdEnKR2eUcyM
         K6vJdFhBUgqHU6pdCakfI/4+Y1/0lpLiu0KhOaR8bhGG1FPv/jYuJYTyf7H9YiatGPM1
         gNdKfXJ7yMV0bZMkBrBizCECSADcUZ197QRw4xK6H4sDY7VbuBbjZADQCUkmi2lv9vLt
         k+yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633486; x=1790238286; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
        b=gFpD08sR/mxkK/82ty9QuxDkaPQONl2DxOs/uYY/tL5KyB+lq4jjiZZxvYPCtTsbFx
         qML25qd09S8TLXI/MLzH+FCNNdsx68Yn+MDVQrnsCqsaqyWFUKl++pPd75lz1TDTNeXD
         MQ+GJ5mvzZ002hdZ8+XHTXiR9nhYwMJZzeBJlVTZp/VuLHvjelEX+gyfvqyO1PJ8/HzN
         7lzWQEOTb4Jgtqcbx/7v9eEYVMiX51J652oPkVKyLwkGxJpOafxyuieLCffvHrqC70Ht
         f0oIqnci+ArbPF7grT9Ts9HHDPelUR7KbNUc4H8i6ls4Bk7WrO+G4f8FhJjHGglWAD34
         g2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633486; x=1790238286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
        b=T6R+lbKbnlF5IghzTCvkz3z6k0xL5RJ/IxF7AhNSz6crzjir+0Y4abOsYrKrv+ljsm
         UyP0ezuiNMKJT6P2M9GtRx3ql/TjsgUzunaVTZt5P+CG7PJi7Rl6sdTK23QZ2p34aDnv
         rFkdSZYw/PYBR57nUM+dEbU16IZInTjxk6MN4siIA2j6ng8IhUDmbktboB2C2WJV4Bc9
         cIy2K9BwIA3kXWmdLty0D5wGpaXVNJAOHbrDXQNRmFJ81gpS3yAbUm47TOERXinRHm9Q
         w/Byotrp0ewF6NcTwgJya5oSufNsvhv9Hu0SnmZEcklSIrt8ohVgvvrkI3GiJK+W099h
         0unQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQNYEKeFV/Nw7BUVVgwvSX5O4xFIScgsz0+P8UaFJr91ZZnlSYL6ww6PfXiPPyjvTRJhXloBGQR33Mpspx@lists.linux.dev
X-Gm-Message-State: AFuF++m6wBS6g/Ss2g9EUVQ/Ta0jh33Bib7vzihNpth2EysvJH3AXqlh
	SUZOQncUt74FWySB+66DIBPszvreEog2QzGI7GCGhDQD8LVPewBWrkCbfn7BR0UQMyKiL9MNyzm
	bd1wZv9RCuKEOyMX/YWC5lYqUcyb+Yuk=
X-Gm-Gg: AYBFou0/JqLZlg8akEeXA/MLsIlyMqhVt8TWeS7lhqa+aivonuFU6fQc0y2mSHvWYJb
	3ZHdS4268m/eq5OC+5HqECH6/pfiwmp9NuuAT2kuYPxbAKE21VTM8/fFfjnnXXBe5h4tftSzf+e
	Lx0Ba67sc+30AClRabKed2YzuZFRLi5IC9vIP236OhARoqy1OwaYlAH22ZAPbbri84yxC5lzscU
	/B8czC1FtfnzDKyEQoHKzqiDv4juThiWI0oClGGsoUn9U9AGnRYzCQC5D11JJit+if14OYtCZQP
	FVUioaKWtoy0lxSsGx2p2rUbC+9vO0YFN3feyy3PFBjHHhrY9BgqOK3U
X-Received: by 2002:ac8:5990:0:b0:530:780e:9613 with SMTP id
 d75a77b69052e-5327ed7f4aamr99464371cf.8.1789633485846; Thu, 17 Sep 2026
 01:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917071931.8063-1-palaomer100@gmail.com> <87mrtgthqb.fsf@yellow.woof>
In-Reply-To: <87mrtgthqb.fsf@yellow.woof>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 11:24:23 +0300
X-Gm-Features: AcwNN1VQnPQe_ExU8gbeuuD_N1Yh4S4QTlzsRNiFBaOPLKoRHW2NMXy83p31l3U
Message-ID: <CAKhZXnpmg7wcwyjFuh0EQQQMke9XBKp2pndSq2awEkh+FRCyiA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
To: Nam Cao <namcao@linutronix.de>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Nam Cao <namcao@linutronix.de> wrote:
> Why is precise delay important for power control?
>
> Precise delay comes with a cost, so we don't do that unless necessary.
>
> Nam

Thanks for feedback.
I am sorry for wasting your time.
I thought waiting up to 20ms was too much for power control, so I
submitted this patch.
So i wrote this patch.

I understand this isn't necessary.
You can drop my patch.

Best regards,
Omer PALA
