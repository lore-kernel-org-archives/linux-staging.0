Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45820E2
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 08:25:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id bx10so3398892wrb.0
        for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 00:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ti0622YsFQhm/dbd0cduZsACRVh/OauLWgYAq/gPwf0=;
        b=W7s2Cq5Y5SIi2jutOse7Dl6oqOFokI8iQqf3nLwy1otg4dg5BuBmOCrrGpPg2CGneH
         clmbNu5KppjU+3+Ui9VimIsiEbAWKdXYYv6f7kfEDSPcd6E13mOol2cFgZCny262xaDL
         8AHiAoi91+7yEnCIP8OrA1Qt7Hw1bFvcndhlqa9SNv89JsCi4qqzFKYYXf6Qv+ZKNLvf
         3ot27i/y8IwOqQ8x5jGRmESVrWqo3/r+20FZxQzclTVBNAa+mwrSEEAiM1J8n8W7jAA4
         yNB/kgtIaM0j9rXuXfIkm0TJp3wFEeHA7atpE3w8V2a6STIAqLs4aSdpup6kSTfXEhzm
         y1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti0622YsFQhm/dbd0cduZsACRVh/OauLWgYAq/gPwf0=;
        b=RRDkyUdi/TKUJ/VCkCaXgVGCwjc+KzcRPdAsj78E7JbvJ495wpA4hQP2mdZqjeunet
         atakn/D4Yut3iUB8wcuDOMpAeuDn6q/g4/Xrd+qbGOQ8eSI/VdoDpubQSnYiB5Nwdl8R
         QVfJ1lNjxgYxcQ/uO3kFUJ/SG7659EHXJbqOGsB2x+gNZfvJJLMecYUh6iv2tcpkP3cx
         4cL2Z/nwAPC4z/2oAe8Xd2Na4Gur8+eJLVbapkrSxlyun/yyfoF4MxAaOx0sDAP4wGYy
         VZKrhxzDH8sbuEKdl9T7XDmnVdIMFMYsKUpR5mYDL6OgaUTHGyW4FuYl3SoI6eCNz8k2
         yzxQ==
X-Gm-Message-State: ANoB5pneIJd203wl6WIdcV0SIM6iNSnvdCM5kfcOog6T3rLTVDCwdmyI
	ZS1Z+UW0HDvoSoD9FkyUq+A=
X-Google-Smtp-Source: AA0mqf5Y0rn09NYdgkcAHNWtto6F2qwTi43S6jENrKxDgP8z3esLWqFMyTOvRa/NVv3JHkJxGnxIpw==
X-Received: by 2002:a5d:58d6:0:b0:242:8e8:12c1 with SMTP id o22-20020a5d58d6000000b0024208e812c1mr7609851wrf.315.1669623904831;
        Mon, 28 Nov 2022 00:25:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bk23-20020a0560001d9700b002420fe50322sm4734325wrb.91.2022.11.28.00.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 00:25:04 -0800 (PST)
Date: Mon, 28 Nov 2022 11:25:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y4RwXSs9ha0zepxZ@kadam>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
 <Y3Z3aatcaISvqURJ@kroah.com>
 <Y3jqUpNOygJ4+2jy@qemulion>
 <Y4RnJyiCDYavLAJq@qemulion>
 <Y4RoOxgo76Hc5RRP@kadam>
 <Y4RvpvpmFL8zNvfB@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4RvpvpmFL8zNvfB@qemulion>

On Mon, Nov 28, 2022 at 01:51:58PM +0530, Deepak R Varma wrote:
> On Mon, Nov 28, 2022 at 10:50:19AM +0300, Dan Carpenter wrote:
> > On Mon, Nov 28, 2022 at 01:15:43PM +0530, Deepak R Varma wrote:
> > > On Sat, Nov 19, 2022 at 08:08:15PM +0530, Deepak R Varma wrote:
> > > > On Thu, Nov 17, 2022 at 07:03:21PM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Nov 17, 2022 at 06:50:55PM +0530, Deepak R Varma wrote:
> > > > > > On Thu, Nov 17, 2022 at 01:54:49PM +0100, Greg Kroah-Hartman wrote:
> > > > > > > On Thu, Nov 17, 2022 at 03:48:45PM +0530, Deepak R Varma wrote:
> > > > > > > >
> > > > > > > >  struct hfa384x_pdr_refdac_measurements {
> > > > > > > > -	u16 value[0];
> > > > > > > > +	DECLARE_FLEX_ARRAY(u16, value);
> > > > > > > >  } __packed;
> > > > > > >
> > > > > > > Why?  This structure is never used anywhere, right?  So why is this
> > > > > > > needed to be changed and not just removed entirely?  Same for the other
> > > > > > > structures in this patch.
> > > > > >
> > > > > > Hello Greg,
> > > > > > I am unable to confirm that these structures are truly not needed in the absence
> > > > > > if a real device based testing. I could only validate that using the compile
> > > > > > build and driver loading.
> > > > >
> > > > > Think this through, if no one is actually using this structure, and it
> > > > > is of 0 size, then do you think it is being used?
> > > >
> > > > Hello Greg,
> > > > I did not find any memory allocation for these zero length array structures.
> > > > Also, the union or its enclosing structure do not appear to access the members.
> > > > Hence I am leaning towards concluding that these zero length array structures do
> > > > not appear to be necessary.
> > > >
> > > > There are a few other structures that are part of the same union, however, they
> > > > too do not appear to be used for accessing the memory assigned to the union [or
> > > > its enclosing structure]. I think most of the members of these unions can be
> > > > replaced by one max size structure of this union [e.g. struct
> > > > hfa384x_pdr_mkk_measurements].
> > > >
> > > > Could you please comment if I am reading the code right?
> > > >
> > > > For your quick reference, the zero length structure declaration are online 963
> > > > whereas the union is on line number 1080 of the file drivers/staging/wlan-ng/hfa384x.h
> > >
> > > Hello Greg,
> > > can you please suggest how should I approach this clean-up/correction?
> > >
> >
> > Like this:
> 
> Thank you Dan. This takes me back to the very first version of this patch. I
> will send in the clean up.

Don't just send what I sent you, look around and try to see if there are
other issues with the code.

regards,
dan carpenter

