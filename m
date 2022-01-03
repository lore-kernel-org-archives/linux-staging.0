Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A82C80
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 18:19:24 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id f5so1322149pgk.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LZ0dil/lB+/9aGZq43MmnXBZ0loQwi9X6FTpsHaNwAQ=;
        b=UE0aMZ5Hs7cx6lxrJJauh4hefBzyBtuPtNYJpSBitWC7aVN3xTgrmP7oWEnjL9DIAm
         DuBqCrlFTr4Y3zplBiwHqaheHsq/nWGBMxc6liE4ORSQmihD5Pp+x+nHRj44U3RgRf2x
         bpDHNMttSvzw9YbRuOgIDkNTsMedalGn01Acr+asfIYXOrA1V5ZnIctJObrscsqaYAbh
         xtWcp8TeHz0QLrRJVfvxFyDGuzKfB2N2YDnfFFATtyWmCPLuUbM8FkpUXfwlHFqgw0JK
         7xuLlMy2LHogVs1cpzTC9Fai/F3cbA072j8wn3YHsEccH6Yn7Ti/VUobq7Y9gy5BSrC+
         TkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LZ0dil/lB+/9aGZq43MmnXBZ0loQwi9X6FTpsHaNwAQ=;
        b=aWXGoDdu8LFqUP+UAWR/lJZMFUzUkaF8h8VS+ml4m8jLycloYM79IqssV8pYbCHZ5s
         0uSUAblSwJY4d7qnDr4ulIcgyTJxHbW1qsNDJ9JIftlOaQfVCfrvMAOnTFeaDdfE8tCl
         898gypYiHAe73lGoO5OJv8/MAinP2/iKoec8V8kasnKN9+lcNCnbr0XUTma8+2uU8DZX
         Y/4xok3DV9Ac44A0BXpXvpOMO5B4J6PwzSYCIkYKB4W3RY5Ff423fT6VkLe3p21IDa2W
         rcbTKcEkmBSzsqo6SnFSNBK3f35rSM3xJy7lCwGB9Bc/oVbG54bFlbv/n4/ZcFYdnJlk
         1hxw==
X-Gm-Message-State: AOAM532Pf1miYHMlNFgd/Z3urfHedlvHbRBqN0iaIJPGgmCsWLpFml8l
	DvtvRwwybkIxdZ8fSCCEomQ=
X-Google-Smtp-Source: ABdhPJyw4jzaCqUS5VaBaaKIQ9Ww5kRCOafkU9iWkiNKXXWaYk1eACK3aw6VkKCU2EUdO/+Pr61dLA==
X-Received: by 2002:a63:3647:: with SMTP id d68mr41671695pga.500.1641233964193;
        Mon, 03 Jan 2022 10:19:24 -0800 (PST)
Received: from nlap2.localdomain ([171.78.146.184])
        by smtp.gmail.com with ESMTPSA id c18sm41805780pfl.201.2022.01.03.10.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 10:19:23 -0800 (PST)
Date: Mon, 3 Jan 2022 23:49:16 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unneeded ret variables
Message-ID: <20220103181916.36dkjuyfawrt3pcr@nlap2.localdomain>
References: <20211231172527.184788-1-abdun.nihaal@gmail.com>
 <YdL6CE3+CaU6xVvD@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdL6CE3+CaU6xVvD@kroah.com>

Hello,

On Mon, Jan 03, 2022 at 02:28:40PM +0100, Greg KH wrote:
> On Fri, Dec 31, 2021 at 10:55:27PM +0530, Abdun Nihaal wrote:
> > Remove unneeded return variables in ioctl_linux.c that are initialized
> > to 0 and are not assigned after. Instead, return 0 directly.
> 
> Almost all of these should not be returning a value at all, if they can
> not fail and no one checks the values, right?

Yes. My bad. I saw that some of the functions were iw_handler functions and
had assumed that all of them were iw_handler functions.

> Please fix this up to be functions that return void, as that's the
> correct thing to do here.

Sure. I'll split it into two patches (one for iw_handler functions that
need to return int, and one for functions whose return value are not
used ) and send a v2 patchset.

Thanks,
Abdun Nihaal
