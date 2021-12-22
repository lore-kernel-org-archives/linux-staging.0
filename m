Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313AC2CA0
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 09:54:53 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id v138so4986722ybb.8
        for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 01:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CWBvAwfqDYL5LTJRobpShVxnlEz39kj9AjzUTYziGMk=;
        b=c/JA3ksY9FZ1CvwEGKK5xrJouuPyZ4+2DTQcnZ5ieeO5hXJ0URkARJHEvXlLD1BJ+G
         kJ6bCI2ye23d8Hj2Jubjn7ZShv+F9ZzWabXx0GnspNQs33vUSVTr5lb7EnVu312J8k13
         YZGMTA9+chAbhnKvrM3V3qAA3Xer6C3xnIBY55E1See6DbyrbMsjMY7F7gew5HSBA1CK
         sbKZcyBCG+NMzsi29oxNadbBpLstHg1TlQxYUGFVchfhk/WZQ6lgI/tDj1bvq05zRFmg
         Pcn8tWP7QEIGjN3wj79Rrn5Yf4bVSik0gpSyKkNnaiIWsLrqrJ/U2DFKsGZA4LFOYTjg
         VdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CWBvAwfqDYL5LTJRobpShVxnlEz39kj9AjzUTYziGMk=;
        b=tcfEHqhRNW7BPEq8ylCVJMwUOH/WAUGmn9yFm4XmP1BoHq2BEgkJD2f4Yg9eaxXSSk
         sW/R+Wbsz/UvuH/KatGyo2A4K/7E/I+olpgc8qFOLd6aSXL1PXBD8RPb5E0aoKjWcX/E
         d/s/XX0rnzg/5ABuNq6VuCTz72iu3SbYJjN90ucDEAeW6pJvcQxie5wifnxBEFUMV8EF
         rlgi/LPEw2wVV1KC8On76ZrW58PQb9kxG2b0LvPtgdLBTfSwmyblg+qVYK9+PStmKfHs
         pUbEWRYKEILbg7gMzb9pyxirLYea3WPoCYUvc63dy+DXjILOt8IMcNkCvKUSh197dy1h
         bjAw==
X-Gm-Message-State: AOAM533jJ07HWoW6vyNLPUYpHwjlL8rUEAaC96Iv+6RCPeI+jripshNf
	pSnG/wNWpCBF0OjaL6OXtBFipuOLCfs097r8Ya8=
X-Google-Smtp-Source: ABdhPJxbX4Nlmn1Ka4s30MrIcI2+BmQE+eAGYEuJfHMOmRhX3UA7dGYEPcm/C5yvU02o1zp2tKtWZUE0NnHF2kuDFXs=
X-Received: by 2002:a25:3b04:: with SMTP id i4mr3029321yba.767.1640166892081;
 Wed, 22 Dec 2021 01:54:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 22 Dec 2021 10:54:41 +0100
Message-ID: <CAKXUXMym0M1UNuNGUVpFr2yUwOwjkZ_sQpCD0jC8YB+hs=j-bA@mail.gmail.com>
Subject: Addition of config USB_HSIC_USB3613 soon?
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, 
	Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	greybus-dev@lists.linaro.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear Vaibhav, dear Johan, dear Alex, dear Greg,

I have seen that the greybus arche driver has been under heavy
development in 2016 and 2017 with some further clean-up in 2019.

However, so far, the config GREYBUS_ARCHE for this driver still
depends on the out-of-tree config USB_HSIC_USB3613, with a proper
exception made for compile testing (with COMPILE_TEST).

Will this USB_HSIC_USB3613 config and driver still be added in the
mainline kernel in the near future, so that the config dependencies
are consistent in mainline?

Or, are the further out-of-tree additions still maintained for the
current kernel and will stay out of tree? Is this arche driver not
needed anymore and can be dropped?

Best regards,

Lukas
