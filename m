Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E4526288
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sx0Xr4Bh"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9338e4695so14599551fa.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697127803; x=1697732603; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4LH3Sij9XQU79jEPgJn0yMrYODWkACYHDE2obGOHWY=;
        b=sx0Xr4BhTA9x7vd4Tt8T17fF003VkEqi9k/M15k3h0A1TWXe0NLEcDmw+ah8D2VKTi
         ay8SUwYXNo5AP9rMFk6iwgfQGRf3nu1Q9s4rlLTHN/BtUPafl4EXUf8KNDIFfBA0MjFh
         hUNL1g+z073w6XdfIdMEASLZB3f4koL2RCGvlYUwR5+gK6J4ryVst9VMBLzzh749b58J
         uqH1OlpTDKrKuTd2Go+o0xhBESVOYL0F347YJ5U8DubjwhdRm6EoZ3tvvzgjZiI6Mlhk
         b5XJ2ZmaelZMS0tFeP6AjsQZ067fjH7SPizXQvdWLFtymiGpIdPOdVALQd1jf6mKVuiL
         EhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127803; x=1697732603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4LH3Sij9XQU79jEPgJn0yMrYODWkACYHDE2obGOHWY=;
        b=iaN10+OVKu89CK6wCrRteBUo0nk0PdQfbIdaztIVJE0rXS60Os579nmsVHlhkfVJ+G
         vOjPXl6SwPAiEguaDQfcfHURvAs627G/GDb3ydiCZs3Hi1UcljL2eGS6NR6D/RIZK/YQ
         IMVOg3qG40EisP447Sl/7ncfumUC4XgHKGSg9bDQPbV4wypxHeadeLkGdyRGdkBI6mzF
         VNwWdM2kq2OIAWkX+SHyOaGyhbKi5wHI0/DgM9InLlC/s3NcU/PQpFhElxZ7Upfl+6Dc
         70Uizf1mJ7Cov1H5W8xOcbDkH5BH361fjRrVcmIx+JwR+b2KfA/25dnrmBW6XBB4p9JY
         KZpw==
X-Gm-Message-State: AOJu0YyDag39p1DhC017dkRRLvCk8uw3zTy2ii1O7oduGxJfUpblpAB5
	a+nv0s0afqHB7TPX3YwfXzsMDTAsjfumXKAxSefjDA==
X-Google-Smtp-Source: AGHT+IFjGWcALEDp/yA+Wb5/VW6uEkBWP/hZtqU8vCLB497zeqKckI6Gl60gFQvmvGF2G9wgIXC3eDKXw8l+xQvN/cI=
X-Received: by 2002:a2e:97d3:0:b0:2bc:c3ad:f418 with SMTP id
 m19-20020a2e97d3000000b002bcc3adf418mr25123355ljj.20.1697127803015; Thu, 12
 Oct 2023 09:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
 <20231010-ad2s1210-mainline-v5-4-35a0f6ffa04a@baylibre.com> <20231012092522.27ef48dd@jic23-huawei>
In-Reply-To: <20231012092522.27ef48dd@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 12 Oct 2023 11:23:11 -0500
Message-ID: <CAMknhBEzbeUgQweKk7+tmwRTA4XpkMdEHQO+UFRLrcFvQaOf8w@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] iio: resolver: ad2s1210: move out of staging
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 3:25=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 10 Oct 2023 16:12:36 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > This moves the ad2s1210 resolver driver out of staging. The driver has
> > been fixed up and is ready to graduate.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > ---
> >
> > v5 changes: New patch in v5.
> >
> > Diff was made with file rename detection turned off so we can see the f=
ull
> > driver code for one last check through. sysfs-bus-iio-resolver-ad2s1210=
 and
> > ad2s1210.c are just moved (no changes).
>
> Excellent.  Great work btw - this looks really nice now.
>
> I did a final scan through (most of the code was familiar for some reason=
 :)

Thanks for all of the reviews. There were less than 200 lines left
(mostly blank lines and boilerplate) that didn't get touched!
