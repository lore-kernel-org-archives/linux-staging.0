Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC612FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621438007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=;
	b=SjBLDta38XjBY3kvpYLWmFbYGGv6UB3Tds2kQHKIDvMHwtGKFnWpUMhj/fDHeIwpTrbXQL
	g2GroXzVUy/CnlwXxdStUKT3imWSdGkUkTpTZFqCf2yDhl8W5guwCfn0UE1iRy2fti7EAZ
	APf8iADb00YAaGTZ2K6wxm1HqXlkqhc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-lceew9pPMaSXbVLJ0EgNGw-1; Wed, 19 May 2021 11:26:45 -0400
X-MC-Unique: lceew9pPMaSXbVLJ0EgNGw-1
Received: by mail-wr1-f71.google.com with SMTP id v5-20020adf9e450000b029010e708f05b3so7309171wre.6
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=;
        b=G3o5zZakwcCBW7X8qEvov/8/JgeuCjB8Iey0Qpw1dY2X/F06tmxD3qUKQnVCYDxUQR
         iiN7u9B4IKgDPRdEM/B1VsKiKRllA0EImLyiirgO+dYrvullaihCDp9lltO4a8XPtxmp
         0VCdBJUKow3XfCRnPXvdCt+4Z/wsOx+teX5nK5572AznTwl14Ih+GUAxjBZioAiVwxfx
         78QBFjX8p8Jmho5gMo5gnZ9vWFQfA5PUBr2o2I6S7p66KFh+kh7RijgqDyqbJ8CBYCCN
         5WkaOZY6PJ0A7vPXuvoh7iWr/1zEPtzKsRH6Ce3ErBoWnd86xLYXiQMaxzC4KDI8fiIA
         qVwg==
X-Gm-Message-State: AOAM531w8Q0cys0y2m+yLCkwIbzC/7bV1g9cLxl7bUfU7Yhtbp8qNuPV
	klLyDlb1bSQQLolXB8npx5a4160ssjpNQr6p8QuTowYBLVUacEZDdNWWiQ/sU+95+ptiSrso3Jh
	8NlRl375OAkdXnyXaUssko2JKsidWDRTakMIjz3IeA4e1TtuSpF8Zwh4xNQ86nij4YiKsba9H0g
	ohEQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr15048790wrv.354.1621438003977;
        Wed, 19 May 2021 08:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKFgM0dMznbTO2YJBPi9PLyM0fdlyyhnY2E+SOMK4tY3xOEu2tCm4NOpliSoEFl1o4vdaeSw==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr15048755wrv.354.1621438003711;
        Wed, 19 May 2021 08:26:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y137sm350209wmc.11.2021.05.19.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:26:43 -0700 (PDT)
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Graf <graf@amazon.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
 <YKUZbb6OK+UYAq+t@kroah.com> <20210519150814.GY1955@kadam>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1ce20fe0-0fea-406a-f7bf-1dde686b411a@redhat.com>
Date: Wed, 19 May 2021 17:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210519150814.GY1955@kadam>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/05/21 17:08, Dan Carpenter wrote:
> It's sort of frustrating that none of this information was in the commit
> message.
> 
> "This code is not ready to be merged into the arch/risc/ directory
> because the RISC-V Foundation has not certified the hardware spec yet.
> However, the following chips have implemented it ABC12345, ABC6789 and
> they've already shipping to thousands of customers since blah blah blah
> so we should support it."
> 
> I honestly thought it was an issue with the code or the userspace API.

Yes, I was expecting this to be in the staging TODO file - I should have 
been more explicit with Anup.

Paolo

