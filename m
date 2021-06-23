Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2866A2FB1
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 04:55:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id u2so525164plf.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 21:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z98M28/S5DTkRaCcduNwo8JvvrtDJam3SJ6vLPsh7e8=;
        b=t0j8pqTBwCofwBmzsMnRKN8o9RrKS1dthZm7imB1FnfTXT4A2CS3bmDV2d8UFN/n4N
         fbTB+6140FV1SHkH6VwmXE1szaiWj2fZGCdsVaXGt142q2M9RNTxNs4GXuqKZDyqsfnD
         LyO2vGQ9mfzOMJM23AnGFSEteQCimeJv+P7eMFcL4y/91lB+NW3HQakXN7LYiDIpFa9s
         JBPPxLeMYO3mQR/2yCyVtlOGPgIhWRzGS+HlX2G6ymqCxqdcULDl9ATcoGU5mULnuOlO
         N9BwAjm5kVRj5cZ87t1LVHOgCrsEErDJW6ILBQ08et/0UmsKEkaz8RbC7dJAXjwOYxBP
         DeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z98M28/S5DTkRaCcduNwo8JvvrtDJam3SJ6vLPsh7e8=;
        b=S+ZzWDtPmDHSx3yhLt3sWfNaU8rz+8V9uqXWZWgZImPXIzmEWOIe0ClId2GjdJ7IAe
         s0qhaqwf/U7C3w+Gc5YlIIs1BLUiJGvKNiQV/xeJt6p/A+o+gio5e8CXiRC/yEwEww79
         NSx0bOIL4FENsJKRKOViNMNdNninFjLbkpnsVglIMygJJ/DYp/3QKxHH8Ig1dPXpCFpp
         30brCsKkkAslFIfYOHun/DYn4pMSK8KlsjKZG082bZ7Ch2jWT4jXFEjTZN+51dlGTCE4
         gdapppT4zmlDYy/PYFkrrzEoaQQkn3Ug7NqQx6Ws1nSg7ZmMxn112/GPH2W2uXaWfjio
         th/g==
X-Gm-Message-State: AOAM530m5XL0oP/sy9BDaUc1kWTFpNjP2lzjBmmaEwdiJAh2R6MJk/+5
	SdvE052WOMHyn7m0oqvRjKs=
X-Google-Smtp-Source: ABdhPJyr34usZfM4otBZLMCgqdIkx6xknpF7q6eN/7Pl6CxcYIkUbun7aJssJW51BLb6HSZg9pSefQ==
X-Received: by 2002:a17:90a:4410:: with SMTP id s16mr7264860pjg.25.1624424120569;
        Tue, 22 Jun 2021 21:55:20 -0700 (PDT)
Received: from d3 ([2405:6580:97e0:3100:ae94:2ee7:59a:4846])
        by smtp.gmail.com with ESMTPSA id r14sm16539508pgu.18.2021.06.22.21.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 21:55:19 -0700 (PDT)
Date: Wed, 23 Jun 2021 13:55:15 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
	netdev@vger.kernel.org, Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 01/19] staging: qlge: fix incorrect truesize accounting
Message-ID: <YNK+s9Rm7OtL++YM@d3>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-2-coiby.xu@gmail.com>
 <20210621141027.GJ1861@kadam>
 <20210622113649.vm2hfh2veqr4dq6y@Rk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622113649.vm2hfh2veqr4dq6y@Rk>

On 2021-06-22 19:36 +0800, Coiby Xu wrote:
> On Mon, Jun 21, 2021 at 05:10:27PM +0300, Dan Carpenter wrote:
> > On Mon, Jun 21, 2021 at 09:48:44PM +0800, Coiby Xu wrote:
> > > Commit 7c734359d3504c869132166d159c7f0649f0ab34 ("qlge: Size RX buffers
> > > based on MTU") introduced page_chunk structure. We should add
> > > qdev->lbq_buf_size to skb->truesize after __skb_fill_page_desc.
> > > 
> > 
> > Add a Fixes tag.
> 
> I will fix it in next version, thanks!
> 
> > 
> > The runtime impact of this is just that ethtool will report things
> > incorrectly, right?  It's not 100% from the commit message.  Could you
> > please edit the commit message so that an ignoramous like myself can
> > understand it?

truesize is used in socket memory accounting, the stuff behind sysctl
net.core.rmem_max, SO_RCVBUF, ss -m, ...

Some helpful chap wrote a page about it a while ago:
http://vger.kernel.org/~davem/skb_sk.html

> 
> I'm not sure how it would affect ethtool. But according to "git log
> --grep=truesize", it affects coalescing SKBs. Btw, I fixed the issue
> according to the definition of truesize which according to Linux Kernel
> Network by Rami Rosen, it's defined as follows,
> > The total memory allocated for the SKB (including the SKB structure
> > itself and the size of the allocated data block).
> 
> I'll edit the commit message to include it, thanks!
> 
> > 
> > Why is this an RFC instead of just a normal patch which we can apply?
> 
> After doing the tests mentioned in the cover letter, I found Red Hat's
> network QE team has quite a rigorous test suite. But I needed to return the
> machine before having the time to learn about the test suite and run it by
> myself. So I mark it as an RFC before I borrow the machine again to run the
> test suite.

Interesting. Is this test suite based on a public project?
