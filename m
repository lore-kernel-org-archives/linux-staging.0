Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD029CA
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 21:00:01 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso11398324pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 13:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p1VgySDUuTxujElNU6wOZ2jQO8XPQhp9HhAkv/iVERk=;
        b=i+iv0X0I2cA4T9uM6PPCvPfcdwpNLXJW98EYdY6uuSkmTEqg7T/Ugg+hYKEbmLN0y4
         X5fya9KPEWYzmEdr9lRqh0uz/nrUsab/2+Yk11slGxwFJDiciev2Powr9DA5odBfe+pl
         9yP0WGrp6OlC3cAdrufgK1aFijAcKkhQsKCZnrbimQG3TrBqbsit3kkzbf0ITvc2ILHz
         ld6qaxjdUqn7+flYDnfFCKKxtNU4RtXFcdLpulyAv8LO6vp8v2a9fz3x2hmdweHvmCgK
         U4uoxnnrOss2BZYU+UBxkY5dshJReiK6BM85MzX2NjQ9u4oqF/jZD6lp4tmWpX7HWdQL
         1ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p1VgySDUuTxujElNU6wOZ2jQO8XPQhp9HhAkv/iVERk=;
        b=vrkhZ6non8x/luArDiobd97q0m3wZGYnDgblTRYmU8qPyp48TvPv4YJ1Auoxbdn8M9
         vLP4HH4GCmp88YN8ZBtQzK3EmYiOILPWUB4q+hCrOb8osBGEW+duUv5aI6u7W48WpqQh
         jYrPYpoDlWrKOebh8+wFJZ+Yg33xishlr7R6EtJDbx/Nvy4W5Lctnqb+CHUflA/u5kaN
         dzSjjXxGuNlljwlNozXsPAPjktbnLEahNdqFgG6KO/ADDV6EL6sKLV/w4rzqJj+DuOVE
         Wd6u+yBUzJW+vp8s4ECUD0B7UZjUyTIrkGhnUilxvzWGywbOjSmcL/0tbw/yABpIUwS+
         R11Q==
X-Gm-Message-State: AOAM531yIoppC6akhj9kiuKBKm5EOxkXQb722wVOrsN6vwbjZuJ2GVmj
	MDdwb2PcQBXz4yTu/pvXX+Q=
X-Google-Smtp-Source: ABdhPJz4yClYng8Ow9atBD9PGhp/H5v2R1hwaAEq2t1TqkiHVRfhRLqSrJ8ZakRmdEApFfbAtxNmPg==
X-Received: by 2002:a17:90b:3e8e:: with SMTP id rj14mr22268418pjb.195.1641675601274;
        Sat, 08 Jan 2022 13:00:01 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id i23sm2134065pgi.92.2022.01.08.12.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 13:00:00 -0800 (PST)
Date: Sun, 9 Jan 2022 09:59:55 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: pi433: move get version func to where all
 other functions are
Message-ID: <20220108205955.GA3660@mail.google.com>
References: <20220106201430.GA3416@mail.google.com>
 <20220106213325.GA10767@mail.google.com>
 <20220107085343.GP7674@kadam>
 <20220107192438.GB2693@mail.google.com>
 <20220108111910.GA1978@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220108111910.GA1978@kadam>

On Sat, Jan 08, 2022 at 02:19:10PM +0300, Dan Carpenter wrote:
> > are you strongly set on the rf69_read_reg approach or would you
> > be open to keep the original approach? (rf69_get_version)
> 
> I think my approach is best but I don't care.

Thanks for being so flexible. I'll keep your suggestion at the back of my
head and if I come across more scenarios in which rf69_read_reg would
be the easiest way, I will gladly send a different patch to make it
reality.

> > I just want to double-check if this suggestion is taking into
> > consideration what was mentioned here:
> > https://lore.kernel.org/lkml/20220106210134.GB3416@mail.google.com/ 
> > 
> > If it is, I'm happy to add it back but I just wanted to confirm it
> > first.
> 
> Yes.  Keep the error handling.  Your way makes the code more complicated
> to read.
>

Agreed. I will add it back.

thanks,

Paulo A.
