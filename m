Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E555F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 15:00:30 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12PEkBps031174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Mar 2021 15:46:11 +0100
Received: from [139.22.38.170] ([139.22.38.170])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12PEkABT019439;
	Thu, 25 Mar 2021 15:46:11 +0100
Subject: Re: [PATCH] staging: gasket: remove it from the kernel
To: Rob Springer <rspringer@google.com>
Cc: Todd Poynor <toddpoynor@google.com>, Ben Chan <benchan@chromium.org>,
        Richard Yeh <rcy@google.com>, linux-staging@lists.linux.dev,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20210315154413.3084149-1-gregkh@linuxfoundation.org>
 <CALTjKEP_+uBU8K-=Cnose8wCv9Wrv8oFnKfRUywLEHV4U_jWjQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <30ee6d6b-9206-acad-b224-591fdeb0dad7@siemens.com>
Date: Thu, 25 Mar 2021 15:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CALTjKEP_+uBU8K-=Cnose8wCv9Wrv8oFnKfRUywLEHV4U_jWjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.03.21 17:10, Rob Springer wrote:
> Acked-by: Rob Springer <rspringer@google.com>
> 
> 
> On Mon, Mar 15, 2021 at 8:44 AM <gregkh@linuxfoundation.org> wrote:
>>
>> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> As none of the proposed things that need to be changed in the gasket
>> drivers have ever been done, and there has not been any forward progress
>> to get this out of staging, it seems totally abandonded so remove the
>> code entirely so that people do not spend their time doing tiny cleanups
>> for code that will never get out of staging.
>>
>> If this code is actually being used, it can be reverted simply and then
>> cleaned up properly, but as it is abandoned, let's just get rid of it.
>>
>> Cc: Rob Springer <rspringer@google.com>
>> Cc: Todd Poynor <toddpoynor@google.com>
>> Cc: Ben Chan <benchan@chromium.org>
>> Cc: Richard Yeh <rcy@google.com>
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

OK, so is there a plan of the HW vendor to improve the user experience
for this hardware? Is there a different software architecture in sight
which will not need a kernel driver?

Just wondering loudly while fiddling with dkms packages and starring at
the code diffs between what was removed here and what I still have to
install manually from remote sources.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
