Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841D2C9B
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 10:36:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id i26so14230112ljg.7
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 03:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hOtYGAstQBZM1HTeKAOZH5NrcEzxemdgOcTinWbxn2M=;
        b=pc9fJctElMG5cqMh61CF50Deg2JNAQh7FPXXFFN8Nrf+TrFFJL2YVL8232VPVRTaLL
         85ElTCMXvvPAIM8IB/A2nD0i98TO219O7arR6jf8eMMd4KD3ZPxa/mP1ChYW83yNcxNp
         18ywIYyxua9ghOFsby7+90mHI62gnykfQFrpSYcjeT4RVatPs9K5FwUe22lBCIuc527r
         uglE/XEMtkL/FaPKVr/RmooMzvAH9EThHW+eK4qRf5rAGF63jTUGxAwk0iNlrTfu34Zp
         8UBoapdJZgyndP31a9JDDDRqoyzYJjWqZEA1t8MTUFqJsYopy7QaVTU3eQPq35nAjsAU
         U+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hOtYGAstQBZM1HTeKAOZH5NrcEzxemdgOcTinWbxn2M=;
        b=CZ2L4FQCggwU9CqHoNDYafpHslCht3lInfxv6yhsVIkcBAFmk6pHJ21yBxVoEIABOb
         wi8ig2Q7OyLKzW9gsYBzqP1PViR7VNg3x6tS1WEM32VlsKWPxPjrXUn/ni5p39b5yZH8
         arsybyU54/XPTGUn/jOEPgdOfq70LVKIOvlwH+49XJIKmAvRZezdiDRF7XzHtUGR5jzw
         5Fig0PPkD4LbmGwuS5JzcZlhwD+4CaFEjZGSiThlU+Sd4d4juivH3J3MEmE44KewDFhO
         9pRoi6GWuZOZ2UyGU+WSK+72/Ui7PvQFx6ofHAHzwp0jWCLudLEMx/xp5mjnswpAqh3z
         vBKw==
X-Gm-Message-State: AOAM531z6oZHYBBaulmZ3nBKVCz7wvY2DhqMFVVJT7Fuw/v2KU7pP6QX
	DbUVPRk/2I5jdrA3ib4yQXM=
X-Google-Smtp-Source: ABdhPJwhepuWJLnqDEh0NejsKAUrFCgXVoX9OJ+XjsEQnwUsZw42uUCZ4AeDrBqcOTOR6kYf6RApSw==
X-Received: by 2002:a2e:9a47:: with SMTP id k7mr22070931ljj.100.1636108581373;
        Fri, 05 Nov 2021 03:36:21 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.207])
        by smtp.gmail.com with ESMTPSA id q13sm42923ljp.115.2021.11.05.03.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 03:36:20 -0700 (PDT)
Message-ID: <ecf6ba8e-8273-0d77-5ceb-3ad44179d3a3@gmail.com>
Date: Fri, 5 Nov 2021 13:36:20 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
References: <YYKvWeyqd71pYSqM@Sauravs-MacBook-Air.local>
 <YYT/LibxFzssNUJN@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YYT/LibxFzssNUJN@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/21 12:53, Greg KH wrote:
> Right after this, ret8 is set, but never checked, which looks like a bug
> to me.  Can you work on fixing that after I take this patch?
> 
> thanks,
> 
> greg k-h
> 

ret8 is returned from this function, but as I said [1] it can be just 
removed. It will be always set to _SUCCESS.



[1] 
https://lore.kernel.org/linux-staging/f26b4aec-c0a1-8c93-b34e-8b1a36ac81b3@gmail.com/


With regards,
Pavel Skripkin
