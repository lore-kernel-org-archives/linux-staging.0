Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1194A1A
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 17:14:22 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 130so28665909ybw.8
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=AbP6CVs2QyPBwuEArSUrorWYOdYxHwW8OIfOfTn5CKQ=;
        b=eOa25gfwje15AbAqwKI/mJQjw1D11JnbJ1y5vLhY0zMwPhKwwItsPsXB8GLxGFu7sI
         cwDeNb2HpbwezE7WMZF9aa2m2n3Qvt6a28Azr5tShVTCqLZigd3D+kOwm6ciP62uoVAd
         xhNdeXJOTzSTkx5W3OUAedy8cRtrHEA0+l8p77vEEQZBn8rsound+XYLc0x28T8woXQh
         IlOWBYgnt0FzFQlHrOD6dZajt0F22shBPoNgF1QOQxkhNYi3KdUItJuuBem/B7BmaNmT
         ZsDvrYVfcrNmbVRbGjAUEiQn9LU5OckBsiDWGwpPIrSKyCxALEi+CkKzEw01GjH4vLIm
         L+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=AbP6CVs2QyPBwuEArSUrorWYOdYxHwW8OIfOfTn5CKQ=;
        b=lRYqMFacV09O1X0o0BY9hAKRnuu1uCx0yKa1nFpt77OOLGwrnrXzJvgdiVYY1yC1I5
         hjs3cIsDKrNhvpJw+896cNFTihEy/z4a9RZEh9x2NA/TjRlPrQOYPziuWVQEwl78z7Zz
         eZRAZtAhm64jUFRKg0FW0rET/+qwC0NwOfLGvG4CM3GA9IZRX7LablmgnN2FkRaI68XW
         cWoL4qaW07aDsqfvEUUwwYhxEUQWtacJ6C3Z8TqxmEDvNW8E3RCYdlwRgWTp0ud2sxvm
         yBIkrXJmAAPHrvPy21l28w6AL18Se15Tc2mzOOT7ctub3lfK6mNunO9H4OL1h5TeLp14
         JPLw==
X-Gm-Message-State: ACrzQf0OAK4Nk1ZvcaKUjo7rdLIooQKZafqGEAhbA8lJJoac8Frl3YG4
	JPpRLsqWokfn3x6L3FkpDTtLSk7Xvr7iZQLDbDs=
X-Google-Smtp-Source: AMsMyM5ePgz3WZw5h5kzguoj3p8a7Ccsygth2HM2b53KBz7qrZFMHiJK6dKIc2jAkDWuPFT5BFMS9Xe4gYXoTMvfkQY=
X-Received: by 2002:a25:adc6:0:b0:6ae:e4dc:942c with SMTP id
 d6-20020a25adc6000000b006aee4dc942cmr684152ybe.599.1663262061676; Thu, 15 Sep
 2022 10:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220914080016.67951-1-namcaov@gmail.com> <YyLmEpJBG7fPZ8iN@kroah.com>
In-Reply-To: <YyLmEpJBG7fPZ8iN@kroah.com>
From: Nam Cao <namcaov@gmail.com>
Date: Thu, 15 Sep 2022 19:14:10 +0200
Message-ID: <CA+sZ8B8ogeKhNwvLtj3hSkTUg8AED45unEYP7GCGYuLq8Do8vg@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: replace spin_lock_irqsave with spin_lock
To: Greg KH <gregkh@linuxfoundation.org>
Cc: forest@alittletooquiet.net, philipp.g.hortmann@gmail.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 15, 2022 at 10:44 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 14, 2022 at 10:00:17AM +0200, Nam Cao wrote:
> > In vt6655 driver, there is a single interrupt handler: vnt_interrupt(),
> > and it does not take the spinlock. The interrupt handler only schedules
> > a workqueue, and the spinlock is taken in this workqueue. Thus, there is
> > no need to use spin_lock_irqsave, as the spinlock is never taken by an
> > interrupt. Replace spin_lock_irqsave (and spin_unlock_irqsave) with
> > spin_lock (and spin_unlock).
>
> What is the speed difference before and after this change?  And how are
> interrupts properly handled anymore in this driver if you took away the
> lock that was being accessed in the irq?

My understanding is that no lock is accessed in the irq in this driver. But
it seems like I am wrong. Sorry for sending a buggy patch, I may follow-up with
this later when I figure out what I did wrong.

Best regards,
Nam.
