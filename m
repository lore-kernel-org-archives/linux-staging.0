Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0B4684
	for <linux-staging@lists.linux.dev>; Tue,  6 Sep 2022 12:48:29 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m1so14986849edb.7
        for <linux-staging@lists.linux.dev>; Tue, 06 Sep 2022 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sKN+MCCCY1y8F4okwhE51v1IBBv5B5BbAT3q9rc+SkQ=;
        b=pyCYVZ710UBEF04F8p5lnRQ28IKLTdGpoGJrHiZyAleJjH6xfHdT+49W9177nIItH8
         STRQMS7kABB5jsckybxJeiyg0IFBnGbudqcq/U9xSHaXw60+UkWchDR/DlUd27+lXMuy
         XofK/XQUIf4UxWB96iM+Z2a5Avd9dRo7KHYYBuWrMYzhf0GESim40a55BAYTy3IMhr2k
         9pgK9M/VTp8KBxebM7XktbOAno88Heq73kqpBFM3bq6cn7n1DbqQu8jiJ+3XVbeXyS+F
         nDV2TdKb5c7xVdQ9p9vjit3M0reKaJbTgt88G7lkuOXCCI5p5rFKq9eOm6C6Kdby65PV
         Z4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sKN+MCCCY1y8F4okwhE51v1IBBv5B5BbAT3q9rc+SkQ=;
        b=7BE++VenBxrFv45q1ZmOESYbzrbvjxCz7ZYyD+bKLKL/g1yMHNgE7uKWnrm4cHcX2J
         5lxhOAHdU/WvM109iacgfOjhWdO4szkApMdwMpYoF8fsVbuB00oMQPQ6wR05qeKxW5yK
         EyYH5H/uVGN3KfK8iYjEdYgvAyiQY9p+J11dTRLP24W/OCQnTd33v1YQVTnc0T2c400o
         Uwsv1WxvL+JTIKWpy6c0BwE7S/6rh6wHc7qm2rQboSyqqd40f+xLyOl287HyM/rd4iQw
         JKsXOcsD5H9tMY6eKdmJIvCF06tCOb82PWkj34ZpPnqtuG5bVdXR7nIf87MeWBKpLUxR
         4gSg==
X-Gm-Message-State: ACgBeo2oRzEmjd7tlbc6EylzAk7QNiTxTxp8FjcPPeyCH68rM2JUp++/
	Ttb6NzBgGVL5gbKnz2093O0=
X-Google-Smtp-Source: AA6agR4ClGHjCw6fkSXvNPQMdz8/3T1qsN9eoPMUwjCiz8tmBBzk/hsY5jxTgMhC/5BIF5QQYjte1A==
X-Received: by 2002:aa7:c90e:0:b0:44e:b410:b1d5 with SMTP id b14-20020aa7c90e000000b0044eb410b1d5mr5028627edt.359.1662468507431;
        Tue, 06 Sep 2022 05:48:27 -0700 (PDT)
Received: from [192.168.0.151] (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906b00600b007306a4bc9b4sm6580001ejy.38.2022.09.06.05.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 05:48:26 -0700 (PDT)
Message-ID: <3ddb38b0-4526-05ba-0b8c-4acd21824e35@gmail.com>
Date: Tue, 6 Sep 2022 14:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] staging: r8188eu: remove channel parameters from
 rtw_sitesurvey_cmd
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220905195612.81945-1-martin@kaiser.cx>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220905195612.81945-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/22 21:56, Martin Kaiser wrote:
> The rtw_sitesurvey_cmd function may receive an array of channels in the
> ch and ch_num parameters. All of the callers set ch = NULL and ch_num = 0.
> 
> Remove the two parameters from rtw_sitesurvey_cmd and the code to process
> them.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---

Looks good and works on my system.

Tested-by: Michael Straube <straube.linux@gmail.com>
