Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F27B71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 16:20:44 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t140so6082237pgb.13
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/2OfzzxnxOCDxc5Ilck7Epb5dTCszeXwDU9tJLtUKc=;
        b=JGjbNbMLLzkVqRq62QyonJjoR9WwRVFsF0oyMguSXQy4XNImhjTDh48Nl/hEZczEzu
         Kz9bOAmYqHNTRB9N6V8YLhIdW602GBoWKGG4qC1V17db9B+4Mh7Zv6blRzmEi76Ge2GZ
         y2vgTHxrNa9IAoHeco2Hiz++jezn/5ZRbE5AK5/ylBCVd+UNhxzMdzoqVCn64PquDSJB
         Cp6Jpm/UaMaVvtp/dmbH8u6v5inm2NtjdW0K6m8OaSkf8xb+awZFazVgxVAxjlXZzgn4
         zfYR2TNSd2FdbeGUZh/SB0neBaEfKz5fwcE2CHUuRtdDV6GdV3Ui2TvcXyhbUEPWU1t6
         G0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/2OfzzxnxOCDxc5Ilck7Epb5dTCszeXwDU9tJLtUKc=;
        b=DpEOskwrx7N9GbAzcALiFgHmYVx1EWvOXZnB9NIrVNJEY3x0ZuFn83Rr79EhI/+Pgo
         4wageq+RrKJWChiQABc8hRZOUM5W6kT9mBjL+AqCoVxroQFRYKJR3enfjDPXnYJ3mDEA
         nCVDhGYYUgr0rYpSZgcCqvws082xMvSYVExMH8+0aumm5rvS/sFHR3oLt/OS1gO8XcjM
         Ry8tBiV14rBQu0Rek7uLD1HKwT/PvPEhxv2Q4qv1gzK9b+sqyGIFu7s8RfX50re0cowH
         R3SWMX8TsvW7TT3SBTReGgfX9PEEY2ZdShD3W6mdPXUP/AyKvbyaszNFbTUdayvqJe8Z
         kAjQ==
X-Gm-Message-State: AOAM532v6Ooa4xyVXvoR0ZogOwnerZIG92X2RsvwVQ+HqYDgvXURDGN0
	wfU5FM1Yrs7AMrKHlf2xRWGSycjy5S/8eBLZ4eU=
X-Google-Smtp-Source: ABdhPJysfXNLMQ7FkAAnDg8NfcshdeP6IElWUUeqtmyMFGwMs/IKB9hx9lW/QzNPk6Aa+7YLaslAjMlPeHInIfaNbFU=
X-Received: by 2002:a65:6645:: with SMTP id z5mr18024871pgv.273.1618071643867;
 Sat, 10 Apr 2021 09:20:43 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1617993776.git.lucas.p.stankus@gmail.com>
In-Reply-To: <cover.1617993776.git.lucas.p.stankus@gmail.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sat, 10 Apr 2021 19:20:32 +0300
Message-ID: <CA+U=Dsq7EgSapyCmQfuFr+qyDGc=6wLWOruLrugsJsxbGTyBtg@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: cdc: ad7746: remove platform_data in
 favor of device tree bindings
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-iio <linux-iio@vger.kernel.org>, linux-staging@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 9:50 PM Lucas Stankus <lucas.p.stankus@gmail.com> wrote:
>
> This patch series aims to replace the platform_struct for the ad7746 driver
> in favor of device tree bindings, creating the dt-bindings documentation in
> the process.
>
> Since the header file was only used to define the struct and the excitation
> level values, it was possible to remove the file entirely.

From my side: I need to get better at understanding IIO and how to
place some logic of devices into IIO,
I don't know if there is a better approach at converting the current
platform_data into DT/OF.
Maybe Jonathan [or someone else] has some better ideas.
Otherwise the overall approach looks fine from my side.

>
> Lucas Stankus (3):
>   dt-bindings: staging: iio: cdc: ad7746: add binding documentation for
>     AD7746
>   staging: iio: cdc: ad7746: use dt bindings to set the EXCx pins output
>   staging: iio: cdc: ad7746: use dt binding to set the excitation level
>
>  .../bindings/iio/cdc/adi,ad7746.yaml          | 79 +++++++++++++++++++
>  drivers/staging/iio/cdc/ad7746.c              | 43 +++++-----
>  drivers/staging/iio/cdc/ad7746.h              | 28 -------
>  3 files changed, 100 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
>  delete mode 100644 drivers/staging/iio/cdc/ad7746.h
>
> --
> 2.31.1
>
