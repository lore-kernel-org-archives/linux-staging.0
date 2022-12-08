Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED0A21
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 11:33:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so791475wmi.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 03:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gyePz0ceQs7OoaxMHF/kKC6cWki4Kwyl7phO32bdEmc=;
        b=HjNpis7/M9qlQGmmb6AvPNbsbhnPigEf1y0ufykE7eEwtpoyGUv/EgNWnhDyyMvs8N
         whrgryNZoTPPEzgOxn8I7eGtvt0i3WWW+yoMsfl+bCdBHnTjbYZTmVI1aRsD8XUwtAKW
         EDWoyzBDyMV/f4qd5H5/12kdWVO+6toaqTmYJ15TWaCh1fSYqCwWLwPyyvmr4/2rUiwk
         M3+mBgwxDjGOCQJiswaPpr2cCt4Y7KNK/XgNEaia7cZ2kfVbaS2kp6xdLY6jn+Tslf9f
         gkQfKFXBfmXBfR8V13p13WX/mwusbJc6s2MMZ61yVOVEI7zvZV1C+r7ZagmaTZpGv5LS
         0QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyePz0ceQs7OoaxMHF/kKC6cWki4Kwyl7phO32bdEmc=;
        b=rMVBI8y7CA6Br0JEhrEJQVyuAMMDhWK/RAvdM4dxrQPk0JNxtgfWl02ZxUHviWgo9p
         mPmwOlNN3iEtSQaRXetr1CMgjUKSaJe0q17nHNEjaCsT3UQsxJwubS6LAvRAeE4Mleyq
         hhRopoEtc1xD1bR5uogJtrhuKDa31W8nrvEhqzcSkLhgDrLcqTXDGxEBpXtunoaVkwBy
         WhQFHDvAy4LwKTAZLJURW0ZAx/sXXT+JTL9zC2Hdv3lcQsuQEwHVmNHLExC5flwAAieR
         ZMJ3xwl5EMVkLMhpKq6LRkjM/lqnn8r9fhLtOQ8dfL++EKjFRtw+O3B26+mbDauVKEX2
         A8cg==
X-Gm-Message-State: ANoB5pkO8YLas4kKVqechtCih+xcIuqaws+egYRMXzlYHlq0nXlS5GUj
	ZW6A6DFZwkZc7uOGQs05N5g=
X-Google-Smtp-Source: AA0mqf4cD9rhikrA6MLNsQ/UECoZtltssHkhnYE3CHNWHQLvysj514I/ukiGkCTge9MH4Zniw4CbYA==
X-Received: by 2002:a05:600c:548b:b0:3cf:b0e4:30d9 with SMTP id iv11-20020a05600c548b00b003cfb0e430d9mr60584027wmb.66.1670499211799;
        Thu, 08 Dec 2022 03:33:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ck14-20020a5d5e8e000000b0023677e1157fsm10731915wrb.56.2022.12.08.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:33:31 -0800 (PST)
Date: Thu, 8 Dec 2022 14:33:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 RESEND] Staging: greybus: camera: fixed brace
 coding-style and indentation issues
Message-ID: <Y5HLh1r3R2bULsRj@kadam>
References: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>

It's hard to ignore checkpatch but I feel like the new code is worse
than the original.  Let's ignore checkpatch on this.

regards,
dan carpenter

