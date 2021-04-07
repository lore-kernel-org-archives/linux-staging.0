Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719129CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:15:08 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id j3so7451937qvs.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IoDhC05Udeby8H3mwCSxcUxp5KE+GJAbd5CZY5P3TBs=;
        b=Ly7X0pidbe7jE5Ch+MfNQHzWS7C1KuO/xrU2MM3BxU8QlLpAMAAdbSMgYB49SrdYId
         qHaBfjmjCO7YxnWAz2UdwjxsYWfdl8Mx6vrSioxrLqmXbfu53CXL0ntQtz1Nf44Ft4y3
         FDiO+5hoE4jQa0tMaKXTNhjLUb6RGvyDP+24VkV8SVALVw/0MQAPcWfizvI8UvyWKrRY
         xkrnTEIYK8ypSfEOLqFAxNRSGwiJZeBb0hj2wGagg15Mw9BPeeQdfmFF8WaUAauFV/Ro
         djsuOYtM4SYuaNDrTBEguitgqrxlAxSHoPT3elnFnWgs0yFoPo1erPM2xlU9rXh9aeX1
         XTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IoDhC05Udeby8H3mwCSxcUxp5KE+GJAbd5CZY5P3TBs=;
        b=Bzu8Zs5bIPULDEH5K0s7+WIUaCFiSJJ+Xw2Scnki+kzzW2SPKXdltZVl4z4UKjuCvM
         gKXgQVETMnFFWNjVa/nwbfl+ml9tYn+B1grUM+jFq2JvZG37vKnF/iL+LkRu9iS1Q08n
         CDH+Cra3BF9QlOzxrPakeGPF4bW2m3n4GO8E3RLoqW1S2UnWIGAKaoaQ/tZJTBHHn8xK
         DUgBp8y45w+t2m8rQFw1MQiP+/958mbKK7YrrQYIDtsXJarTU7MZjQ0I63x/6kexvRQG
         t6EZz2cqmGGI/s0TlJ5yInpaT4UbZ2zlYXqvl/2heVXZ2V2V/kA+p5HwyqeE+t+/Jb+N
         4J+g==
X-Gm-Message-State: AOAM530wNFmutOckWXx2xUGXKwkY3gmaF0jzv9hN5xlcovcLhUSWHVNa
	deKBuWg3LSUG5KCuZiX/RZQJaJW/k261is7Wc2ovNg==
X-Google-Smtp-Source: ABdhPJyfI6L5FqSy5bABmL8GS4BeBO/bR3+yylf3WOMffhcxCFaq5n0BPn4ZQa3Gp+hwOc5+KUy2O/blibybmrOHFVM=
X-Received: by 2002:a0c:fc4d:: with SMTP id w13mr3126859qvp.40.1617819307252;
 Wed, 07 Apr 2021 11:15:07 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
In-Reply-To: <20210407175307.1114472-1-abbotti@mev.co.uk>
From: Spencer Olson <olsonse@umich.edu>
Date: Wed, 7 Apr 2021 12:14:56 -0600
Message-ID: <CAOx9PegbFfbfBGjOAf+DU15vJ8ZYqYndUp5_907u3=8yTFMMTQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] staging: comedi: tests: Fix a few more issues
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 12:01 PM Ian Abbott <abbotti@mev.co.uk> wrote:
>
> Fix a few more issues with the "drivers/staging/comedi/drivers/test/"
> code, including reducing stack usage, declaring more stuff as 'static'
> and adding Kconfig code to allow the unit-test modules to be selected to
> be built individually.
>
> 1) staging: comedi: tests: ni_routes_test: Reduce stack usage
> 2) staging: comedi: tests: ni_route_tests: Declare functions static
> 3) staging: comedi: tests: example_test: Reduce stack usage
> 4) staging: comedi: tests: example_test: Declare functions static
> 5) staging: comedi: tests: example_test: Rename to 'comedi_example_test'
> 6) staging: comedi: Add Kconfig options to build unit test modules
>
>  drivers/staging/comedi/Kconfig                     | 33 ++++++++++++++++++++
>  drivers/staging/comedi/drivers/tests/Makefile      |  3 +-
>  .../{example_test.c => comedi_example_test.c}      |  8 ++---
>  .../staging/comedi/drivers/tests/ni_routes_test.c  | 36 +++++++++++-----------
>  4 files changed, 57 insertions(+), 23 deletions(-)
>

I am not in a position to compile and run the unit test code at the
moment, but otherwise looks good to me.
Reviewed-by: Spencer E. Olson <olsonse@umich.edu>
