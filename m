Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B852918
	for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 20:55:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-965aa9d1d19so249901666b.0
        for <linux-staging@lists.linux.dev>; Thu, 11 May 2023 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683838522; x=1686430522;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyU2yJMTTWP+TqXiAQ39h3qUzT30tuE4shvQs3raY5g=;
        b=blS8/1iEX/8TMezsdHFUshFcOmFv4OetqL6BKXdZxZDDj0uBt7/282csgzqaBBJMZC
         79JEYdwFrsUhNoHfv2VNX3dmSukMy6FLXxDpU0eHOa/hVqzUVl7+VEaVCcOpYIW3iFQ1
         LnjtVQuX9Hjfd4t7vCZ4LJhrI2ijSrcBtd3qXZlxXlFWw+t2xv7WCWd8wFKsb1Un5kMl
         zA/sgRpFXGJ04R1XAh0b6HqTWgfrFteJTva2x5TiPIUXr9Vlu5YDHVYzGIjtlWqy17p8
         5WmJkFf1mRpOOzWRxQT/o/zX59zzaLWPR5/5cUrz3m0wpiF3HjzdBq2nQOTca++lKUlL
         7JBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683838522; x=1686430522;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyU2yJMTTWP+TqXiAQ39h3qUzT30tuE4shvQs3raY5g=;
        b=VN2/RXXhPlw9Y5C4EyTgEf5UDA/ZxoBcbrJ5c2D/gPW7FBBEeq6oqVDwn17fVfEZ8v
         WmX6lsA2rDkje0sDez1fPP07qzHSVwpJmIWP5y48HkbLtP5IXdX9j8+gDJCiswLtNs6J
         01RvBqV2jce3B7QYquIVpdroFYMvBCs0kDhU0gqX/ax63jDMWkvoa9nvTi3hphRre0Dj
         CFNsxBNZHCYbnlU7RXJustRAoPZVIyYne9wCViLP0DKZRMjwh+H65/SKS+lGDXsAMRRo
         ctTpwVtb6lp079UdS8mKodmYx1Hey64MIFlKnYx873O1rKUJvCipZYa2bQpM/45pPk4J
         MpMw==
X-Gm-Message-State: AC+VfDzifJ7BxsRExVnFxWC4w402GD6qfJcTVSo3+HFVhK25HQAG5431
	Vdkp2i/uSo6Gv/OWuepohHo=
X-Google-Smtp-Source: ACHHUZ7dRy/liazszbJG1nvxuu2yJ/7t4rA/ZngmnLiUv8UzPGH7twOGifXyyj9jb9ELW4g9nf5RJA==
X-Received: by 2002:a17:906:72cd:b0:965:9db5:3824 with SMTP id m13-20020a17090672cd00b009659db53824mr18151141ejl.6.1683838522092;
        Thu, 11 May 2023 13:55:22 -0700 (PDT)
Received: from [192.168.0.103] (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id jl21-20020a17090775d500b00965b5540ad7sm4562442ejc.17.2023.05.11.13.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 13:55:21 -0700 (PDT)
Message-ID: <ecdd4474-d570-e0b9-f30f-278d2ce36f1e@gmail.com>
Date: Thu, 11 May 2023 22:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] staging: rtl8192e: Trivial code cleanup patches
Content-Language: en-US
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1683730854.git.yogi.kernel@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1683730854.git.yogi.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/23 17:08, Yogesh Hegde wrote:
> Rename variables in function _rtl92e_dm_tx_power_tracking_cb_thermal
> and Refactor variable assignment to avoid checkpatch complains.
> The patches are required to be applied in sequence.
> 
> Yogesh Hegde (4):
>    staging: rtl8192e: Rename tmpRegA and TempCCk
>    staging: rtl8192e: Rename tmpOFDMindex and tmpCCKindex
>    staging: rtl8192e: Rename tmpCCK20Mindex and tmpCCK40Mindex
>    staging: rtl8192e: Refactor tmp_ofdm_index variable assignment
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 68 +++++++++++-----------
>   1 file changed, 34 insertions(+), 34 deletions(-)
>


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
