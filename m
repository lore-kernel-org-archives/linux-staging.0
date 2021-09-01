Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372EB3FC1
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 15:20:26 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id d3-20020a17090ae28300b0019629c96f25so2303594pjz.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HR/bUY4CIHX9QEwg/un6BIIYxuxD5D3OcyVLAtXISWY=;
        b=LOd3elatHJFf7Gf2t37DAlQRgFANZpUI2tnhD8w15Wo10rbeqHHtfGzzBLG/LcV1gy
         e5u6AsS1VgZRp5Y3WA2wBQ/D6j3z7zMxYZkcLEvet100v33cSrZMGUfIXx1GA50OKwu5
         fBka8gaBIEsgVi5Dnh/A9MupJ2jQws7fBmJ6HclM5+hbo7zG1tA7dCjxv1v/06T8rC0P
         GFcs21spJ+h8ijM46Yg0+YVWRbGkRnTn2wa9q8Vty1g4SgC2vHl7blanHSLQcBKMWIi2
         N3/RnZ5BTVaxIxNBvIExBj6hazRou22EtZ6KjO3hdJwetp0lnXaEB1KuK0Uedx0VuUqr
         hHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HR/bUY4CIHX9QEwg/un6BIIYxuxD5D3OcyVLAtXISWY=;
        b=Ms/XRY92jiszAm1wyYFMUPvNqsY50JDx0U0c1Mytc1jIGOkP2554nNQrY4nL/AXtE4
         Egxa7lTmEF9AMS29aFJZrFOTGlb12fgGrWAWzwqGj4qVpjQnnfaF7+U26Oxb7T5wplmZ
         d3G193fFORilOQ7tMOVps6IQRE/aXzWa/BNd3x0q350UQrVr48mHZjn5EYo5zzFO36u8
         q6R57MiD0DWDnJ+XkKlPas6RchxTf7o1gJOoxUX3zf36FnMcK9LRzeiEaS9n+I8VauV9
         /ORulXNBx3He8aSQ0QRldPwk2Pt5tbiEP4MDqxxLw73Xgf2FJP7KMhXMiAgmpPxzEzYI
         GIJw==
X-Gm-Message-State: AOAM531ft8u5sgsvpxZY10GWK4+ZGpnQfB3Xac7DuVTM2TD0KMU/cs57
	kbyW0auN5qikCF4POnqVUL4I66a8/O16am0Rhwc=
X-Google-Smtp-Source: ABdhPJxIgLhZBL45IOznzbHYHZCmTzMjImXoJJOCaE7zeKJ1SaSLhSQEupQx718O2F5WgW3hPkK4q7vd+uVbg364uwA=
X-Received: by 2002:a17:902:ab53:b029:12c:57a6:13ae with SMTP id
 ij19-20020a170902ab53b029012c57a613aemr10175518plb.53.1630509625523; Wed, 01
 Sep 2021 08:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+wyH3Pj6DV_m8wqCV5yujhjRwTwVNs6dK4i9JO-Y3ys6w@mail.gmail.com>
 <20210831133533.6aayzjghdakrhy56@h510> <13366651.n50aozgL3V@localhost.localdomain>
 <20210831230014.cp46vho2hnndacjp@h510>
In-Reply-To: <20210831230014.cp46vho2hnndacjp@h510>
From: Krish Jain <krishjain02939@gmail.com>
Date: Wed, 1 Sep 2021 17:20:13 +0200
Message-ID: <CAPGkw+zpYsovnXL_4GfjsQ60fqre+xyiwvwKuDj_fHPTKEfzeQ@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 1:00 AM Bryan Brattlof <hello@bryanbrattlof.com> wrote:
>
> On this day, August 31, 2021, thus sayeth Fabio M. De Francesco:
> >
> > I just want to *really* thank you for the hard work you got involved and that
> > you carried out with one of the highest levels of professionalism (and
> > patience :)) very few of us could ever equal (not I, for sure).
> >
> > I thank you also not for the technical hints you gave to Krish, instead for
> > your your choice "to not rob [you] Krish the opportunity to learn".
> >
> > Actually I was tempted to write something like "first do this, than that, and
> > finally run this tool". But I was able to desist, by learning from you how
> > people should be helped for real.
> >
> > Most of us here should learn by your attitude.
> >
> > Thanks again, seriously.
> >
>
> Thank you for such kind words, Fabio.
>
> I was very lucky to be, and still am, surrounded by people who
> demonstrated this idea to me when I was young. I am very happy to see
> others here see how beneficial and helpful (in the long term) learning
> this way can be.
>
> I'm grateful to have found and be a part of this community.
> ~Bryan
>



Interesting.

"make drivers/staging/android/ " works now (finally!) and shows me the
errors when I mess up in the file  ashmem.c for example.
Furthermore, " make CCFLAGS=-Werror W=1 drivers/staging/android/    "
outputs the same errors too just more verbose. So it works completely
now, However, "make CCFLAGS=-Werror W=1 M=drivers/staging/android/
" just takes to new prompt line and does not output anything. Do you
know why?


Thanks
