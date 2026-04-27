Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD73AF646
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280520; cv=none; b=LAmwUH6PH39FfUc5MP69YbNBqGxiG0Bkc9/TG5JIdFZlc4Bb85TqGnBwjm4Dekte7qhH/ZLeVLJ5N4pmxJhWE02swgahSNhhWRooOFAbEG80nTsyAP44N9QHVF8v2tISgBdWxRgY8u/dwr1Ib8POxloPRv90SZMS8w6tGYz6NJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280520; c=relaxed/simple;
	bh=YumIxpe4vZaVClOoclDAOKaK4kjnhB3vAYBZ8VvNmSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvDB8RW89EaDvwS7KC3cGkqKcp/xfJJ1BSK6VAINCwjSyrfabIx3H3GaKMl8qhcF9yCsrEI9fJLtbEuZvw+wHv6e7d7F/Jjt3kmC7Y49Si3bA18d+oEEOr0WxQhz/KjFWOeHub8CMj7ji2gJTWi1y0nLe/F9fZdB7uRnIqMkvbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFoHwHj3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFoHwHj3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so123595525e9.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280515; x=1777885315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIyRNr7PkxdnNGnGO2dqi1XIeJze90e/mRyHtPxpxrs=;
        b=jFoHwHj3DsvPSsOuiy2rPxubttCrrTF6X+mOSdX87Ri7n+FzsC6wsK8XMSgmck+iw5
         jQgJd7/h11jr/HOWBYdlB938suHu4oFfmXV5cWO9b/3/8fR71VD112i5jy1hW6wBabTY
         X0OIcjRHE6GnvcnCrPyTEhR9foCMjgccPQocGZHwGqPASc7BAQHvkqkrIaYHEs5W8vkh
         FQKzTO7hDMnvOXBJ34kI3GFWzR6P3moSpOXIP7lUUtLzUX4Kelzpwd9FmF2CG8sMe8Pk
         b6kEPserHQEaW3ksLe2ECx1a+TYK7bbwM4yiNE4b5j3Tn5Y8vGQPgyz5CA6PD4QlEf6n
         N8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280515; x=1777885315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIyRNr7PkxdnNGnGO2dqi1XIeJze90e/mRyHtPxpxrs=;
        b=Ai+jRZNr35SiEXIHlXy1b/YOVANlW4ziuyDRft7mXCTjZ+64Ptq48pC5P2B7vOKHib
         6WiCSx2dar4Yv65619wu4H3MZ8Dt8ie+RS55tB9FSj/NNSq5atT1INSxYZEl9B51fMFS
         xfb5fKeSObTn5tF3EGMH+OAj1H9Ar4+ENoBqOz7LSeO6I0iJhDmQxWlH/BgM2Lhwz8u5
         +7jc1GpxVBdyHAMqKfil1EkRxuCQ47XStJ469Ju7+LuLt2iTPc6PjUgE+26sUSINLBqT
         jn/XPF6Mo6xedjLwl3CFEDoUuBrAyFeF/mWyTYfVsHUHGVoa1vTT4TqRZLcGTuloVvk7
         mWIw==
X-Forwarded-Encrypted: i=1; AFNElJ80ecAriLmyt5DUl5R2/pZj9oQmgLj3P8vqr4LFLhU3+jXXG8KTdnADGS0JvgXNVLaJW5HdxkU6t1fnZ4bi@lists.linux.dev
X-Gm-Message-State: AOJu0YzoERkm1/7yg27BSx2IoXaooPvzi2kPmqVH5xDLtUbfzUhKUQOf
	31g62pDZUcl1Hfav6QDbb6+RQRqAwAwECGy09uXwKY6ButiytkAE0FfP
X-Gm-Gg: AeBDiesBGYSV/cN+YNR3XK1ec7uobQ+8SALvHUN4Ec9schkx2Foc7aqLyZrJpQajA/8
	Qv554JJOiQoH8s70vh9SX4UjGo23H1H1NtekOccwbPvkFId0XjAs0eApQInMScQLINV0DQ39vBE
	x8LcFDWRnBOX9Tk+3cxzAiBfKEx7nhJYj4laXYO7qI219FLcvT9Ai4bsxieb+qRZrm8VCEdE2aM
	vILTOOFv/Bu1pJsnbdXmDYinOLOV084dSwX4u6/jqcewvmxAEM6rvcTYAk+r8XgZN8NisiyNyLZ
	ZX5TyMTTEk7Y437a0rNFwZ8rUPiL66fSYvPEKHTZy/Q7DmNYtUwyyn+GfHzvnzTnNVwsL1Pz1TU
	c7NejfddpKFpKmIF+yBTzEFHJ4oECBWAIZG3Q7JB1K8R2a3UveOZbmESCQHd9dZyyZYFGOR7oX3
	nniznm33e3asWnJlROpXCC0ji3bNXDxw==
X-Received: by 2002:a05:600c:a408:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48a592ce943mr241776665e9.16.1777280514932;
        Mon, 27 Apr 2026 02:01:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52d232afsm163766105e9.31.2026.04.27.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:01:54 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:01:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Salman Alghamdi <me@cipherat.com>, gregkh@linuxfoundation.org,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] staging: rtl8723bs: rtw_mlme: fix long lines and
 related issues
Message-ID: <ae8l_lfT-BH81TWQ@stanley.mountain>
References: <20260426225552.87114-1-me@cipherat.com>
 <87lde9pb8p.fsf@cipherat.com>
 <DI3PQIL60XS9.3S9DP1GE4I8P2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI3PQIL60XS9.3S9DP1GE4I8P2@linux.dev>

On Mon, Apr 27, 2026 at 08:11:27AM +0200, Luka Gejak wrote:
> On Mon Apr 27, 2026 at 1:12 AM CEST, Salman Alghamdi wrote:
> > I noticed the function signature continuation lines appear misaligned
> > in the mailing list archive. I've verified the alignment in the file
> > using cat -A which shows correct tabs+spaces:
> >
> >   ^I^I^I^I^I    struct wlan_network *network)
> >
> > The misalignment appears to be a rendering artifact in the email
> > client or archive. If you can verify by applying the patch locally
> > I'd appreciate confirmation, or if there's a known fix I'm happy
> > to address it.
> >
> > Regards,
> > Salman Alghamdi.
> 
> I am confused in email it's misaligned but when I apply and check file 
> it's looking good. Anyone knows why?

It's because in a diff every line starts with an extra [ +-] char.

regards,
dan carpenter

