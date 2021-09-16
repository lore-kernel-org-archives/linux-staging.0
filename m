Received: from smtp101.ord1d.emailsrvr.com (smtp101.ord1d.emailsrvr.com [184.106.54.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7CD3FC3
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1631803656;
	bh=oGcCGIKnGjk/ZPJFTm5ie8WYtb0aCti6vzAcVLvJMEI=;
	h=Subject:To:From:Date:From;
	b=Y5LKOGPVapbM2N7GyiHcL+8DYO0K0yHroB17OHBnTXg/tmMpOwCClxMpVUWnYy576
	 a7zK6CxcmBefHz6hiu9p8zC81FRk+TfsxmP5rnGm6QbYQ942BuEHBCZYHuoP2gRj6L
	 xEiOoEYtr3hkHF/7moQSEq7TYNvCu4vBU2IKrSs8=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp21.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 4E3BA6019B;
	Thu, 16 Sep 2021 10:47:35 -0400 (EDT)
Subject: Re: [PATCH] comedi: Fix memory leak in compat_insnlist()
To: linux-kernel@vger.kernel.org
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <greglh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, stable@vger.kernel.org
References: <20210916144438.156858-1-abbotti@mev.co.uk>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <631771cd-4fde-210d-2bf8-ac36f8e6cdda@mev.co.uk>
Date: Thu, 16 Sep 2021 15:47:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210916144438.156858-1-abbotti@mev.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Classification-ID: 17782ee8-0505-4b13-9f0a-5b33163ea9a9-1-1

On 16/09/2021 15:44, Ian Abbott wrote:
> Cc: Greg Kroah-Hartman <greglh@linuxfoundation.org>

Sorry, I need to resend it to fix that typo.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
