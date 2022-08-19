Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F33220
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660919163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eICnUMCnIldtlbZrl7FbZerwo61fNEIPgGY03g7m9SQ=;
	b=JlyZPpLAvhP7xV63oKAnhGdwPdm8Sj6V4TMNPlDH+CPSBS9wb1S2GfsOajGD3Yx+CsEJ8A
	bP1uPpZNE7lxfBQiM1qI+eMSIJ0UlXRGZw0BYKSY8nah4tLd5tCn53hOsiRKhMSSS1JenB
	zlDm56e+c6l2RxAIr8NUL9qNxym8mQ0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-450-eq1VpIGvOXabHUFfr1Avbw-1; Fri, 19 Aug 2022 10:26:01 -0400
X-MC-Unique: eq1VpIGvOXabHUFfr1Avbw-1
Received: by mail-ej1-f70.google.com with SMTP id nc38-20020a1709071c2600b007309af9e482so1568129ejc.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 07:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eICnUMCnIldtlbZrl7FbZerwo61fNEIPgGY03g7m9SQ=;
        b=4AtljTIXt8MFB0ToStR+APQ+9RYCSL7cKP87Ege1mixm4fLWpJdJZL5bq/8eQCjP9R
         ihG2Q+hE1hx1X6I2CU4NxrWLGEH1dbnHG0bGCynyqWOIAnRkJf8xx8qyJQ83DleATtq8
         b6IO772VFSYfzCadX0kuRNq38lU4Haor2E0fsUUjhzjyNQ1gMXhqAMTeD3aN1KrXoRi5
         ZssBrFqXX+r+BVC2NIcpV+CKDPIo9qUWPmIdqqXkY0VWjK5vTXbi1dIQwiqgOYXKHgK5
         XIDWIL0a5J7iFE+TwZOlOkJWVerh+PWRk/B+V40prM8nBnaKi+zKPJKOYHkvQcgzYQcb
         SUMQ==
X-Gm-Message-State: ACgBeo1XCesUtmAiPhiknN01nL+9aY7D9BaQRIaFhhGpRJ/c1658DbCp
	Zg6wR+svD4XRQLlDaYvDYC4tB8lYnE3ImRd2iy5o80k1O2bPmtGfVKs34C5C4zH+rBOzfIV7Qbo
	VROaZMpx2iO67a46un7QHoPDOKg==
X-Received: by 2002:a05:6402:22f3:b0:446:39e9:5d0e with SMTP id dn19-20020a05640222f300b0044639e95d0emr2966901edb.300.1660919160746;
        Fri, 19 Aug 2022 07:26:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR63eJLF5q6lph4qaiToW0WKHDqW73GHbf0jK4qlifdLRM1JnNcG7Cu+W7XEKmmCbaYhJF6M5g==
X-Received: by 2002:a05:6402:22f3:b0:446:39e9:5d0e with SMTP id dn19-20020a05640222f300b0044639e95d0emr2966890edb.300.1660919160596;
        Fri, 19 Aug 2022 07:26:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id kw11-20020a170907770b00b0073c9db65819sm1470939ejc.47.2022.08.19.07.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:25:59 -0700 (PDT)
Message-ID: <e15d7107-636d-eb55-10a3-24a1e311f7c0@redhat.com>
Date: Fri, 19 Aug 2022 16:25:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/8] remove some dead code
To: Nam Cao <namcaov@gmail.com>, lkp@intel.com
Cc: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <202208192018.BfgiZyOY-lkp@intel.com>
 <cover.1660916523.git.namcaov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1660916523.git.namcaov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/19/22 15:49, Nam Cao wrote:
> Remove some unused functions and variables.
> 
> Change in v2: add a new patch to fix kernel test robot's warning
> about unused variable.
> 
> Nam Cao (8):
>   staging: rtl8723bs: remove function rtw_odm_dbg_comp_msg
>   staging: rtl8723bs: remove function rtw_get_ch_setting_union
>   staging: rtl8723bs: remove function rtw_odm_ability_set
>   staging: rtl8723bs: remove function GetFractionValueFromString
>   staging: rtl8723bs: remove function IsCommentString
>   staging: rtl8723bs: remove function rtw_odm_adaptivity_parm_msg
>   staging: rtl8723bs: remove function rtw_odm_dbg_comp_set
>   staging: rtl8723bs: remove static const variable odm_comp_str
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 21 -----
>  drivers/staging/rtl8723bs/core/rtw_odm.c      | 79 -------------------
>  drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------
>  drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
>  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
>  drivers/staging/rtl8723bs/include/rtw_odm.h   |  4 -
>  6 files changed, 165 deletions(-)

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

