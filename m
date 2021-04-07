Received: from smtp125.ord1c.emailsrvr.com (smtp125.ord1c.emailsrvr.com [108.166.43.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84570
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 20:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617819646;
	bh=4LGgb90Ndoe+2TqXyELQNZz3polJxIGqnUaWHXIUMiA=;
	h=Subject:To:From:Date:From;
	b=Hvl5dVfo4EiRP9IRuLJv/iUBB/uZ26/A3/gCe17rjy6rg8ZDd6lcFJ30NvWgsg+jS
	 trISq8K/KZ4Em7ZBcuK4QGUy4YvymG01KjrPcC5SoRWbyfCCDkcaKpSzkpWCa9oIwP
	 /MGfDMLKYo2ef7eslWSi94gpxL0qk2vuGPLw/rZI=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id CDB53C0221;
	Wed,  7 Apr 2021 14:20:45 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <31138c5e-9272-fc05-2c79-234101f8d5dd@mev.co.uk>
Date: Wed, 7 Apr 2021 19:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YG3rUN0fvyA6HCpf@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 6f78df84-99cd-4181-92c2-c05b8efa4ce9-1-1

On 07/04/2021 18:26, Greg Kroah-Hartman wrote:
> On Wed, Apr 07, 2021 at 04:39:25PM +0100, Ian Abbott wrote:
>> On 07/04/2021 16:10, Greg Kroah-Hartman wrote:
>>> On Wed, Apr 07, 2021 at 03:01:37PM +0100, Ian Abbott wrote:
>>>> The code under "drivers/staging/comedi/drivers/tests/" is built when the
>>>> CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
>>>> on the "make" command line since the option does not appear in the
>>>> Kconfig files.
>>>>
>>>> This patch series fixes a compilation error and various other niggles
>>>> including checkpatch.pl stuff.
>>>>
>>>> 1) staging: comedi: tests: ni_routes_test: Fix compilation error
>>>> 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
>>>> 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
>>>> 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
>>>> 5) staging: comedi: tests: Correct unittest_fptr
>>>
>>> Should we move these to the normal kernel testing directory instead, so
>>> that they do get some build testing?
>>
>> I'm not sure since they are in "drivers/staging".  However, we could add
>> something to comedi's Kconfig to allow the tests to be built.
> 
> We need to get the comedi code out of staging, I really don't think
> there is any need to keep it in here anymore, do you?  I'll try to carve
> some time next week to look at the code and if I can't find anything
> left to do, start moving it out.

What do you mean - it's only been in staging for 12 and a half years! :-)

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
