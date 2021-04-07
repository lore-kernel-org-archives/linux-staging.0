Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D66D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:43:43 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id o11so4965242qvh.11
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSbaVUsAS/4147GZ5oGOQn53zvd+9eX1P35DCfcHl/c=;
        b=M6tfz/dci/9n23rYcKMyI40m83L1YwzDU50IEMILM7Y3owvZvyVg9qgGKplnSwNTKG
         HQN7sMtN0pB1iud9GYznkOjkDbpm9EsXmnKum6zlFasmM97td8Rs+fH6/ealNiGJqNOM
         xh7OE0p+XfCRIvJM6IEXyCByWpGs3zVdG9yqyWgZDeLQk22bPpi59vUi0aRFSBfcwmic
         mu+p6LrGu6t81fT2j1OeIg2GY5S+3C8mvzc3rVM2D/hal9uwDCW3uPwFcSgy1P2n4DE9
         5sJJOKLdmamQ+o0fuD4SOtjryT2XFyAk6nKko2owXSD+RYJWInWghcLBHDGOU6+wpkGH
         3mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSbaVUsAS/4147GZ5oGOQn53zvd+9eX1P35DCfcHl/c=;
        b=VHFkaldpMV7XIayo6U+f88YCNXESzz6kNYiMO+7kA3/8F0vZDAwaq+mREOXA1sE9Th
         01Cj0/qbhS/QIoxN6MeMaWpjJcMmIQIP4cRGix6Dwqk3t6l2uLor7RFzoJpV7CmXu3C5
         rgIkQ5jrgQOnjk9aZ1mCoqsdS0ekup1MUb1vlmZScSvSpeuNlu/Zbt1uiOOz3jb8+2pu
         IKe3Tb+0/+8JhisELEYrEVacvyKeSVMukYix0rw/5cWLW33Sjq+Po0hP/ueLeNlVEFld
         /YiJxFyWBcjoaSt/EstZXKQqWD2RJk6FXonYl2DE+tw3MDp1Q/Eg2omBHd5+lYMQRbY/
         n8vw==
X-Gm-Message-State: AOAM531ekLWlw6XXHnO3sOkAlmNHKIr2Qly+U25FXYQKGTitkdc3J9+u
	B42+GSlb/GrsBNczHPLBSyGU4mmwmnba5HWmPqgM1Q==
X-Google-Smtp-Source: ABdhPJxToNO98/QcF2h2Uhm6Vuxc/23r2ktn4xRvT/9iu1pSFSpCQTh7pUXyHql1h2bFhOqEN3vWzgHYGEiXG2kkce8=
X-Received: by 2002:a0c:c243:: with SMTP id w3mr4077902qvh.34.1617810222315;
 Wed, 07 Apr 2021 08:43:42 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210407140142.447250-1-abbotti@mev.co.uk>
In-Reply-To: <20210407140142.447250-1-abbotti@mev.co.uk>
From: Spencer Olson <olsonse@umich.edu>
Date: Wed, 7 Apr 2021 09:43:31 -0600
Message-ID: <CAOx9Pehoh1nPng__Bx1RJo9p7uX8MMM7fN+Wzm1oOosDEEDHTA@mail.gmail.com>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 7, 2021 at 8:11 AM Ian Abbott <abbotti@mev.co.uk> wrote:
>
> The code under "drivers/staging/comedi/drivers/tests/" is built when the
> CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
> on the "make" command line since the option does not appear in the
> Kconfig files.
>
> This patch series fixes a compilation error and various other niggles
> including checkpatch.pl stuff.
>
> 1) staging: comedi: tests: ni_routes_test: Fix compilation error
> 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
> 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
> 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
> 5) staging: comedi: tests: Correct unittest_fptr
>
>  .../staging/comedi/drivers/tests/example_test.c    |  2 +-
>  .../staging/comedi/drivers/tests/ni_routes_test.c  | 81 +++++++++++-----------
>  drivers/staging/comedi/drivers/tests/unittest.h    |  2 +-
>  3 files changed, 42 insertions(+), 43 deletions(-)
>

Hmm.  That must have been a fat-finger on my part when I was
submitting those patches.  I am pretty sure that at least one revision
in my copy did have the option comedi/Kconfig at one point.
