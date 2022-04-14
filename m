Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884377A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:36:23 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id z2so1404839oic.6
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bluv1hkXdADa/7/ZGpKxIvQTb4QNQVu1xgeDIBHpnmA=;
        b=BtHWKM9d1THYkjT+ga4YZO4bDYrhjKTpWYIt+eZu2YVKbQVbYeaC1gj6OFTiCTMcQ3
         Wzmef9FKChuZGMp0cbSCbBReu8v/CYfodfCfPs3Y/toG8PW0dm6lwO58f5fVfyFIRnAG
         3ekfqjy+hiq5ivW2bxtS15HFXjPlYSn23a1JpOKiWmDKWwkbcnITy1IIaFk1ljNW4T9U
         zy0HGngXnzWb2pv1ZnwCuuVkE+nVSAdv24mb1jm7rc3CYGzwm+JRDqneyuvLdcZf43D3
         oleo0yg1DqWl1KHkqxlxMEAMCPgbzN0j5aPN9RFYm3SIht7LJCALB18o0m7s8ExV3hJc
         66cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bluv1hkXdADa/7/ZGpKxIvQTb4QNQVu1xgeDIBHpnmA=;
        b=k+Fc5RivMrtC1Qkj+IK2RTO+5Y2xkednQihOCc9IliSiRr9YSUOaYg9GiyNAjm3xPa
         Mkucexh+uejOl6y6fFX+DpR0L0ZaTQSyV2auCtAZRbhILdrYtPT8KS07TK1t3KC0ysv8
         e2or3pDwz1J5vXg1dGf6lS9Q3dSQT4RWx8j8dDc9s1wrYfPfV0ua6WVCosg0SS4hcUcT
         vqLJbnbLF1UHkeoqR5UnMNZco8Zimuek7cVpHHE1tj5+toH5fodZAh6GUL+/Su9+IZZl
         2n1KWf0+esUsOfQmeP6VUXkwL82ebO8RDYvnjFzZHyOlrVtVXsOssV8RdGIxs3TOT1o9
         LxuA==
X-Gm-Message-State: AOAM531DBvwfE4CvjlMkN8ULVKuSrBD/HOdZZgj7H6sA6Y4UwZ5zTLSH
	TKnehGWJfk+8dZ5G6B1m1JA=
X-Google-Smtp-Source: ABdhPJyWUMklqQP5SFVg65gdz6e4kSw9omemOlS3nC17dX0xheswnb462aiANRXRNTsRoHNMhYSxgQ==
X-Received: by 2002:aca:f1d4:0:b0:2ef:1fa6:3c74 with SMTP id p203-20020acaf1d4000000b002ef1fa63c74mr1812903oih.89.1649950582688;
        Thu, 14 Apr 2022 08:36:22 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id hl26-20020a0568701b1a00b000e2ff513be1sm739212oab.55.2022.04.14.08.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 08:36:22 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <80414992-a662-e884-05ca-dcc0c8b07b99@lwfinger.net>
Date: Thu, 14 Apr 2022 10:36:20 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] staging: r8188eu: always log firmware info
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220414083853.3422-1-straube.linux@gmail.com>
 <20220414083853.3422-7-straube.linux@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20220414083853.3422-7-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/22 03:38, Michael Straube wrote:
> The local static variable log_version prevents logging the firmware
> information more than once, e.g. when the device is unplugged and
> plugged again. That is not necessary and complicates the code. Remove
> it.

I think the slight complication of the code, one static variable and one if 
statement, is worth not spamming the logs. My recollection is that there are 
other cases besides unplugging and replugging that lead to the firmware being 
reloaded.

Larry

