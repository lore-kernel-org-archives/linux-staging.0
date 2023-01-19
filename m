Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA207485
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 14:38:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r9so2076092wrw.4
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GD0a/ka5+MJwmasza9LWV0qmM9V0aVs/dU+fSwzbrLs=;
        b=bQEZCtdRMYcijshT0y2Qu43vkvvkxnxFwy1oJhQCYKekBgxduc4PibPd41KYQ4DIlk
         r36PazF7qhmaQ/BJkKR0r/pA4X/4FSq3jf7rlUlUfMW7edWvRHJBHv0kUNUmXL50ivUI
         daB4uoFA40zs8ffS7cHsMu0w5LQUUrZvR+lq+C3EULFL5NugbTV2ey3ubJRZmC1unaO1
         VUh8MjbKZHEKtzBc0UF8AXYnpQE3c9EhcLMKjFCQ5sNvCd2dB+32dnHVa1GYHjjdod9X
         z5WwPPK2NwjfBbtV9/lAkTJ00PRnU5dLTD4avwUpEBqtxinsS8SBcs3s0vmSS6BWdjB9
         DqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD0a/ka5+MJwmasza9LWV0qmM9V0aVs/dU+fSwzbrLs=;
        b=laVUfGKEDO2lOAVv27oXBBON05Y59vWHEUQXsqml5aP4g7KN2QIh+XhFsFhuiWWu4f
         MO/KZve2oB1cC+qpaU/M5NExaXS331hZx2//N5MIvevsyJp9A9hHlZVh8WNfcNxh3FDr
         cnVSwO1Q13pG9wlmjilpGxtNntfSqHRCdXG1HEIQ+n0UZdRlKIWcbvysVvX83bkPbYBZ
         nohoJhyvraAyOzMtnw6TAlYwie8i7xUPE7+TwN3+XFMQL7xz0L8QHHSgDeYa0PunccyN
         97GKo4IZVntzVbIAdLTZpFLvgw+aoRvuIAQWPrtO6o/8uEX1xgtPhVvkXeyczFX4wO1u
         FOvw==
X-Gm-Message-State: AFqh2kplJx2q/CrYwdWZFlCaoCYrnn5cBPVSV5C8I/Pw7AEFf50zkkE1
	8q39qF5WwCHqo3AwJc50QmU=
X-Google-Smtp-Source: AMrXdXs/MbE7VqWd1vWjhpRw1JIECqYAGxrvtnGpGJTppbIZ3SSFqmdLDloCNBl/0j/F8ueulrWNqA==
X-Received: by 2002:a5d:428e:0:b0:2bc:8339:1fcc with SMTP id k14-20020a5d428e000000b002bc83391fccmr10333611wrq.58.1674139079212;
        Thu, 19 Jan 2023 06:37:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q15-20020adfab0f000000b002bde7999cd6sm16061235wrc.61.2023.01.19.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:37:58 -0800 (PST)
Date: Thu, 19 Jan 2023 17:37:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Drop custom logging
Message-ID: <Y8lVvHMIYeSOLM5q@kadam>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
 <CAMEGJJ1=dix7gWvV3Jxef-M-ExFZRTASQCr+6sn_dGsEQ=deYQ@mail.gmail.com>
 <Y8lHqd9FlxiXTLuW@kroah.com>
 <CAMEGJJ1oZ9XFw0609PrEABAgDwvapbc3hG4hJ=vBekUOepdiWw@mail.gmail.com>
 <Y8lS5eBliYw5EHBb@kadam>
 <CAMEGJJ2b1KFQY1m1eTcvf8_kGBBTjzrBD2i_M2uR+6v4gEcbVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMEGJJ2b1KFQY1m1eTcvf8_kGBBTjzrBD2i_M2uR+6v4gEcbVQ@mail.gmail.com>

On Thu, Jan 19, 2023 at 02:31:50PM +0000, Phil Elwell wrote:
> On Thu, 19 Jan 2023 at 14:25, Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Thu, Jan 19, 2023 at 01:47:44PM +0000, Phil Elwell wrote:
> > > > > I understand the desire to remove the custom logging. I don't welcome
> > > > > the loss of flexibility that comes with such a strategy
> > > >
> > > > What "loss of flexibility"?  You now have access to the full dynamic
> > > > debugging facilities that all of the rest of the kernel has.  What is
> > > > lacking?
> > >
> > > Perhaps I've missed something, either in this patch set or the kernel
> > > as a whole, but how is one supposed to set different logging levels on
> > > different facilities within a driver/module, or even for the module as
> > > a whole?
> >
> > Yeah.  You will be still able to do that and more besides after the
> > transition.  Cleaning this up makes the code better in every way.
> >
> > Documentation/admin-guide/dynamic-debug-howto.rst
> 
> Are you saying this patch set gets us to that point?

Yes.  The patch has some issues, but yes.

regards,
dan carpenter
