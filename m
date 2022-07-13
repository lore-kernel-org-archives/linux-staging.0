Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E34A0A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 19:11:11 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id e69so20915557ybh.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uX6Kc2kAxANJpf80UpilSQ2SInJgmyK49SONOFQNv5c=;
        b=iqVLGZ4UHwqB4eZdQyeXhiOEO+3NmpiA/ZmKUZ3pojmgFsncTkpWmPWEH6+ykG18ae
         mHYXJpDCYYAX+LOCja5quKdYDeVwQBkzP5VSKjvA+JOqHRBeG0ePsnW3S6y8aZMwu+Xv
         us7pMqfk3SeJPMf4E8N6+/hDpkiDabfhM6Xus346kN48d+1zkrjBRPjbWfCPS2NGUJVf
         OT/KyT3Vo5ti4qLNEhIuyE1W6+6HvnH+ENqkryha0rdTdP2IyVbgzSxvuJlXWF9HGYDN
         ND6a5hAb2qfk94K/GM/VejQ+ISdNeM7+bhoN96fn8G7yXSbzZP7/52zcbjLwybjCTJOY
         8LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uX6Kc2kAxANJpf80UpilSQ2SInJgmyK49SONOFQNv5c=;
        b=XqQ+7eBijY1Us3PYR4ExPRugBt+Yu/cJIs51D6FwexsBplJynUMs5bsvMPLxnCNzX+
         4VLNyXBC2s3j4+1n/sHrOLz/WXuY0aZXWBncrHo+AJs67kO4QfMc5AgbZTyReQ9jEv4j
         NMcO+caQy0BWPMU8jYh/FQed+BpjYUQPe3UZxr3wkBEr77gEbc/PNkElx0son9FX28DA
         9xp8Kw/FnF3eWVkpImH6AhaD5iJ5WLcEznBQ3Jzv13OZtSKo1P1nxZQ3oCR6CMkBBq/j
         j5biYFTbGV+JZTG/D6M3fstt9DQ7/aSVTlkd91U3Lg9bqfmGZVhggvjAPbGckLpEHQhB
         IXUg==
X-Gm-Message-State: AJIora8PC5EvRfS50upgAyZDH1zZHyuwPmvqEknTO8pXSm7uRwGEUHd2
	+odnx3zbGzTejZshuE8TYnmEJkreCCtqZV1FSXE=
X-Google-Smtp-Source: AGRyM1ubtEnBQBhsUQ4cfAfwgVqIR998ItYnbTDQhKD2W4fja/tTb/hnXkjG4PQuVLspPo/Bt6mh1j4EftGpjQ1ATcI=
X-Received: by 2002:a05:6902:686:b0:66e:627f:4d29 with SMTP id
 i6-20020a056902068600b0066e627f4d29mr4782371ybt.385.1657739470007; Wed, 13
 Jul 2022 12:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713163201.136202-1-sebastian.fricke@collabora.com> <Ys8Txuq9/u/EL6sj@yury-laptop>
In-Reply-To: <Ys8Txuq9/u/EL6sj@yury-laptop>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 21:10:33 +0200
Message-ID: <CAHp75VeOLfKw4-+Dpn54yy6j=tdiBNA_2Kvhj7mUUjTD-M_vYA@mail.gmail.com>
Subject: Re: [PATCH 3/6] bitops: bitmap helper to set variable length values
To: Yury Norov <yury.norov@gmail.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	knaerzche@gmail.com, Collabora Kernel ML <kernel@collabora.com>, bob.beckett@collabora.com, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-staging@lists.linux.dev, 
	nicolas.dufresne@collabora.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 8:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Jul 13, 2022 at 06:31:59PM +0200, Sebastian Fricke wrote:

...

> I'd suggest you to try implementing
>         bitmap_copy_from(dst, src, dst_off, len)
> or even
>         bitmap_copy_from(dst, dst_off, src, src_off, len)
> if you expect that you'll need more flexibility in the future.

Do you think it would be useful?

We have bitmap_replace() & bitmap_remap(). Wouldn't that be enough?

-- 
With Best Regards,
Andy Shevchenko
