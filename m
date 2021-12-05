Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F852C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 18:10:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id l25so33695645eda.11
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oqCnAuMa6hQyTbbrJOr0/eprrgkd78cxU3mlprQfZ3M=;
        b=KaMf7C+Nm7XjOqLTQ/Kpw6pXtAw8SsBxHyYdxXpQXgoCQ3O5CukghJ1/WT3adhzChP
         y1o1OgkOhKXfr31jNhgm8eS+pHYGtsV+jZO3QZP7madXMMZsfKcaB9yylTe7hKlz9V2F
         6jFLq6Azx+vXrFbP26gpd16NZp+KjVAxaZWMManSYlafCspAzWCiXHbW2PbkxXZEuJxq
         esQMt9zve4wHGZMqptrEmafv2i0bxoZlKpxUgPii5oU7lRdc3h8J97Y//Vz1v5MkYsyI
         hUA/oGXSQegZi2U0DMsPa12UgvuDGKovFRxpAFXgbVUn/pZmvq7+j6UkZt4NEnwFxGQz
         dA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqCnAuMa6hQyTbbrJOr0/eprrgkd78cxU3mlprQfZ3M=;
        b=hRQI94rhq4F6wUOLdk3E8O4WOOYT039S1JSAJ+diUVKtEbPw+RlIvpW2WqaFlRXhA4
         SABUBHMdfqLsAasW0BIaLC9RqYCs96rudf8C02hR2sah581rILlSEBcAkgpzRdfK3fQn
         y1NDHNvpoG2Inwv7Nhi1P4IgdIAn3pApunENj5bYX4YfpsRB4UDnltj0fwLrXslezJ1V
         aN97PtM3l1FkZw4ZTlQhO/OyTWEyZbb5qxSlrQwbocdo/0UbaQ0ueLs8Rq4ck5DTXA9X
         F2B7w3eqtId9qTBFvDaiD2/xaYipixdYBTuabHX+YxVmZAHqFxZMf4Exavxl5/EBTsk6
         zJ5g==
X-Gm-Message-State: AOAM532VF3JMjLzOmBWIpciMi6tPDMM2HJ/p7U6pnYdaIViAeMIBSssI
	Fvn1nUgCbSwiONutUHlr8ig=
X-Google-Smtp-Source: ABdhPJwe8o2eOZUsWS2JJedJrp1cL7lPvVGYmFBlHQ6tTX1rFsnJtfHG8fKoHkyxDO0By5e1b0LASQ==
X-Received: by 2002:a17:907:3e8a:: with SMTP id hs10mr40015002ejc.404.1638727800702;
        Sun, 05 Dec 2021 10:10:00 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::b792? ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id w5sm6631561edc.58.2021.12.05.10.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 10:10:00 -0800 (PST)
Message-ID: <a9a77dba-45fe-3d0e-438b-acfa5bed693f@gmail.com>
Date: Sun, 5 Dec 2021 19:09:59 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 12/12] staging: r8188eu: hal_data_sz is set but never used
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211205135919.30460-1-straube.linux@gmail.com>
 <20211205135919.30460-13-straube.linux@gmail.com>
 <197e167b-2225-3593-dab3-4f1f61331de9@gmail.com>
 <b3886219-9a24-c119-fe10-12e5e7c6b139@gmail.com>
 <51a14a4a-8385-b155-a16f-b4cc8b0096c7@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <51a14a4a-8385-b155-a16f-b4cc8b0096c7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.12.21 um 18:23 schrieb Pavel Skripkin:
> 
> and even why Haldata is void *, but not struct hal_data_8188e * :)
> 

I guess it's void because they use the same code for other chips.
And drivers for other chips perhaps use a different hal_data structure.

I'm working on embedding hal_data_8188e into the adapter structure
instead of using a pointer.

...still much work to do to get rid of the hal layer entirely. ;)

Regards,
Michael
