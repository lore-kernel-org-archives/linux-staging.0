Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDF70
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 19:12:03 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so5984829pjb.2
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Vhd+O9ngUiaW+b64VVg6x1FRJZO378mbbVoeuL0y8HI=;
        b=O6RtmzHUaOhU3kzx2I77GM31mowWU/M+bVARMQtGUih16bLB/QCSa8LFs3hOgiGR2r
         1Lqm2r/md5ne/1ILg5CN0pBEkTJQ6tr4F/K822wnq0hcXh4/D93tHS+w9lS/f7SuybA2
         3Y11KtBBkjqRvVXfJfcy2wdCXrZ6l5tZqCNHmLnJCCOmJ+LjiqgSvegrBn6YarmGBaom
         +u4j/CtieI780TFVSWMX/4NimaQ8fghMHWDMKYmm9pXb2Q41FJD59M4NKXQkoRgC6I15
         Wx/DHy6PhruLLYfV7mqP5WES7CsMnwgqNOVUY5Gg7skTVkKl4EI+AAVL8qbHgR2WLk9u
         4jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Vhd+O9ngUiaW+b64VVg6x1FRJZO378mbbVoeuL0y8HI=;
        b=RMQ5kvl6gZ1oIHIG2byjf1EOE8Vir9diuXqUP05kthF5TTVNVYcoveeU0rAQ3mydJs
         nxK91qsgGplhguxFrolQUEzSE3ngwl2exQzhmUAEhAjo7r7oXAqdSVX7hvr91yVVV5sI
         9C2i2p1olL7GgCtrzRidbqMVvX5j2wsubBGN7fPt+zhVWFcMtEY/kpaOLKSUybIdZH16
         5NKZ6rgAsUxQvIXY9znj3taTazrMJo9z6R4Ks1+ZbKivwIgOnoT8EABbK1IYcOKsJvF0
         fOOy51+wrVe8kf5ml74s8SWYz2HZeCkxs9eVHGf7qwTj+LYZQFUZvZovC0hKHrlDCk0v
         8Shw==
X-Gm-Message-State: AOAM531051nUtYNZ+OLoBzcBmPX9V3HB81KQCgvFsgYepAZK+rvAMDVF
	HVNvOOO8eS5cP4sWtL4hlw0=
X-Google-Smtp-Source: ABdhPJyE1ioxdPFgy7HQA/5zNIoOkbdFJUpQxmLfCsfNu/BhgF4FiSlNjprfm9nNfhHvbTuvxJvHSg==
X-Received: by 2002:a17:90b:1e46:: with SMTP id pi6mr6810625pjb.212.1621537923337;
        Thu, 20 May 2021 12:12:03 -0700 (PDT)
Received: from [192.168.1.2] ([103.196.78.23])
        by smtp.gmail.com with ESMTPSA id b9sm2488091pfo.107.2021.05.20.12.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 12:12:02 -0700 (PDT)
Subject: Re: [PATCH] staging: emxx_udc: Fixed coding style in places where
 lines should not end in '('
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Dewar <alex.dewar90@gmail.com>, Sean Behan <codebam@riseup.net>,
 Colin Ian King <colin.king@canonical.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210520174701.8370-1-hridayhegde1999@gmail.com>
 <YKajzaK98SvKfbkm@kroah.com>
From: Hriday Hegde <hridayhegde1999@gmail.com>
Message-ID: <916de40f-f3eb-a9fc-0588-fe8c91430b47@gmail.com>
Date: Fri, 21 May 2021 00:41:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YKajzaK98SvKfbkm@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 20-05-2021 23:30, Greg Kroah-Hartman wrote:
> On Thu, May 20, 2021 at 10:46:57AM -0700, Hriday Hegde wrote:
>> The fixes were for the following checkpatch outputs:
>>
>> CHECK: Lines should not end with a '('
>> 1076: FILE: drivers/staging/emxx_udc/emxx_udc.c:1076:
>> +				_nbu2ss_writel(
>>
>> CHECK: Lines should not end with a '('
>> 1228: FILE: drivers/staging/emxx_udc/emxx_udc.c:1228:
>> +		length = _nbu2ss_readl(
>>
>> CHECK: Lines should not end with a '('
>> 1465: FILE: drivers/staging/emxx_udc/emxx_udc.c:1465:
>> +			regdata = _nbu2ss_readl(
>>
>> Signed-off-by: Hriday Hegde <hridayhegde1999@gmail.com>
>> ---
>>  drivers/staging/emxx_udc/emxx_udc.c | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
>> index 741147a4f0fe..8364316c1d25 100644
>> --- a/drivers/staging/emxx_udc/emxx_udc.c
>> +++ b/drivers/staging/emxx_udc/emxx_udc.c
>> @@ -1073,8 +1073,8 @@ static int _nbu2ss_epn_in_pio(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
>>  		i_word_length = length / sizeof(u32);
>>  		if (i_word_length > 0) {
>>  			for (i = 0; i < i_word_length; i++) {
>> -				_nbu2ss_writel(
>> -					&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
>> +				_nbu2ss_writel(&preg->EP_REGS[ep->epnum - 1]
>> +					.EP_WRITE,
> Please don't break the line at ".", that makes this really hard to
> follow.
>
> thanks,
>
> greg k-h
Ok will keep that in mind. I don't yet see a way to make this into the
proper coding style without losing readability.

Thanks
Hriday
