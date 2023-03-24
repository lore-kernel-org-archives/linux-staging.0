Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD72771F;
	Fri, 24 Mar 2023 23:10:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-930bc91df7bso11232366b.1;
        Fri, 24 Mar 2023 16:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679699438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIbBdv0rR71zWsoyrLAdHdQfi/mJqC2jsnQ8fjq5QOI=;
        b=PZltg+bc4W54ijsUZsOnfPqqbkur/wtkcvTpWzSkHZ6IgJyUQTTCr+3BLnmrwqcSDL
         sKhAy+3dWhyuhu1Ak7DOoi4137fMda4acW71p9P2DAcAAGlOJStBNVZB+5p4Sjk494n6
         bBWjXPfWR/cZHpt7e5H2N7YNwEtMu1ZNZhda0XQILfbKr4O25sTkwXZVEXONYRCM97Fe
         ftEwITbfOPT4Th/o+Z1kddh2UdrwW5tEPUW0q+wKl8HE4KzhywiZSJeTugy8qDI6stn6
         cO/Ra6dG3RDTHegHOfpjwmtUlMqgfnNEKWr5KyJAURM6tKX6hoxSJSizBJv2gizK4t0r
         nDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679699438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIbBdv0rR71zWsoyrLAdHdQfi/mJqC2jsnQ8fjq5QOI=;
        b=CUfuHBX0jJPQlOec/a7l5VJG5tLAvl9bH+FiCnphbKrtSpHfll0ysO9ScWi+u9dmzY
         dtm9LuA/OpPenURz9C4b2KothqY87nwHBua/iclMO+HngKTPfQGsZIAhxhNOhX6NDINp
         5Hh2QZ+IHfuuJARgNEN2qbpMIvEteRI4628gl/VoHFRhqzl24wEFSe4sxvZjyE3YDtGo
         jxWW1jIyMXMoeqmotqChKQSECUweFi3U0jmdDBvmd5cfjyAHf7CriIh1/IinSBRIzwQF
         2XuCJUNl9Pl/XEI1oaNMAIJ1mLakA4JRNYa/AR960N98C9qv9aODztkqs/SnTtvjPX4H
         tI/g==
X-Gm-Message-State: AAQBX9cUpr8zLBEE8uK1hztJ2YGEWO6Tz3Z6MZP0Gywv7r60YcRa1s2j
	SErTsWNs2sQ2Gy+5s0RLjQY=
X-Google-Smtp-Source: AKy350bfe5wYGjTF/L2mD0fFGrMsWgyqhrJ8O9a+eNW2aDX1sa04fcottuCgbUB+I4tyYrqQWykJOw==
X-Received: by 2002:a05:6402:11cf:b0:4bb:afe3:e0a with SMTP id j15-20020a05640211cf00b004bbafe30e0amr4276485edw.3.1679699438461;
        Fri, 24 Mar 2023 16:10:38 -0700 (PDT)
Received: from [192.168.0.104] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id q27-20020a50aa9b000000b004af73333d6esm11360561edc.53.2023.03.24.16.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 16:10:37 -0700 (PDT)
Message-ID: <18590515-9005-01c1-3035-50a4f3b8070f@gmail.com>
Date: Sat, 25 Mar 2023 00:10:36 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 0/4] staging: rtl8192e: code cleanup patches
Content-Language: en-US
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1679696777.git.kamrankhadijadj@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1679696777.git.kamrankhadijadj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/23 23:31, Khadija Kamran wrote:
> Fix several cleanup issues reported by checkpatch.pl in module
> staging/rtl8192e in file rtllib_rx.c
> 
> Changes in v5:
>   - Resent the correct patchset becuase mistakenly sent a wrong patchset
>     in the previous revision.
> 
> Changes in v4:
>   - Changed the subject of the cover-letter that was mistakenly edited in
>     the previous patchset.
> 
> Changes in v3:
>   - Changed the description of all patches in order to explain 'why' the
>     patches need to be merged.
> 
> Changes in v2:
>   - Resent patchset with the correct email address
> 
> Khadija Kamran (4):
>    staging: rtl8192e: remove extra blank lines
>    staging: rtl8192e: add blank lines after declarations
>    staging: rtl8192e: add spaces around binary operators
>    staging: rtl8192e: remove blank lines after '{'
> 
>   drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
>   1 file changed, 29 insertions(+), 44 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
