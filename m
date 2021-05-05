Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175772F80
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 21:05:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s8so3302911wrw.10
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g5ki2/CLKVqUgPJDuMEAG4cnfXDkKd3GHXy+wbhARKI=;
        b=p7Rlwbr8mv7jGUNwi0jN/4GCdbp7e6pJ1lZxgkqlSu+PZdaF5oj+5zKbPtjahy+vFF
         tENG8rNcsc8Pwf7NNm35QjHKGVNOqo1YHxG0K2Ca8Hrf2sotk6g4a/UrBYtUj6s6XDBF
         Mfse9xLoT4/SZxdeXRnjOTP9ojvTdF4FXWg7nTSFqR7PHHE5vAwGONWf/jf9EVMSiW5Y
         7M7r8YyB6E40nSF79yhKryY6cCyPc2cqFsuCr3YnO6MIH+V4klptjQXyM3/hjfYF0EK6
         3IjVm4HvIi/yAR6vLDwbsDp6oLTPdXH1YheEJVCw9rOZsagYZraExCAT8+5A3yacw6o4
         u6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g5ki2/CLKVqUgPJDuMEAG4cnfXDkKd3GHXy+wbhARKI=;
        b=pM+uokLSi7zm2BDOwh6m24AB1tpqYFutQrbShvoV2i6PFigLY53e+C7dLxAoQGXQua
         HNqA0f+dOZlHlAHu0CxPns1bi5lYYaN6L5uqxAJhct3GkkiWxD7JxBjAnwp+iSgxAUsp
         p9uVSb+Zg9y0Heqcm9RBdd+s+E/ooqgDHOEF+8/9g8ed4+qu+614YgnypHE022hT1Pxu
         jVeXNFsx+lEKiYWaB4vHQpwV1vFMtEIsyc+737V/SNUuPr02c+ErPGyKaetDcinx7P8g
         hi3JFsbNden08WySM6CavL9jlVYm00tc5ABSmMWOKC6mLnznHOLOC5GCCQBNNY1KHHvg
         fJwg==
X-Gm-Message-State: AOAM531p42DWunX6o2ZUdQVxIqVW4e2ogzjSLkfUkbJehZbPa0P0UYvv
	fXoc3LXRRjTfkVQ5bvUO2X6gNGz5ITnbrLWxhx8=
X-Google-Smtp-Source: ABdhPJySFOPL32IsiHzXxOLPr7i/2s93z/L5O3MggJsMqA35YCWwrLaIvQL3/UKOhXn2TWKsMNJIMQRel4m6RdV4CdI=
X-Received: by 2002:adf:d215:: with SMTP id j21mr1034577wrh.251.1620248706459;
 Wed, 05 May 2021 14:05:06 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de> <20210505202923.198607-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210505202923.198607-2-u.kleine-koenig@pengutronix.de>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 5 May 2021 17:04:55 -0400
Message-ID: <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering drivers
 without .probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 4:29 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> A driver without .probe() callback could never bind to a device because
> anybus_bus_probe() returned an error for such a driver. So refuse to
> register such a useless driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Looks good to me. For the series:
Reviewed-by: Sven Van Asbroeck <TheSven73@gmail.com>

Uwe, I'm glad you're submitting patches for fieldbus. Hope you find it
useful. This code is in staging mainly because only a single
company/developer is using it. So if you are actively using this, or
planning to use it, we can work towards taking this out of staging, if
you like.

Sven
