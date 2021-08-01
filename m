Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A772
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 20:15:55 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id a5-20020a05683012c5b029036edcf8f9a6so15625322otq.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 13:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SCcuT+0QFEZ5pOqaHiafc4eYwFnXV3Mc9ZkWxRnuv4g=;
        b=mJ2f92JQDFt1pBmeDfy6QwCC/24FTHxvojX4S87Nay0py4jAbAZmkYBpJNTaom4xZG
         rETVzy9y2Fhf5SToJ99K6hTMELQrKZdic4IYzKyyzcQkqXIJqDKWRGDD726wPYzUugYo
         FCTkE0/fwCGOzSqZcWvRCbc3TAMe7u6Yrccs0Q+4u1VTGN7MKSdDAVrgq2iPt7aaIiKz
         mtqeHOUAApCrGEWiexIwpEUbzoBbG1NE5DOJkdDp5mB4YaAy5i2LHuLNWEJfl6119PFy
         LrFNxxe6hYUALCAlEVXaVLInDnqYD5JnRkS1lupu3LEOja+DC9myZI5afm+fKk+abad5
         LIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SCcuT+0QFEZ5pOqaHiafc4eYwFnXV3Mc9ZkWxRnuv4g=;
        b=pW4bX2HQFpKRBuryxq/IXLnLkYnIjVTxL0GtPZ4zTVDa9IkQaGL7DEbXaDS9zabZF+
         V6eMMKYfE1DVyKL9uXr8sRRt2cReJY2xLqFA4mLj09HCrSqhUENasmC6SgfMa3AyFsiR
         dUROuoKbDFT5mEnb7bOhOUv9WMDIcd+Mv3HJCVn7MMCos6R2HsBCURXb3FwvCmBeDRU0
         n/0FZv+Sg64l4BcjcT0hkp+9J4o5TPvDclob+hMV6lbInOO98v/JVswqtEylJA2tJIAJ
         qdxoTcW2s3mK0kuudCCTY5E1PARVQoJ8TyPFttlP8j+hKHia19WMcxY5spmmfCS2qIH5
         hHyg==
X-Gm-Message-State: AOAM531vL5/CT9xrojVeWTJrzxoapyIXNC8vn+jagKuavVhwjCvkG4ZO
	vQz4VkEezz2UzXhvqlatCdB0hx5x+Qk=
X-Google-Smtp-Source: ABdhPJwfZu1KdxekaGhoKyzE8lIqVR10w8bh5dnOkdP0NeE5LOBo3GzXlbiZcbF9IQYFQAHlxGM1pQ==
X-Received: by 2002:a9d:827:: with SMTP id 36mr9141079oty.322.1627848954542;
        Sun, 01 Aug 2021 13:15:54 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id u3sm1556498otg.15.2021.08.01.13.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 13:15:53 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: kernel BUG in new r8188eu
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
 <YQThm1A0Up1m4l1S@kroah.com>
 <c2a6746a-24e6-6888-9208-32fccebb3fec@lwfinger.net>
 <YQY/tfJJdBVg/mwf@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net>
Date: Sun, 1 Aug 2021 15:15:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YQY/tfJJdBVg/mwf@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/1/21 1:31 AM, Greg Kroah-Hartman wrote:
> 
> I am worried that my "remove the wrapper" logic got something wrong
> here, so if you could test the revert of that, I would appreciate it.
> 
> I think I need to go buy one of these devices so I can test cleanups
> locally...

The bad commit was 9ff1cc4ef80e ("staging: r8188eu: remove rtw_buf_free() 
function").

Looking at it, the only difference between the original wrapper and the new code 
is that the wrapper zeros the len variable before the kfree() call, but making 
that change did not help. Reverting that patch restores the old behavior.

There are lots of these on Ebay from $2.47 up with free shipping!

Larry

