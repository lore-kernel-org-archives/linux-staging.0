Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21673FCD
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 21:28:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id k13so1999953lfv.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCael78eHTXtzN3Jeoe7P5VBsdIsgjl3tT58y4QUcXI=;
        b=TPQiuLqHwS06/WSYc3aqR2n6F/ZnAzPZ4cNqDMXlKyJHO71AdpC+c9mXY5rUoJ3NO4
         n+bQPZkg8zBYBQZ+JJoFiRBDUDni/OSVdlNcEk1xo7LgvQZvnhIuKPbZnMQqCW54neIR
         I9Fi7MrYRX5+XT9b7cJOyWiKEjBb8tb2adItA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCael78eHTXtzN3Jeoe7P5VBsdIsgjl3tT58y4QUcXI=;
        b=Ran464ksVuAj4TdQUBAgn8ymqBB43MV+wISiwMZ+faS5PH63DE8wFZTTHvIbNz0N+I
         uiBkSb5dZPaZlDYwDxP2vM7mlQ4zJXLYBXgB9ZowPrB+oen3kB401wGyqgCknuReNJCI
         8HX3dc1f7ECVvwRNZpqjClqIdpuoR5WV+oK1//i0mlXGApFZb56g2NQ34wanUgiRWUXv
         RrSsUe2H0ogm5PON/GxXnlFxlJoKk2FOnYm9AxUUYx/vI4mDNHYWQ1LTo90r7QlMdZYL
         Js8giHMbwrWjlH37Y/vYPNqxY1MJnLUBl5erT9lLRDZRYasGBZE0CKLlcb1iXv11omaG
         i8Zg==
X-Gm-Message-State: AOAM530F97nenJfBW3gDPqKDDQMBKBRwBhsnWvp5fn8m/8eZuUzWoX7T
	LGs8G7i3SAAJBK/zX+4UclfqNnKPYsBCkDxt
X-Google-Smtp-Source: ABdhPJwpvNb6/LLl/INi4qYSBYpIKjzWVAoGU6KcRhCpczBI7keQBqycwhqwjgwXfx13uHJoTT18AQ==
X-Received: by 2002:a05:6512:3d0d:: with SMTP id d13mr1046366lfv.513.1630531700291;
        Wed, 01 Sep 2021 14:28:20 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id d19sm64940lfv.74.2021.09.01.14.28.19
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 14:28:19 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id s3so1408801ljp.11
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 14:28:19 -0700 (PDT)
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr1305255lji.411.1630531698848;
 Wed, 01 Sep 2021 14:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YS+LXqoDGk0CqU1Q@kroah.com> <CAHk-=whqN1gAZk0ZD_4JxGemdbpnQkDaNFY9MjW==v-kb1J-fw@mail.gmail.com>
 <YS/pzJCV8MiwOPRB@equinox>
In-Reply-To: <YS/pzJCV8MiwOPRB@equinox>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Sep 2021 14:28:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzVVzA5Ng0BUZOvhxEjQiopjwWM5KQDhh6-dWKbD_=vA@mail.gmail.com>
Message-ID: <CAHk-=whzVVzA5Ng0BUZOvhxEjQiopjwWM5KQDhh6-dWKbD_=vA@mail.gmail.com>
Subject: Re: [GIT PULL] Staging / IIO driver changes for 5.15-rc1
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 2:00 PM Phillip Potter <phil@philpotter.co.uk> wrote:
>
> I left this code in when I wrote ae7471cae00a ("staging: r8188eu: remove
> rtw_ioctl function") with the intention of modifying and reconnecting,
> once the changes to struct net_device_ops made their way into the
> staging tree.

Oh, ok. That explains why the dead code existed.

Yeah, I guess y9ou can resurrect it now with the new siocdevprivate model.

I actually ended up doing that first as part of the merge, until I
noticed that the code wasn't connected in the staging tree at all and
then decided to undo my merge and just remove the dead code.

            Linus
