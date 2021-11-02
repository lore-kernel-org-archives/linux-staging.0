Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78B2C99
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 21:29:25 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d3so535133wrh.8
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qML9KgHR0khgdZTW1uosHaPAKnNgvxttSEAuQMX0GEQ=;
        b=vvVatfd1BQrLsFszhbRYkm03+gKZsCb+X9t5O7w8wkTWJ1SOloE5mONfoWyytrAADh
         h87rtq2oiZ/ohJbtE+aH6wuAirzuHvaHxoriSWzcya5IUTGDGTXFRVb+N50PXr+GY1s3
         K79dLJtqpgFab4kixIoAJydh7RTkL8Bv148RCchOYtM3EhicTwpRcguphSF+XmkH1mqY
         xfZ+yrRJeeWWbuobbxvM6Hie9qDkbI7fL8zcocg7ZL1uJskWZHw6K6lWZvWrDsK0R6Ye
         jhjk/FLqrNc/bvfQJ/+bGOYHBXothQDwfWt+GHaA/UL6OHMN8eqK/NwbJq5bYRfvINmP
         Z1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qML9KgHR0khgdZTW1uosHaPAKnNgvxttSEAuQMX0GEQ=;
        b=slupb+fWHC4fgL1Snc6pdukSlC5p1XkT2fPrh3HkmllnzJT85ZCl6i9ULKhMK0M86e
         6qJ4m92lQWv1oCe2gdUSqYpebpCbcmRBjnpsg8Ej5OpXYj4VKkU02pwZ7U2TPOEFO7oB
         L2awWbx2XgOaQpelXQ9LnjAObrFQ4l0affMKA0w57udPCdK8+MUK0hRlSPaor9KyG4uM
         gE7yAqfV7NiFT5CSAy8ibkCXKDP7GIGvaQMbKIxB55lk6pet2ZOavn98V9nAZ7vGoA0T
         FB9YTQ0ZNWKK2KWxSUpK5okxt9tstUxIBhKjfLloI2BziJgYfpp0ktMixoB53xDdMKZB
         2I4g==
X-Gm-Message-State: AOAM5315kFHEXKP9AAxDTtNlhUAJv4nRGWrXCU16P77sUtEEigko40/h
	U+vq6mamM7CAFV+3oCMxbKQMFw==
X-Google-Smtp-Source: ABdhPJx78m9gTB88Hr7ZpsykWna+1GSTTiWETWNwDFSIrgNVpYJJJATd62v8KH9zCjR2Me0qd2l8dw==
X-Received: by 2002:adf:e810:: with SMTP id o16mr43165440wrm.359.1635888564154;
        Tue, 02 Nov 2021 14:29:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id z1sm172984wre.21.2021.11.02.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 14:29:23 -0700 (PDT)
Date: Tue, 2 Nov 2021 22:29:22 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 04/10] staging: media: zoran: add debugfs
Message-ID: <YYGtso8/Uym+9Jwb@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <20211013185812.590931-5-clabbe@baylibre.com>
 <20211014073752.GM8429@kadam>
 <YWyB8kwsqAvHMuhb@Red>
 <20211102174027.GK2794@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102174027.GK2794@kadam>

Le Tue, Nov 02, 2021 at 08:40:28PM +0300, Dan Carpenter a écrit :
> On Sun, Oct 17, 2021 at 10:05:06PM +0200, LABBE Corentin wrote:
> > Le Thu, Oct 14, 2021 at 10:37:52AM +0300, Dan Carpenter a écrit :
> > > On Wed, Oct 13, 2021 at 06:58:06PM +0000, Corentin Labbe wrote:
> > > > +config VIDEO_ZORAN_DEBUG
> > > > +	bool "Enable zoran debugfs"
> > > > +	depends on VIDEO_ZORAN
> > > > +	depends on DEBUG_FS
> > > > +	help
> > > > +	  Say y to enable zoran debug file.
> > > > +	  This will create /sys/kernel/debug/CARD_NAME/debug for displaying
> > > > +	  stats and debug information.
> > > 
> > > Why bother with a CONFIG?  Just make it always on?
> > > 
> > 
> > Hello
> > 
> > I love to provides choice to user (and so avoid a dep on DEBUG_FS), even if I think I am the only one remaining user.
> 
> Sorry, for the delay, I was on vacation.
> 
> No, there is no depends on DEBUG_FS in the method that I am describing.
> 
> How that works is when DEBUG_FS is turned on then it's on for everything,
> but when it's disabled it's disabled for everything.  You do not need
> the "depends on DEBUG_FS" and if you make this an option the it feels
> like it should be a selects DEBUG_FS instead.
> 
> How this normally works is that when you have debugfs disabled, there
> are dummy files in the debugfs .h files.  I bet the compiler can tell
> most of those are empty and removes them.  So if you have DEBUG_FS then
> it doesn't use that much more memory than when VIDEO_ZORAN_DEBUG is
> disabled.
> 
> I don't know if I'm being clear at all #jetlag.
> 
> It should be easy to check.  Just remove the "depends on DEBUG_FS" and
> enable VIDEO_ZORAN_DEBUG.  Disable DEBUG_FS.  It should still build fine
> because of the dummy functions.  That's build 1.  Then disable
> VIDEO_ZORAN_DEBUG and that's build 2.  See how much memory difference
> there is between 1 and 2.
> 

No worry for the delay.
Anyway, I have removed VIDEO_ZORAN_DEBUG in v3 since Hans Verkuil also asked for its removing.

Regards
