Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C570
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 18:10:39 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id x15so3818929oic.9
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nO7o2mnROm6vfrwIFqpPmkud04mZHjdO1289sNb+Hw0=;
        b=SZUpBRULSN2CSoeeNZ16bWEwfw9BT+28HqCpb79v4tkTQVtEcEpowHLFyE3bARU+AP
         yGdSakKCvE0yDTm+5/FXktniQT1fh4tM5N6EyJST9UfZfk+TPXOGrvJHms6ly5oEEDlW
         x4qFcMj+jtEgKWEF+Or+aa1mGmQ7M8LVkrIoNmt3g4K4iFSxmvEeBPZyE6iTnHzguDeT
         CbRdfdJxgQueqUiMUKrdYwMTdbEOnMwHu3Z8sPJFQqChjc7AKfOfiAs8dPS8TSk3m0w0
         PxvqCnaG+EvQ1hQBXxpDAQan/W4lIx8PF5yLP+FftLVHl5RUOtL5ZpriNZKTKPdm+FwX
         Zk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nO7o2mnROm6vfrwIFqpPmkud04mZHjdO1289sNb+Hw0=;
        b=tnl0tEqJGnqjJdMSZoWUTYB2qdslkgrMYBjxDv8gALh02kqdIxYQTuWBCRGRhu/LfG
         +oMvWHuMt/AL6JbcrtbAg2u0E0Gu5/e4yE+9CQPa5HNcPKqhKoEAWZR82b3sXM7NIuZZ
         7WiHMBQuqU2m1R4ReOFzaMnZfjw2umV+m3bQIaYKrJPGt4KF4q9k6Zc2fAA9ikE8EeXd
         uAIfoVVUSKzGXmL2s4gRhnqkdvhAFaTh7Ut0cMJ3hDt2XLKX8zufKSfElQt1zmprDUlR
         Udh3PNGY5aHQhH36IGwGsJS9FlIOq+7+vk2lxZrf3O7JSCm9BFfKO1Wn6H6i41i0ngnp
         wN1w==
X-Gm-Message-State: AOAM5313DsAWdXUe4y0MBVpf3iwonzx+d+z6IVJRlm1NvG62repbdjE5
	oUjF4g8QxwipbHXmGyQoedI=
X-Google-Smtp-Source: ABdhPJxQfR3eULiGVYmQ466ZqjtzMkAdnUNOO6e49aXKcmE3YmWTf2uZ4d9Ehn4RPBezXBwuACTC0g==
X-Received: by 2002:aca:f089:: with SMTP id o131mr547234oih.37.1628100639168;
        Wed, 04 Aug 2021 11:10:39 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id d7sm431522oon.18.2021.08.04.11.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 11:10:38 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: core: Remove rtw_mfree_all_stainfo()
From: Larry Finger <Larry.Finger@lwfinger.net>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20210802005517.12815-1-fmdefrancesco@gmail.com>
 <20210804130136.GJ1931@kadam>
 <CAP71bdUDEX=B6Km9wZO1AyHpVzqqkGNw6xNvspBz3qUABSKMEQ@mail.gmail.com>
Message-ID: <406c6f84-a2f6-1a0e-3a52-9406df41973c@lwfinger.net>
Date: Wed, 4 Aug 2021 13:10:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAP71bdUDEX=B6Km9wZO1AyHpVzqqkGNw6xNvspBz3qUABSKMEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/4/21 10:09 AM, Larry Finger wrote:
> In other Realtek drivers, the while loop has a call to rtw_mfree_stainfo(psta). 
> That routine does not exist in this driver, but I think it should. In a few rare 
> instances, the driver leaks some memory - this missing code may explain that. In 
> any case, this patch should be dropped as the fix will require testing.

After looking at the original code for several other drivers, routine 
rtw_mfree_stainfo() just ends up calling a couple of routines that free a 
spinlock. That operation for Windows and FreeBSD is not trivial, but for Linux, 
the routine does nothing. Thus, despite its name, rtw_mfree_stainfo() does not 
free anything, and it can be deleted.

The original patch is

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

