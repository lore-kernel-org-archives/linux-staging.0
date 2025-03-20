Received: from out199-3.us.a.mail.aliyun.com (out199-3.us.a.mail.aliyun.com [47.90.199.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CDBA932;
	Thu, 20 Mar 2025 00:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742431743; cv=none; b=bB63fYHLqBreADgciVNhsjs8Y0OZtBXqCsaP1BVzGYcjwnYVhaNCg0L/DgXM3tPFVEZETMyi+xB3EAINZyOXYCjfU9kJc0m1eYt1pwX7RhmJNXy6eQLwglLu5hqIEOfzuQW2bkOvmQ/hOoSsBm7JZll3hcaJWnvPfpPUbLTqq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742431743; c=relaxed/simple;
	bh=N3JrfAe74zWYWntEAoMu3hgiVC7VPDt3/pmat94gSFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENREwCJxaf/H9vvufQEU+sbbqs6xAbD2X1m80rX2oTAp/j5wO0XVYuConTIG0aDUgvodZcMTMIDMPCLGhk2hgJDX41PX7Ufzj1fKA7jeF2pH0hX0Lnndezy37byLVp22mN3aBmGr0mrMcPuaDys9+ghhbYalYEPKVs168/zc3Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=C/Y2p05M; arc=none smtp.client-ip=47.90.199.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="C/Y2p05M"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1742431721; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=d3PXrSZdoQRecHWJ8cdn3KiUu+yDTdxd+xT5ZNIbX74=;
	b=C/Y2p05Mn7SMeoT7UMGFo34I0sc/chuTLz/0ykrNFNEoyHIOGBEZU6wWzjnJfqWoNwjikK2bwqC/Kzw6qfOrYbrHuwZrfJ15jZGnX8ewkdQfIrOit6f9gLOpLFnTNs5Th/gWVB9kMXPM1VTr9xD8uwgdRo1Oj9bvvBdbvvNwC+w=
Received: from 30.134.66.95(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WS6e9xm_1742431400 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Mar 2025 08:43:21 +0800
Message-ID: <51a347ce-84d4-4698-a492-61eac2f4318e@linux.alibaba.com>
Date: Thu, 20 Mar 2025 08:43:20 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem support
To: Ethan Carter Edwards <ethan@ethancedwards.com>, brauner@kernel.org,
 tytso@mit.edu, jack@suse.cz, viro@zeniv.linux.org.uk
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ernesto.mnd.fernandez@gmail.com, dan.carpenter@linaro.org,
 sven@svenpeter.dev, ernesto@corellium.com, gargaditya08@live.com,
 willy@infradead.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/20 08:13, Ethan Carter Edwards wrote:
> Hello everyone,
> 
> In series 2, I have fixed the formatting with clang-format of the lzfse
> library and fixed the comments to use linux kernel styles. I also
> removed my Copyright from files where it was not appropriate.
> Additionally, I removed the encode.c files as they were unused and
> not compiled into the final module They should be easy enough to add
> back if needed. I also rebased on Linus's tree, just in case.
> Nothing broke! ;)
> 
> I am holding off on adding Ernesto's Co-developed-by and Signed-off-by
> tags until I get a better grasp of where this module is headed. I hope
> to here back from Christian and the LSFMMBPF folks sometime in the next
> few weeks.
> 
> I understand the jury is still out on supporting both reading and
> writing. As it stands, I have configured the code to support
> reading/writing on mount, but upstream auto-rw is configurable via a
> CONFIG option. Some people have expressed that they want the module
> upstreamed even if only read is supported. I will stay tuned and make
> changes as needed.
> 
> Additionally, I realize that staging/ may not be the correct location
> for the driver. However, I am basing my upstream process off of the
> erofs process. They started in staging. I understand that the correct
> tree and dir will be discussed as next weeks LSFMMBPF summit,
> so I will wait on their feedback before making any moves.

I don't know why erofs is related to your case here:

  - erofs is not a project based on reserve engineering from the
    beginning; it was a real productizied project initially designed
    for Android and got wider adoption for various use cases now;

  - It was a story 6 years ago (I've been actively working on this
    project more than 7 years and it sacrificed my extra free time and
    some other possibility), more recent fses instead directly land
    into "fs/" and it seems the preferred way.  But, nevertheless,
    there is also some fs like ntfs3 directly into "fs/" and got some
    dispute;

  - I have no idea if you have enough professional experience to
    resolve apfs-specific issues properly and in time.  I think it's
    a basic requirement for a kernel subsystem upstream maintainer now
    that you introduced this;

  - And you'd better to keep relatively active during the entire Linux
    kernel lifetime even that is not related to your ongoing work
    rather than dump and leave.

Thanks,
Gao Xiang
