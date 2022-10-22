Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAD20F0
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 05:16:27 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e18so13000187edj.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Oct 2022 22:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yFsO2k9GJqskGirXTy30+Rr4ObgZBCuJO3gxd2Y2+g=;
        b=hSn9Ud8MZRAcuu/0OXR4Ra0GC+vLv9JzfjMakBRJrHH9stUfS664LvveE40eqxDc1B
         YoV/m2gqS3KlfwqA3buJnJ0cIbld0d8fjksV2YwNCHuggS18BV/Z5+fuHPVpW7/mP63r
         0lN41601nLdfUS8V4pdqK7j8t02wfhyrmeAq+bPll0DmZKXyt8TXnPagAJ+h6vhiVenK
         T4JnuT1SsH4nJ9lUxDQrBtXWBTDDreDaeuoSX5OL5KnyyHYZcEfUV7CvzSEB0M/xc6g1
         uVBkwHDamo+2w3oXbYfSWo8MCc8YVURW+ZNmMPgvKptqHiUm/xyY1IHZSzwMvAiaz1bY
         Ev/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yFsO2k9GJqskGirXTy30+Rr4ObgZBCuJO3gxd2Y2+g=;
        b=QIShdpd1RF7miILyVdeYLLBCSzul0qhSOn4cOlvEtttFCYkniN8P9Lww3z5Vbscy5R
         2OQ0aUwqM4ZroAm55qzcM9Ae9IW0ayUrtiFD67l/FMXpQUPIKObKqLgnTBMzq46Eecgl
         WdjigyVQkzhelj6IPHr/YQ2NgcMkF5YRz2tZHRG1RHhbrNX6Uq3KDzQax8EB6zAMGeyK
         ORT4F9AOcms+fob+r7fTNNoDFfiEv0QIf+dDqAtFmPxoeBm62m6yBwsoTkeTQqZ/IOvd
         HVZkLlm0XnJmUsn858v9Lrn7v6hJx7UDHz7aW70RIT47nUCtsiFYKCl927gn5nhMVPiT
         +Stg==
X-Gm-Message-State: ACrzQf1JqCi+svE5PhPXrA3ohuflIjkvXZf2ddbiUY2jOrAF1wCZPkFm
	ovLcjprxwXRQ6Sf9+aleLt8=
X-Google-Smtp-Source: AMsMyM6Kdb3U8Sua5e/k8W7PleyvXrI55p8LwSSe3xrXFb0we5Sb/RXS9n/go/MwJdScEdzHmWHouw==
X-Received: by 2002:a05:6402:e87:b0:456:c93c:5361 with SMTP id h7-20020a0564020e8700b00456c93c5361mr20203693eda.88.1666415786147;
        Fri, 21 Oct 2022 22:16:26 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a47:f906:12eb:e934:9c2e? (p200300c78f3e6a47f90612ebe9349c2e.dip0.t-ipconnect.de. [2003:c7:8f3e:6a47:f906:12eb:e934:9c2e])
        by smtp.gmail.com with ESMTPSA id z12-20020a17090655cc00b0078d3e54aca1sm12327092ejp.75.2022.10.21.22.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 22:16:25 -0700 (PDT)
Message-ID: <ee426ce3-b336-1b9d-32a1-55e184028f8a@gmail.com>
Date: Sat, 22 Oct 2022 07:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Staging: rtl8192e: fixed multiple coding style issues
Content-Language: en-US
To: Aaron Lawrence <t4rmin@zohomail.com>, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
References: <be839b05d799ff8e62fc2f79e6f0aaec81a8cd19.camel@zohomail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <be839b05d799ff8e62fc2f79e6f0aaec81a8cd19.camel@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/22 07:05, Aaron Lawrence wrote:

Hi,

please do not attach patches to the email. Make the email the patch.

Have a look at the examples:
https://lore.kernel.org/linux-staging/

 > Subject: [PATCH] Staging: rtl8192e: fixed multiple coding style issues
 >
 > Fixed multiple coding style issues on multiple files
 > according to the checkpatchscript.

Please do one type of a change at a time and not multiple changes. Look 
for examples in the above link or in the kernel.
Thanks

Bye Philipp


