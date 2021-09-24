Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com [192.185.143.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2F3FCB
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 22:39:48 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway31.websitewelcome.com (Postfix) with ESMTP id B25AF32BA
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 16:52:23 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with SMTP
	id Tt7HmgSRsejmuTt7HmbJgB; Fri, 24 Sep 2021 16:52:23 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2532Yjier0I++q82x31IsHseInNPutEwAc4kd7uXVUo=; b=UUQfkEoBprrs254Pmm+26qeBM+
	OuOx3/iV9kU1o7C++vXv+X9Ws/pikcZpppTJ6pzj+mV6UWox8JUK/lLayj/X2uK3tGfG2Crq7Dpws
	5P7R/tHXVBsEdLR5bo/UD/GLoyPbi0NA4jEKsAEfIJNVNT0Y6AW0yFch9cbiBHRuroS672CizzrGQ
	85lnR95W0DkkTt9zHv99uaiLSRjbu4INWakD1mFnnSrxd+M5AvYUp/86gopeauJTrAPmh6hG70aU8
	Bimgd6UUuBnFdqGaWf/80D+dpEhcdN1d8/oe2ZbG+oDZUqyDO/KBTavU5oT8Xk41HM7mllyrNvFEl
	ynkwuaZQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:45244 helo=[192.168.15.9])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1mTt7H-000xLJ-08; Fri, 24 Sep 2021 16:52:23 -0500
Subject: Re: [PATCH v2 3/3] staging: vt6655: replace camel case port_offset
 instead of PortOffset.
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Yujia Qiao <rapiz@foxmail.com>, Lucas Henneman <lucas.henneman@linaro.org>,
 Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
 Edmundo Carmona Antoranz <eantoranz@gmail.com>,
 =?UTF-8?B?QWxkYXMgVGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210924210008.106355-1-tomm.merciai@gmail.com>
 <20210924210008.106355-4-tomm.merciai@gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <58c61a30-c368-8e4f-d9c9-1f39cadda869@embeddedor.com>
Date: Fri, 24 Sep 2021 16:56:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210924210008.106355-4-tomm.merciai@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mTt7H-000xLJ-08
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.9]) [187.162.31.110]:45244
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes



On 9/24/21 16:00, Tommaso Merciai wrote:

Where is the changelog text? :/

Sorry but I insist: take a look at this:

https://kernelnewbies.org/Outreachyfirstpatch

Thanks
--
Gustavo

> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
