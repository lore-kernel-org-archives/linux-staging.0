Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099746D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:48:38 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l13so14045715qtu.9
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbPJmtJdQ7BVqkT28E565nFA/y7LagUhwIcJY8SA28s=;
        b=dcfNhQVzeXrqJo0ojvkqehkHzPn2NXYvJHOkAc78Bu4WZQFKB+wqRtoz5MRBJ0S9xF
         HuK7rnsmf70bY4hogfS/197EYz+tAkDCjJND+iOUaU5nIpRytoCQHN3W7PQ645ryXQbt
         k7lqCmkG4Fu0EZLPHlrXTSfr9JVNjXxbTYn0t1xAoNapkSuCD7/Kb6PKaynHu1HP8cu4
         b99nnvRU5USZeQrLtOozXBjU4ADiP8cV7/Oiuq93ZL0ZxXAVex1SkEvJRPFE7vhWJ6qN
         hqFcT1U/9uxm+n0N0cc+qdhLQ72U6sgYsQGwudl4qe+mNFCGpBvAD083j1tS7v7MTpQK
         SqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbPJmtJdQ7BVqkT28E565nFA/y7LagUhwIcJY8SA28s=;
        b=gFn/io2tuurZYYR1faQ1m3ApcQN82oelfWrgzU8LJc0ZbXEpDetxG/+RP16HL+uFR0
         fIR7207fbOuBrTHsuMb0eEHXfqrTvQrocWzIJbfdEP773bmc587PV9KomPGC1p36TIQT
         YBw+/zXn9NrtH4mgbeXE9t81qdrUiXXgqYCuzcOWB5pKTcW8zedCXorGZzOfcFiOVg1G
         zSNjeuVRriS2K5m1aKfQLz3nuIuVMxNOo5hlfcU2J0YEqKDYoRuCb4AsEo7fZRF7uUo2
         5mQX0aanWlrp4nAjUjfq8wkHJieRyGKxiNzljjMRM6REEzjn31aOtaWiUvAkx5MoqGrW
         Q4bw==
X-Gm-Message-State: AOAM533ANAT8K/M2H5Y60DxKHpv9to+OgOsIa32AqYKogseeU9dGElMC
	FyfOwu0PwpDeQdYq3Z/+zW0ruXdo8jlOlMLB5dLQgg==
X-Google-Smtp-Source: ABdhPJytynqYXUzvbxudt9E4wVlqHMGKiuVSw4KZ9ljiMogMlSUxBXoU9TVgvE2HHNWab5TBRA46Yc1jgGL4xcG5XaQ=
X-Received: by 2002:ac8:4f06:: with SMTP id b6mr3326040qte.255.1617810517940;
 Wed, 07 Apr 2021 08:48:37 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210407140142.447250-1-abbotti@mev.co.uk> <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
In-Reply-To: <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
From: Spencer Olson <olsonse@umich.edu>
Date: Wed, 7 Apr 2021 09:48:27 -0600
Message-ID: <CAOx9PegenGENfvqwp2XFiSgYTB6y=g8dQcy3NQ_NipbQFxdGTw@mail.gmail.com>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 9:39 AM Ian Abbott <abbotti@mev.co.uk> wrote:
>
> On 07/04/2021 16:10, Greg Kroah-Hartman wrote:
> > On Wed, Apr 07, 2021 at 03:01:37PM +0100, Ian Abbott wrote:
> >> The code under "drivers/staging/comedi/drivers/tests/" is built when the
> >> CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
> >> on the "make" command line since the option does not appear in the
> >> Kconfig files.
> >>
> >> This patch series fixes a compilation error and various other niggles
> >> including checkpatch.pl stuff.
> >>
> >> 1) staging: comedi: tests: ni_routes_test: Fix compilation error
> >> 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
> >> 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
> >> 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
> >> 5) staging: comedi: tests: Correct unittest_fptr
> >
> > Should we move these to the normal kernel testing directory instead, so
> > that they do get some build testing?
>
> I'm not sure since they are in "drivers/staging".  However, we could add
> something to comedi's Kconfig to allow the tests to be built.
>
> The "ni_routes_test" module in "drivers/staging/comedi/drivers/test/"
> would need a new config option because it will need to either depend on
> or select the COMEDI_NI_ROUTING option.  The "example_test" module (crap
> name) in the same directory doesn't depend on anything in particular.
>
> --
> -=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
> -=( registered in England & Wales.  Regd. number: 02862268.  )=-
> -=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
> -=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

I don't have any arguments against your complaint of the
"example_test" name :-).  It was written with the hope that more parts
of comedi might follow suit and create some unit tests.  In terms of
placement in the tree, I had been following a pattern set by another
module that also had some unit tests contained local to the module's
directory (can't remember now which one it was).

Spencer
