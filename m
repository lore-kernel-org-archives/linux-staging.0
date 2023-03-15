Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B27E;
	Wed, 15 Mar 2023 03:08:32 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso320158pjb.3;
        Tue, 14 Mar 2023 20:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678849712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGdr/E0FzAuLt5/y1L44Qzrzo3DseJLo/0lbocJS4d0=;
        b=lUU+a1nb4qPlGxHNNl5mWOoqEE/TMs4d5haeafClSauEE3ogFGBxpEzy61TXLtFUIT
         xnaHJWlgKw0QEFRL9MegHUP15Unh26RAvWQsqTyzHzSgupq79zoeBXIrestY+hmDoV6N
         2fD9GySpetzio8aUJAiefcLxLoR98llFA/wE0mwR9NrgE1i/K1D5/IS/PMh5hbxgvDAA
         yt0UEI2oy++/NCneEsg5bvsXfU5YniScOH4KeVerGKpAjA9HnCUT0wCoqcXxoR8bluc9
         A9Sf7CVSux4k1Lunv2FYqwbWMNO7Z1OiPBtfqkkFm1UabFoZ1c/uYrNsMUn7lVQSuX+/
         IC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGdr/E0FzAuLt5/y1L44Qzrzo3DseJLo/0lbocJS4d0=;
        b=ImBKIsYFs/FXsJ/ayUaVDK6/Dznqyf/YII/+GRiiesP+4znTlo/T35oKgw5/4gKsb1
         cLox76dKvwx2eMPE2/HibI7BYrcFYSrYZV9MWWzaovrq1fovcabBChtkuVuZu05cLShB
         I1FjO1iVqZgk2sxQdqfaY85YB6jQQBxYr7pjF5Eix7556YEQPFmwC1jch1MeLzuJQpq9
         Hp6iqSQPq/rwEI6jVv6Myo01CDxLHWbE8Us9M2aMN9h5T5kfgOIZuZuhlXF8u1d13Sgw
         gGdX3HLXfGyNAIEPmD3SvqpG54S8EZc8aKWPZ2CSdpvBFKl+B9oh9Hv1nq9V4A4p1Bkm
         NO+A==
X-Gm-Message-State: AO0yUKUXfmIXuAhFNHNMMRKUK9IxOPD67kHk2Wpj6X9oZJIXsv46sC50
	wx2dLNPLyxq7bjZR9L0XfyM=
X-Google-Smtp-Source: AK7set9EAQBxtnXIxdV5KDYNlpbU34hJfwqcNMvp3CNiDs4ZMK3xnx8EESF6RVJN+80hQpSZ3q3DEA==
X-Received: by 2002:a17:903:1112:b0:1a0:4b23:84a with SMTP id n18-20020a170903111200b001a04b23084amr1347869plh.46.1678849712255;
        Tue, 14 Mar 2023 20:08:32 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-17.three.co.id. [180.214.232.17])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709027e0700b0019a7bb18f98sm2439582plm.48.2023.03.14.20.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 20:08:31 -0700 (PDT)
Message-ID: <5fd67671-8e21-ffa8-8571-d8b5533b4758@gmail.com>
Date: Wed, 15 Mar 2023 10:08:27 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Content-Language: en-US
To: Alison Schofield <alison.schofield@intel.com>
Cc: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
 sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld> <ZA/+JlgWfdg2wH8B@debian.me>
 <ZBCS7DR9dZH1yds8@aschofie-mobl2>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZBCS7DR9dZH1yds8@aschofie-mobl2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/23 22:29, Alison Schofield wrote:
>> Fixes: <commit that introduces these camelcase function>
>> ```
> 
> Why are you asking for a Fixes tag on this? 
> Seems unusual for a staging driver cleanup.
> 

I thought this style cleanup also warrants Fixes: since
it fixes coding style problem on existing code (see
Documentation/process/submitting-patches.rst).

-- 
An old man doll... just what I always wanted! - Clara

