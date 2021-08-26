Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368629CA
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 15:57:05 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id i6so5418226edu.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZXF/RHrw7uR6voIrN0yU+7iqLQE1G5atkH2gmUQ8pZk=;
        b=RQJ9kvRCGzboqUPP5bbDLYsm7wHK3ezjmAWY1wP8SNnfLIS8HarSFZ7DJKNBFxOZyg
         T922M3YNTNVOXO+PbK4iL9ZJdNtmDV5GCGR3QRem4nQSsD520BwsZuLH410XfjbB7EQv
         fxg0GiydJw7Qzi/ur41bgIiyYrORoc/7NuAxot5EHb3QZUR6ae297ssxWmesAEMciV6y
         LFU5wczmGANMvf63O9yQFiIItalWhpi8XqxwqeTTUfmWXyWsCEGp2YBSQfY5bk7oiELJ
         Io/8CFj6cHPCYYeag+XZexMWmHNIhp29ydwdyuPOWHwfB4Z4TqgYQ9iN/r+93RjvaSHF
         OFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZXF/RHrw7uR6voIrN0yU+7iqLQE1G5atkH2gmUQ8pZk=;
        b=BQC3gWHQ4dL7pQX24XN7k7uMqiyB7+FMP8g+qxA8ZsQxe1TkmpI4I4vdS/Enhv3VnG
         BQErgteEwTMGjQ7nwzY7lm+mCvVSe7Ska85pkvreqpgtyS9//XoR3GG3olN9nzpYKV0O
         DYfcj5yao0Wgjs/Df1fQ1VBxuMqSTvh7vsTu9ZUD2hXjfxbIPxM9Emq0/W7zvFtuy6IN
         VHx9hOCXaCDPELfMuLgSdZeHuldg/LqUpo5dLWq1nLNEbsq59pBad1BpMuV1kQbotlXI
         RPlpD7cCSHOD+/ecvJ2FpF+8mte0f3OZYwXREYljqleWLBESpCBy7tSlOwRIWRD7crKt
         QuCg==
X-Gm-Message-State: AOAM531DTZ2260bYE4Za3HB4tteN4Dk7fO5LJ7DoFv1XZgT6RPrK49qu
	9M1qi8fdUscEIYQWRCVsodQ=
X-Google-Smtp-Source: ABdhPJwTDYtb8XcfblsJ7q7oQNNs+70i6Vv8+cvwvcrMtFQWph5GvGCGlXX7GD4Uq78wknF2uANqUQ==
X-Received: by 2002:a05:6402:354c:: with SMTP id f12mr4872206edd.287.1629993424411;
        Thu, 26 Aug 2021 08:57:04 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id q5sm2080803edt.50.2021.08.26.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 08:57:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@ieee.org>, Alex Elder <elder@linaro.org>
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from IDR to XArray
Date: Thu, 26 Aug 2021 17:57:02 +0200
Message-ID: <8278430.GnBS7eVdlf@localhost.localdomain>
In-Reply-To: <335f30c7-8ab4-d46a-d415-e994997a3fa5@linaro.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com> <1838037.Ul9q4Z07vA@localhost.localdomain> <335f30c7-8ab4-d46a-d415-e994997a3fa5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, August 25, 2021 3:45:13 PM CEST Alex Elder wrote:
> On 8/25/21 12:20 AM, Fabio M. De Francesco wrote:
> > On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
> >> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> >>> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> >>> is more memory-efficient, parallelisable, and cache friendly. It takes
> >>> advantage of RCU to perform lookups without locking. Furthermore, IDR is
> >>> deprecated because XArray has a better (cleaner and more consistent) API.
> >>
> >> I haven't verified the use of the new API (yet) but I have a few
> >> comments on your patch, below.
> >>
> >> 					-Alex
> > 
> > Dear Alex,
> > 
> > On August 16th I submitted the v3 of my patch ("staging: greybus: Convert uart.c 
> > from IDR to XArray"), with changes based on the comments you provided.
> 
> Yes, I intend to review version 3.  I'm sorry I didn't respond to
> your earlier message; I am on vacation this week.
> 
> 					-Alex

Oh, there's no hurry, sorry to bother you while on vacation.
Even kernel hackers deserve a vacation at least once a year or two... :-)

Thanks,

Fabio

> > 
> > Could you please take a few minutes to review this too? I would really appreciate it.
> > 
> > The v3 patch is at https://lore.kernel.org/lkml/20210816195000.736-1-fmdefrancesco@gmail.com/
> > 
> > Thanks,
> > 
> > Fabio
> > 
> > P.S.: I'd also like to know if you think it's worth converting IDA to XArray in order 
> > to improve the Greybus driver in staging.
> > 
> >   
> > 
> > 
> > _______________________________________________
> > greybus-dev mailing list
> > greybus-dev@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/greybus-dev
> > 
> 
> 




