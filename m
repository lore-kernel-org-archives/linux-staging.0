Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF13FC4
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:19:44 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so28224936otg.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0n0w4PDIyms1itbpc01zsz9eZtSGypxZCXnsam1uhvo=;
        b=inkq1zZOzw077vCxOERqLDQsrUjy6Y3U12ZdSTf4H9iEsl96d0zdYecyLH6uCnK6t1
         UFD5i0P8DgtKxcF/t2m/DOrttb/idq+BPUpoI44bqYx3nQ4CWKZ7F2AWooQ9CS0IeRX0
         7CfrHKLmQnrPf2LS0opObELhoa5cmXKakytSYecljN/4SS+ET2OjvjEFfxha9TKHg9ZM
         8LqKbHYQFJlao3HD0y9gQnNn+ay38sKTZkZIffeZXsqNFCZ48T80h6aSzttE5VJ8tRYP
         LOUFe5/gpNK9qn5hdedGjhqZrXL66WmXksYUcrO3gT3Mr5rUcsRUYcXHoTK+qqxCCPc8
         R2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0n0w4PDIyms1itbpc01zsz9eZtSGypxZCXnsam1uhvo=;
        b=J1PJ2BzDQmNw3yI2rV2unwKoLq8SSHa/Vn4fhKFjIxLNl89sUVNVHa7jQVuckR9Qso
         llBBjTF+0HcGkGs3J2kmRAvCX1LtF6mOwavbKmRpzgFj1BOAoqjyqbo7rIMgKzcf97u6
         865wcKSKFhMSAjcbSPFwy/H5sfBWW71FzuZHYT39BTc0ZUjlDe18gmi7CfifVwv2fTqE
         ARFa+3oMx+k7EqbCAVYRxIpo9uvjTDoNuf0f4miNeb0ja8pxX45zNwVUBuSnQMdbPVG9
         6jwpPAmZi+wugqN5xdGx3r1tkT2I35CuHsrdqgxGAS585c2kx+qOM1ZYk/RyktDks5SH
         wqSg==
X-Gm-Message-State: AOAM5327jpbTfiMgOmB/aSVg0PbyYEE0tg+6u3l/iR3VOoHHiXj+egYC
	C4O/d6+NV/R7X9yGifbWj34=
X-Google-Smtp-Source: ABdhPJzlLNbbwzemGWWilAuX2b8NTLLUCZqRzR1NUr2n0d1FcV0tdq0e8Y7g1wkOe1nlST9Jj9/ueQ==
X-Received: by 2002:a05:6830:1657:: with SMTP id h23mr18929046otr.315.1629728383412;
        Mon, 23 Aug 2021 07:19:43 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id m206sm3642468oif.23.2021.08.23.07.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 07:19:42 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
To: David Laight <David.Laight@ACULAB.COM>,
 Aakash Hemadri <aakashhemadri123@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
 <4be5c5fa-c3fd-8c86-e904-8e2e60173380@lwfinger.net>
 <05aafb94be1b4e609250313709cd668d@AcuMS.aculab.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <c79cfd22-0809-7a7b-2b43-7801a17605d0@lwfinger.net>
Date: Mon, 23 Aug 2021 09:19:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <05aafb94be1b4e609250313709cd668d@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 4:30 PM, David Laight wrote:
> From: Larry Finger
>> Sent: 20 August 2021 22:45
>> 					u32 cookie = be32_to_cpu(dhcph->cookie);
> 
> Modulo anything that really means it should get_unaligned_be32().

True, but cookie is 32-bit aligned, thus the code is correct.

Larry

