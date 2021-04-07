Received: from smtp86.iad3b.emailsrvr.com (smtp86.iad3b.emailsrvr.com [146.20.161.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF93A6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617809967;
	bh=NFnRsnooXgPKk4h8eM8Ts/yrKzjYCgvFqeanp31eGuM=;
	h=Subject:To:From:Date:From;
	b=XJEeWjLQLf/zOzhCs6g5XQsN2gV+ezjYBF/1xFHJUJ7gwMnbHYU6NUWyB2nQAoOUH
	 GdwJtUHtHbmKdfrop7Fgj4fcw1iGIBw5DAPrxA0Nwq+H+DE1ByclzmzYEG/hzqXptm
	 2bwpfV8CIZhBAMtaTOgzKJMENa2Ra+bMx15GzUm8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp3.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id A2F3A40233;
	Wed,  7 Apr 2021 11:39:26 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
Date: Wed, 7 Apr 2021 16:39:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YG3LY0hhDhzeXa1V@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 9379fab5-780b-428a-9ef2-e767e5734cd0-1-1

On 07/04/2021 16:10, Greg Kroah-Hartman wrote:
> On Wed, Apr 07, 2021 at 03:01:37PM +0100, Ian Abbott wrote:
>> The code under "drivers/staging/comedi/drivers/tests/" is built when the
>> CONFIG_COMEDI_TESTS option is enabled.  That currently needs to be done
>> on the "make" command line since the option does not appear in the
>> Kconfig files.
>>
>> This patch series fixes a compilation error and various other niggles
>> including checkpatch.pl stuff.
>>
>> 1) staging: comedi: tests: ni_routes_test: Fix compilation error
>> 2) staging: comedi: tests: ni_routes_test: Put complex values in parentheses
>> 3) staging: comedi: tests: ni_routes_test: Avoid CamelCase: <RVi>
>> 4) staging: comedi: tests: ni_routes_test: Lines should not end with a '('
>> 5) staging: comedi: tests: Correct unittest_fptr
> 
> Should we move these to the normal kernel testing directory instead, so
> that they do get some build testing?

I'm not sure since they are in "drivers/staging".  However, we could add 
something to comedi's Kconfig to allow the tests to be built.

The "ni_routes_test" module in "drivers/staging/comedi/drivers/test/" 
would need a new config option because it will need to either depend on 
or select the COMEDI_NI_ROUTING option.  The "example_test" module (crap 
name) in the same directory doesn't depend on anything in particular.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
