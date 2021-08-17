Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3872
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 20:21:50 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id q3so29146245edt.5
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aElaQY59KXNPtiLMXlPfttrGWOlXzIX0OonVI0K93CQ=;
        b=Vat3cvxN0e9+MaFZvF7B+FaV2NKJFQuMbMXn8KQ8MPAjcakztpp5gb9rEJoA4hZIRF
         TfxDNA3kE5Vd1hFPKYG+JFR9scuQxfeymknlhKo89/SziVd7cnovFAPzR4t8n1u3CVN0
         VEYjHbhqBBzPgJJK1ExSyHC8s5Ijl5N3e11BDgZlL/8GsHsbj6tXmPc5eMyvLroQuUZw
         LQmJwpltP3glVvoMIkvwV48skmc+AuC2zxYTbz9nA+a5AZheRhLPoyfSJO5uha2e+La5
         1AuzrqTNv+Pdzoz5kOi5HjMaq2Ha3bYqt3jJebrbn2kAtqJ3EvtJDnoFOYJWcjLGgza0
         lYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aElaQY59KXNPtiLMXlPfttrGWOlXzIX0OonVI0K93CQ=;
        b=sQ5Bq9A3wIwiwM33oH/Ae7S1Xl3zz64pl1ToNv4iWBtwzNRWtm5Lm6Fp25wT36c6pX
         CdUNJq1caNDp9vocKRonC+DuDQRyfsoN2ROUgcWZrHk9vWlNDO1V6kNLqs5/glo/IeAA
         nDq4S8THGIMCuXf9tonOp1sFd+RhD9K4lWnNb4u4jaMeN3FCXxu43/ZxJSFbZLbP4brM
         GLL02Qzc70TcmvF0UY4Ybxp6OKQx31Zx4G6wDTvjiYOMg8Zve5q/5d8XXi8XDKq2yVfk
         kMEEd8t/Afg9PM9N8OXCK74VR1n9PhF3buUJpbnoP/j94qXbEv3crDt9Nxq7HaDA3yJq
         Ee3Q==
X-Gm-Message-State: AOAM532oVdzI/56CiuL+KNQCnS6gcLsQQLrELoWLRXIE+75qjKjk0PUD
	Nb16sUvAhhCrPwYOh1xqGII=
X-Google-Smtp-Source: ABdhPJzwjn9F8+5ManWa8VXN7eBp5yaOnUO8gvrfNaPb1wO23hszNQBUUXG/V0aZAYIajfvkj52e+Q==
X-Received: by 2002:aa7:dcd1:: with SMTP id w17mr5827652edu.322.1629231709244;
        Tue, 17 Aug 2021 13:21:49 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id z6sm1434472edc.52.2021.08.17.13.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:21:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] staging: r8188eu: Remove code depending on NAT25_LOOKUP
Date: Tue, 17 Aug 2021 22:21:47 +0200
Message-ID: <1873149.OoslLVuAm5@localhost.localdomain>
In-Reply-To: <YRv4GLL0BsMm/lf3@kroah.com>
References: <20210816175138.21633-1-fmdefrancesco@gmail.com> <YRv4GLL0BsMm/lf3@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, August 17, 2021 7:55:36 PM CEST Greg Kroah-Hartman wrote:
> On Mon, Aug 16, 2021 at 07:51:38PM +0200, Fabio M. De Francesco wrote:
> > Remove all the code related to the management of the NAT25_LOOKUP
> > method in nat25_db_handle(). The only function that used that method was
> > the now deleted nat25_handle_frame(). Remove the NAT25_LOOKUP entry from
> > the NAT25_METHOD enum because it is not anymore used everywhere else in
> > the code of the driver.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > v2: Patch rebased against the latest Greg K-H's tree.
> > 
> >  drivers/staging/r8188eu/core/rtw_br_ext.c    | 112 -------------------
> >  drivers/staging/r8188eu/include/rtw_br_ext.h |   1 -
> >  2 files changed, 113 deletions(-)
> 
> This change adds a build warning, which is not allowed.
> 
> Please merge this, and the 3/3 patch into a single change, so that it
> all is removed together, causing no build warnings at any point in time.

Sorry, I didn't know that, within a series, no patch is allowed to add build warning
that are then fixed by the following ones. I did it for the purpose of splitting
different logical changes into different patches and the removal of code
related to NAT25_LOOKUP (2/3) introduced some warnings about a function
and a variable that were not anymore used. Patch 3/3 had the changes that
removed the above-mentioned no more used objects. 

According to your request, now I've merged 2/3 and 3/3 into a single v3 patch. 
I had to drop the numbering of the patch because neither 2/3 or 2/2 seemed 
appropriate to me after the merge. I hope it was the right thing to do. If not,
let me know, please.

Please see:
https://lore.kernel.org/lkml/20210817185723.15192-1-fmdefrancesco@gmail.com

Thanks,

Fabio

> thanks,
> 
> greg k-h
> 




