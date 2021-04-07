Received: from smtp102.iad3a.emailsrvr.com (smtp102.iad3a.emailsrvr.com [173.203.187.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE586D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1617818274;
	bh=zIJ5FoF+IQ+jZf2zAWMcm+/7zH6hWaSsbY361PCJaKU=;
	h=Subject:To:From:Date:From;
	b=fayzohv0IZVlcotCk8jnJj2gbs+fGUx3fPGEPHBtVDW0uMclr7Mx41O1N5p9+1dT5
	 SgAhB8R94CxtN7aqFTYssqZUAwqUCZ8uG+3ZWVYSbgwfIqZQznvYdzKWWg/d9hRF++
	 BbacLlcc0w4dDBCfUeGXgjxCfbs+0tLg1t2OROBM=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp21.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id D4028250F8;
	Wed,  7 Apr 2021 13:57:53 -0400 (EDT)
Subject: Re: [PATCH 1/6] staging: comedi: tests: ni_routes_test: Reduce stack
 usage
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "Spencer E . Olson" <olsonse@umich.edu>, SpencerE.Olsonolsonse@umich.edu
References: <20210407175307.1114472-1-abbotti@mev.co.uk>
 <20210407175307.1114472-2-abbotti@mev.co.uk>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <644d3f0a-df49-f734-0a9c-56c9849a595e@mev.co.uk>
Date: Wed, 7 Apr 2021 18:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210407175307.1114472-2-abbotti@mev.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 6c2f9ba3-bc6f-4174-b4ef-ec1d40b526bd-1-1

On 07/04/2021 18:53, Ian Abbott wrote:
> Declare the `unit_tests` array in `ni_routes_unittest()` `static` to
> reduce stack usage.
> 
> Cc: <Spencer E. Olson <olsonse@umich.edu>

I messed that one up too.  I'd better fix up and resend the series.

> Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
> ---
>   drivers/staging/comedi/drivers/tests/ni_routes_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> index 777d9b5d96d4..cdfbb054d537 100644
> --- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> +++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> @@ -577,7 +577,7 @@ void test_ni_get_reg_value(void)
>   /* **** BEGIN simple module entry/exit functions **** */
>   static int __init ni_routes_unittest(void)
>   {
> -	const unittest_fptr unit_tests[] = {
> +	static const unittest_fptr unit_tests[] = {
>   		test_ni_assign_device_routes,
>   		test_ni_sort_device_routes,
>   		test_ni_find_route_set,
> 


-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
