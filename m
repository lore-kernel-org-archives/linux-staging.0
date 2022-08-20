Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5042F2A
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661022892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcEdOQ10DcjhFhOlSWptCrA6mRT/8ZyucyzcP38daTc=;
	b=hTn5dcIAFPsBsj4L9obN63gMnJATKka05mhZ06gu/5ekSF1nWdJAHOApxCPeNTDOoBhxBK
	z9q0R2BH9z1qxRvbDYZvYR5NWQt6kk0eJyTNhGE3osXDTfiR8+6D0f/2Rl/54i6lsbd5wg
	djvGrG2rdmoIiuAj2hYWREbJlg7JJo0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-2oNZ2U4IPt-akSgxx7jdsw-1; Sat, 20 Aug 2022 15:14:51 -0400
X-MC-Unique: 2oNZ2U4IPt-akSgxx7jdsw-1
Received: by mail-ed1-f71.google.com with SMTP id h8-20020a05640250c800b0044642d29d35so2757003edb.18
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 12:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RcEdOQ10DcjhFhOlSWptCrA6mRT/8ZyucyzcP38daTc=;
        b=DfftVIenbeT4Ms10PPeVldK0xxErHRMuth+sY/UO/NoRcVZE4zTAI/FgC39zBM2kp1
         Aq3DGsi07rzwQafMw4Zlww1o1i11hxAicahbng8LhJ/tewGAMjHl0lxRbXv1NpwLSn7F
         WukLnQ6b5le7rQ32AdJg8adwwzIKSnv+iZ2evpGn8S5W+INRD1Uvulfn0RMfvVw2i7Xc
         eyo6ydz7tqgCuBnik/kXF1gv2RygwhDbWS6Owa9tacXw+Rfhc1dlaMm2ZhaB3t7b5z60
         bLdrpDOktnH2UmTUnnF/kj7NTDwvF5RUBImEBkUr6is6onEN/3tkBA+5gM2SmFTfXuVS
         skGQ==
X-Gm-Message-State: ACgBeo2tkF33PaFOqKL9ZtmpDBCTI71nfjzxtObveY2bONEcYG38kTB/
	lf+194ApYhGQGkV8OKQUkxhy+CtuOBxv6NBSHlyQgS7um5pavSFrun6aNJpca2DmnivKopIvNwC
	hnRF7jxnYZ+xelcKZiLlGTOYXBg==
X-Received: by 2002:aa7:c790:0:b0:443:a086:6877 with SMTP id n16-20020aa7c790000000b00443a0866877mr10384379eds.84.1661022890442;
        Sat, 20 Aug 2022 12:14:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR60jbrBYrvBSLFTcJQhnjQeLrtGvAgcYYuRCi9iNnW52jSM6yo7xugH8I2R5ca19534ueMvEQ==
X-Received: by 2002:aa7:c790:0:b0:443:a086:6877 with SMTP id n16-20020aa7c790000000b00443a0866877mr10384370eds.84.1661022890289;
        Sat, 20 Aug 2022 12:14:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z6-20020a1709060f0600b0073079439f27sm3927590eji.72.2022.08.20.12.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 12:14:49 -0700 (PDT)
Message-ID: <a74584a3-fc47-b458-2d1f-8e03beba7d9c@redhat.com>
Date: Sat, 20 Aug 2022 21:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 0/3] remove useless files
To: Nam Cao <namcaov@gmail.com>
Cc: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, lkp@intel.com
References: <13600e0c-bde2-198f-26c4-00531f277bf8@redhat.com>
 <cover.1661017377.git.namcaov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1661017377.git.namcaov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nam,

On 8/20/22 20:00, Nam Cao wrote:
> Delete odm_NoiseMonitor.c and odm_NoiseMonitor.h because they are
> useless. The first 2 commits are preparation, and the final commit is
> actual removal.
> 
> v2: Add new patch to remove the file from Makefile, otherwise there is
>     build error as reported by kernel test bot.
> v3: Squash some commits together. The patchset functionally remains
>     the same.
> 
> Nam Cao (3):
>   staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
>   staging: rtl8723bs: remove member noise_level from struct dm_odm_t
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

Thank you for the new version, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

