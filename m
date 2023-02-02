Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23878F7D
	for <linux-staging@lists.linux.dev>; Thu,  2 Feb 2023 22:13:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1048505wms.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Feb 2023 14:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u0GguDQPT3zLu/8MG92OfTe7PbfZZIh+XyJ3Yv2nDGw=;
        b=WBsZPyJtSM1V86ca5l7Q9d4dBuslBYDnXyWaeVa2C2JiwcXjxM3fo9VyVR/K7fayeU
         WL71Z4AWGoWCxQvI4kWWf4fkyCEZWOJQJEM9BM636cNwyeSPs61So9+uhqa980I+qe2Y
         gNEt2o5RaXB2f+pN+U33YYnZOEvkXMlQyi966IDZjLDNJCqwQ+OhzxdA6r8r0NH/ycCK
         KgkqHIQY0DgZqw/zc/Zj+aGC8zBnwnYfK5nmdJldB8e3R78b1Us8d6B/bTaXFW0FIM4A
         b0lPAbbRwJVFL0yDlAJZQ//IJHIxWTWwpWLcCMUqfZ1mrpkvOqKWdfRYPSWSjZNdZUDg
         4zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0GguDQPT3zLu/8MG92OfTe7PbfZZIh+XyJ3Yv2nDGw=;
        b=Lwj8lNfv+4uALEQexyGGeHSvUyThFAPI2pQUW5wF90wDpb0w1+BLCfAVXrB9NfGUoj
         LNp+gyHJrobIsTvQX2oQrVMc8tfeE50igUECWmmdp4KC7oYKl/9idNmYc7nRQIhcbAh7
         Su8cs4OSOiBcbMihJoP6Ru6BHqWw2DfirdEpEM2j1eB6S9OrNRl73i2ju2xKrN6vNX63
         htJmkp6Mcu5gvZA10rSk5mzMuPgmDd08BiUqpCPH+IJe4/rtCzvzY2QSJ338PfctqWV9
         XzBm5rdHjit9+0+V0xdks7AADCpPOWD8ij2rPWgXrjZcqd8KJDcwZjpmQCRlDOxG5m4y
         hV+Q==
X-Gm-Message-State: AO0yUKVotDLrjDER398ZQSZfqSpBKTFFe1PYqYXIWLzpf0bopPtWEDHd
	QJZ2GfPmm5l6uipqzVGzOvc=
X-Google-Smtp-Source: AK7set/nXhbianujQl5UY3iXTQtvbalIwk7GTrBsr2v3khiFUhckhvAdEYN1g+jJ7C46ydLJYuaQmA==
X-Received: by 2002:a05:600c:4f03:b0:3df:9858:c036 with SMTP id l3-20020a05600c4f0300b003df9858c036mr3066462wmq.11.1675375990816;
        Thu, 02 Feb 2023 14:13:10 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c354a00b003dd1c15e7fcsm6957128wmq.15.2023.02.02.14.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 14:13:10 -0800 (PST)
Date: Fri, 3 Feb 2023 01:13:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: 'Guru Mehar Rachaputi' <gurumeharrachaputi@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9w1crEwTInJzlWE@kadam>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com>
 <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
 <19e492521b4a4d31aa13c45e8616689b@AcuMS.aculab.com>
 <Y9pno7gZHa+r/Rg3@kadam>
 <08b38578bb0f4088aeedbf4b179d9c59@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b38578bb0f4088aeedbf4b179d9c59@AcuMS.aculab.com>

On Thu, Feb 02, 2023 at 10:02:25PM +0000, David Laight wrote:
> From: Dan Carpenter
> > Sent: 01 February 2023 13:23
> > 
> > On Wed, Feb 01, 2023 at 12:34:50PM +0000, David Laight wrote:
> > > In reality having a uapi structure with embedded padding should
> > > be banned.
> > > But that would need a compiler attribute to enforce it.
> > 
> > It would be simple enough to grep the names of all the UAPI struct and
> > use pahole to make a list of the existing structs which have holes.
> > Then re-run the script every week and complain when new holey struct
> > types are added.
> > 
> > You could do a similar thing with Smatch looking at copy_to/from_user()
> > struct types.
> 
> Would it be possible to add aa attribute and check to sparse?
> 
> Might persuade people to use it instead of 'packed' for structures
> that map defined byte layouts and so mustn't be holey - but are
> never actually misaligned in memory.

I mean, it's kind of a before and after thing where we have to allow
all the existing code and complain about new code.  But yeah, we could
use the __user annotation as well.  If we encountered a
`struct oldabi_stat64 __user *statbuf` then complain if oldabi_stat64
had a hole.  At the end, delete all the warnings that existed in the
previously tested kernel.

regards,
dan carpenter

