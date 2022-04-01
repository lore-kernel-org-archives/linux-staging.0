Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5886F7B
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 06:50:14 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id bg10so3847519ejb.4
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=YuBl/f3XfwHvQa93+ozqB8r1E47ocLC0Rqnq4xYkwnk=;
        b=dbN8gBG1DIw4qjBl6ffKKyiZ7V0DgQNxcTQaaAqGEjfw0Y9CIT9fi7Yxtkil2lBF4d
         lluQ2qS4B+ycFFK++rnpr8ovwDcCPqugcI1ivBF9S81SZszy7IAwY0Z+t3mJL9Ks03Q4
         Vd9bENcM5LH1zxOIi+WhsPx3iJLlM9GL14gr9cVZl0+El0PS+L1RpFYlKZB0zxZ8Fc7t
         bzSWeuiMTsirTmSq3nI38bxmdM8lFqR6C5kwCkJW3+FYyiW74VsGFpYdvES/ICY4THji
         GHC/j4/h+owfAUSYy+g1E2Xc39VT2PvDCcHrY3u5RfCsZ9tI+Cc/oVQE03IpYARaHWKt
         9LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=YuBl/f3XfwHvQa93+ozqB8r1E47ocLC0Rqnq4xYkwnk=;
        b=MFMbbmyiilZqY4B9lUQhgz8yXoeTfc93LkLKAQoSlJc04Nn+f4DXGOBf7sUPD2umnD
         HCKesIB1SN0mD+hYF0f5Sk20lB6VddgC2mCy+6/7Q4D96IqLdNYoepiEuJI0U4yPL+gW
         mkS7ubeQ+EYFv23WvsN7SCIpJH72PYTDRDzmrbssqgBkJOqIvn9378fJjHmwq7+zWSRr
         RXbr9rM7PcsmkANDGgXEyMy9boANq+2KBN+B0xx+CCDGwTtRKTX6IO9fcL3q2n9o21Qi
         WLsqLFhRgNYaWWXfoiesvaXaI05WtO0layctTldLotenJTL6rs5EG2C2UN+6a+kGUSAM
         8PMw==
X-Gm-Message-State: AOAM531Ix3NJWg+XATkxlyGvu72WbsQsmed3MJFxMBbEt3czKvghMMYh
	2vwMc2y1ls2aTxh1WWAXJ6w=
X-Google-Smtp-Source: ABdhPJzMkxBXFe5gLY12+rQoXVgTb5dNkbuEXAGLuYMAH+KhEA+hGON971+OoAEx8VXnJWu+9qVn8Q==
X-Received: by 2002:a17:907:6e0d:b0:6e0:59ae:21f1 with SMTP id sd13-20020a1709076e0d00b006e059ae21f1mr8351917ejc.362.1648795812369;
        Thu, 31 Mar 2022 23:50:12 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.gmail.com with ESMTPSA id m24-20020a170906161800b006d420027b63sm678937ejd.18.2022.03.31.23.50.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Mar 2022 23:50:11 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] staging: android: ashmem: remove usage of list iterator
 after the loop body
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <YkaP6UWmSZjxO/oA@kroah.com>
Date: Fri, 1 Apr 2022 08:50:10 +0200
Cc: =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 "Bos, H.J." <h.j.bos@vu.nl>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7BBD57E4-287B-461B-BC5C-D2FF35865D39@gmail.com>
References: <20220331213934.866804-1-jakobkoschel@gmail.com>
 <YkaP6UWmSZjxO/oA@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)



> On 1. Apr 2022, at 07:38, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
>=20
> On Thu, Mar 31, 2022 at 11:39:34PM +0200, Jakob Koschel wrote:
>> In preparation to limit the scope of a list iterator to the list
>> traversal loop, use a dedicated pointer to point to the found element
>> [1].
>>=20
>> Before, the code implicitly used the head when no element was found
>> when using &pos->list. Since the new variable is only set if an
>> element was found, the head needs to be used explicitly if the
>> variable is NULL.
>>=20
>> Link: =
https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqXPwr9Y7k9=
sA6cWXJ6w@mail.gmail.com/ [1]
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> drivers/staging/android/ashmem.c | 21 ++++++++++++---------
>> 1 file changed, 12 insertions(+), 9 deletions(-)
>=20
> What tree did you make this against? This file is no longer in Linus's
> tree.

Looks like the driver was removed just a few hours after I rebased.
Feel free to just ignore this patch.

>=20
> thanks,
>=20
> greg k-h

Thanks,
Jakob


