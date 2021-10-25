Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3472
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 17:26:51 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so3895159oop.12
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 10:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KfOb2eIS89lcVTT7KSpBk1AQTOhqvqByR0j8ZKXzoqo=;
        b=kvcVxrf0BOB2XZcKCjY48WnrlH3sGi42UzdM+sc3NB9bVex7b+HInK22322KTpujlh
         r5iXN5JbJeN3YgCmlHv3jXAWR19BzyQ+5xw89flz+P5n8KeQw+SopsW8lybUEC498GUm
         kBWzV2EZaifpAuExsg2GaC2PlgnJe/M+7S3rn/elEkuFgC8VMLk5MfGtADaRXojtXsub
         fh6HaI6wdxobmljQR3EWGUph0+keT4cqZWYZYZd9S3TYTAdybmVAQYwyUTCfd408EweI
         6Tya4Lp4z8PISOAFgSQmd3awglmJ3q7eITtQtTGWYXmhpqAao+WEF+AwbEZNb4EgsyDe
         Cy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KfOb2eIS89lcVTT7KSpBk1AQTOhqvqByR0j8ZKXzoqo=;
        b=gdETrNVoI9j7HJe6kpArPNarrQQNzWgxQHgis7gqzLdnYkv4ypEH+uKVC0lrohvaAX
         gntyaa2NyLUPWUm4Gc22W8TXc24gFeAdtT/9uxXIFv0eBzZyKYuDp4npd+dJoE8Dw+HT
         AkJAEem70yYAcN2zWbREOGyUPZuzlVkFRDkrQu4MlG9vKoGVuxzryy8zXfkXVVB6ga0J
         dcMd93EGXCcWrn6K3yteaPPY1JxKYq1cr31xwrXrIy1bvxlSZnxoBhDfJstwQRKNvWCh
         bRR4pPqpdvDhP7EhwJcgxnMlZQDRsTg6OGm9o1zyLNuspuKAMUivBp6YLVaQWGJWOT4H
         jMFg==
X-Gm-Message-State: AOAM530viibIDize3VXb81MoFUWTR4B8tap6+Bh+P503yDtaUV+SDvBq
	8Jt640dn+go7lq112lQEVn4=
X-Google-Smtp-Source: ABdhPJxCl1xJWf5SgF1E/pTDaZemn7gw0LebbJtsuyGJLvBhludb5qCw2npv9ohI/jRqwJ2i4lwxvA==
X-Received: by 2002:a4a:be0a:: with SMTP id l10mr12941343oop.64.1635182810337;
        Mon, 25 Oct 2021 10:26:50 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::101e? (2603-8090-2005-39b3-0000-0000-0000-101e.res6.spectrum.com. [2603:8090:2005:39b3::101e])
        by smtp.gmail.com with ESMTPSA id bi20sm3986570oib.5.2021.10.25.10.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:26:49 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <de1bddd8-8e09-4b8f-1fd8-ae9047e60269@lwfinger.net>
Date: Mon, 25 Oct 2021 12:26:48 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: r8188eu: core: remove goto statement
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YXafzp5F8T7/+tk2@Sauravs-MacBook-Air.local>
 <7dc4eba4-c009-b8b7-bc08-5b608bdf86a0@lwfinger.net>
 <e2020caf-1b0c-ce0e-3d94-d105be85ed38@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <e2020caf-1b0c-ce0e-3d94-d105be85ed38@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/21 12:00, Saurav Girepunje wrote:
> 
> 
> On 25/10/21 8:45 pm, Larry Finger wrote:
>> On 10/25/21 07:15, Saurav Girepunje wrote:
>>> Remove the goto statement from rtw_do_join(). In this function goto
>>> can be replace by return statement. As on goto label exit, function only
>>> return it is not performing any cleanup. Avoiding goto will improve
>>> the function readability.
>>>
>>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>>> ---
>>
> Hi Larry,
>   
>> You need to read section 14 of Documentation/process/submitting-patches.rst to learn how to submit a revised patch.
> Resubmitting such a revision using the same subject line is likely to confuse reviewers and maintainers alike, if not patchworks.
>>
> This is original patch (v1). I haven't get any review comment for this patch.

Why did I get it twice? At least I got two messages with that subject line.

Larry
