Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DCD71
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 18:41:08 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id bf4so7478211edb.11
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/n/q/aelXMf9mgaQMQLtrJKcudG4Wd5KNGsIllPB90=;
        b=Gg9Y3N2Fdb9DyHwiymNwYxOiruKJLzHaTEC41rI3N1IC6KvUtL++MANcceqK2VR90S
         XZs+XpbOIcz5v22bn8WiIRypSN/4WR2AK0HzNE305WZrTTU5j8h72SlE9vXSmtAgos4W
         d1lgJ/G5UT2KvsDmDf05tDhMLWJiNfLOwwwq8IwqzUs2cZkbvIqoqMYPlpMYTZ2nwUqZ
         dwjuOZKkg5JoJBhqf+ZhTpy5zGLDnGn4oc2OprEqiDZ/WaG9UAL+LzLFWcAgelJIl/fX
         83GAWF0aYfTMnQMiqgWop9O4tnuai5PmWSfhFNrC90d2llUsXl3Jxh1RPdwmOIc2MPdp
         1yPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/n/q/aelXMf9mgaQMQLtrJKcudG4Wd5KNGsIllPB90=;
        b=gUbTmlh9ylGnWmgxuAOML06QhdAJ2uD7lrD4p+nK9gzxMcuTIxLE0msJQ/4eznayCV
         ulsMdqa7H/cucg+nOgo+l1PARQpR2TH/zegDbWGspkuAJ1TjPiO7uZsEt799mn3c5RIP
         QFdFpPyoj5csYJ7+xT/JM+YfhqMh9lhhGulNqXYufB3r+vXfQxA8bszFUiL25CCuVxct
         imHr22WlPkF238m+kybGBtSzQm/LDHD09wv/36mW5JMnhRpYc7gtqp+9dB0KsTUk7gEF
         jfOgFftb3vq3vrgh7bJQGQc+oVx0Xc6/naIGZ6uGi189a3gBhcpOuIbhKhwMOqwIq61G
         TbdQ==
X-Gm-Message-State: AOAM532priIfMwTRXBn6M4RZP5C5mD/lyIvXwugdc/IXpNqdGzMvCV+D
	H+bjIJBdSXm11/Bom+K5v78=
X-Google-Smtp-Source: ABdhPJyBymSS+DOEhj25VtSpyczjlx/GZKWCAj3qYvY45dyrc3K6vl7VfIlPvi19ijH1G5MonBF3Uw==
X-Received: by 2002:a50:d782:: with SMTP id w2mr21487090edi.346.1620067267238;
        Mon, 03 May 2021 11:41:07 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id rs8sm243938ejb.17.2021.05.03.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 11:41:06 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, David Kershner <david.kershner@unisys.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [Outreachy kernel] [PATCH v5] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Mon, 03 May 2021 20:41:05 +0200
Message-ID: <2381635.6tjctmx4mM@linux.local>
In-Reply-To: <YJAlWJXDnK9KLg2H@kroah.com>
References: <20210427150719.30841-1-fmdefrancesco@gmail.com> <YJAlWJXDnK9KLg2H@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, May 3, 2021 6:31:20 PM CEST Greg Kroah-Hartman wrote:
> On Tue, Apr 27, 2021 at 05:07:19PM +0200, Fabio M. De Francesco wrote:
> > Converted visorhba from IDR to XArray. The abstract data type XArray is
> > more memory-efficient, parallelisable and cache friendly. It takes
> > advantage of RCU to perform lookups without locking.
> 
> And does any of that affect the runtime of this driver?
>
Unfortunately, I cannot tell. I had cc'ed the maintainer at Unisys but no 
response at all at now.
> 
> I would need this to be tested by the maintainer before I could do
> anything, and a review from willy@ would be also appreciated as I'm
> guessing he asked you to do this?
>
I've contacted willy on #kernel-outreachy and said that you would appreciate a 
review from him. I hope he can find time to see that code.

Thanks,

Fabio
> 
> thanks,
> 
> greg k-h




