Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475C29CA
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643012175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTLl4YJkeUuVgMvKnlcneMHmBiRgYGMhn5C09P+gXVg=;
	b=GK1opJiTAWKvBnhN5aRBgeImQhRoe224L+6WnZgoKfLaDJNbgmfeRMGOo9pC72SofI3OoF
	2jbmSJjzVxHFL03XOC6vKoL5JrKr8VXsn1z+/4Csk3dza9KxBAQJPSV/UgzR8vhHlQB03J
	WrBrcPuvvY1cUmEMY9nM0kpaJWZJCfQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-3N6iup2pNoCtZ3Zyxtrcig-1; Mon, 24 Jan 2022 03:16:11 -0500
X-MC-Unique: 3N6iup2pNoCtZ3Zyxtrcig-1
Received: by mail-ej1-f72.google.com with SMTP id i21-20020a1709063c5500b006b4c7308c19so1756893ejg.14
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 00:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZTLl4YJkeUuVgMvKnlcneMHmBiRgYGMhn5C09P+gXVg=;
        b=cmV4V+4x64JY2KdipoKDMqg+XehBwJe/sNJVhHV1HJU0Rm9gBvfZvI+4/aJt8GtFgD
         Ozkp9BrLOi6cAfiKBrRmATrEqI+efmuz8U2zwp5AEOeoecyrf3eNc25EOur6MTFm8vkG
         uCqyNbirCk1f9r6PMzh7ZJvvOwZ4ia3qBU5oUqA+re38qfJtbyLGmWsCrwHgh0YEDMxo
         DPtER9yg16LH9gDSTeTdrhxvxepiy+FkYZ2acmek2SyQJLOChzD1QnvJb5305kVplNLQ
         EtAFt7FOvatN3EiytrPDV/e2JjC881bZen371vljr/PFqOXpHYcp6iFg0VWESG4W6jOk
         j32g==
X-Gm-Message-State: AOAM532bvMZF1n3WcqOWgj2Ebm2m36XZcwRo7oAs15ib4YrVwB3PkGW8
	hkymH7RJ/MNaxIbls8Gpr/oVbSVRJezVqMriK0t6HHzhVvahpc1B+Cibk9Tz0RYvApM9Up02GCm
	cv2YZToQIWGPi14bMBnJVU/upyg==
X-Received: by 2002:a17:906:9742:: with SMTP id o2mr11722206ejy.530.1643012170407;
        Mon, 24 Jan 2022 00:16:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOr3jOY+RTOMB2JqY3ZgFgnki6NWYqRSaiNL7SDrsnmX5TQlHJzM/4eGuy6YOS1RraAewSXw==
X-Received: by 2002:a17:906:9742:: with SMTP id o2mr11722192ejy.530.1643012170213;
        Mon, 24 Jan 2022 00:16:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r23sm948111eju.134.2022.01.24.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 00:16:09 -0800 (PST)
Message-ID: <7792513f-4f5a-d2b8-f142-ac14d97cda8f@redhat.com>
Date: Mon, 24 Jan 2022 09:16:08 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Patch 0/3] Staging: rtl8723bs: Fix codestyle errors and warnings
To: Jagath Jog J <jagathjog1996@gmail.com>, gregkh@linuxfoundation.org,
 Larry.Finger@lwfinger.net
Cc: fabioaiuto83@gmail.com, dan.carpenter@oracle.com, marcocesati@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220124034456.8665-1-jagathjog1996@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220124034456.8665-1-jagathjog1996@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/24/22 04:44, Jagath Jog J wrote:
> This series fix the following errors/warnings:
> 
> -Placing { braces at the end of same line of if condition
> -Removed extra spaces in declaration
> -Placing necessary blank line after declaration

Thanks, series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> 
> Jagath Jog J (3):
>   Staging: rtl8723bs: Placing opening { braces in previous line
>   Staging: rtl8723bs: Removed extra spaces between datatype and variable
>   Staging: rtl8723bs: Inserting blank line after declaration
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 54 +++++-----
>  drivers/staging/rtl8723bs/hal/hal_intf.c      |  5 +
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 98 ++++++-------------
>  3 files changed, 63 insertions(+), 94 deletions(-)
> 

