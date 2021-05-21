Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0817D70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621617679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qwR/0GNmU1erDIzfTwdpHCjLZxYNU+OZQVJXmXfAYfM=;
	b=Rp001alysR6Djrsu1XUaGGxzM6zHSzI8FjdLh8ir4ovfhyPGCDKWWIJGEvvh2Uxq4qEeVT
	a70//g8HSzlP3PgjU1pqzJppRC1UGMI6AeKGepPzwHSIb3uF3eMPMWR1d/ADWdT4hUgZ2t
	+VyHIKmjLSFmtDwbo/ll5iF/M/JbOeo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-RHHSVQwHM1at1AqFZOs7Yg-1; Fri, 21 May 2021 13:21:17 -0400
X-MC-Unique: RHHSVQwHM1at1AqFZOs7Yg-1
Received: by mail-ej1-f69.google.com with SMTP id bi3-20020a170906a243b02903933c4d9132so6492408ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 10:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qwR/0GNmU1erDIzfTwdpHCjLZxYNU+OZQVJXmXfAYfM=;
        b=gGx0+XY7J2ZjBH0s4PfXZoB5p4ZKnrjRTSDrB/zD7WI8E83nt/xH6ix3yUXThweMZ+
         9PUUhGqgnoaHsvJo3rS4Jq38VwiQkVm9DikpiLr0hZIe3svHfu0fZOogPXu7IcdilwCL
         uCHb2UBqXmFC1Oh4F7KCOEkOpH1UymZT3QsW2J8F2gFCG784pGKN5+X+xAcohURU5SpI
         Gyj4xZnZnmVCXgHRIttGiS+ogqShTmh+mbngQTn9/bniYT9JcjFFtorglbsGHfMAYM/v
         2lVH8wPP2OKaT0Pjt9kfVDBtiC5JUjvzJLUF9Dv+0RJEl6C1QlP2GPvXw7uPoibFRUZ4
         cEYQ==
X-Gm-Message-State: AOAM533rsqnz8VY162O+b4n31IVds2z1v29rsoLE+rP7N0c/fM/6pJon
	VfkIvgOQ/NoLlHIHZqvsYun6NTsINmQX4W65J++OAKosoV7a4AueVhgEOwTIQNbnnR83Y9kxsir
	kgl9ewHnM/HsMDhY57/FvSmzmFGZUsgs5lRW6vjh+j92l37nIDGgx5d1542DFr7Hmab01Lfanow
	+Rbw==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr12350077edw.206.1621617675196;
        Fri, 21 May 2021 10:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs1PPEtRit2YsbPl3fyEJzFG+BMaVTPI5cJbO+TcDqnJ8UNSbmnYU1JgZsPGIv6fh/e498XA==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr12350048edw.206.1621617675016;
        Fri, 21 May 2021 10:21:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m12sm4079494edc.40.2021.05.21.10.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 10:21:14 -0700 (PDT)
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 corbet@lwn.net, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
Date: Fri, 21 May 2021 19:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21/05/21 19:13, Palmer Dabbelt wrote:
>> 
> 
> I don't view this code as being in a state where it can be
> maintained, at least to the standards we generally set within the
> kernel.  The ISA extension in question is still subject to change, it
> says so right at the top of the H extension 
> <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
> 
>   {\bf Warning! This draft specification may change before being 
>   accepted as standard by the RISC-V Foundation.}

To give a complete picture, the last three relevant changes have been in
August 2019, November 2019 and May 2020.  It seems pretty frozen to me.

In any case, I think it's clear from the experience with Android that
the acceptance policy cannot succeed.  The only thing that such a policy
guarantees, is that vendors will use more out-of-tree code.  Keeping a
fully-developed feature out-of-tree for years is not how Linux is run.

> I'm not sure where exactly the line for real hardware is, but for
> something like this it would at least involve some chip that is
> widely availiable and needs the H extension to be useful

Anup said that "quite a few people have already implemented RISC-V
H-extension in hardware as well and KVM RISC-V works on real HW as 
well".  Those people would benefit from having KVM in the Linus tree.

Paolo

