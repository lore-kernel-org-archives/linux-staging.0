Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28A210D
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660997839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iy3aCCM0ofzhiGWBxDwAa5x5+aFSHrvtSCmy4RrpDTE=;
	b=PpouliPgEtqN4U/9mRC90N3eXmpl28EmB/krwXcCQCx4FtD8KwA9FoFvmTU05wD1RK7J8y
	iVzjplYCBS0kaEKI8qe4okCThC0d+Pepr7ADOCy4rDvSWT+VLp7ksMEkI6IHQfWhBnex/Y
	KtEx195Owr1wiEGbclQyO5cLRIIizkU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-YEKk3BukPbiHFjf95rOaLA-1; Sat, 20 Aug 2022 08:17:17 -0400
X-MC-Unique: YEKk3BukPbiHFjf95rOaLA-1
Received: by mail-ej1-f72.google.com with SMTP id sd6-20020a1709076e0600b0073315809fb5so2086137ejc.10
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 05:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=iy3aCCM0ofzhiGWBxDwAa5x5+aFSHrvtSCmy4RrpDTE=;
        b=ZMRLWz23/DFIqfJmDoxMPxPPXxuebUUpVOrnSuzBeRaY7zC5JmabqlEIEwnHtXsZQh
         oGa6M3prP+QNqtpvzPR7LeuV5i7DJFjtzl76pzYAmDoTCPvw24S4vOY+czLBAHQXfB5d
         +iEkfmVbHFdHX5UG1UBD5n3mcjkM2RUsi9NQvL0PNX8N7EmBprrguA7054TSaZE6+fR2
         ggzFlvESOjzPmBwfSx+4qBrZ5pnmEiskmpAMgrabdnwjDHXpKAgQkzsM8y5i2CQlPPft
         sAKRcbz6jOBcOZrtQSt0CwKeAy60gLLO7DOpOINMylGU6VCYkI5WDwlR3xalVNUtXhEB
         YZyw==
X-Gm-Message-State: ACgBeo1P2w4zEMUFTf2hfVU8fENzYxGGV/5O4K0Q9lEy878Yd/e3zUVo
	UuSFBe3Pn+NSUDO9fAvo0vPg9lvRUfSfG39YFmbiY/RMRaamudzuK2idoaR7GWTgQ3SlnmEmbkF
	zf6VEZMOuQefrz9zStDN/XSzn5g==
X-Received: by 2002:a17:907:970b:b0:73d:5a29:959 with SMTP id jg11-20020a170907970b00b0073d5a290959mr3372641ejc.183.1660997836696;
        Sat, 20 Aug 2022 05:17:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5nXo87Pd7eW6X9eQzTrY8FDGaHJn7EYV6wHukMmMfX/kPNkwcmlXtH1ZjmliARRqJ1I9GyPA==
X-Received: by 2002:a17:907:970b:b0:73d:5a29:959 with SMTP id jg11-20020a170907970b00b0073d5a290959mr3372632ejc.183.1660997836515;
        Sat, 20 Aug 2022 05:17:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709067cc700b0072f112a6ad2sm3575376ejp.97.2022.08.20.05.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 05:17:14 -0700 (PDT)
Message-ID: <63626444-a7ee-a0c4-ec0a-f44a810e25ea@redhat.com>
Date: Sat, 20 Aug 2022 14:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/4] remove useless files
To: Nam Cao <namcaov@gmail.com>, lkp@intel.com
Cc: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <202208200447.kdEhBy9a-lkp@intel.com>
 <cover.1660977535.git.namcaov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1660977535.git.namcaov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Patch 1/4 seems to be missing?

Also please squash patches 3 and 4:

   staging: rtl8723bs: remove odm_NoiseMonitor.o from Makefile
   staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c

together. Ion other words remove both the files and the Makefile
target in a single patch please.

Regards,

Hans


On 8/20/22 08:42, Nam Cao wrote:
> Delete odm_NoiseMonitor.c and odm_NoiseMonitor.h because they are
> useless. The first 2 commits are preparation, and the final commit is
> actual removal.
> 
> v2: Add new patch to remove the file from Makefile, otherwise there is
> build error as reported by kernel test bot.
> 
> Nam Cao (4):
>   staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
>   staging: rtl8723bs: remove member noise_level from struct dm_odm_t
>   staging: rtl8723bs: remove odm_NoiseMonitor.o from Makefile
>   staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c
> 
>  drivers/staging/rtl8723bs/Makefile            |   1 -
>  drivers/staging/rtl8723bs/hal/odm.h           |   2 -
>  .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 130 ------------------
>  .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  |  39 ------
>  drivers/staging/rtl8723bs/hal/odm_precomp.h   |   1 -
>  5 files changed, 173 deletions(-)
>  delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
>  delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h
> 

