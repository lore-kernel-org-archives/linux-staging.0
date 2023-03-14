Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77D180;
	Tue, 14 Mar 2023 00:08:02 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id j11so55510090edq.4;
        Mon, 13 Mar 2023 17:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678752481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2ukH6WAZ8EttWg0OswBTEdX1j9zDdqS5u5M40aGmp0=;
        b=Cs9Of024cqf9TlHnAmq+MlNmaZdAuCMQBfmvSXd/aDPKlzbAsdx3WuTfnmLa3rthFl
         Jc8kCmzE7+8jXd7qYo1BzlM3P1gBRWaR6+Rvomc9EbpgoP1xFENtPOhVgqS7GOTYwPyt
         RGRd1KskLclkuwnU/YQ5DoyAUTujpwinNMMlX5lJz21OJasErqh5Dq/s9ctc4bQhOvtu
         nWax6M/MXri3etbTS5QvpL5f67NHi98nunD0c8+QNbSd3Xa6jUPZql7EqEs9SfF/pUUq
         Ic8/Ovn/SfCrHWP1ZihszXcF+omWxJgjKDJ+wGEXWNhEH2DyXUxHyYhQHjwUNBmNp2TX
         flDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678752481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ukH6WAZ8EttWg0OswBTEdX1j9zDdqS5u5M40aGmp0=;
        b=1ThfjvzTTf4ZI25LAbqFhJ1Jyy5IWeml5gGsGunPzBD70tvcC0LgDpxM5hQhl4Yusw
         RE8C5kmCwB3K3h2J785lD8YS1wBhBkDHrRadx4MvGbKeutapPCgeQoPz2kQsGfmioPE7
         nf/zL8dhEzGMIPuF/+6bms5FgU9JB5wQpclStRBc6E0Rrhjtl2R6ZuUP6ezAeXVbmpK6
         YEZLMbYbWQG8gu7Rg0UNijesM5hjfmAJq0e1F52euv/vpK/deUQKAUeCQ0HZrIiFOPN7
         pTl7uRIVbtqvJmMGIVj7JnRAfQmFDwWD2zUkz+YzRk0QILjDyBgmv6r8wK0qEWwDshuv
         n6Hg==
X-Gm-Message-State: AO0yUKUCfQWryrlPC+/EhlzmaBqvodS652F35JHA45pSYuzVnTnfAv9Z
	i7br8ClXxmT0tv+wQY7F56GKzFJMgrs=
X-Google-Smtp-Source: AK7set9CotDXNOtvrT9WBiu6WzHL5SzfydYWqI8zVpwQyv4iOdBiMbKAW0gqEe9Ltdx9LQpoG1aHAA==
X-Received: by 2002:a17:906:739e:b0:91d:9b07:94c3 with SMTP id f30-20020a170906739e00b0091d9b0794c3mr10493385ejl.0.1678752480654;
        Mon, 13 Mar 2023 17:08:00 -0700 (PDT)
Received: from [192.168.0.104] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id cb17-20020a170906a45100b008deba75e89csm369673ejb.66.2023.03.13.17.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 17:08:00 -0700 (PDT)
Message-ID: <64f9d3ca-268e-71ae-4a6d-b71315a8406e@gmail.com>
Date: Tue, 14 Mar 2023 01:07:59 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
To: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
 sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/23 21:43, Kloudifold wrote:
> The sm750 driver had some functions named in CamelCase,
> which violates the kernel's naming convention.
> In this patch, I rename these functions to snake case,
> which is the expected style.

Hi,
please make the Subject more unique. Many patches could have this name.
Look for examples in:
https://lore.kernel.org/linux-staging/

Please use your full name consisting of a given name and a family name 
in front of your email. Or is this not possible and "Kloudifold" is both?

> This v2 patch was prompted by an error reported by the
> Linux test robot, which detected the compile error.
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> 
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>

The explanation what has changed needs to be below the ---
but your Signed-off-by: is not allowed to be below this ---
Look for examples of v2 in:
https://lore.kernel.org/linux-staging/

Thanks

Bye Philipp
