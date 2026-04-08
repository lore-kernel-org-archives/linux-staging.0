Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52B2F3C3E
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656243; cv=pass; b=Xx1rZzeDsftG6dsDJlfc4lX8NFkOpiz9ecEWRcBgZasYegFWO10YPchJzLBzq7mC1AEsfjbNlVOFDMefKUXgOV8sfI68sAn33I6aobeewejpFlcOGA4g2nu7r2zpytkQHd8B6l+zBADncJ/4mIuyIItvFB6LAR2vXzAZhUx9FEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656243; c=relaxed/simple;
	bh=lCIJfRatUMsLXI84C494X/0r6IWitDQ+7gqAKLP9bG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2N2CJxETxE9sRcXap0MG73vDK/FFkKUr9SN8SQ/tfkKIoBfCkIHO4j7bhRgSrv6WFIEgql1SJtSFQ3l7tZGfSC0XU3/ZI7UlpBY53wu4cR0BsED0Q4Ek9nJws11VIl2b9ND3b7fElrX8GivZEWmDhPA6hz4oJNAWMPPhXlQUQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RadKLcIn; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RadKLcIn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b87970468so4840393f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 06:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775656240; cv=none;
        d=google.com; s=arc-20240605;
        b=P1DneT4aQEi6JBEDae7mgqZrG440YS6hJVyczotf0HcKVbGsg2kXR4bE3zMncLPqq1
         bgb+U8qWEJ9MmUOVatYNhm2VYfYIEdd9zNrgPLobbIVhNGxwufw4WLv9AvKNeZW31xGc
         TsiMpf/kxIkZS3IvKutAEiYdoZEwNwde4lq9OIBI497AwFPPLN/GegU4uS0n6ySGKhLH
         yX48IQdwfr/IPhzB+5YIJBS3kAWoxcbbjrF5JArNKvL2ebarGRsR+ToSnHieVlb9bDoq
         k/TTp5QWwZ8LKGSUB/vsS1XukonSA8zh8Tk46VMTNO+61JXXA4WkLz5K3kYNnoJPyMkX
         VowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oGtEb2yHeNmcrgvXzY1HsE+I5Aw6Ec0BxHiFB9eP2l0=;
        fh=6jP8LEUTEHE6ODjm7W8gSfOGf1kQ45gX3Vjn/eUGegc=;
        b=jiupQTfvkYVsRTFdtH2hwxt0gKF3EyhEIU3Qj0HU1mIMGcAPRBKkNoTbPOMijw8DPD
         9QtVcXcdenruX15wCe5/NpVmLaecFyCqt6IpTnqXePrs6G4UfzxMNzv/A/CZmudAsMnd
         Pb2gT3saiIu1rqUxtJDIk9FBuH5QKB3afB/QBqx5mkmBza1dUPRQNSKGJZnZy2PN2l00
         I+o7rPnDQodh7GlbKP6uqu+OVnPeONPivl8zM8q1dPu7xeEqK4SzYPhjhw6XYXpp0uAH
         XMbePi7Sbqu5vNVtwjyCiaGN6n0Rjk9rjdLespQlEwVEf/kEABB2bZIRE/2ZmOeNQzZ1
         viow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775656240; x=1776261040; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGtEb2yHeNmcrgvXzY1HsE+I5Aw6Ec0BxHiFB9eP2l0=;
        b=RadKLcInidyK73Pa+D/gZF/nxD0xcWIwSQKaOJ11Q5mgPWjvaA1YB9+ABrIA1veIOx
         Cw+2mLh1Gx5iAvC/KtbFa18gcXQVB0hDLqZt4skzKrq3+6TCDtnMjfq/9Q/I5nYFls+Y
         19+IKIb0M9dvPgwQObWOvENlQomcepjXpPmTCWV5m3UTZyBOT0ghdIoijNmdt9jArqUs
         dqWKEInq5lyL8KcMWq1xAj4TpUbG0hT41eaVd3/H0+SrKj7sOJ+iUMx+btL6BZUyp17a
         P16HOhhhk9V4bFalK5mrQKgkofPbjC4yTHyumiUi/79xbXSfNjEzEH7OTR4Srt6/jvvL
         7+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656240; x=1776261040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGtEb2yHeNmcrgvXzY1HsE+I5Aw6Ec0BxHiFB9eP2l0=;
        b=mwSq2miz7YYAwzEId1upxb6S8ewTBnNkhxRW//9kawOdnJEVx0l9poq/5B3rtlteZI
         t5BSHRSJxl9ybTlN/VnBh3GYRp9OJABn+3YO2LvtMJ4LdAu5f6bkbGpvYOhXACF5dcxK
         ctFz9K+QL+p5y1CHM8O237Iu8uXTXXFYXxzaRq6Ie8Eg1b6XBAkG/8elo1dgxMVs4jq9
         oIUwljlc3B93zIvNQC+AW6SNDIIz1TeoyTuupaqQbbsJMEPp+AGgIQmWOjA8ZGTUTj7b
         vWX7k2++GbdRRkUYuFQ07UdMknACG+IN2oYdDtK3vWvECtnpSgp1cUjLz+mMBgo5KS0X
         v4iw==
X-Forwarded-Encrypted: i=1; AJvYcCX1acVnqWx9lyirB0lAQ22SoDNpcXoYWgMBNvLNTsB4WY2lXEJQ7h7MbtiZlW89Xsaa9A6tW2fwbhZf7FYU@lists.linux.dev
X-Gm-Message-State: AOJu0YwIV2tLE2sZK4QB2ANMhTu2UTbup4MIXgu9JTAbISuDHpj4tVUj
	Azsjg0xfD+E0/9KtUG8mWxSLkRDgMIGN+WjNdfpX1kRkbisvcK2eEYN7rJtqp/EU0erJU+m5oIH
	Qe4UqlILRMKTTl1KjcejpBeiubMn3kK4=
X-Gm-Gg: AeBDievN2PjAKlvlZpT5lgbpnB3/aYJvB/S1mXWN2AgrXSo0hFfWRG7wwkOlQr4Bu4h
	KyvcenpmUr2vls1OnXSqtZ+w3fz32RW6aA7gQTPKfDrtxT67wcsBdAYTgJxnStVDLlFzgkZ6zvK
	2BH70K5c8bXpiIlwJqYwk5p0ZGNecexN8K2dypdoLuvMXTI6rI+ls4BYFl5/CtBRcYmSk0WyWsU
	fTUpLr44jIEstqKnEpO16p8oNZRtY0OcSUhdsYx8jxRpN56AP2ZUAGPjRL5jxzDC55tNvcbynN8
	eJdwAYsGNW90AZQfp7NIgwG9xydqDrwoKhERLGpFW+/DH/ER2SaTPLl4+z6abEGJpeBsUonCYjj
	xFD7DdlQJ0I0o9dPUJIk1U8fYJQ==
X-Received: by 2002:a05:6000:4285:b0:439:b057:cb05 with SMTP id
 ffacd0b85a97d-43d292f0b41mr32274228f8f.49.1775656240241; Wed, 08 Apr 2026
 06:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <adUeywfiQzZ5JgEd@ashevche-desk.local> <20260408134612.1380-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260408134612.1380-1-joshua.crofts1@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 8 Apr 2026 15:50:37 +0200
X-Gm-Features: AQROBzCVC3JBDLGivxsFP2FG-KJ2ijABqTy6_kGDbH8FX82M3BkY3FmCKCm7dQ0
Message-ID: <CALoEA-xazTLhHpdQBtw0TU79vSpzv73+MTChLENbzAouXKGeiw@mail.gmail.com>
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
To: andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 15:46, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> Since the atomisp driver concerns transferring video
> data, it would probably be better to use an iov_iter
> than copy_to_user calls (scatter-gather i/o and better
> pointer safety). Per yesterday's emails, I'm sending an
> an example of a function in atomisp_cmd.c where I've
> implemented iov_iter usage.
>
> Note, this isn't a patch, more of a question whether this
> style of changing the copy_to_user calls is valid (or if
> I'm writing garbage code). I'd rather get your opinion
> than submitting a patch first.
>
Before I forget, this change was compile-tested.

-- 
Kind regards

CJD
