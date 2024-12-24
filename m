Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F51865E9;
	Tue, 24 Dec 2024 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072748; cv=none; b=PXj5ksePr/MK8k/Q6Sb1Qdj3egrQW+QBr91lwdKw1wqwWOJ6vY0cprTDBzlFf/HlywjCKi9RLFV39cdZ6ogrs+jKpTOGAPqM/WXp7h/Nfe2WNSNucXYODqFf1DakmxNcyEbzHCGwD5yeNdM5LtMoDZqUsmVDu+DY+h7rV+msY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072748; c=relaxed/simple;
	bh=BzDScQUeyBHs6w/k6IAx9Ry5RdJFXtl2b25TwMtMNIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjH10Nf4bFH+Bcn0Av+Nk+PeCXxPlLDTVjU9XsQiEyHAYpvb/iLIDkEMQ2jzXYcPG3qVCqEkp92QKiUiqT3flZnl7fQG5g/buM2uGPsuzC6eRqrUZeFr0UNFfl0FiKM+WD4ArWQJp6XJS+uhHNSh1h9hwjvqOqraOaI9qq7TcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OS0mI2wC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OS0mI2wC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I95G5M8vVmJLr8RKtCJ2hAN5FiRu22Kwqpoc74qBKPQ=; b=OS0mI2wCXJNK8vroAj4HMOnuVF
	7MEtHqbyRsqWqWCE1Dxm1aayOy/IcWLzO2E2f7moQDAws7Et/xHSBbbZB78BdIUyViVtJMw3KjiYb
	w6t98ThBjMw+Xe2xYK00E8M1WgeVl9sKVR1MOlqiUl4V3ZTE5L0GLWvj8kpxtjmVwIzLtQEDKJr4A
	42aTAk8FkxphjJCQnA0S1mUIkWOzVTtrYNsSBT6iMRAfNkK7Wt9wn3dUeGC7tiGjKIuFyEz7cRp+6
	2q71Dc5OUzgZBGPXouvFJJaVL1Df2Lyabxi9qaH7Scy4D2RPeLQ5dbRlnjhKnL1/ttyT2AHMa2gP2
	az4JN8Nw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tQBfv-00000006fAn-2rkU;
	Tue, 24 Dec 2024 20:39:01 +0000
Message-ID: <f486bd6b-84f1-4c20-be3e-0022e2ad7214@infradead.org>
Date: Tue, 24 Dec 2024 12:38:37 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Fix allyesconfig build failures
To: Steven Rostedt <rostedt@goodmis.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Cc: Dave Penkler <dpenkler@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Frank Mori Hess <fmh6jj@gmail.com>
References: <20241217101904.370bca1a@gandalf.local.home>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241217101904.370bca1a@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/17/24 7:19 AM, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> My tests run an allyesconfig build and it failed with the following errors:
> 
>   LD [M]  samples/kfifo/dma-example.ko
> ld.lld: error: undefined symbol: nec7210_board_reset
>>>> referenced by fmh_gpib.c:1512 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1512)
>>>>               vmlinux.o:(fmh_gpib_detach)
>>>> referenced by fmh_gpib.c:1637 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1637)
>>>>               vmlinux.o:(fmh_gpib_pci_detach)
>>>> referenced by fmh_gpib.c:1342 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1342)
>>>>               vmlinux.o:(fmh_gpib_init)
> 
> ld.lld: error: undefined symbol: nec7210_read
>>>> referenced by fmh_gpib.c:46 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:46)
>>>>               vmlinux.o:(fmh_gpib_read)
> 
> ld.lld: error: undefined symbol: nec7210_write
>>>> referenced by fmh_gpib.c:54 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:54)
>>>>               vmlinux.o:(fmh_gpib_write)
> 
> It appears that some modules call the function nec7210_board_reset() that
> is defined in nec7210.c. In an allyesconfig build, these other modules are
> built in. But the file that holds nec7210_board_reset() has:
> 
>   obj-m += nec7210.o
> 
> Where that "-m" means it only gets built as a module. With the other
> modules built in, they have no access to nec7210_board_reset() and the build
> fails.
> 
> This isn't the only function. After fixing that one, I hit another:
> 
> ld.lld: error: undefined symbol: push_gpib_event
>>>> referenced by fmh_gpib.c:1166 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1166)
>>>>               vmlinux.o:(fmh_gpib_internal_interrupt)
>>>> referenced by nec7210.c:956 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/nec7210/nec7210.c:956)
>>>>               vmlinux.o:(nec7210_interrupt_have_status)
>>>> referenced by nec7210.c:962 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/nec7210/nec7210.c:962)
>>>>               vmlinux.o:(nec7210_interrupt_have_status)
> 
> ld.lld: error: undefined symbol: gpib_match_device_path
>>>> referenced by fmh_gpib.c:1370 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1370)
>>>>               vmlinux.o:(fmh_gpib_device_match)
> 
> Where push_gpib_event() was also used outside of the file it was defined
> in, and that file too only was built as a module.
> 
> Since the directory that nec7210.c is only traversed when
> CONFIG_GPIB_NEC7210 is set, and the directory with gpib_common.c is only
> traversed when CONFIG_GPIB_COMMON is set, use those configs as the option to
> build those modules. When it is an allyesconfig, then they will both be
> built in and their functions will be available to the other modules that
> are also built in.
> 
> Fixes: 3ba84ac69b53e ("staging: gpib: Add nec7210 GPIB chip driver")
> Fixes: 9dde4559e9395 ("staging: gpib: Add GPIB common core driver")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  drivers/staging/gpib/common/Makefile  | 2 +-
>  drivers/staging/gpib/nec7210/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/common/Makefile b/drivers/staging/gpib/common/Makefile
> index 0c4c77bea75b..460586edb574 100644
> --- a/drivers/staging/gpib/common/Makefile
> +++ b/drivers/staging/gpib/common/Makefile
> @@ -1,5 +1,5 @@
>  
> -obj-m += gpib_common.o
> +obj-$(CONFIG_GPIB_COMMON) += gpib_common.o
>  
>  gpib_common-objs := gpib_os.o iblib.o
>  
> diff --git a/drivers/staging/gpib/nec7210/Makefile b/drivers/staging/gpib/nec7210/Makefile
> index 8d4d90f21109..64330f2e89d1 100644
> --- a/drivers/staging/gpib/nec7210/Makefile
> +++ b/drivers/staging/gpib/nec7210/Makefile
> @@ -1,4 +1,4 @@
>  
> -obj-m += nec7210.o
> +obj-$(CONFIG_GPIB_NEC7210) += nec7210.o
>  
>  

I have the exact same patch. ;)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
