Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4557A3054E4
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776587604; cv=pass; b=hcGBbcuX+5U7D4GwZ266X+noB3KM1bKIGUN0CfXV9L4eiz/GlurgBI9e5Ht7856Of7ja6+j7sHEPS6a3AN72KU52WUx5eT724VDAiwkVmGDGllNp07NeoJRyEUfDVLIu27WkmO1OZy2m2iBoNajdI2xSzVdBCtAho+quOUQ/lzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776587604; c=relaxed/simple;
	bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcCxQSmyS0RNs6OAQDlpg0h6YkceaTMRqbxDZsyCNPhbqud3KeLCDR3I6eGYOZu8CtwoDwpfuwlq6cE28wcY96h/R/iHvOBPcbLyH4WYPKj6Ed45H2WpjqVxxLNNzr97ikPcxsyfis8o0Fsr4eAIangptGjuYaRJhY0ks4PvKiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3U7Su3Z; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3U7Su3Z"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c9d03524cso299818666b.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 01:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776587602; cv=none;
        d=google.com; s=arc-20240605;
        b=MarEmy5bX7BXBQf3UmIZeyYRNB/OV7IfZ1N9De8OEgkL4KOA4ZmnupchEoc0/dVEt8
         h9yxD3NjaiUcU1OwpeFv+WeXch6bi9SQ/sTiIsG+DU+vAG9aPitDEYswOIttg6+71Q6d
         4mJkOWRUZ6prE6Zw4x7jJTud66ZRXfsuLxIb0xzZJzypyR9Y8NNzpY1DN6xlAtsAJxsL
         s1PqOsbhWt8002K/HKmIdku+lvFPmdhRaA+vb/by1tBPoeSZBS2lK5nDz31ZiXGKRrTU
         7nM65SXgu9PcKLwVi4CIDP/dAUbdn5mUmcDJLv7yeNSS4MytGxxF8RgY8FMzg5Oi46/i
         /mWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
        fh=MLYinZBbhOS1Pz5JaLcwA8yP/PkprPjfQFRm9n7SjEA=;
        b=c54WRIyK6/vvOW6s9wwn3mrqQjUm22KYsLfFn1phQeRkJplfOG2+9DDVi8/oO1BIw2
         SdlA8ryCqjHhP4OUbcyEy7bzZlRLlaHzCJv1LijYUVT38hhmwvl5ZtuQliqO+OHgrgf+
         fwFonUe/D4u2XpJG6S7YfsdT7tox5flE/ldh0Yj9t5QIMdX8RlQ9GP/23+BVvn5HRBrz
         CUFwtn+p6UvpprzTOfXO2VDqwFohRKKv97M7Pnde0KBVEdiS867SFBuIUT7qp7O2EiWf
         ygpQ9+uAy9aihUQjsGtpWn8XJ77iYiBEUnobkcAACGLVujkmE2JgZ3Pv8PQc591FFazo
         5JMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776587602; x=1777192402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
        b=D3U7Su3Z4v/+Ft8U2b8Jjkc2c0SuZOjF0pCRuyUtKpRBHTKbCzqRq1/A4oPl/TwicF
         k4NJ08tGBVnnLKzXCzwimpuhwx2QBQGCwhPOaWMFmJnHxdE1SnRWMFwkah/QG0a4qNCs
         PsJdtt/zlMvvXlMAEBnHXAFFi+AvgKVyHyVb8/HAaWrZ367LrP1oe0uYfufsuC6fR55i
         pIQ2Qwn1xoB6Aw5PrPeQ3JH9Jzdz8ZEINO/bEIE8vARYrIEN+9IpEg9FejhjFlt1+Wuv
         OTQYcZKPuhMqxj0hEX0bYw3njdwDdvRaRZSUaGVu43vWVrxxO6rTHem0oNn4U7/Irjgv
         kJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776587602; x=1777192402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DwWkjOdIRSHe4csEhz0zSx7E0vDcY83F6ZsKPKQ/kDc=;
        b=iBk1OlvovTeudmvcIdzzz/zsmc//mOr3Ue8VUNWi1OcXFaeg5vBjmo8tHPlpqn7EKY
         iXnMXRaQlGx155LHPI6nuYRD5Twv6j0+4/Lg2K7zY4P9cR/hVzHnfTq3hKMjkVlKqHK+
         qWtVLUBf0/IMCvx/60paSKlFcs6WsyFJvVAzOVBr4nTXlebBUqjV3G/yvlPLcJJ4vD4B
         w1SEWK894rJk9gpwkz6FZAYPCsYF7MhXymuZuNaGtgjmcMVVsU72zuh6w8XWqMyXzvN/
         XFXfEouppI4vOWCfRg52mFBTQ8UiGSVBquiGnLZDJoHklZzMueDN+Er56dM+J5+6GWve
         zu/g==
X-Forwarded-Encrypted: i=1; AFNElJ9z0SYYRUpnf0TkCIei0dnZq2kR4wgHUPV/rvbbG5f3113CrPVowpcEkCcq2BSW7ZeE6mM4lHyLrceH2zGJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwKzs11xDJe/fafTuiYjGJNPxoY1Bo1GOR24qs5mjvAOLPFTFiP
	IQENzEbY2r5KiFtoryI2iV+CfzuCH8aX2CWRpKEA2YTkDkAi6GxtG530mlMbSLHVThW+mosMs7d
	ZPmf7KRFrDW2ramLtgcC/OjBoOCbavyI=
X-Gm-Gg: AeBDiesIdkopIR/gSYL5oqw3zSL8ypLArTja7168nGEg6oIHvShVw1OIgWQ3eVkFIJ2
	kvJpRhhg7uJQUdF5pCHQgVmg8cF4utkG2bGkgiku0TVNEvzfBPDBPrGLa0qTCS5roPnMymbvHsU
	FKGtws932x5gC5LmY+CpozesLm5/zJmReGgkpwVl8bcee9q8xrfmWdO32U4ulDdz66e0i1up9W6
	WZc+SXknmdYyXOk0gRAjjKy/PLPvqMQexr5DuAfM5LQtY7kfmP0Yu53Z5wfVHIMPzCXa3zNaa0l
	whc7VTEbLpRz4EWZBwQ7J0dfy8/9ep54+PH2rAcJrIQ7tvmE1vfgtlXVAX+qR3/YKMu2bk2napP
	CKBQ0U2TNKpy9nTIRnrrXzPHpEQ+u+A==
X-Received: by 2002:a17:907:ca20:b0:b9c:b475:90ff with SMTP id
 a640c23a62f3a-ba41aa14db2mr339185166b.30.1776587601377; Sun, 19 Apr 2026
 01:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126190026.37436-1-ayushkr0s@gmail.com> <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
In-Reply-To: <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Apr 2026 11:32:45 +0300
X-Gm-Features: AQROBzDYDo_2FEB9nOldB2RSTgoGCCCJtdWgt3FrnvUUCOg1eLrOC5ZCiCtTNhc
Message-ID: <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements to
 next line
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Ayush Kumar <ayushkr0s@gmail.com>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, ribalda@chromium.org, abdelrahmanfekry375@gmail.com, 
	santiagorr@riseup.net, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	kernel-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 1:20=E2=80=AFAM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:

> On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> > Adhering to Linux kernel coding style guidelines (Chapter 3: Indentatio=
n).
> >
> > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
>
> This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658fde0=
b
> in my atomisp branch.

Btw, can you rebase your branch and drop "staging" word from the
Subject in all current patches?


--=20
With Best Regards,
Andy Shevchenko
