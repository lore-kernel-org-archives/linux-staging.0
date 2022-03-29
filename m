Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83BF20E5
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 09:59:54 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 29 Mar
 2022 17:59:49 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 29 Mar
 2022 17:59:46 +0800
Message-ID: <d293aee5-6065-9d87-0906-438542a8be84@meizu.com>
Date: Tue, 29 Mar 2022 17:59:46 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIFYyXSBzdGFnaW5nOiByODE4OGV1OiBE?=
 =?UTF-8?Q?irectly_return_=5fSUCCESS_instead_of_using_local_ret_variable?=
To: Greg KH <gregkh@linuxfoundation.org>
CC: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>, "straube.linux@gmail.com"
	<straube.linux@gmail.com>, "martin@kaiser.cx" <martin@kaiser.cx>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1648457028-4226-1-git-send-email-baihaowen@meizu.com>
 <YkF2MRdxlUWow0UC@kroah.com> <be09d628f09041ac8f2c7bf2e9d5a13d@meizu.com>
 <YkF78wyXCaQIwkB2@kroah.com>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <YkF78wyXCaQIwkB2@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

在 3/28/22 5:12 PM, Greg KH 写道:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top
>
> On Mon, Mar 28, 2022 at 09:07:44AM +0000, 白浩文 wrote:
>> Hi, Greg KH
>>
>> Yes, I think sync rtl8723bs and r8188eu will be better as they have same problem.
>>
>> commit 067756acdac8e0dd91edf4800e844fcb6e0cc72a
>> Author: Hariprasad Kelam <hariprasad.kelam@gmail.com>
>> Date:   Mon Jul 15 23:16:18 2019 +0530
>>
>>     staging: rtl8723bs: core: Change return type of init_mlme_ext_priv
>>
>>     As init_mlme_ext_priv function always returns SUCCESS , We can change
>>     return type from int to void.
>>
>>     Fixes below issue identified by coccicheck
>>     drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:464:5-8: Unneeded
>>     variable: "res". Return "_SUCCESS" on line 492
> Yes, that would be good.
>
ok, got and learned a lot as a newbie, thx.

-- 
Haowen Bai

