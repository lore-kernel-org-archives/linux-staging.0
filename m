Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FD621D3E4
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772391291; cv=none; b=AlP9a4tBOzOYBDCJ+6dB1zVYJGthOZaWcVvU4AGJ4Tnf5gx6Xm/lgSRsV3d0TpJOZd/MDNKryt3c/oGCHjj6zp+uS4fMoMJBXmxvR+YwJiEk6m81//Lkys2SNNqx+6BL15k8ZWuxEiOmUUpSXEJuuY5kUmaMMZST28ACfjREgdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772391291; c=relaxed/simple;
	bh=YLOfE1HsEzFUwiuw3QQeef9jxybnsGdAmD01f+MY9Ac=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=JMnF/ylTodX7YDGnUYIn2QQkUJLoMuzXE2i7OEckw+Koon8fiabW8mllLfstQFffN5AlzIbBIAYzFfq3zmBt+BbCW0WTmSqyC7E+3lLKXtOAZ5ehN0Zf2avCw2uPK2BoSXQLJPw6At5XKYX74ixS/XR3N7Hx2XEMi8PCDMNeMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0yQ4fgq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0yQ4fgq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so41198295e9.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772391288; x=1772996088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTgP57hgO9eOqH3e0/s/VDU3AFPlYIUxry3G9l/XiKk=;
        b=B0yQ4fgqJx7J35sTJwN0dV9gjcSr61DO3IrsGOuPZqTdLCEHbUWYsdUyurm10KUjbR
         fqy3mzVoS6FjNI2JnlnCuNzzM+GWMndCOmGfRduKRgtI/wfq4Nwi75Ts7gKEEepMmjYY
         +rrzd1fvLe5JDrlUw8ZaEUcHQ8Olo5SqdqH0R7qo/M2D6b8bCXXJnxq1wg2PPaKP4rIP
         dQ1hof+rKoO/QrtZY1o8IJh2X8QYMuOivbeFAm7tP9jJEuKgPVWwsrgIhYG5Mk1+/c2E
         YHnHbkV4B5sD5xwOUecMCN+hbbBE421S+9nsYnd9kenbp/6OWAXqRYhHNCK/6O72G+ep
         x1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772391288; x=1772996088;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTgP57hgO9eOqH3e0/s/VDU3AFPlYIUxry3G9l/XiKk=;
        b=dAqKVtRIBVKXwp+SDpue7CLk4cGAQ6gFGmy745tOzZRhzcNw4z4cvLF/+URulu5h40
         Fkztk4niLwj75hkwL8fXcn58tFGgeZtdt62PIoVgCxH9v3W4IN7jiFhr4Yxw15HCUw+j
         IV/BttDnS9sk1fRQyP3uwAj1pK6sv/LrK6J+FgCrJS3zNPtZXvy44jAa2fuG4xpKn9BT
         8v3pPJWs8KI58gzKZ3fekT+7iDvpYbzIccV4fip8PaIQq093P5+L3GWiQ1CMNLXfOO9S
         BIMj+pLYeKg6EOoc0notag3Mzr4N8ifBBAkA6S0rzUwDFgXnxLEI4+bCyrhHdQj8preb
         8xig==
X-Forwarded-Encrypted: i=1; AJvYcCWXLX67IAbNrtlQWg6whTAbPx/38TvbEK3LDqkcJa23b2WtwM+nUHCrakID1XxwW/hMx0eboG9LmW72Te7b@lists.linux.dev
X-Gm-Message-State: AOJu0YxrnyWhlIJ+TJJN3aXFfk3foOEWXYXfN/xZMa4gKGPRNC9P+XMv
	CtWrgrP1eAmoBWgJ7tCd/io9xXLpETUsqPuD0rv8XZbDcP6HSKPVHbNr
X-Gm-Gg: ATEYQzx0elbgF5ZzwCuA57IUY6nblzGxYG5cykqqVL/58a7Tn/SLFLXCu/9dTwDqx6F
	sDX7hRnY+1S8NB9so0jkXloAwmdm2o3Z069sy1g1n+OOeHfVrqmrbkUmQOggaF0gYgbtdaNNjG6
	u7UMrYfjVVjugDS+ONyMZ49PN5BJyIPE6TX/NT67x82nGkirp+dV4eqO5oUb0EGKkuQjMUf1e2t
	+yoOPd8YTPvbb45W6RFj7/NVly4cAzhsV6U+LqU7tpBcSERX+nm2u+/xXrap4ERAvr9OT9woYwV
	Wa6C1YZST3m30uO9IyTKpjPo1dOIo6k4Ec1SyWx07JGT8a8vvdnLtCmyh+W29P9AsWw+GiH9NNb
	XZHgOiCzgVkJKVjGYy37j9+Y7GdxXIiKHZr6WOhJ90mXTGv0u3oLc5GYz/H4DbxJF+sRKg9Rpdp
	SHM8CXvapXif2I/zQxYv/IokNuy4U=
X-Received: by 2002:a05:600c:4591:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-483c9bf0b3cmr155511175e9.22.1772391288109;
        Sun, 01 Mar 2026 10:54:48 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf794sm110954005e9.21.2026.03.01.10.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:54:47 -0800 (PST)
Date: Sun, 1 Mar 2026 18:54:47 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <08a72969-af76-4515-87d5-f792516dc5b5@gmail.com>
In-Reply-To: <DGRO3C3JVCRK.N84RA9RCVOXS@gmail.com>
References: <20260301155318.2596519-1-objecting@objecting.org> <DGRO3C3JVCRK.N84RA9RCVOXS@gmail.com>
Subject: Re: [PATCH 1/4] staging: axis-fifo: fix grammar in Kconfig help
 text
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <08a72969-af76-4515-87d5-f792516dc5b5@gmail.com>

Hello, are you still going to merge my patch? I am new to this, and I hate using my Gmail to merge stuff like this (bit unprofessional lol), I am sorry for the inconvenience, because my objecting.org email can't send emails

V/R

1 Mar 2026 18:46:30 Ethan Tidmore <ethantidmore06@gmail.com>:

> On Sun Mar 1, 2026 at 9:53 AM CST, Josh Law wrote:
>> Use 'an' instead of 'a' before 'AXI' since it begins with a vowel sound.
>> 
>> Signed-off-by: Josh Law <objecting@objecting.org>
>> ---
> 
> Your email client isn't setup correctly. :(
> 
> WARNING: From:/Signed-off-by: email address mismatch:
> 'From: Josh Law <hlcj1234567@gmail.com>' != 'Signed-off-by: Josh Law <objecting@objecting.org>'
> 
> Thanks,
> 
> ET
