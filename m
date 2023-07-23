Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9C3233
	for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 17:44:56 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-579de633419so38811657b3.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690134296; x=1690739096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sPdCSD5AmFVFEdD2cqqk2qtaqyfuU2DEBfQJVgjKFB0=;
        b=N9vsVovBzUqMiszcLD94N3fd+7uZVZRdtAETQZ4Dox4iiDvnWlpim1WJZC/vQGW2uh
         9oLG5MAiXLXMjUbOBxjnHj4CFq2APH690SkqLWIfwh3+k5yKjMnZ3Run2dfB/EsPUIkF
         1Pkr91u7+hiHQYK57px1fw81a0T2LeL8z52uh1MUdpN878OsZ9F8+MYqnFRo+hH+A3u0
         PhxY2N1P1UAkTH3VsQ6CDOGImMjbhUp8TmH+cwQquBdPBWqVIPFe8ZvfuO0WLbgfXrb5
         0Ow87GBBOsIBFNvDFv18jwnnflSXHu+YA+wu7N3jAs8itxB1gykdRFDc1BpJJK6uLH8b
         TQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690134296; x=1690739096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPdCSD5AmFVFEdD2cqqk2qtaqyfuU2DEBfQJVgjKFB0=;
        b=QpPEEvMwmsT6+EiVCrcoTFLDzkze0avZkAQnSVyx2NKvx4BiRtE1gw/ZN5SlFkKQsi
         i2ZpZog+4VsUaSQht7CHN5qQOEB5AklUfTforWm+/h5hvCWEfOT9P/YDPRR3e4NtdlqI
         eShcm0Yd0wh4FjPAuDaokZMtUEf9VtbH1wx+AXcUgQgNGSY/GYCDN05h9gLb5Uh29fbO
         SBoHHuEdJ6HYK2FEvPx1BG3wgSxlz6vMo8edE9R+dT4cDvr1KeCBdH4DaZ8X35copd7y
         IDgQH4H7KliYWqX4v3gm2x5bwrk8WU9DpckGZ30ViRNAgmSJzIlNlJ33uriF/4u3d2ZY
         dS3w==
X-Gm-Message-State: ABy/qLYkrDFMX60S91CQ0xRmyECGjuxIPpZiiVNrbatxvkHMWbMHY0I7
	DkMiQT1jvYfXDkSMY/DZdw6XZFs0o0chE2z1fKk=
X-Google-Smtp-Source: APBJJlFSX7H7gt9TFDUi3uuo8jI+fP82XT4JuAUkLCOV3bUxhx+tBBiHLYKTPs1zPM4F93IG7mfUgkSRLc0WJtJVvYc=
X-Received: by 2002:a0d:d98f:0:b0:583:78b7:53f1 with SMTP id
 b137-20020a0dd98f000000b0058378b753f1mr4096965ywe.7.1690134295743; Sun, 23
 Jul 2023 10:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de> <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com> <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
In-Reply-To: <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Sun, 23 Jul 2023 19:44:44 +0200
Message-ID: <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	Emily Peri <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>, 
	Hans de Goede <hdegoede@redhat.com>, Kang Minchul <tegongkang@gmail.com>, 
	Philipp Hortmann <philipp.g.hortmann@gmail.com>, 
	Veerendranath Jakkam <quic_vjakkam@quicinc.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Am So., 23. Juli 2023 um 08:19 Uhr schrieb Markus Elfring
<Markus.Elfring@web.de>:
>
> > Am I supposed to adjust something here?
>
> There are possibilities remaining to handle recurring communication difficulties
> in more constructive ways for some hints.
>
>
> > As far as I understood, I can ignore the comments from Markus, correct?
>
> Would the provided technical information be taken better into account
> if it would be presented by any other contributors?

That's not my point, I appreciate feedback from anybody, absolutely no question
on that. I'm just struggling to know what I'm supposed to do when the maintainer
is saying somebody's comments are not helpful.
In another thread I was told I should mainly follow the maintainers comments in
case of different opinions.

Franziska
