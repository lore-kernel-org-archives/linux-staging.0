Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFCB17F
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621931049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nMNrS2AH+pWQGLicYKYrV08FbwOU09YffgbHD3gux2Q=;
	b=fYkiabXmImrjP67dldLUG8+lJCaG94FpO+K+uFcweUxPOOTCyRYpDuRBXnQmuZWz6JXabn
	xWJqr18ZB52OD3PaOPjcgvKBpkiq0bhBblHc3oa0u2ZyKvrTPNlkaYmcae/sCZ7PzFgWZ8
	p2txVdKceFElwP/W8sQoe/0o+glqif0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-iUsBvcyoObSX0qAb1ZSy4A-1; Tue, 25 May 2021 04:24:07 -0400
X-MC-Unique: iUsBvcyoObSX0qAb1ZSy4A-1
Received: by mail-ed1-f70.google.com with SMTP id s20-20020a0564025214b029038752a2d8f3so16911814edd.2
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 01:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nMNrS2AH+pWQGLicYKYrV08FbwOU09YffgbHD3gux2Q=;
        b=Kw5FbM6WcqfeH55v/x5H+Jq/DZ09UrJvUMDIzjjY1HLAOryThQWe+O6dSjb/hPtM7n
         T4wwUQaboZF8hETxSTL3G0TJ2UFyHapswkWC78ytIQeLlESdN2Slt9U5qf5sl7f9+GCC
         lj9JwL+jscRNHguqJj1rG0WvLS8b2HcLZp0DhNkRkmddx5P13GKuGypC72kWNlqQtFCk
         rHRwHrwJTi6/hBoAzgpjHOznuF6GVFaKDkSjLwT2Y5MZXOEWT4i+M8pevEfDUstoF5Fn
         jLU0gBUg05mACUri+8Dhlv5MUI6RgSPS+ABZUZHxHU8cGC7liqd7jIDF2+p93nf2lox0
         diEQ==
X-Gm-Message-State: AOAM533Uyav9gxdSYcaSplauL4E+pHBLxj7W/0QL8MhIVe6Cj1vE+EsV
	sDRAKNjfjtjieZcCL/G18KO8Jnwbi3WwjttnYyTqoAe5Xfol1ipHUR3dphjUH71jR4Kuiw11loV
	HbjnklVSB2vqSBvv/2CS3b/TyYXiS/Mer9S0mvWWXFsnk3yhHGSOkhdeyco1jLlJWC0kWOiIu8Y
	VCMQ==
X-Received: by 2002:a17:906:2749:: with SMTP id a9mr7301272ejd.498.1621931045853;
        Tue, 25 May 2021 01:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ejiTVjnk0KxP0784vBVyBVdsw1rtPY3FP7JEZB/fGwja1e9e9HqFVf3ExrM8SXokAJlR3w==
X-Received: by 2002:a17:906:2749:: with SMTP id a9mr7301238ejd.498.1621931045543;
        Tue, 25 May 2021 01:24:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id gl20sm8752886ejb.5.2021.05.25.01.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 01:24:05 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "guoren@kernel.org" <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "corbet@lwn.net" <corbet@lwn.net>, "graf@amazon.com" <graf@amazon.com>,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKypJ5SJg2sDtn7/@kroah.com>
 <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKyxMy+djlscUhr1@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <fb03a89a-873d-ab85-8b05-f5f283f54489@redhat.com>
Date: Tue, 25 May 2021 10:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YKyxMy+djlscUhr1@kroah.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25/05/21 10:11, Greg KH wrote:
>> 1) facilitate the development work overall, both for Paolo and Anup on the KVM
>> part, but also others to check that their changes do not break KVM support.
> 
> Who are the "others" here?  You can't force your code into the tree just
> to keep it up to date with internal apis that others are changing, if
> you have no real users for it yet.  That's asking others to do your work
> for you:(

I don't know about changes that would break KVM support.  However, 
"other KVM developers" would be able to check that their changes do not 
break the RISC-V implementation, and I would certainly either enforce 
that or do the work myself.

Also, excluding simulators and emulators from the set of "real users" 
ignores the needs of userspace developers, as well as other uses such as 
education/academia.  Linux for x86 (both KVM and bare metal) supports 
features that are only available in emulators and simulators which are 
not even free software.  I am pretty sure that there would be more users 
of KVM/RISC-V than with KVM/MIPS, despite the latter having support in 
real hardware.

Paolo

