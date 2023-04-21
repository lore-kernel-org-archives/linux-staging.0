Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF7649
	for <linux-staging@lists.linux.dev>; Fri, 21 Apr 2023 05:32:55 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-94f59fbe2cbso41788566b.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 22:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682055174; x=1684647174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFW7Gg1SgGBbBJt5owgBHTN5D7RxDmj2irhm6z31MIQ=;
        b=VxiYdLrE1afaqY5HkATYYMkJb8GawuWMByr4Cnuu4TCSxIO9qF4emDfIiTguKIRkD3
         7QBWafFYwaVQseFDu2qMwMedVO4LFCSbENEVcUdyfTniSaC5eq6N1wxvsGlZajUzkl1H
         e7ljqj5zbwu858s53seRVTSKP2l5FFGynKhpJ/eAQu1eJs3CMwY0nqNiIwjDXB6SqdJ1
         QBNTeeh9ogt9JVHMkEMfTlQ6N53PkAHY+cUlhG95De4FKk8ZogU6+QdTMGOQj762UiYH
         1xIGvodhYAeTSIV+493oDYJbdhvWx7nYTRTD50c04793W47IUhpTTvRcfPXbEghJIict
         RMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682055174; x=1684647174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFW7Gg1SgGBbBJt5owgBHTN5D7RxDmj2irhm6z31MIQ=;
        b=gnERH9RfvxmPpeKes4RtLpV8Z0IDcGyNA59r23YFZjCHH8jOxYScR53SAG43GF3AGx
         /Lp5HmTQUHBLXTQXaDdWawYFGzbn3s4xGb1Hma2zLQtxH+aROMis01HLB53VWj9mnV5j
         q+Q7MK6C67Tli9m7upi9DOv3OA2lf6yMzo1Y14n4Itm9x+wtA8N/1D+EC3uH2uYz65qI
         6zKXJXpm1wp4AaSkGTb1rAOf++xJUtJz06q6Mo1JV2DrMIpIpoYK6tSXx2SYLiOTF6R5
         cKk03GnGvvchcKlKCxko5p6p0dZqo/nQZBbcTnQd/70RqHnhYro9rqnCn4KqeHr6h6sW
         TA9Q==
X-Gm-Message-State: AAQBX9ewiHUYMKZIZId+DPtzYnisSYk9Cb9pbWI8VRWR6pRoVpPpVWwr
	j70JjD1Ckymn0xxDU2njBn0=
X-Google-Smtp-Source: AKy350Z/TfHG2ZHB6XiI5P2UxmdymQ0V+AbYUHsq26ml8FoULXU8BIx3YGBKeVyQ+boAr4AqINfHOw==
X-Received: by 2002:a17:906:35d1:b0:94f:4ec3:f0f5 with SMTP id p17-20020a17090635d100b0094f4ec3f0f5mr3504174ejb.4.1682055173642;
        Thu, 20 Apr 2023 22:32:53 -0700 (PDT)
Received: from [192.168.0.101] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906174d00b0094e477eb441sm1573171eje.110.2023.04.20.22.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 22:32:53 -0700 (PDT)
Message-ID: <d5140404-6b11-6755-a086-7e473d093494@gmail.com>
Date: Fri, 21 Apr 2023 07:32:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] staging: rtl8712: Adjustments for process_link_qual()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>, Nam Cao <namcaov@gmail.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <93913f0c-4699-cf9a-0f10-8edd478fd2b3@web.de>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <93913f0c-4699-cf9a-0f10-8edd478fd2b3@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/20/23 12:54, Markus Elfring wrote:
> Date: Thu, 20 Apr 2023 12:05:12 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (4):
>    Delete null pointer checks
>    Delete two variables
>    Reduce scope for the variable “sqd”
>    Simplify the usage of an expression
> 
>   drivers/staging/rtl8712/rtl8712_recv.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> --
> 2.40.0
> 
> 

Hi, you get the following checkpatch warning. Is this wanted?

WARNING: From:/Signed-off-by: email address mismatch: 'From: Markus 
Elfring <Markus.Elfring@web.de>' != 'Signed-off-by: Markus Elfring 
<elfring@users.sourceforge.net>'


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
