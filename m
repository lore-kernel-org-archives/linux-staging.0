Received: from smtp93.iad3a.emailsrvr.com (smtp93.iad3a.emailsrvr.com [173.203.187.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5B6D24
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1618419923;
	bh=sPzsibtvSkZFKvjwGkZbIpozNyTbKJvkR/Ev+NnVvoM=;
	h=Subject:To:From:Date:From;
	b=fXoU6dNmdXLiYVwv1FLCkBaiUA4fZfJsiMPQtmyHXOuFj/F7u13pEvYU5wg6Ue07+
	 bJVw56FVn3tsvU52LVud8jjTIVsEKatZDXpLx2nPKJpVT1jftYNPVQPCmDEsqNjgyG
	 o8RVOpk5AYnBDygE5R9C54aBfCX4fDg/ejaW+wyY=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp20.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id E5E8324888;
	Wed, 14 Apr 2021 13:05:22 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Spencer Olson <olsonse@umich.edu>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com> <20210414100905.GD6048@kadam>
 <2955bb05-fa59-c35a-b5a2-a5aedb4c96a8@mev.co.uk>
 <CAOx9PegwL50fZfxG3D8ePEqcyPNJHWeF=T65ubv2SFoW2Yq2ow@mail.gmail.com>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <5caafc6f-74fb-ec1e-cdd9-0f5b450bade8@mev.co.uk>
Date: Wed, 14 Apr 2021 18:05:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAOx9PegwL50fZfxG3D8ePEqcyPNJHWeF=T65ubv2SFoW2Yq2ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 3e82ba70-980a-49fd-9bfd-f28d23dfd4b0-1-1

On 14/04/2021 15:29, Spencer Olson wrote:
> On Wed, Apr 14, 2021 at 6:34 AM Ian Abbott <abbotti@mev.co.uk> wrote:
>>
>> On 14/04/2021 11:09, Dan Carpenter wrote:
>>> The test_ni_get_reg_value() function calls
>>>       unittest(ni_get_reg_value_roffs(-1, O(0), T, 1) == -1,
>>>                "check bad direct trigger arg for first reg->dest w/offs\n");
>>> The -1 is type promoted to a high positive value so src is greater than
>>> NI_NAMES_BASE.  It's not clear that that was intentional.
>>> drivers/staging/comedi/drivers/tests/../ni_routes.h:269 ni_get_reg_value_roffs() warn: 'src' possible negative type promoted to high
>>
>> I agree that it appears that ni_get_reg_value_roffs() will be returning
>> -1 as expected, but for the wrong reason.  I think the intention was for
>> ni_get_reg_value_roffs() to call route_register_is_valid() with src=0 in
>> this case, but it actually calls ni_route_to_register() with src=-1
>> (because -1 gets converted to 0xffffffff in the test `if (src <
>> NI_NAMES_BASE)` where NI_NAMES_BASE is defined as 0x8000u).
>>
> 
> Good catch.  Based on the error message that for the unittest failure,
> I would agree that my intention had been to test when src is indeed <
> NI_NAMES_BASE so that we could test for a bad direct register value.
> It does indeed look like sending in 0 for the src would have worked,
> since the first row in private table RV in ni_routes_test.c (the row
> for destination passed in as "O(0)") does not have a "register value"
> equal to 0.  It would be nice to compile and test this code though,
> but I can't do it for another couple of weeks.
> 
> Actually, looking a little further, I don't think that src=0 will work
> here.  There is another argument for ni_get_reg_value_roffs,
> direct_reg_offset, that gets added to src before sending to
> route_register_is_valid.  I think this was provided to fix an offset
> mismatch that was in the original approach to handling signal routing
> values (i.e. to provide backwards compatibility).  But, I do think
> that value greater or equal to 9 will actually work.

Since that unittest() is calling ni_get_reg_value_roffs() with src=-1
and direct_reg_offset=1, and ni_get_reg_value_roffs() adds
direct_reg_offset to src if src < NI_NAMES_BASE, would setting src=0,
direct_reg_offset=0 work? I.e., like this:

        unittest(ni_get_reg_value_roffs(0, O(0), T, 0) == -1,
                 "check bad direct trigger arg for first reg->dest
w/offs\n");

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
