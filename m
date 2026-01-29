Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2094377555
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673966; cv=pass; b=hPmQxOMtXBJHrbWr5NmYUEfdEmbOjEGJ0UIjtGMg9HQhApe5rmJDCuA3erDQ65NtuoL6vFWbrGDjTRHZXvACsPQfYuGS3O9TAXumS2oqHbsNURS0bSRXbZL9+EhL68IxbI7k5QE+LOBq8kUAm7O/koZMKGP6jAZtVpxcLhDPYFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673966; c=relaxed/simple;
	bh=V0YS5YteFp99M0EexIOu7mBdo0mnDv//wyllJoasTu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbGviUUF+OAs+hP/6XdzcVdszVWXxENFp6I+R0uDvxOHc9ebiB2m3dTZyf7pA8+xH6GWQsx76WB7h3Qjj02yBIsXzsvPNVc9nBD+MAkIyurfQ8Jmth/WNmk9uiBq+weDpLtDcG3LbA2l9fKU1ntucHLg3E3qQOLbC2UKlHyM7ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVuRMtMG; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVuRMtMG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b884a84e622so101186966b.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 00:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769673963; cv=none;
        d=google.com; s=arc-20240605;
        b=BOC8waISUdCb5gBHBCQpZuZg2wFvncQQX2vNTo9/VPc96eVm8V0wsnkCMa8hOIzsN4
         ezDCc1UzAiw4dYVe5VvDHIu2lbZCpqA2GmU6invnSvTNzZrWXRJYpGJN27I/2rxpYuoG
         roB1fCLAOWRNHb+L/XmDeZY2l70CWkXK4/eygrPDE5P4H5wXQB5Nk09alb/zBe+J224d
         7iu/dKtcskf/d9YF4T1lJLTcLQp0TqAJtxnQBq6aMYuJj2BkNGjJEi01nD5dl/zDTnMS
         rdgcCKSIBH0Rgll5KLU/e/I8MUWlZr4xlmF4SANzy3EU58wmyV0XqgyOQaJwC9CC/G89
         o/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CjqD5t9/FBYpEA64H5t+vyF0ojWTBIjo9GlfhWVQJ0s=;
        fh=aHFAQGkNXbcr9IkC/jbdg9X43heC1Bf6npm8HotuK2M=;
        b=Z1KqnbtWJ0a+IH+BmOTl25S2mJodhLbj3b9KYlpBU4DMWlL90HzgUGUapCrLI88twV
         84aO8WUB1MBWx4Y2wZnL4g9YTzU8+9aMYkpiWNvXJ32Fwn5KScYpzV8vNddXawKDoOcK
         F2FREkli6bEKLRxhw3rMjl90ivBDRtAJXMtI9+WjPtpJVwy0J+x0F96aLW9KsOWQlh1Q
         re1TYjaL9T7WWc1oC5HYFwDj993TL7KdpWXOEssPuGqDyBWg8n5HiuTVcWW011aunQMF
         YANFrg4mp1JOCVjgdE3JVn3GuX9uZAintOOCRQLQRKMcS4DatE2B1+QXJBNtAFq30VJF
         tf3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769673963; x=1770278763; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CjqD5t9/FBYpEA64H5t+vyF0ojWTBIjo9GlfhWVQJ0s=;
        b=PVuRMtMGHpttOV7oit24PddE3uWrJLFiRQ+K4X7OHKhwVc8uYqpYOee+eqDtASmFDs
         FQIfwWXB6q3ie48YlG0d7dLiqCMvk4os88AJpcyOTFbm1yTbcKfbvHBWo6fBCMY1JR7e
         H+T5DK2TJ6EVCT71+fIKsOB3+RBRrf4NkKZaxY15170tpGyEwRVxnxwMUTBXTpSGMEGf
         fwdIMm+hL3cDda7a9jYLP5/JcCWrtZAUnJ0liu/Wm50IM5GJECNcdYsStP2yJ+RmNf3g
         f/POzQU6+LQ9w1gYmFmxFSf1YwA6de5cVi91GheDYDtbrjV6U2lbA99gMPrblhH6s+0j
         B69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769673963; x=1770278763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjqD5t9/FBYpEA64H5t+vyF0ojWTBIjo9GlfhWVQJ0s=;
        b=cuDRU0MFXdsQv5U9GlSOj5pAvCopoeYjvIy1rUbOhHKmcjibroedWCK1+iAyP3zD3w
         1gP1vLZ9DCZQbTT+00g3BcFfVuu2UwG14Etv6pQTXa7yKBsa5baR5MIvpLnv5O3H1JrV
         ctqWKbB03VPyFLVED5MsgFHnlGgo9hjcY9me6GneGHX07asNe05CzSP5EyAofFHHldl7
         HmE4Vw8KTkZ3u0fNc6khTT04F+Y0ap8SNoSwZiYZX6yD9RLu8+oJTFb/I4lGXF3f8azF
         e6wtuz+dHUOFx8I2910r5bTQ7zzWrxD+iZsncEI3cNOPlBtaOuSugIcGBzsPt+n4LjVh
         jmRg==
X-Forwarded-Encrypted: i=1; AJvYcCUvhAHzHlPGv/CEy0U56uDM8yvcTM95A+V58gnoh+poS0O1YN9DSuZnDWcntV/gOlGUnUkjrjO3MFSeZIfN@lists.linux.dev
X-Gm-Message-State: AOJu0YxsgVG9H57m9Aem+uGo95NB00SKsspsH/fZqVhJV39k5I2bUB19
	n9yOo57g972WEvpp4CBQWZ9KOiSSBbEM9nraPZ3vtKKOPeoMWsBQAzZMDmFBW31tR0FKtbdwzOz
	rHXtQHGtXsuujcWC2jYVpBq1E41ufGG4=
X-Gm-Gg: AZuq6aLXzTg8CA0tJUvL+O7dVDipd8j/RWNLFMPv2Ym6qL5EiyUKBK4uldsRmE52yep
	tOeP66xmY1FsDq9vztwyCH7r7YGq8yBCwAOL0uSBVJmsZ0nUUYUJfgyrDqzkGgtA9eWcNdXlK2a
	rxUe7X9zicBzrqf48raF2keihPnFIpgTOD21YdSgQWde+dYAosdQ+osop/2lylULM182UbWxh2x
	IpPs+iAennnivulOJsd4N2qXLBzB4PXDEA4KVRe2T+yCy3zuPqZFUa9cfxVNIKpxDElDAQ=
X-Received: by 2002:a17:907:c807:b0:b83:1349:3a7 with SMTP id
 a640c23a62f3a-b8dab28ce05mr545151166b.10.1769673962727; Thu, 29 Jan 2026
 00:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128204510.53433-1-tehsiu.huang@gmail.com> <aXsEd2bzf35y8i_E@stanley.mountain>
In-Reply-To: <aXsEd2bzf35y8i_E@stanley.mountain>
From: Te-Hsiu Huang <tehsiu.huang@gmail.com>
Date: Thu, 29 Jan 2026 00:05:51 -0800
X-Gm-Features: AZwV_QimP-xy65iJuZlNS_eblVBN2gnuijtS5sdWFYOO8CJpa8D5L1dcT1R5AZE
Message-ID: <CAMbZB6PiT5KSLU43pPMoobVFz5dGhXyS5Lf1e6UBDpDbpz0FvA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> We only ever set the first element in the class_active[] array.
> #puzzled
>
> > +     bool ch_present[BSS_COEX_MAX_CLASSES][BSS_COEX_MAX_CHANNELS] = {{false}};
>
> Btw, use "= {};" to initialize arrays to zero.  It's not standard C, but
> it's kernel C.
>
> regards,
> dan carpenter
>

Hi Dan,
Thanks for your time!! I understand the confusion. I kept the array
structure because it reflects the IEEE 802.11 Intolerant Channel
Report format, which is organized by Regulatory Classes.

Although the driver currently only reports for the 2.4GHz class (index
0), using an array makes the code semantically aligned with the
specification and easier to extend when other operating classes need
to be supported in the future.

I have submitted a V2 which uses the '= {}' initialization you suggested.
