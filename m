Received: from 005.lax.mailroute.net (005.lax.mailroute.net [199.89.1.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B00441F
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 20:08:31 +0000 (UTC)
Received: from 001.lax.mailroute.net (001.lax.mailroute.net [199.89.1.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by 005.lax.mailroute.net (Postfix) with ESMTPS id 4Mvspd3skQz1T5Dr
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 20:08:25 +0000 (UTC)
Received: from localhost (001.lax.mailroute.net [127.0.0.1])
	by 001.lax.mailroute.net (Postfix) with ESMTP id 4MvspV44S0z1M8Hh
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 20:08:18 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 001.lax.mailroute.net ([199.89.1.4])
	by localhost (001.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
	with LMTP id aLk6NTqsHSH3 for <linux-staging@lists.linux.dev>;
	Sat, 22 Oct 2022 20:08:17 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by 001.lax.mailroute.net (Postfix) with ESMTPS id 4MvspT1zLlz1M8Gf
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 20:08:17 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id v1-20020aa78081000000b005636d8a1947so2988843pff.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.net; s=googled;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sM4EI5EG8aFU0eCqXxfKOVx9vcJ9fHC3LeTBs0eo7r0=;
        b=Vp5HkvPRblNR7maW8zuZrwdq2lE0SXcr+CtwyVTGZn1L2pCKCKgh8KnAif6jf4iD/B
         7Y+G1PZa4tMXeu0plBaywXBc+Bee92QSCz4JGUjigl4ll3QxehlxMlaTNPi9ORTNGU7s
         UFtfLgxAoNQrSdhlo2lLPHKK/FWMu29+tyrv5eUMdH92woXr2Xb7OBFbHu5Vq9s+aHt6
         a3duvn8piFheu2ThyPoG6e8hTQmq7fYeTKg8w+n0MGamtMpOe1s2BliDMcbZTAl33JLr
         kduISj+Ex0nvmXiXCpDWCjJ76TzfGU67GN/DmKbYnv/At9tXskaIitYqnsMe40iRr4dT
         +TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM4EI5EG8aFU0eCqXxfKOVx9vcJ9fHC3LeTBs0eo7r0=;
        b=0HQ1UvQMHgsQ4Ke/7cO/rdOzorganJiRZOFhqCqqlgfl/SHCrp24hWnP7KnCt4YwZi
         RdEo4P5nWwBx3Efm44PLn3RYkNjlGXw3YGGnMh9ZsZWFYmfXU1GJwvJ2nL1NdLx+vslE
         48CPfomvH2wNgYDm7WroGKMae0h1+kuKrDkil2xlwPktDb399uvQX+sLiCvIgdlDU5Jc
         SlDzo44P/cDUhpYbRl3++fx6AijmNj/TdainP9lw6WLsX0NGkOlG/eVyuAEIUA/L+ANW
         NnX7MW68BEzlCaKjXI1BZPOQFqIjXK5bQ475bR25KonKHwSowqmfrYBF9skRbImQYKii
         YgYA==
X-Gm-Message-State: ACrzQf0t/+NriAa5oigYF8DcQth/CJcq74MMUicPipYQVz0tE1E8xNZc
	6BVGLdFE3F5PRt7nXmuK6to1z2wnmq6xolnrvaMJXmYzOQ9fR9LfhHnLRRoNFZZCdO7lhS913RZ
	FgCKUDpekjHIm1NK2bJalnTrJPUMM0BCZCemKXivM+cM/TMUr4mdgmx6u
X-Received: by 2002:a05:6a00:8d0:b0:53b:2cbd:fab6 with SMTP id s16-20020a056a0008d000b0053b2cbdfab6mr25812764pfu.3.1666469295622;
        Sat, 22 Oct 2022 13:08:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4TQlnIFWemjieXYFHB4kZCU06MWCA0fuLbWzeSKkOadrNWOw5GKkPPMHCMsnRSY108W+f8AO/qejDPa7Rc+Pc=
X-Received: by 2002:a05:6a00:8d0:b0:53b:2cbd:fab6 with SMTP id
 s16-20020a056a0008d000b0053b2cbdfab6mr25812755pfu.3.1666469295383; Sat, 22
 Oct 2022 13:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d4898956a848c85fc93c3f7d25cafbfc49a46e60.camel@zohomail.com>
In-Reply-To: <d4898956a848c85fc93c3f7d25cafbfc49a46e60.camel@zohomail.com>
From: Slade Watkins <srw@sladewatkins.net>
Date: Sat, 22 Oct 2022 16:08:04 -0400
Message-ID: <CA+pv=HOrpzS8j6Pq=GD8_U6n9VWA8pyTwKRP40dixSHsZ3=MXw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Staging: rtl8192e: rtl819x_HTProc: fixed missing
 blank space
To: t4rmin@zohomail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 11:48 AM Aaron Lawrence <t4rmin@zohomail.com> wrote:
>
> From e6635103e3cf2426220767955b99d2e2b62a7329 Mon Sep 17 00:00:00 2001
> Message-Id: <e6635103e3cf2426220767955b99d2e2b62a7329.1666450553.git.t4rmin@zohomail.com>
> In-Reply-To: <cover.1666450553.git.t4rmin@zohomail.com>
> References: <cover.1666450553.git.t4rmin@zohomail.com>
> From: Aaron Lawrence <t4rmin@zohomail.com>
> Date: Sat, 22 Oct 2022 20:46:25 +0700
> Subject: [PATCH 1/3] Staging: rtl8192e: rtl819x_HTProc: fixed missing blank
>  space

Hey there,
Could you resend this without the above? For whatever reason it was
included in the message, even though it shouldn't be.

-srw
