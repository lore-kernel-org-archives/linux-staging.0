Received: from 4.mo179.mail-out.ovh.net (4.mo179.mail-out.ovh.net [46.105.36.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B332FB3
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 11:28:20 +0000 (UTC)
Received: from player770.ha.ovh.net (unknown [10.109.138.76])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 7915C19C25F
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 13:09:00 +0200 (CEST)
Received: from mrtz.fr (lfbn-lyo-1-490-81.w2-7.abo.wanadoo.fr [2.7.79.81])
	(Authenticated sender: harold@mrtz.fr)
	by player770.ha.ovh.net (Postfix) with ESMTPSA id 5236B1EA20AE2;
	Thu, 27 May 2021 11:08:51 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-102R0046cca3f94-d97d-49b6-a149-483190b67c1f,
                    A96342309192601C9AD39103BD083FA7ED13D9CC) smtp.auth=harold@mrtz.fr
X-OVh-ClientIp:2.7.79.81
Subject: Re: [PATCH] staging: emxx_udc: fix alignment issues
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Dewar <alex.dewar90@gmail.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Sean Behan <codebam@riseup.net>, Colin Ian King <colin.king@canonical.com>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210524152128.20519-1-harold@mrtz.fr>
 <CAMuHMdWQqoqeaym5apdN8ppvkSm3DkKVeDn=S4e5Z2ytCVVUww@mail.gmail.com>
From: Harold Mertzweiller <harold@mrtz.fr>
Message-ID: <9367b56d-71d7-a98b-15d0-d8347403def5@mrtz.fr>
Date: Thu, 27 May 2021 13:08:50 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWQqoqeaym5apdN8ppvkSm3DkKVeDn=S4e5Z2ytCVVUww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9064620153952079127
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepjfgrrhholhguucfovghrthiifigvihhllhgvrhcuoehhrghrohhlugesmhhrthiirdhfrheqnecuggftrfgrthhtvghrnhephfejieffgfelffdvhfehgfefjeeiueeuveeiffekteelleefjefffeejgefgveetnecukfhppedtrddtrddtrddtpddvrdejrdejledrkedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehhrghrohhlugesmhhrthiirdhfrhdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghv

On 27/05/2021 10:43, Geert Uytterhoeven wrote:
> Hi Harold,
> 
> On Mon, May 24, 2021 at 6:46 PM Harold Mertzweiller <harold@mrtz.fr> wrote:
>> Three function calls can now be properly formatted inside the 100
>> characters limit.
>>
>> Signed-off-by: Harold Mertzweiller <harold@mrtz.fr>
> 
> Thanks for your patch!
> 
>>  drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
> 
> I'm so happy people are improving this driver!
> Is it working well on your hardware?
> Do you think it's ready to migrate out of staging?
> 
> Thanks again!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Hi Geert,

I sent this patch as part of the Eudyptula challenge. I just wanted to improve the coding style of any driver and unfortunately I don't use it.

Have a great day,
Harold
