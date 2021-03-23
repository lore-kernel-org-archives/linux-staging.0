Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72FE6E
	for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 02:40:22 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e8so16157074iok.5
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 19:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=s0HowszsuEfjtfo24d87zlx05oozxBsWwcdSOVENYc0=;
        b=tYMoXmBVOrhS8QeOvxn8Tuu+Ei9OGz5k/Nb6T54/IvlTFVeF+NuSY05KELtZDhIOGI
         mZqiE/pZE49Q5s5raTFD5T1LhI+gFqOGb1F+RZvW+jxf1G9OFipD3gc8PvxVIGeda0iw
         f6RoVWR5vrlU2Do35S/Lu9xP3/3c4CAgQPGaVu5EzheiNTUhL1AwkeREaS6Wh66NEKVT
         ikUqDpI0f91gdmDiqPN+AwmdjzOHbltsVkAWJfm60qV5Zn19jLRV97dbU6BsMU/RA5Y8
         1ngS4klNkqERqeLJKvJRGMbjjGTtBqg2dMCfWWmJqkzPHUR4tvA4pk7s6q9msfUZ0gNZ
         Gdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s0HowszsuEfjtfo24d87zlx05oozxBsWwcdSOVENYc0=;
        b=krd6E/RO1K/5wo9vo/ofYOCY3vKC/4ql5kya7c12oWDIOsbi7jtxavpEXxf8hH0fNk
         fN7B4E3MQFrpkBg+8vcv1p+QCzmsprfl11jCMivRLYjxEyJhmx0WNW2SwK4d/QHAZpQG
         DBmSbeOkmQXSzUgXzjaAAzMsofAsH1tCqgDjOBUkWbO8C41k20IzgwDV8muNOOg87x9z
         BjlCt4kFZOj2NSN2TcwgJ6RU0OPl0EIpL0hIV5RmGKfmWMR6WnHVDJkblRTR2zx8H3dn
         EmaAcVEr3WBxMES8vkIG0E7jWZSUjCT4QL9NHU3Sv7P1D0+eB9AckaiS7f1VDGjncw+W
         4xHg==
X-Gm-Message-State: AOAM532HOWXHdVLdqA/CHFMw4YOCrkXzGotIATKJj72G/RyjGgmT4/L4
	ONyyTaNN3amtkvYH6LvD2KZIrI3f8kI0YkwdhqI=
X-Google-Smtp-Source: ABdhPJyBowCQx8E5+kuXMD4ts5hx7c8DZvgwlN/OY/fbnvd9t2Q/AI9aRCrea+cl9s52mmEgbcgzwIMAFzweLoN6hoA=
X-Received: by 2002:a02:a691:: with SMTP id j17mr2421198jam.14.1616467222135;
 Mon, 22 Mar 2021 19:40:22 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date: Mon, 22 Mar 2021 20:40:11 -0600
Message-ID: <CAOc6etYY0yhsdQv+nM3aPxs9ahaEDd=h+vXAesdi65=SiQZ3eA@mail.gmail.com>
Subject: Question about rtl8723bs
To: Marco Cesati <marcocesati@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi!

I was just trying to correct some compiler warnings coming up when
building this driver. The one problem that took me into kind of a
rabbit whole was about having K (in rtw_security.h) set as static. So,
every time it is included somewhere _and_ K is not being used, the
compiler is nagging about it. Ok.... easy fix, let's remove the static
keyword and we should be fine. Then I took a look at _where_ it was
being used.... well, nowhere.... so, ok, let's get rid of it.... oh,
here are these macros... are they in use? Actually _they are not_....
let's remove them also.... (I don't know if you are noticing a pattern
here) then I noticed that _a lot_ of code has been removed recently
and so I pulled the big guns and cleaned up the file and started to
add things back as they were being used in the build process.... in
the end, around 80 lines are gone (give or take) if working on top of
next, at least.

Is it a good idea to send a patch with all of these things removed or
they might be coming back later and so they should be kept?

Thanks in advance.
