Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A3472
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 17:57:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id f13-20020a1c6a0d000000b002e6fd0b0b3fso5733831wmc.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qp2znENGjNE6am4araAHOS3yFZnocvS1VA7PpjH0CYg=;
        b=mkYlZ5ZKQ7rA1IysviyTzbO+MGnjWk9cRypg2AqlmTBKatavByifoW/1orDHXzvPRy
         GHH8QqZH7YMR8gx6MyVk/8AoVy4agGQ/xR4E6cS+5qmuYkNrGSt1xOT3QA5695YWFayp
         6Nvzoottrg7I5MTA67cfj1kFnCI89UdL00x1ae0OKH/h17UNOesCsONtpovzZ3xommbR
         1wIRAPGeJK521Ql9T+1QD3hY4MXokCJlc5SHaRdZ5R9N1+Yu1Sav+ddjPLwPXdATpXgq
         tXsvYVHptyn8a++LRaJYqBqxWefmVT+Ixqa5RW0VeDaywjUCTownCI0uFfXTmxs9IH6m
         kumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qp2znENGjNE6am4araAHOS3yFZnocvS1VA7PpjH0CYg=;
        b=tly60g0p6p2+O5cDYRF3Z/O+3DbsTYUZd9noTWM4COfnmwGB/3xBFEyiPE+4FWJPx+
         nkBAvpLyzCcNzAq8k/QDvyy6BoDIekKubOSDGhlNrdpljuORbfPJFunoHndiKAJCs639
         bRZ2LoJMQIHd5S1XrJCC9cBmZi4N5F0bbORl5hhyhGScBMuvMPXbDoLkkNC8Pf0tk9tF
         G+BMUstooBj4T7/AZWn4XMxKnvxmytSvJnA5AdRiDRx0e3Bcqdo6KwJLtiCkR7ZS6B4x
         1APhTmnbUSD61OABY/Mzuj/89LIzE0BgbzXaJBPNX/OW3uUCZK1RA1uH0E1dAbzD4R+2
         YI3w==
X-Gm-Message-State: AOAM533MuZTPHO7HUnZqGfIA7LX7yHquKcBB9jw5ZS9UruVIeNHRdwGe
	BsvzK0lDaXWuwv5AZxPy9FsiFHqpbmugMbF0qTkw5g==
X-Google-Smtp-Source: ABdhPJxg35G3Ri2pIoXnwotEAV+S/DBC2+/pO/JqBlYi7QTbklhJWunGwvnywU1M/QOFsjx+ZaZbaATVwVQ4vW/BZOg=
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr14670231wmj.103.1629395832665;
 Thu, 19 Aug 2021 10:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210817105404.13146-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817105404.13146-1-lukas.bulwahn@gmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 20 Aug 2021 01:57:01 +0800
Message-ID: <CABVgOSnPVy0St9QHHt_ePFqFmR2MWzLK4BKmky2k2+ABECZbkw@mail.gmail.com>
Subject: Re: [PATCH] clk: staging: correct reference to config IOMEM to config HAS_IOMEM
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 6:54 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 0a0a66c984b3 ("clk: staging: Specify IOMEM dependency for Xilinx
> Clocking Wizard driver") introduces a dependency on the non-existing config
> IOMEM, which basically makes it impossible to include this driver into any
> build. Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> IOMEM
> Referencing files: drivers/staging/clocking-wizard/Kconfig
>
> The config for IOMEM support is called HAS_IOMEM. Correct this reference to
> the intended config.
>
> Fixes: 0a0a66c984b3 ("clk: staging: Specify IOMEM dependency for Xilinx Clocking Wizard driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Whoops! Thanks for picking up on this: I thought I'd fixed it, but it
was actually for another driver.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David
