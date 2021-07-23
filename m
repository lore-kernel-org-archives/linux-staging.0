Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5672
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 11:05:58 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso3237786pjs.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 04:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G2/HRjwzSuyEQQW5d/BrTJVNVV2eltDeN7HjganBwLU=;
        b=wXVTyIsfBoE8IVkuM/NNxjJ/Ozl5NI2B6ea8KhEt9PRd1X2A8/Uyv2O5KLGEfIkBr9
         UHklLmQyYDH6sxp/2hvDs4VofWICGVMv1w37Y8rDJCpcAYGKlgwXb9sFkNq3Gl1xy9kr
         hL7Hd4eYqilDK81myZdOx3eCctTdc0eh5DhZSCPE3PDjqIb5CDM17v+guuunKAXppZbw
         vTovAsWUAf+rdfXFFrTzfYxU3WjjjXprZpk/841VxkSAaxvAbW0MhRecXFtsqJ9e5DBe
         ZyWreFRdDI0ESe04S72mIM2pgnKEerjrqMEdPy+0AFHaaeHJS1hJrDgeIaTJecdUVkZM
         0X6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2/HRjwzSuyEQQW5d/BrTJVNVV2eltDeN7HjganBwLU=;
        b=sqkqhl9hllBh45O5zxqAG0Y5iCqaQIlYN7Dyoj7d7eKsLWYOE2/EjcBQb8ZNKFr6Is
         E6MNWKZ6lMkbPLFOPjAjPVIwqL+WxBOUVC/lNWHOFPPXIyitCawA8OE1I1uvisZLNY0n
         JQSkh8tWm9C5s9tqU5DNo8ZmfD2xVYFM4uahbQwtAfJfwW6idBKpdeo3yWaVru1wx2dd
         Rf8AGV9CaWAR9uZpEm5m30F7n0f/pcI8xvscHM3jSAjem9lnkr9SGvWK6P0oxvmrseIi
         n0h6c+7N1kgQC2PKaCNgIA1t7LOO/ZI4e7kWC0IKXoJJQq/ecHO+m3YqtU52JKPkCiC5
         q9kg==
X-Gm-Message-State: AOAM533MgvqMZ+2husD3OqkI3h1HiTZrV/GPeGj3bAxXkURNxd/If4h3
	/riioItNmabrNVFFvBg/muFy3gC3q9uzuTZ3h8NThA==
X-Google-Smtp-Source: ABdhPJzgzffhDy77yRXYZ3+R0nXiOZf2sC2IBuoxaJ9FAjQwkUe/Gemm8mzdaiDAD+E7fW8pmcdFxTMTMvdrwA0U1PU=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr3664805plo.37.1627038357645; Fri, 23 Jul
 2021 04:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723004214.912295-1-phil@philpotter.co.uk> <YPqhmjYDj0rq7V7r@kroah.com>
In-Reply-To: <YPqhmjYDj0rq7V7r@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Fri, 23 Jul 2021 12:05:46 +0100
Message-ID: <CAA=Fs0nU6686F=g136n2VzHrcVbctAkh09WF1m9-xSouhMv80w@mail.gmail.com>
Subject: Re: [PATCH 0/7] staging: rtl8188eu: replace driver with better version
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jul 2021 at 12:01, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 23, 2021 at 01:42:07AM +0100, Phillip Potter wrote:
> > I had to break this patchset up a bit to get around the file size limits
> > on the mailing list, and also I removed the hostapd stuff which is
> > userspace related and therefore not required.
> >
> > The driver currently in staging is older and less functional than the
> > version on Larry Finger's GitHub account, branch v5.2.2.4. This series
> > of patches therefore:
> >
> > (1) Removes the current driver from staging.
> > (2) Imports the GitHub version mentioned above in its place.
> >
> > There is plenty of work to do to this driver, including to its Makefile,
> > but it is at least buildable/usable for now.
>
> Looks like it failed to build :(
>
> And does this replace the 0/2 series?  If so, is this a v2?
>
> confused,
>
> greg k-h
Sorry, think I screwed something up. It was a v2 yes - should have put
that. Will do a v3 tonight (and properly) - Larry mentioned there is a
better commit I should be importing from, so just waiting for the
info.

Regards,
Phil
