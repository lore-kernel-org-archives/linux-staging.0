Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994A71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 11:40:30 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id bb20so7740860pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HH/ge+eMrkI7gGPeXjozVQm3lW9YsdJEBaU1NSBzDEY=;
        b=T7rbUj7MqHJXFfLgrMO1X6JfbXHaQpgA/bvETfzOgfuGwg7HvZH9Ess43hMV9/IThr
         YgXK3kYoNcvYTkOe125V0VNx7VIZs4y2CoS0EXsd5Yr0FnT3TzEbJP1IkBQe+NHwfpnn
         vG+LJwjuKaykwGHBNlNkt9YEUpgZoSZGNLQgf2Avsw1Nt2wwjdYSIOOgJ2bn0xQvpP8f
         cWld3jjMc90Ix8DuRNLoR4sdLo8XXxur02mHIWI38nbWKsGXjUzuIK2JpiD7P2qOthRm
         QngzHmbeBuvKO46JBNZOmzX9yGh4lSXGImSH5L+v9KlhzdtEHJHJAeiQqxCsxuWgRzNW
         5bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HH/ge+eMrkI7gGPeXjozVQm3lW9YsdJEBaU1NSBzDEY=;
        b=O4h3xPAzRB26excldbdcBOLGMk+C35Hn8dY50ZmoWwdgB0ifSoc/5mC4o/HBQXw+Sq
         jNFNxAUHEWNDN1wZj8SKzpFwOmE5H2d5sr4woRgIV5OsSfDGIHfwy+uD3yXCGMTkPsEw
         Aw4vnVzF+Ytzu65gjnmNEl9j3rsRCHOF2kRS5GPvLjKQkW4/rjYJQbg3amHihW/VqeKg
         BJoMCBdaAnsA7qzAESbX7lR4OqceBZp4rqBXce+HI/SMPTNeIlKwdamIeS5FCf/WmskE
         JzLtjeQ3zvG3I+8eVy1WRJOtpReHmBhPsPkaYcaQhIbb9HbPX/6saFOGEnAL20pUYDaz
         YxNg==
X-Gm-Message-State: AOAM530lGqjO++06jDpg87nhU+n7v7Mq5OO1BzlRk/5zlRjsIvaoUInA
	QrbbLKqI3u38p8+KeRfi6OU=
X-Google-Smtp-Source: ABdhPJwXO0UgLKcWBreB/hHKSLZgnt9eKVXVcy8zLXqeS7m6km9vHcCy07fVRg48ZLwMkWxu3MT8zQ==
X-Received: by 2002:a17:90a:66cc:: with SMTP id z12mr3633506pjl.93.1624362030077;
        Tue, 22 Jun 2021 04:40:30 -0700 (PDT)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id b5sm16408990pgh.41.2021.06.22.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:40:29 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 22 Jun 2021 19:36:49 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 01/19] staging: qlge: fix incorrect truesize accounting
Message-ID: <20210622113649.vm2hfh2veqr4dq6y@Rk>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-2-coiby.xu@gmail.com>
 <20210621141027.GJ1861@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210621141027.GJ1861@kadam>

On Mon, Jun 21, 2021 at 05:10:27PM +0300, Dan Carpenter wrote:
>On Mon, Jun 21, 2021 at 09:48:44PM +0800, Coiby Xu wrote:
>> Commit 7c734359d3504c869132166d159c7f0649f0ab34 ("qlge: Size RX buffers
>> based on MTU") introduced page_chunk structure. We should add
>> qdev->lbq_buf_size to skb->truesize after __skb_fill_page_desc.
>>
>
>Add a Fixes tag.

I will fix it in next version, thanks!

>
>The runtime impact of this is just that ethtool will report things
>incorrectly, right?  It's not 100% from the commit message.  Could you
>please edit the commit message so that an ignoramous like myself can
>understand it?

I'm not sure how it would affect ethtool. But according to "git log
--grep=truesize", it affects coalescing SKBs. Btw, I fixed the issue
according to the definition of truesize which according to Linux Kernel
Network by Rami Rosen, it's defined as follows,
> The total memory allocated for the SKB (including the SKB structure itself 
> and the size of the allocated data block).

I'll edit the commit message to include it, thanks!

>
>Why is this an RFC instead of just a normal patch which we can apply?

After doing the tests mentioned in the cover letter, I found Red Hat's 
network QE team has quite a rigorous test suite. But I needed to return 
the machine before having the time to learn about the test suite and run 
it by myself. So I mark it as an RFC before I borrow the machine again to 
run the test suite.

>
>regards,
>dan carpenter
>

-- 
Best regards,
Coiby
