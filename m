Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE37B
	for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 23:12:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id u20so18462294lff.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 15:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=COC/4g+XK0ncFFdjTFjbGI8kwJnazvpy+Y8Z5kBv2abHG/7OdfJl8XVUO/gQJQXrgU
         7syJ6Bl4EH1rhevEXJDyJCzV6vXIrdiBYUsB99agtvA7QQFqI7pET+wt/bULnxpe/llB
         DoHBp+DrTOur4By7IXXtsNs4+hSllcxUFM+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=fJHQsNVYkToZvrzgH//wqIyME+hysg9tJ6ZoBfCcuhe/f3JvWwE+ZvikQgarbywhez
         XsRHTO2bXqRu9op5aA5uC/NMMBWXo6CVoDZ999MikL0qgVcIuQ/tNZzN6fNzA9EtdlFn
         +udysOixSb7lfkstpzWMQrJLGe2ehZSs63pmySf1CYYvJQNi8DPBm0dpqVK640wdeOSH
         voebTgi1zuCEKwbWa5qiOv5qlD73/zyVDg7QzO2Ga6kTEi7Ik3xALBYhdaTcmKPqu/81
         m99ZVooDcyXJcwQxkVOvzgYSGjJM7zEA57wUeveZL1BWbSImDNHi4vxAZoqX5jA7oWaU
         AFnQ==
X-Gm-Message-State: AOAM533+K6lRgk34WAbjsQbky8zOju8vAK4JHH9u2SjYNXHmJ58Nh6K+
	grgM/Q8LKk8f7iIPquL3LHjVFms/OIDcvtYioFU=
X-Google-Smtp-Source: ABdhPJwczpUbDuWy4H0nDEugM+S+pPRDPo7gksywd9nVUpApUcY4cPw4KW29/My8aPxG7deeJjFH0Q==
X-Received: by 2002:ac2:4c4a:0:b0:443:3c7a:63ce with SMTP id o10-20020ac24c4a000000b004433c7a63cemr10634174lfk.182.1646003521484;
        Sun, 27 Feb 2022 15:12:01 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id a21-20020a19f815000000b004456ce23ba6sm754264lff.71.2022.02.27.15.11.58
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 15:11:58 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id v28so15003514ljv.9
        for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 15:11:58 -0800 (PST)
X-Received: by 2002:a2e:b8cc:0:b0:246:4767:7a29 with SMTP id
 s12-20020a2eb8cc000000b0024647677a29mr12717079ljp.152.1646003517979; Sun, 27
 Feb 2022 15:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Feb 2022 15:11:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To: Alex Elder <elder@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.

As mentioned in the original thread, making things unsigned actually
is likely to introduce bugs and make things worse.

The warning is simply bogus, and the fact that it was enabled by
-Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
be fixed in gcc.

So don't try to "fix" the code to make any possible warnings go away.
You may just make things worse.

(That is often true in general for the more esoteric warnings, but in
this case it's just painfully more obvious).

              Linus
