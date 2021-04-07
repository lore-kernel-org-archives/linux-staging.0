Received: from smtp115.iad3a.emailsrvr.com (smtp115.iad3a.emailsrvr.com [173.203.187.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CF6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:21:33 +0000 (UTC)
Received: from smtp78.iad3a.emailsrvr.com (relay.iad3a.rsapps.net [172.27.255.110])
	by smtp7.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTPS id 2E22F4C44
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 14:01:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617818180;
	bh=Q1Vufzt3bNEAolr9lbMI48Gar/ZPIGTFxCwc1kwU77o=;
	h=Subject:To:From:Date:From;
	b=TO+UNlF5TcESJ1yQ7TxA/Yi8C9pfqzi7XhF22rD6Za5nW6mMIBKFUFGq5efLb4dVY
	 /sPAtwcNyV27f+9mE9pqhem3kt9ibkqMGkVOXQd2g0c7oqopAySlCusgniehy+zS0w
	 OyOofJsKhnKOWae2VbA9ikdb+Nqsf2Dr5pT05jlI=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp26.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 957AB42A2;
	Wed,  7 Apr 2021 13:56:19 -0400 (EDT)
Subject: Re: [PATCH 3/6] staging: comedi: tests: example_test: Reduce stack
 usage
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>, SpencerE.Olsonolsonse@umich.edu
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
 <20210407175307.1114472-4-abbotti@mev.co.uk>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <c3c49f39-d8d3-66b1-1313-2396356485c1@mev.co.uk>
Date: Wed, 7 Apr 2021 18:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210407175307.1114472-4-abbotti@mev.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: e5a990b9-687c-4893-9201-5498d5de0841-1-2

On 07/04/2021 18:53, Ian Abbott wrote:
> Declare the `unit_tests` array in `unittest_enter()` `static` to reduce
> stack usage a bit.
> 
> Cc: <Spencer E. Olson <olsonse@umich.edu>

Oops, I messed that one up.  That stray '<' shouldn't be there!

> Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
> ---
>   drivers/staging/comedi/drivers/tests/example_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/comedi/drivers/tests/example_test.c b/drivers/staging/comedi/drivers/tests/example_test.c
> index 4d1ab130339d..550784fdac2f 100644
> --- a/drivers/staging/comedi/drivers/tests/example_test.c
> +++ b/drivers/staging/comedi/drivers/tests/example_test.c
> @@ -52,7 +52,7 @@ void test0(void)
>   /* **** BEGIN simple module entry/exit functions **** */
>   static int __init unittest_enter(void)
>   {
> -	const unittest_fptr unit_tests[] = {
> +	static const unittest_fptr unit_tests[] = {
>   		test0,
>   		NULL,
>   	};
> 


-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
