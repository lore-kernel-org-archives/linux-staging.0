Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539502CAA
	for <linux-staging@lists.linux.dev>; Thu, 23 Dec 2021 21:52:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id y22so26378590edq.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Dec 2021 13:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=prwaM6mYrGIwUEQUdwxVqfoXUWUvgyYN9XM4sUL4t7I=;
        b=GE14HRQo4fAeKredrKTDr0sQVdzRx75sLOhFAusKTAwO3/ILlFrztbge24wVltNwTL
         LPG/4o+Ng/ZyWz8tQDqSjwpTclkX1dZd1ivrYIENm56tBkVpZRr7eUvKtbPf0QLwj40R
         MQE9Lrw0EPVx6bLcoZYGNZuuTDDV9FGQfupWeJBi3bYB90ccAApUXJUccW7nSTS2bJwB
         EeAcqwhPZIuuAnkQFvOlus69LfVj6dZ5TlpogPUW7wxNU8CJUdGgo7BPnQU+/lNeEvPp
         EmD+RHB1sZWa40UNv3SyZdnAQVtle/GPJcTZlVbdGUBZw8L6eh4I1Xsnnb/yoixGSgEq
         2hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=prwaM6mYrGIwUEQUdwxVqfoXUWUvgyYN9XM4sUL4t7I=;
        b=1ov96OqKwXThmL5WDvhwXMrmnQBwKKVPTBiUff6A+e7rwxCzCOpOkrML2QiESpebbZ
         WQhezKpLax1p55Dw2cQD/P5bWZsCjL9zGKmT8focpTrtqEblDRX4RaaDittDvblQRu9P
         tJShjtziL25i7LChyXBoz0WcP+Q+K3J4aam2NxyPp4+e9YvTo+qOy93O4tdFqRluBbDM
         yDuhK53s8sOLsHOqbSJgpbfTfCEaSQtlb5sriLnOs/GgbbARKOg1nTemmWpm/4rlpOWi
         MzMgbrEoVe14Glv5Ru8lbmPCHIHfsD44XOE5KIrs878HnDyDnRF3sVjRFZ7mqxmDrqt9
         hExg==
X-Gm-Message-State: AOAM532P5P4atKh/rvmbCW1Wb3TkM/TgiiQ3wpXDE56v3owpVLKLBk/w
	AWpBD2ZnPKm+Icr9KER4oOU=
X-Google-Smtp-Source: ABdhPJyPZ/ftgPar6FQniTBdw2Rtzdi9UH09YTD64KW+Is4jVEFnRl6r/QFIdPb9zOlOVdwzs3fgWQ==
X-Received: by 2002:a17:906:c788:: with SMTP id cw8mr3378744ejb.528.1640296325673;
        Thu, 23 Dec 2021 13:52:05 -0800 (PST)
Received: from tom-desktop (net-93-71-218-227.cust.vodafonedsl.it. [93.71.218.227])
        by smtp.gmail.com with ESMTPSA id q14sm2439565edd.40.2021.12.23.13.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 13:52:05 -0800 (PST)
Date: Thu, 23 Dec 2021 22:52:03 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxfancy@googlegroups.com, Forest Bond <forest@alittletooquiet.net>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: drop off byRxMode var in device.h
Message-ID: <20211223215203.GB7322@tom-desktop>
References: <20211220202523.21805-1-tomm.merciai@gmail.com>
 <YcF1baxVvP3j8Q/8@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcF1baxVvP3j8Q/8@kroah.com>

On Tue, Dec 21, 2021 at 07:34:21AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Dec 20, 2021 at 09:25:20PM +0100, Tommaso Merciai wrote:
> > Drop off unused variable byRxMode in device.h, this fix following
> > checkpatch.pl check:
> > CHECK: Avoid CamelCase: <byRxMode>
> > 131: FILE: drivers/staging/vt6655/device.h:131:
> > unsigned char byRxMode
> 
> No need to line-wrap this.
> 
> But this "problem" is not the real thing you are fixing.  The real thing
> is the issue that this variable is not needed at all.  Just say that, no
> need to justify it with a checkpatch warning, right?

Hi Greg,
Thanks for review. I'll fix commit body and resend in v3.

thanks,
tommaso

> 
> thanks,
> 
> greg k-h
