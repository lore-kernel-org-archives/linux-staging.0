Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641853FE6
	for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 16:42:34 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b24so15434109edu.10
        for <linux-staging@lists.linux.dev>; Sun, 20 Mar 2022 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C4e4Zl1zdi2PDdgomvp1kwsF4rs95DeeBpdKzKoWk40=;
        b=okLI37gOXbcKEuOcsWd7cavyqhQScuhWHoV3NkIgLSIaWkTyLanEUOi0LKt6D/imFI
         ARfhmVlSdGPzFTAaTJPQggsrhSUzkFF9kdncmIgTdxB7+rt5Y+res9zZwkI3DLTOBqTq
         19+D+HmM4r04SprLOsypxTgqzXlN3TE7aobVsSDGkKVGK5WR9E6YMrCQp1XkARPbyQWn
         FT6V1VYr7t+07o2/BAQEdFjSSsKCvsetd+gGIODcQ2OSWL1J3NU95dfJfOzn7ygSk+pI
         rzfApwg2wb4jfMPcneQOxTrxxElqOYpFDee1LfbjDMGssp3VTHVuzQhCZTMdHVZS2UxO
         IVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C4e4Zl1zdi2PDdgomvp1kwsF4rs95DeeBpdKzKoWk40=;
        b=d2VUI+41eRgPXlQQJG2dAMIJevHRFRhf6zGqwrk24h76k50L6x9ecP5OFuxYin0Rc4
         90+eWG5WhhngcDxpFlDqNQEBLiWMQ3pf9u9MgXlD2RSGbopPOQ3b3calKUAk0Lgx/xG8
         8OddyeO/OBCe8rw1IS6xp3lekkCDy8lgnx/4XGzcAsgtCWzlO7nhJem5XvPoy8xzP7Im
         zkxQXT6ENc9FnK4OgTwUQZN3mjyAVSsfcX8M+DX39saBbyManmVEtqsc8o78uubdawvc
         vZ792QV7CjtlnSsJfjHw0dOSfCmJJrPH2GoWd9KGICq/1VNpBkB2oDwadCtCVGnGR+2d
         YBIA==
X-Gm-Message-State: AOAM532r1cRccAdN3GHcy3pXJjjgLZJKEfmRMi4VbRXR69ib84DN6YKg
	kRfJyjA18p6T1+cvTsyFSXi9cwGgpUvJ8dXKAho=
X-Google-Smtp-Source: ABdhPJzJSOY0k2sKsU/jG2OioiH08qdw/gKwGniiadLSAUaAXKzApW1YK4NJERR/3g0P6jklXuSh2nrqyYJu5VcSOTs=
X-Received: by 2002:a05:6402:5244:b0:417:adbe:e9f6 with SMTP id
 t4-20020a056402524400b00417adbee9f6mr18965253edd.282.1647794552551; Sun, 20
 Mar 2022 09:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225155622.585621-1-ahamedhusni73@gmail.com>
 <818eb53d-0ca5-d0dc-4a06-37615a5c4c3b@xs4all.nl> <CAFjpAKpyDeEKvA9TEK0KbKVHFN8KSMDZKF=L2Azq_7cuAhHH4A@mail.gmail.com>
 <c4368e33-f6bf-5810-85cb-cd31359a42f7@xs4all.nl>
In-Reply-To: <c4368e33-f6bf-5810-85cb-cd31359a42f7@xs4all.nl>
From: Ahamed Husni <ahamedhusni73@gmail.com>
Date: Sun, 20 Mar 2022 22:12:20 +0530
Message-ID: <CAFjpAKqSFwH4QJL3U0YWz9NF_i3BuHxA_jkGPgt97wDpPGe1fg@mail.gmail.com>
Subject: Re: [PATCH] media: av7110: av7110_av: Fix Switch and Case Same Indent
 Style Error
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, Greg KH <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Hans,

> Either just fix it here, or post a second patch that removes the spaces
> throughout this driver. It's a very old driver, predating the much more
> strict enforcement of coding style that we have today.
I have sent the fix as two seperate patches. Please have a look.
https://lore.kernel.org/linux-staging/20220225155622.585621-1-ahamedhusni73@gmail.com/T/#t

Thanks,
Husni.
