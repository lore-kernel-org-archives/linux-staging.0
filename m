Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE279C1;
	Thu,  3 Nov 2022 21:19:08 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id t25so8657688ejb.8;
        Thu, 03 Nov 2022 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImDG//sNXg/oy5XZPOuBFIhl7k6YK/gX5hImljVQwNU=;
        b=i7qVVi6QJzHOHsEyF2H3U4f5BeR1vqQ/kDwBUG+qLwh2CKBdbxFvjlU1NDRlZWCCpv
         of5a1WNQfehJN8bsNpyjehVNs9eSgIztGtu/hL+pmDwe1CTX6Co8eJvifN63coVyARjd
         SvBBi6iH8toGKC6+4APYxAACJDaW316sIqWQbSQPa7XWYx8xgXYXzzH2RpjY8zu0WEPU
         TMdY43lbQ8a1wJBk1yHYHzPpIYe+c/DnyU+nVSH/su1e/aAEsZ4miSYLzLffNjRTAqNe
         m3xv4eVf22zWK86RAjEKJfL8/v9GtOInlGlmel9QLoO0pjS1mpub40YrpTl2TmfuBkvu
         azpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImDG//sNXg/oy5XZPOuBFIhl7k6YK/gX5hImljVQwNU=;
        b=tn9weWuTUvhrx7C5eiMIJxJUtlyuxew/0mw4CiCpkKQCdTs5BDQvViOB1FW7CJJkpI
         fJoC3gYhm4/kZPXrBEUxJlroFzgS33TKOtdm0gWmcnOt5Z9froP64i9dCZ1zjea4xzmu
         PTnoKecye5bVolM2aHjUazajXa64Mi+02HGSjmLfEdu1JjeYUmvESH2PR54uM3H7Ek8m
         g6HP+as+s4v+RH5g+WlYAEze8RwV8Nv9WtPgsUx9/yJDUbw4MJ2/5+iCsn0v4jeY0B9G
         rQBOZYmCK+3pZfDpTRxUkiF++24OBktKahMDBquGJk01mLJR6sRqVq1YVAc5qUXoSvN/
         w5xQ==
X-Gm-Message-State: ACrzQf2jcvcFi+HT1MsieXftfF1La1qWwytojUQyoQlQtmmOxhTZ01TA
	IPN55PWiJ0M2bKMnb7AvMqI=
X-Google-Smtp-Source: AMsMyM7Kh4e60noIwDR139plI/hWSD9OSNgFT8xfKVvgoTo9o2S/R19CkOOAEcIyeni3GZNwo9ShVA==
X-Received: by 2002:a17:906:6a17:b0:794:f0e8:1918 with SMTP id qw23-20020a1709066a1700b00794f0e81918mr31466676ejc.474.1667510346827;
        Thu, 03 Nov 2022 14:19:06 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b895:1d95:7d32:5509:657e? (p200300c78f2ab8951d957d325509657e.dip0.t-ipconnect.de. [2003:c7:8f2a:b895:1d95:7d32:5509:657e])
        by smtp.gmail.com with ESMTPSA id td11-20020a1709078c8b00b00773f3ccd989sm964617ejc.68.2022.11.03.14.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 14:19:06 -0700 (PDT)
Message-ID: <2aeb10bc-178f-836e-eecd-c77f3eb2f0b5@gmail.com>
Date: Thu, 3 Nov 2022 22:19:05 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: remove unused struct declarations
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y2LYvhr74ng+xFbz@qemulion>
 <e76c5fd4-442b-0f0e-73e8-c17acf11b471@gmail.com> <Y2OOM8g0Qj1o6dRI@qemulion>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y2OOM8g0Qj1o6dRI@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 10:47, Deepak R Varma wrote:
> Hello Philipp,
> Thank you for testing the changes.
> 
> Request (not urgent):
> Can you please help me understand how do you
> test such changes? Do we need specific hardware for functional tests? Is there a
> documentation available to know more about the testing? I am interested in
> attaching a physical device to my machine and be able to debug and test the
> changes. Can you please provide details when you have time?
> 
> Thank you in advance!
> ./drv

Hi Deepak,

I do have one device for the following drivers:

vt6656
vt6655
r8188eu
r8192e_pci
r8712u

Minimum test is to measure the transfer speed and see if that is as 
expected.

When I doubt that the changed code is used I use ftrace to see if the 
code is used. But of course I do not test every possibility.

I hope you have the money to be able to buy hardware. Without it is not fun.

I would choose r8188eu (USB) or r8192e_pci.

Bye Philipp
