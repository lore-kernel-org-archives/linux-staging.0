Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F9173
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 01:55:46 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id h11so7847059oie.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l1TFGpQKbo9d6Zg3cXMrMAMjVR7np9Pm2fOo9b5VLkE=;
        b=FLcKFZSCTWqYSbPbU/CKgWD2Iv58Le4xX78cuzcpPOgp/+At7ln28aVCXzNrM9hKwh
         paI8zIz+aI0/BlEEVIyyi79iMlNN7cuPizSjGRneR2ztkS7gQ3lZT8FKQ1bAMVkNiQip
         j4RGiz3AZYo0+6VHo6DGIvsQQ/MDn4hxIgALob91fnNBswQ1Ssnfv+UDzWj+CJLS00LU
         7bI8LbpCyF13dA9s7gulor9PWP+Ks5i24qfWhNTZVp8bA1OGe6iido0zA8oap0nUG2xu
         aj4HVoKhH6FHFlLI/rVXSu9wu2guBPx52A9UfP8fDSF2T1eCZfbFsCU2fCOfESxkO3/L
         SqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l1TFGpQKbo9d6Zg3cXMrMAMjVR7np9Pm2fOo9b5VLkE=;
        b=Fq7CEJjpS5V2VuBzAHtI5lkNifIpjZomJ+NpzaBr5+Wagh/l1k15o3YSFw13ul3J4H
         h+XNPIYDIGGU2ElOiUb5ur6e41E9/+Qn+8Xhbns2J49XRD8Qwhw7ZFtI14jXtNY8WtJk
         2Bqk6zi98BEmdmfbhgMs3ygoj5JoH1jHRoCikkPXkI5Fd92LWA8/1/P/Wo0uIeaCu8eu
         oLmqzx8JxILectIGrl6PgeA2dZTa4Zj+ufc2F0w/dy5QMl2LAMdP2L5t24ITrRkGsz8M
         WCDJ5x/e++wLXrSTyqxAfBxTkYczHYvelzNjNlamQaP6uPiLq7IAICeZodclUgB5vOXz
         Ad4A==
X-Gm-Message-State: AOAM532/RoKAxYpEGmHSO1hi1aX7EZNZTrOkbShec8i0VcumI85B1Yti
	AkJPCQRDQZCHyMQmsw6xRIs=
X-Google-Smtp-Source: ABdhPJy/KphdFc7XiR5guU8xcr1mCJHnEIKZz2vIN+OWYvuZbrNxzTlJfFFKoUGN0w4ILu0ZnEWIGw==
X-Received: by 2002:a05:6808:3db:: with SMTP id o27mr1490366oie.114.1628733346063;
        Wed, 11 Aug 2021 18:55:46 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id s10sm232546oog.14.2021.08.11.18.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 18:55:45 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH 0/3] staging: r8188eu: Clean up some smatch warnings and
 errors
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210811215806.20426-1-Larry.Finger@lwfinger.net>
 <CAA=Fs0=WeawmsS=Y+iEL7AMvkhyN3wuXRaxD2eC271zvdeBwUg@mail.gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <21ed5860-1449-bdba-b1d4-daf5673302f2@lwfinger.net>
Date: Wed, 11 Aug 2021 20:55:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAA=Fs0=WeawmsS=Y+iEL7AMvkhyN3wuXRaxD2eC271zvdeBwUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/11/21 7:00 PM, Phillip Potter wrote:
> Dear Larry,
> 
> Sorry, but the third patch doesn't apply to my copy of the staging
> tree with staging-testing tip as of now. Thanks.
> 
> Regards,
> Phil

Thanks for the notification. There was a conflict that arose between the time I 
created the patch, and when it was received. I just submitted v2.

Larry
