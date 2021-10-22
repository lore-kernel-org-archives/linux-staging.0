Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6228472
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 17:11:51 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id i5so3183069pla.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mhWLNADUWPeTUsvnNwOnZvOtYJnJcXJAMA2KUo85xB4=;
        b=qUcXv8Ydicwcrh4c/lIM8AplWMjZS110zs9ZotW03eL6+4No5/hxNPoOzNzR3tvixb
         BaTfRvurkn+JUO3HPR5bYlkqdBl5ompKKw3NyOYu2bf6IonP01iVhZhGswLZ5J9Nn2od
         N4K0W5Pw0owiUnF0+Ey7FGBZmLd7yGDfDGWpvF0GEGNFOtgnfbmxUGFUaz0uOKzfWmIW
         6M96M66bu7e64FwyZ7TfNdpfcVoWKo8I8MKsiB/v5EbFjqBZy+dIMdo6CWar+Z3X3sS3
         2U6Q5cjZafZbB7qqPAAs5Wqsugr4NVKR/wn+Ptf5pYOTQjr+lkwnPQa2ITmrPu14Mzf8
         s+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mhWLNADUWPeTUsvnNwOnZvOtYJnJcXJAMA2KUo85xB4=;
        b=eIyO4u/bHLJqWHF088SvG/gpyii3Nc2j8Q1ZaKNaX9tt7cBFCsVgYvtOBiYUVtgO60
         pU9uF98OydMGxFq2LedtISqsu4G0pnRRRDpyOt+ce6r6fiVyzQuLxjJwDzExuplmph8E
         nphmgf97Prws0j+ESb+JIaG03GgJanLnFt7sMktasZQPKuj2L2xu8t2etkQcB8J5naOi
         3NlvaB7TR1ib/Ngme0K8YR73E5mk9NqRr8WhlA92wGavXt/noBpuKJZlHSqhq45lu5DU
         ptT76VEGr/FRScBktKA7ORKsuIOnEhhzEJm+WAt1mnU871UyuVZIRm+HPGm7ymdjxrpO
         fdCA==
X-Gm-Message-State: AOAM531X8sgYx5I1SPkfgKR3AIZrWQx6vhsgcwKJDi7mqV2ycYJl957b
	TE6jawAJfgsY0Q/VhXx/pqU=
X-Google-Smtp-Source: ABdhPJzZEJoDCwTFYD2bxloccoFEXmMVEKQCYyk4ppBAs+uY9HSLBJlTXS1BENxqdoTv3MEerqD5/g==
X-Received: by 2002:a17:902:c94e:b0:13f:1b02:e539 with SMTP id i14-20020a170902c94e00b0013f1b02e539mr689663pla.72.1634922710856;
        Fri, 22 Oct 2021 10:11:50 -0700 (PDT)
Received: from [192.168.1.4] ([59.95.89.188])
        by smtp.gmail.com with ESMTPSA id h19sm11944365pfv.81.2021.10.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 10:11:50 -0700 (PDT)
Message-ID: <5de75b10-b46d-d5da-e60d-0d2e10bca378@gmail.com>
Date: Fri, 22 Oct 2021 22:41:45 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: simplify the return
 statement
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
 insafonov@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
References: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
 <YWhDb5/ZDUUs9gb7@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YWhDb5/ZDUUs9gb7@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/10/21 8:19 pm, Greg KH wrote:
> On Thu, Oct 14, 2021 at 08:10:00PM +0530, Saurav Girepunje wrote:
>> Remove goto statement where function simply return value without doing
>> any cleanup action.
>>
>> Simplify the return using goto label to avoid unneeded 'if' condition
>> check.
>>
>> Remove the unneeded and redundant check of variable on goto.
>>
>> Remove the assignment of NULL on local variable.
> 
> You are saying _what_ you are doing here, but not _why_ you are doing
> this.  For example, this last sentance does not make sense, why would
> you want to do such a thing (hint, I know, but you need to explain it in
> the changelog...)
> 
> It's getting better, but the changelog still needs work.  Often times
> that's the hardest part of writing a kernel patch.
> 
> thanks,
> 
> greg k-h
> 

Thanks Greg for review. I will work on changelog and will send v4.

Regards,
Saurav 
