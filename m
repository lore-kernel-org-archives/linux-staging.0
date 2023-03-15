Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2426123;
	Wed, 15 Mar 2023 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7CFJX628pLvjj5vfSGFHBBRo6HSE/YF9anK0wYFjcUc=; b=WhpdgZrGcV6sMjejDSzSU/1d/c
	mYGHDtLfz5WzlxBvb7TECDCl2msGOyTJ3dhpxGuJkdcPL54OlwqR1qm6q9o4iBkVGZrQWhf8TxIcF
	ehJTuzewcEKytw9FyiNo8Mps7851C9uWvmv8+u8wXlBp9Fs1v/2EslT9dwHjdFUMJ3FK9meEfadcV
	zK3+KU4lUkkdr7Z6zsb/rB/VAEQfLRg8YTDQfEeQn5OegR2t9mBJCqPEnCHPNZFDS9uaTLzFF83FI
	CQUuIwIDRlg0gd2IwavLQhVfmkqY/gWxJZI42jCmDea02WylatwYacPSKqqLiVytbFDZg8U3oVL32
	8ysz8rMw==;
Received: from [2601:1c2:980:9ec0::21b4]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pcWjJ-00EJAk-3A;
	Wed, 15 Mar 2023 19:24:10 +0000
Message-ID: <cdb828ad-855d-f7bc-d23e-17ed50750768@infradead.org>
Date: Wed, 15 Mar 2023 12:24:08 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Outreachy
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>,
 Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: Michael.Hennerich@analog.com, lars@metafoo.de, jic23@kernel.org,
 gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Outreachy Linux Kernel <outreachy@lists.linux.dev>
References: <ec13bbba-88ec-64b0-58ae-eee8617990b8@gmail.com>
 <8a30c3d1-a1a4-468c-a9f4-d15e0f418ef6@kili.mountain>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <8a30c3d1-a1a4-468c-a9f4-d15e0f418ef6@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/15/23 07:03, Dan Carpenter wrote:
> On Wed, Mar 15, 2023 at 03:17:28PM +0200, Menna Mahmoud wrote:
>> Hi Mentors,
>>
>>
>> I am Menna, Outreachy applicant and I work on my clean-up patches.
>>
>> Is it Okay to work on this error reported by checkpatch script?
>>
>>
>> drivers/staging/iio/frequency/ad9832.c
>> --------------------------------------
>> ERROR: Use 4 digit octal (0777) not decimal permissions
>> #256: FILE: drivers/staging/iio/frequency/ad9832.c:256:
>> +static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
> 
> What???  Is it complaining about the 0200?  That is octal.  Why is
> checkpatch complaining about this?  Am I wrong?  Maybe I am misreading.
> 
> I could investigate, but I am leaving that task to you.  It may be that
> checkpatch has a problem and you can fix that instead.
> 

Yes, checkpatch seems to be confused here.

-- 
~Randy
