Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9763D9C
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 17:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33931C433C1;
	Thu, 13 Oct 2022 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665683501;
	bh=C33+LlavBGIJeLnJsO26c1VUqKQk7toM8RgmzE7CYd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gagAuEIaaioD+JOxT7F2hUelfoHx2a+rIZEllRw8Mq2+2NGDAwin3/k7npYRG8WBU
	 tFZZzloH7qVArPFLj6I/WFoNOW+i1J8k0md2xKjMRAaqwhAWWLMDpESl0Z5768SYeL
	 2RKFWdHjDnoVg5jvx0ic+Td6fdUScjTpaszRylKw3UHN8exlIkACRK2hrcHvkybeP4
	 BJCBpySmv8EFDIteLuZbXlckm0eZke6R7eBdNrrgQenSFECa2IWiLE2d2yryliqByi
	 9wBEZw4mp/dnyoXajoEeP9AKC1QV6CFDmg+Opn2q3lkP586b8WBQep/ATWDEZKLZ69
	 k+nnEubSAxevw==
Date: Thu, 13 Oct 2022 13:51:40 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	GUO Zihua <guozihua@huawei.com>, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, fmdefrancesco@gmail.com,
	skumark1902@gmail.com, asif.kgauri@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 5.4 06/27] staging: rtl8712: Fix return type for
 implementation of ndo_start_xmit
Message-ID: <Y0hQLEXtrz542h2m@sashalap>
References: <20221013002501.1895204-1-sashal@kernel.org>
 <20221013002501.1895204-6-sashal@kernel.org>
 <Y0eoWDmylWzZjcNA@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y0eoWDmylWzZjcNA@kroah.com>

On Thu, Oct 13, 2022 at 07:55:36AM +0200, Greg Kroah-Hartman wrote:
>On Wed, Oct 12, 2022 at 08:24:38PM -0400, Sasha Levin wrote:
>> From: GUO Zihua <guozihua@huawei.com>
>>
>> [ Upstream commit 307d343620e1fc7a6a2b7a1cdadb705532c9b6a5 ]
>>
>> CFI (Control Flow Integrity) is a safety feature allowing the system to
>> detect and react should a potential control flow hijacking occurs. In
>> particular, the Forward-Edge CFI protects indirect function calls by
>> ensuring the prototype of function that is actually called matches the
>> definition of the function hook.
>>
>> Since Linux now supports CFI, it will be a good idea to fix mismatched
>> return type for implementation of hooks. Otherwise this would get
>> cought out by CFI and cause a panic.
>
>And another that should be dropped from all stable branches, thanks.

Ack, I'll drop this and the rest of the staging patches you've pointed
out.

-- 
Thanks,
Sasha
