Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D476D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 14:29:35 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d23so9511512qko.12
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V6KhdAZ2tzFo9oLqI7bZ8iL33fDy7jc/fnORudNCgxI=;
        b=fK1+pRCKuWzr2JUK73+b89nC3AY5FcfBim+0fgWHLu+fPdurwORSamhttLody2zp4u
         HMQIYKQBYpz3fSI85IQQPz3DKJYW2WJ8GYT1j7uY04GxiA1NsE95YSrA9Bp3yYvtR7Kc
         /yNEDCBqTUe5F/lwkrhPHp2+wymzgsPm0iVY8pxx1Ri4VNB/sZUXDflcdHPrFSbYYTYy
         spfklwMtgaRKqTphGy81PTX82CUcs7S3G0UpGMa22SMDn5//3FJQFmsALaBh1ruz5NQv
         RJo/Q2SLMggpPLRNrBv3WWfIcuknELu1SIW/iNeF7r14lQH7cAmxgqUtTGQgyXUIguI7
         GSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V6KhdAZ2tzFo9oLqI7bZ8iL33fDy7jc/fnORudNCgxI=;
        b=s++EMx2fksfQTQuNSDihKm95qMKWhhNzuOO2mKfVTt6XROrbpGuXDvj2z/fqtgtcof
         hA+C7IvsOORCkR32zseNxru1b9eG4FpGWrHBXCzm1pZXwetorIBzI4wPnODhrruPt3tz
         7hJ8FPFlmAgqGR+OhcD1uhG2DgQAR9gozvOM79WZDRWQIJnV0jDUnTJObHCxpyGKPHPZ
         hnPN7vSx0enUveqCZWMCETTq8J8w5pfOxHYfKrVC1gyK4dKLYmGrBYzzbQxZIJZXun1p
         GcFClWGUIsc6sqz9kLcsjGHdgOOxWutyeBTuGal2m65qLf0MBQ6BF6Yeub6pF2i/ROxV
         IvBg==
X-Gm-Message-State: AOAM530i3UAT/PsWVZEKljQ5zRRSza/VeiwHMCFVIYtxpKHFfmARNjFS
	z4ZaTvKv0ug/jvMzDhyZnEHjUIW48yexLSXl6JJsQLj257c=
X-Google-Smtp-Source: ABdhPJwIxa1W1QxCZ71HhuSy6JDiS+L1TFNkHGbxOr8EKCQ8XRJaMsbvBqZgONBSfMLkTgzeLJxjsz6OHmt3O9+lPyg=
X-Received: by 2002:a37:414:: with SMTP id 20mr30311565qke.11.1618410574145;
 Wed, 14 Apr 2021 07:29:34 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210407140142.447250-1-abbotti@mev.co.uk> <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk> <YG3rUN0fvyA6HCpf@kroah.com>
 <20210414100905.GD6048@kadam> <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
In-Reply-To: <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
From: Spencer Olson <olsonse@umich.edu>
Date: Wed, 14 Apr 2021 08:29:23 -0600
Message-ID: <CAOx9PegwL50fZfxG3D8ePEqcyPNJHWeF=T65ubv2SFoW2Yq2ow@mail.gmail.com>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Ian Abbott <abbotti@mev.co.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	H Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 6:34 AM Ian Abbott <abbotti@mev.co.uk> wrote:
>
> On 14/04/2021 11:09, Dan Carpenter wrote:
> > The test_ni_get_reg_value() function calls
> >       unittest(ni_get_reg_value_roffs(-1, O(0), T, 1) == -1,
> >                "check bad direct trigger arg for first reg->dest w/offs\n");
> > The -1 is type promoted to a high positive value so src is greater than
> > NI_NAMES_BASE.  It's not clear that that was intentional.
> > drivers/staging/comedi/drivers/tests/../ni_routes.h:269 ni_get_reg_value_roffs() warn: 'src' possible negative type promoted to high
>
> I agree that it appears that ni_get_reg_value_roffs() will be returning
> -1 as expected, but for the wrong reason.  I think the intention was for
> ni_get_reg_value_roffs() to call route_register_is_valid() with src=0 in
> this case, but it actually calls ni_route_to_register() with src=-1
> (because -1 gets converted to 0xffffffff in the test `if (src <
> NI_NAMES_BASE)` where NI_NAMES_BASE is defined as 0x8000u).
>

Good catch.  Based on the error message that for the unittest failure,
I would agree that my intention had been to test when src is indeed <
NI_NAMES_BASE so that we could test for a bad direct register value.
It does indeed look like sending in 0 for the src would have worked,
since the first row in private table RV in ni_routes_test.c (the row
for destination passed in as "O(0)") does not have a "register value"
equal to 0.  It would be nice to compile and test this code though,
but I can't do it for another couple of weeks.

Actually, looking a little further, I don't think that src=0 will work
here.  There is another argument for ni_get_reg_value_roffs,
direct_reg_offset, that gets added to src before sending to
route_register_is_valid.  I think this was provided to fix an offset
mismatch that was in the original approach to handling signal routing
values (i.e. to provide backwards compatibility).  But, I do think
that value greater or equal to 9 will actually work.
