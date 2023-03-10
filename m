Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D46C979
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678443978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSYT9NdKeIbjdIT8S3/yTKu9A/BiOzhczLFXXBYF9tk=;
	b=MYVnxnphoDJD98CZgDLfxhXGjMIP7xTZ3zcq3kJpLlK6ihgi2ejPunrXO6duW3aEG+p983
	mJ7vch39wvrcM+QsdrCsNpZxLkYnNL4+lWULIK/Tr8AkcSMiYBLnHTf1pj3w4zQ1i0iDK8
	SJc3qDD2y44jX3/asxUfZnDCbg1DuFU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-h-F_E5h1O-yckOjR-DjoVw-1; Fri, 10 Mar 2023 05:26:17 -0500
X-MC-Unique: h-F_E5h1O-yckOjR-DjoVw-1
Received: by mail-ed1-f71.google.com with SMTP id r9-20020a05640251c900b004d4257341c2so7064658edd.19
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 02:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678443976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSYT9NdKeIbjdIT8S3/yTKu9A/BiOzhczLFXXBYF9tk=;
        b=XouzXf3x4v4qdNO0n8ZjX3v68qc+R7ACTqC13lPR7lXS0mCVwkDKwzU9UmDcKWYzH/
         uYoNElcb+HezltkcfbTkPBaJ7jDu+pfJcCMH/POGsls8cw3h07EV7spSxAYq4HRyGs61
         Q92iTgmpCK1Ye7iut6inr3NSGuQd+VzX15GDnvUSKbfZno/3N1rOIp7Q+V9hEwAtPTUc
         hd6ugN14mBaVclTlb3pQMABSCvC8xzDrZI5OM3cNIH1kVssGhMcU89aX7aSQdKaZHlKV
         r4BovrmuL21xtS1PGkcspwIfThGHGg6a4kbCGv0xFzBPXuwBjlGUTw2ig2P0jkA9Vy8S
         UKEA==
X-Gm-Message-State: AO0yUKWhPXbr3DTDFTU4nErxDqwd9VcXMBj8ZJKD53KSxYDDmY30rdWq
	JiJcjKaB2QkJO6YmqBsjyESL0MPHlB1/wAqZiqL/VWx1bqfjW1DAOpFZQFgt6qJ7SRFxspoPxS4
	1XZxe7oW0/tzHWDK4JXNkU99RsQ==
X-Received: by 2002:a17:906:4756:b0:8ed:5af8:d4ba with SMTP id j22-20020a170906475600b008ed5af8d4bamr1557175ejs.38.1678443976130;
        Fri, 10 Mar 2023 02:26:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+xHrvOFHbxAWQ1eD/jbBpVJSXkKAk6Q7FFe6t2ghKJjQXr/bZkp4vlYrU3T86K9j2Y0urShg==
X-Received: by 2002:a17:906:4756:b0:8ed:5af8:d4ba with SMTP id j22-20020a170906475600b008ed5af8d4bamr1557163ejs.38.1678443975907;
        Fri, 10 Mar 2023 02:26:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m25-20020a170906235900b008ca52f7fbcbsm789348eja.1.2023.03.10.02.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 02:26:15 -0800 (PST)
Message-ID: <9d0bbfb3-cb7f-15f9-0e84-172dd08c6148@redhat.com>
Date: Fri, 10 Mar 2023 11:26:14 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/5] staging: rtl8723bs: remove some unused functions
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230310083449.23775-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230310083449.23775-1-straube.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/10/23 09:34, Michael Straube wrote:
> This series removes some unused functions from hal/hal_com.c.

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> 
> Michael Straube (5):
>   staging: rtl8723bs: MapCharToHexDigit() is not used
>   staging: rtl8723bs: ParseQualifiedString() is not used
>   staging: rtl8723bs: isAllSpaceOrTab() is not used
>   staging: rtl8723bs: linked_info_dump() is not used
>   staging: rtl8723bs: rtw_get_raw_rssi_info() is not used
> 
>  drivers/staging/rtl8723bs/hal/hal_com.c     | 108 --------------------
>  drivers/staging/rtl8723bs/include/hal_com.h |   9 --
>  2 files changed, 117 deletions(-)
> 

