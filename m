Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E910173
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 20:41:35 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id kc16so14734722qvb.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 12:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HEblb4NcyHjgy+hG9JwZ6BIZVjaEPFiRSkzq3qx7O5s=;
        b=M/svcAs3jlY7Prg+Rl0odk2/+T3H8QS/j5nMgvetdX84NaIF7xbTfhi4VdGuYCX9+A
         VmmiFd6D/iJBKddKyF3YLVsIgv4bL8pVAupR4aaqdh6guUyltbRs3/GSQec43AhLZQkw
         beoYT6ZrH8VZJm4n3ifkfmUnpGVYBswrtMuYJ3dqVz3+GUPXKSBmWw7S6vwTmp1PF1Y0
         zonOjmtfnwMbZn0Ly1s3Prg56tt2yfLJ+C14D0Vrb+QTgcDuIZf2+jd3OfY0RFuKKP2N
         +zySZ6jZoHt1igci4tJB3eLLAcDV013yfLCyK7CEZXDjF1loBKwTviRNZ5T0s0AwEPhy
         ymaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HEblb4NcyHjgy+hG9JwZ6BIZVjaEPFiRSkzq3qx7O5s=;
        b=kVb83HzMtBLf4mG3EkE4n+6pqiOlh3SMDSyRkNv74CYC1wdhfD94UopbsGND0J9/v9
         xc9FYpAQlLOYVAeFbodkt1hVL/szOU/kvG/Yb6p6nLhZuzk1/+dv24Yv+dLJKKzpTXqo
         /Fcm2VCzb7tTdPPAXKWttO5SwYu+IINuEslxJj657Y9vu2yHREBMNZU8hJ3itBuDAZ5P
         U1d3qoXaNi9nI5EmgI7y3bWlK2e3SoaylR/pdYfnnIfOk6QPHOxbl4beXNcRanMnmdIn
         Ya/k88JPdjsfD/Pi3M761W/bYXpKUt7uH1XA/dBhWITQtHYm4kgar+aZ9v8fOfqC4IGo
         2kqQ==
X-Gm-Message-State: AOAM533l3M2IvAvMIQytW0T/HvO7aJzjHx4A0BCdg9KuWiA39gxhEs/Z
	7sATgS/xxwuGFhbhUAbz8Vpo+g==
X-Google-Smtp-Source: ABdhPJypWnA4YaLiN2H5DrhKGjxH1UB/Yn66D6fjJc5aYNghXRDHGDaSbM+RG1KrwWk07f3qu059QA==
X-Received: by 2002:a05:6214:4019:: with SMTP id kd25mr16808588qvb.59.1640637694032;
        Mon, 27 Dec 2021 12:41:34 -0800 (PST)
Received: from [10.0.0.29] (pool-96-236-39-10.albyny.fios.verizon.net. [96.236.39.10])
        by smtp.gmail.com with ESMTPSA id b6sm14125137qtk.91.2021.12.27.12.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 12:41:33 -0800 (PST)
Message-ID: <4cdfcc90-67c4-1cf2-1fca-76376a122454@sladewatkins.com>
Date: Mon, 27 Dec 2021 15:41:32 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] qlge: rewrite qlge_change_rx_buffers()
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Adam Kandur <sys.arch.adam@gmail.com>, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <CAE28pkNNsUnp4UiaKX-OjAQHPGjSNY6+hn-oK39m8w=ybXSO6Q@mail.gmail.com>
 <YcnA8LBwH1X/xqKt@kroah.com>
 <152c8d76-af2b-2ea3-4f15-faf2670d8e73@sladewatkins.com>
 <YcnRg9AYfSgC1pBE@kroah.com>
From: Slade Watkins <slade@sladewatkins.com>
In-Reply-To: <YcnRg9AYfSgC1pBE@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/27/2021 9:45 AM, Greg KH wrote:
> On Mon, Dec 27, 2021 at 09:15:36AM -0500, Slade Watkins wrote:
>> --
>> This email message may contain sensitive or otherwise confidential
>> information and is intended for the addressee(s) only. If you believe
>> to have received this message in error, please let the sender know
>> *immediately* and delete the message. Thank you for your cooperation!
>>
> 
> Now deleted.

my bad! I have separate signatures set for mailing lists but for some
reason it didn't remove that blurb.

it's fixed for the future.

sorry about that.
slade
