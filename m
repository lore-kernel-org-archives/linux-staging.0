Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322D87C
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 13:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C7CC34114;
	Thu,  9 Jun 2022 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654782944;
	bh=QaBH8RWuw9ExX/N1zYuNgWYtWQet8otWyR1xJziRo1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQUZBApnf27nuYzHbSmZsjnL8+u1qFeX32GbHQVDPDnlZze2Uu+VwipiH2xFBtrH7
	 YpRYYp0L3BPuAtTQvdgPgzhCcFSXtjklFfpVTSD2X2JSMqXjRvOkgrKTTfcNp7Cemq
	 ei5SlMr+6nNWg72BsN/GKbTcyW16etVPvOA3iYGf2IF13AvTXbtR/kiF47gPYeJeHH
	 nhjOwazCNTMEvWCbHhT1XIcvL8U8+QkY4F2gLcE4MUsAOUR3LtNtiO1sAGaldHGp5o
	 nweTIV3kii67GhMHCmoT6MTfq4yYHYPptwIebL5EXYzd29kvFTwnFrHdNtKgw7rE9a
	 KRlqcVLlLI5Mw==
Date: Thu, 9 Jun 2022 09:55:43 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Soumya Negi <soumya.negi97@gmail.com>,
	fabioaiuto83@gmail.com, hdegoede@redhat.com,
	straube.linux@gmail.com, linux@roeck-us.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 5.15 24/51] staging: rtl8723bs: Fix alignment to
 match open parenthesis
Message-ID: <YqH73xeDpPJki3hM@sashalap>
References: <20220607175552.479948-1-sashal@kernel.org>
 <20220607175552.479948-24-sashal@kernel.org>
 <ff5d5283af74576f65545399851a40cb4f16a85c.camel@perches.com>
 <YqA+mOYUNcYj59Cy@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YqA+mOYUNcYj59Cy@kroah.com>

On Wed, Jun 08, 2022 at 08:15:52AM +0200, Greg Kroah-Hartman wrote:
>On Tue, Jun 07, 2022 at 05:04:08PM -0700, Joe Perches wrote:
>> On Tue, 2022-06-07 at 13:55 -0400, Sasha Levin wrote:
>> > From: Soumya Negi <soumya.negi97@gmail.com>
>> >
>> > [ Upstream commit f722d67fad290b0c960f27062adc8cf59488d0a7 ]
>> >
>> > Adhere to Linux coding style. Fixes checkpatch warnings:
>> > CHECK: Alignment should match open parenthesis
>> > CHECK: line length of 101 exceeds 100 columns
>>
>> why should this be backported?  It's only whitespace changes.
>
>Good catch, it should not.

It shouldn't :/

Dropped, thanks!

-- 
Thanks,
Sasha
