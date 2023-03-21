Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9628820
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 22:42:12 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id s4so7662256ioj.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 15:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1679438531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jDzsttz/Z1eHYKj405pV9Blev59eyzoaBzMYfjRtNs=;
        b=FbuEPLzjGcUCi2cFfW7+KLrqrWm95kIC11bt4fzbF/b61kskPlMJluOllYVw1m0h6A
         wjtYOFhDA9Fwh/wB2xK96Ao7cb0XoGBINiTpnnfE8nTFlhkeZaF0oJ37B6Dm1zkZQ/6I
         2Bw+XaNr4Si9JrMDXDNLAqQh3VFCWoWLBsdEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679438531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jDzsttz/Z1eHYKj405pV9Blev59eyzoaBzMYfjRtNs=;
        b=XjXEWDwBfSnQS9ZWmK+Hr6UI9Vzcx6r26ZSI/aIt2uUDrOFcKuJYd6x0oSnCKREhen
         UiBf3DBmu5yVDVfcVYXjmPIRTPXYg50vStlLnnKYna/blUCUD2keRI9bRdyFPYjYt94X
         G0BhhNPvqrt6lDnu3yDohyHBRc2Cb9rU1A+KVKBD7fW3VUjvXQZ17FkhIVg23XhDgkYW
         4Dc7UuM0F3zPe0b6IMWW0cUUvXPmR+LDPQyMP7Xu/BOCVVdJF+QpIaoVFgaLNXiooPr+
         Qswvw81z4A872rM9vMmqVvxl/Jz7OloL1suLbUO9n0SwABedBi4Qd2qfvhxpWDgwXi1t
         trhg==
X-Gm-Message-State: AO0yUKX1+Njq/SZP/Khz1dLvtT5EoyTZh1Xv3+wBtecAGO1Sq06re2kq
	yWfQct9m+HUB5DcH/MbWkkSk/A==
X-Google-Smtp-Source: AK7set9UDQnyyrcCtYn7eXxYQZekjyMc7aOmhQHbXeN5LP4f214+4CiDgvD4W08V+UsjisQ1AgvMWw==
X-Received: by 2002:a5d:8406:0:b0:74c:8801:af4b with SMTP id i6-20020a5d8406000000b0074c8801af4bmr177109ion.1.1679438531124;
        Tue, 21 Mar 2023 15:42:11 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id p13-20020a6b630d000000b0074c8a021d4csm3905352iog.44.2023.03.21.15.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 15:42:10 -0700 (PDT)
Message-ID: <48674d8f-9753-780c-f37c-f83ea2855ae6@ieee.org>
Date: Tue, 21 Mar 2023 17:42:09 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: greybus: use inline function for macros
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
 <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
 <alpine.DEB.2.22.394.2303212140480.2919@hadrien>
 <5efa6e6d-8573-31de-639a-d15b2e9deca0@ieee.org>
 <alpine.DEB.2.22.394.2303212218500.2919@hadrien>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <alpine.DEB.2.22.394.2303212218500.2919@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/23 4:29 PM, Julia Lawall wrote:
> There do seem to be more than 100 definitions like:
> 
> #define to_dove_clk(hw) container_of(hw, struct dove_clk, hw)
> 
> where we have to hope that at all of the usage sites the argument is
> called hw.  Probably anything else would cause a compiler error, but still
> it looks strange.
> 
> julia

Yeah, that's poorly done and unfortunate.  The argument to
the parameter should be named something different.  I didn't
understand what you meant before but yes, this isn't good.
These should be fixed first.

					-Alex

