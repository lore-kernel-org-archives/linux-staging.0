Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0F7C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648810218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDDO4Z8byxB+Vv3MwlS6NmtsWgbDQ/bQgZ8uPefW6us=;
	b=Jn2SzCBX/0v9WQqVkVd/yh4Nz65Z0vPFYAZg8M3/krRW/F0Ohw8Nn9APol2+K9xpZd09DA
	zIJZCEKvhbPiy75XvPDhnYzieTQ0fKUj6isD18gixlbLnefVRpfDzIbFPiUfNEjZOh2Wjt
	6cVrRi9CTif9oB3kmQLB888HHI81j4Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-JxgmbhvMMPG4dQHPTAr_xg-1; Fri, 01 Apr 2022 06:50:17 -0400
X-MC-Unique: JxgmbhvMMPG4dQHPTAr_xg-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020aa7d512000000b0041b6bb71ab0so1285729edq.21
        for <linux-staging@lists.linux.dev>; Fri, 01 Apr 2022 03:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gDDO4Z8byxB+Vv3MwlS6NmtsWgbDQ/bQgZ8uPefW6us=;
        b=KB0wiZPlC9LlAAHi3wy0u1WiQBHvUoDeWXlHeQnISDZ+TZzsSBMmv+Bj+uePuTQ87o
         6sbxr44ZW0Cy6Ff6AWxBJcefsh+nhQvEuGM6WMrHbOy2lr5t7Wg2/aMdMe1aMblrbnUJ
         3s4QcWhvluPPivPqBajw+BxWZsnkAV9+0TJkW0bbJyVYscshrF83dIHkZReEVkAC6C+f
         uk59wxrqO2Kd1KR4JwM1FpCT5JnWV8yx2DsjiRc0Wo43vFy7vHMvsQSm7q2FLlH+X2OI
         Q50oDruaEBOqL0zbFoxk1yn0HVt3MX71drgA6DuuhtXbTA8jM79HhTJXP4NO+YdXq+Kb
         ztog==
X-Gm-Message-State: AOAM532/4GAD6Q/iOgXBOolTqcfjwob66ySL1a32W/StNQHeB7f20ora
	oAQorQZSHR73MzohLIMcBLV4KFClisai3snRub3apdRLKUHoVbKbmYx/Ddb4274r9l4mnA0cEQm
	N3AXDtv+Cq+lRApdo+KridX5Xkw==
X-Received: by 2002:a50:9d49:0:b0:418:681b:f6d with SMTP id j9-20020a509d49000000b00418681b0f6dmr20467287edk.160.1648810216117;
        Fri, 01 Apr 2022 03:50:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhFlFkORi2fxrVhw0AlbjXBnfVihiFBGuQKhRIJf9d7DtE4HzdXknBigLBfoR6nADd+SUniw==
X-Received: by 2002:a50:9d49:0:b0:418:681b:f6d with SMTP id j9-20020a509d49000000b00418681b0f6dmr20467276edk.160.1648810215971;
        Fri, 01 Apr 2022 03:50:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id gb29-20020a170907961d00b006e00c7b0f5asm888182ejc.0.2022.04.01.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 03:50:15 -0700 (PDT)
Message-ID: <b4462338-7c38-032f-bcd2-2a50cffb15d5@redhat.com>
Date: Fri, 1 Apr 2022 12:50:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] staging: rtl8723bs: remove some 5 GHz code
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220331214146.15161-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220331214146.15161-1-straube.linux@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/31/22 23:41, Michael Straube wrote:
> This two patches remove 5 GHz channels from the ch_freq_map array in
> rtw_rf.c and simplify the rtw_ch2freq() function.

Thanks, both patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans



> 
> Michael Straube (2):
>   staging: rtl8723bs: remove 5 GHz channels from ch_freq_map
>   staging: rtl8723bs: refactor rtw_ch2freq()
> 
>  drivers/staging/rtl8723bs/core/rtw_rf.c | 56 ++++++++-----------------
>  1 file changed, 18 insertions(+), 38 deletions(-)
> 

