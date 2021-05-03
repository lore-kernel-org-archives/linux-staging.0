Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D270
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 17:08:29 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id y1so3162841plg.11
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrRWmFjrLRqx+OLwKIC7R/uG9pdSkec2h+vi6VT8VLY=;
        b=Jp74gdkkTmgDo9v4VOfTpJWRqlLJFaozRUNlQT7QkD5ejT0wnbC50osv1BWfZqR/qq
         Ba4U5mUYkXkha4Z4pxqJ/CPZR7j7vcOZ4mOs7ks7D/OniKWFLQ0QeSVylaOnlHu3tFah
         PvZbNIVFG7qeMhr6zz6zSR2DL5LCjy3RnqNS+H9cmjYfR/27ZMkDmLv0fDyXAeFZvMD1
         WnVIGY76KEtZrqr4kaP+vXWQaQylfPx/bWxiYC7prQAnTPFDT8skawp6RHzJyuZAekxg
         92y+HljpwYO4uNzy9fGbUm5IYxIbSNIAzM5okopoBm5Cy8j3R4MjfanI+ReWGcJmwurM
         pAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrRWmFjrLRqx+OLwKIC7R/uG9pdSkec2h+vi6VT8VLY=;
        b=rpO/A+RH2yGEpeZthnOc+Efad7VNfCXG1zkN1CJo52tsnyvAWwB9PqZmO11nw0cpDJ
         a/UOGHzH6g1tyY5LTPRtnR2tPLbzX3LCjOfXxHYp8rblWjD5lX7t3q9Mh8XJQkDRpR6O
         CCT4k8KoBD4YdSlDMmFEmFL0bP6sZ5w00dkoRq5ijdHcpyQdDIRTCMVixbyIlYHCQFDA
         0tFC4UtabdkNphPx1ejNcQ8EsPAgzThGjIROioklnkz0U2kPzS4K+yGq/Sv1mjBsYcNg
         Lf7isJyuhJvlBNybRcf5ccXIQ3fFnPOfyjZx50eV95dXiREFnEEimRnHr5r8S3MJ1SNo
         oEVw==
X-Gm-Message-State: AOAM532hMJJHGCKCNb8QsdWsJt552Sg0hvo5VVcXsUFhKZvIkrMneYvZ
	tk1UThEqxDzmsGdKUKI4AZ/pdmgifWWlM7rKz2o=
X-Google-Smtp-Source: ABdhPJxMSaqHagIBw/RaN/Jrt5UgDo95VR2FBt5AZ/JmWispzseF85caEUVyTm8/e3OxIIvge/eTA9e/CFlO1Lga2Yk=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr21437040plc.0.1620061708582; Mon, 03 May
 2021 10:08:28 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-2-andriy.shevchenko@linux.intel.com> <YJAm6D2LUtVz1YNa@kroah.com>
In-Reply-To: <YJAm6D2LUtVz1YNa@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 3 May 2021 20:08:12 +0300
Message-ID: <CAHp75VeBbjpczF0ggQ3STySnj15dthPNF_-=b9VXNeMyb_LY8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] staging: fbtft: Rectify GPIO handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?= <linux@jaseg.net>, 
	Nishad Kamdar <nishadkamdar@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 3, 2021 at 7:46 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Apr 28, 2021 at 04:04:12PM +0300, Andy Shevchenko wrote:

> > Fixes: 92e3e884887c ("Staging: staging: fbtft: Fix GPIO handling")
> > Fixes: b918d1c27066 ("Staging: staging: fbtft: Fix reset assertion when using gpio descriptor")
> > Fixes: dbc4f989c878 ("Staging: staging: fbtft: Fix probing of gpio descriptor")
> > Fixes: c440eee1a7a1 ("Staging: staging: fbtft: Switch to the gpio descriptor interface")
>
> I get the following error when trying to apply this:

Argh, i replaced over all commit messages when added staging prefix.
Thanks for catching this!

> Please fix up for your next version of this series.

Will do!

-- 
With Best Regards,
Andy Shevchenko
