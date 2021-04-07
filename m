Received: from smtp96.iad3a.emailsrvr.com (smtp96.iad3a.emailsrvr.com [173.203.187.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F86D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617812196;
	bh=bGnsEKKjWfG7WkhlO36jNMSe1mAnlUusiyc86GWO4qI=;
	h=Subject:To:From:Date:From;
	b=eFirG3jN3a0Wo3vgQDkigW8+L+bV26f7/T5BHLxjCwamj9sS4P3aOx8Zn/Tx3JvGp
	 jbg3BwxBh5QtHeJIb8jP+dMz9SZVUSp0u+dJE0Mutp6ACe9xw8q9w1Z/QxZE9dUjyM
	 RWRevEdqqL09/HeLrk6txXvn2D3zsP80s8BZgN+w=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp37.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 5BA535BA7;
	Wed,  7 Apr 2021 12:16:35 -0400 (EDT)
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
To: Spencer Olson <olsonse@umich.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev,
 H Hartley Sweeten <hsweeten@visionengravers.com>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com> <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <CAOx9PegenGENfvqwp2XFiSgYTB6y=g8dQcy3NQ_NipbQFxdGTw@mail.gmail.com>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <b7d98d4e-212a-7f5d-d274-007bf29bf705@mev.co.uk>
Date: Wed, 7 Apr 2021 17:16:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAOx9PegenGENfvqwp2XFiSgYTB6y=g8dQcy3NQ_NipbQFxdGTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: a22d9d1c-4635-4c5b-9762-96f786e4c7eb-1-1

On 07/04/2021 16:48, Spencer Olson wrote:
> On Wed, Apr 7, 2021 at 9:39 AM Ian Abbott <abbotti@mev.co.uk> wrote:
>> The "ni_routes_test" module in "drivers/staging/comedi/drivers/test/"
>> would need a new config option because it will need to either depend on
>> or select the COMEDI_NI_ROUTING option.  The "example_test" module (crap
>> name) in the same directory doesn't depend on anything in particular.
> 
> I don't have any arguments against your complaint of the
> "example_test" name :-).  It was written with the hope that more parts
> of comedi might follow suit and create some unit tests.  In terms of
> placement in the tree, I had been following a pattern set by another
> module that also had some unit tests contained local to the module's
> directory (can't remember now which one it was).

I might as well rename it to "comedi_example_test" then.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
