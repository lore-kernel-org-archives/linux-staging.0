Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D25CAC
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660900000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R0Slx1DKcgKnlcXGqv5kEXSQpwXtWUMVWojFb3cRpXU=;
	b=CStkhlRuFb93HFAt6dhGc1QE9zESHVfJNEzpNecunypM7T0tlERmFOfebuxtscqzFbOAJY
	6/TxwKcJwjsz8tuoywBhYx9/tV6fMlemZgkrUI8AsACupFE00nwq0i348nFTuxkkA3Ei0Y
	zNISILqHUOYzA6V0tYipL8JTHFrsph4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-SGTA1rqPNMmp-ylWEH3EpA-1; Fri, 19 Aug 2022 05:06:36 -0400
X-MC-Unique: SGTA1rqPNMmp-ylWEH3EpA-1
Received: by mail-ed1-f72.google.com with SMTP id z3-20020a056402274300b0043d4da3b4b5so2487262edd.12
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 02:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=R0Slx1DKcgKnlcXGqv5kEXSQpwXtWUMVWojFb3cRpXU=;
        b=QGojhFustQa8UmPRgAL4+clGnSv2QEmanYqKT1tjGvzAPFqksvasWy+7K1D49rA4Wi
         N0ZTl7+pRV3Dyrt0K32x2GybkMbLQSfPHg68IYY/UXxzyBdalGgqKl+msKmraQqhzct+
         omFRD6NuZlnFxYFbiqdi3isT9AO7KiY7NNgE4BxHnjlwLNdaHr5D/VaF7Mn3yxumd2hn
         U/q+R73qpjPc1YNTX1AjA17lqQzxEL7WWbVNmpqk/XrRlbpcs9zGybmRJQUwLbFAI0ht
         otpVfQFAujq1LwvIXXkdaI8mb3Y2x+DIqcb3THCONXGjqtS5sRW5Bu83lYtPsPvyurQy
         NFCQ==
X-Gm-Message-State: ACgBeo20q6phza+2nJLy48sR/LZhYWpWiqeORK2Ng1r5xU6B7p3Pq6Ve
	iqxwn55BBqUuvjKhwELc7QFPn/b3THOrIyY+2XydDAWq3fkL7cjc9sVY0wLI3RsNpv+l7Lw8ApX
	VoK5N3iTXmR0NE9PBypnXoydqtA==
X-Received: by 2002:a05:6402:415:b0:446:230d:2b82 with SMTP id q21-20020a056402041500b00446230d2b82mr3765982edv.200.1660899995764;
        Fri, 19 Aug 2022 02:06:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5iIcoNNPB6uqme/iA6yUwtAgX+OaDu1Z5NLDXlToy8Aw88ALMoFC2xRIWKIwiF7QVj2WRWRQ==
X-Received: by 2002:a05:6402:415:b0:446:230d:2b82 with SMTP id q21-20020a056402041500b00446230d2b82mr3765972edv.200.1660899995626;
        Fri, 19 Aug 2022 02:06:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b0073c82539183sm1233883ejc.91.2022.08.19.02.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:06:34 -0700 (PDT)
Message-ID: <d2f4a83d-6e15-b8ca-0bc6-d3a39915b7ad@redhat.com>
Date: Fri, 19 Aug 2022 11:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/7] staging: rtl8723bs: remove dead functions
To: Nam Cao <namcaov@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Larry.Finger@lwfinger.net
References: <cover.1660898432.git.namcaov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1660898432.git.namcaov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/19/22 10:52, Nam Cao wrote:
> Remove some functions in this driver because they are not used anywhere.
> 
> Nam Cao (7):
>   staging: rtl8723bs: remove function rtw_odm_dbg_comp_msg
>   staging: rtl8723bs: remove function rtw_get_ch_setting_union
>   staging: rtl8723bs: remove function rtw_odm_ability_set
>   staging: rtl8723bs: remove function GetFractionValueFromString
>   staging: rtl8723bs: remove function IsCommentString
>   staging: rtl8723bs: remove function rtw_odm_adaptivity_parm_msg
>   staging: rtl8723bs: remove function rtw_odm_dbg_comp_set
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 21 -------
>  drivers/staging/rtl8723bs/core/rtw_odm.c      | 44 ---------------
>  drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------------
>  drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
>  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
>  drivers/staging/rtl8723bs/include/rtw_odm.h   |  4 --
>  6 files changed, 130 deletions(-)

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

