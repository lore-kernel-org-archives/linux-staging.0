Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C628E1
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 10:27:33 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id w2so12960405ljj.7
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IBeghQjIQTuVAuHODHdWbCnnEDL7Ey8qKJa2W4GbzSA=;
        b=iw5lmfXnsjKcqo/hUQUO2lquCgD6f8aijivBEOcwB6PzEBfK9W/aE3o/QYed5UG9Jn
         1Zm03K+xmeq5/UnebMPAoQedLnM+xrSf+N0MLn3UgTR7M+dBUWp83gA8v7CaPjlgTtJK
         JdnsXqQ7eIObYLW77c9T52FgbsVFS+orz/3qVLCBIIQG9dTFnPB+7WQbesJ5AuBpzz44
         VP9BLim6acCvFrA1bV0A/KFypN3eQwFLD+0oIwN1ag0JATZ/9lNHT4fp2dGs0UYNXnn/
         obuqKG6kLHTCAjHQC0aKOe8NtQx4jGmLcaxP3+SrxKBgXptRs0tCqnIYhIW363WsWEPg
         IPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IBeghQjIQTuVAuHODHdWbCnnEDL7Ey8qKJa2W4GbzSA=;
        b=L2+QVymRG3eOiNVUMtqYQ6M16VqKLdpybRnJzja2MYlWE9eYN931JmfQp/cH5+0sFD
         NGjuK9hEbG4lch672kbxVI35u5MiYvGyCmwiZdPZcznLWGotY5StGkKOuRZZfpIV9Sgy
         Hvn3oG4hl4OFZgBx6ztHWE3oygPgz7pa0foRCWWMofPw0/5D7CvScYznu0ehiOLVzzDc
         bEbygihIxv1EZTlqv4qvGNKsj56h2GjWMhVpVT6e3EZjyJdfj41WV38kHJJ3d06bid8u
         mtj6xGwauTk8r1Zwga8uADfqUpkhyF0eDQpj9x+7TDN8MBAO28gv/biusSnCT2clbSEN
         KcYA==
X-Gm-Message-State: AJIora/o0E1Z8ztadlzI4WK/XIiz2wn0GCe01Gqf74MziZ9N35xvTpCI
	e4UAH3Xp+3kFgFYNCjQsD6KWRpixU9g=
X-Google-Smtp-Source: AGRyM1tAkNAlsoqfiJCsQ4j3Cu4MlpJnLmrn7ZCjD2jTjwvjXMdDmcY1ofTiDagYlZ/nIy1ptpT1Ww==
X-Received: by 2002:a05:651c:4c7:b0:25d:8797:cd4b with SMTP id e7-20020a05651c04c700b0025d8797cd4bmr1327409lji.253.1657708051176;
        Wed, 13 Jul 2022 03:27:31 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.63])
        by smtp.gmail.com with ESMTPSA id b15-20020a05651c032f00b0025d652e12c5sm2583780ljp.109.2022.07.13.03.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 03:27:30 -0700 (PDT)
Message-ID: <437bb094-0768-47ff-fd36-9f181feefe6b@gmail.com>
Date: Wed, 13 Jul 2022 13:27:29 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] staging: r8188eu: fall back to random mac address
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
References: <20220713075552.140927-1-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220713075552.140927-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <martin@kaiser.cx> says:
> Call eth_random_addr to generate a random mac address if we cannot load
> the mac address from the efuses.
> 
> Do not use a constant mac address as fallback. This may create conflicts
> if we have several r8188eu devices on the network.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---

Looks OK to me, thanks

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>





Thanks,
--Pavel Skripkin
