Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E686117
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 13:53:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5183075a5ecso532311a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687701232; x=1690293232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0e0pXKXKCDPEsLE7K22OHRMlMkpy/gOjYbTMZCeW+Ck=;
        b=Z8jlnRFlbnUN5x4vCl6hIce6TZ6FLk058KyzBj+qLwBFAqIimQrk0QF0zVos201AqG
         k77QaJEMPyX//3ml0ikSo181j9w/Ue1T3Dn3F8Rs9W/pAmychPNLw+9WkpfsCCy4nx/1
         CxFN+qzbGQ3k9BNGHMZTCJTU9t3MAf48M06v9Mwlwo2qSGhYDVJeC5A9IOewCwTyK+Gh
         EyxtR7CzWkNwTAjrjpY2MekQsl4fZ2rz2AIMsu5Z5r8s7qP/c+kaTubGdeEJTFRpMre+
         /WTeBYehHygqAHy+dyCgkRWy2kwCfkMMMIFjNTOK18fj10l72KERmMfuGb+dSXWIZ5yr
         YnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687701232; x=1690293232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e0pXKXKCDPEsLE7K22OHRMlMkpy/gOjYbTMZCeW+Ck=;
        b=F86Z1Y0DEjB05I3SIMZVLJFu18Ffk17bq2bS4eLZLy+/egfnGznzR4cNLOzVWxEdqq
         LVug7PRzUHYz1hpVztIVwR4Pwipl5rEU8k95j4cn0RdU4L4Fk/rd0rZXgmoYyGmOs4Le
         FPHsUxwP8Hnqh4GQqTclQCRxsVIfzdzZ9oxuZKzSOX8Lr/suTkYaVcekYbuD+hzjg4LC
         Nld+wBQrb+JVOzyxM5fGSeQb8k71rtm/Vhvz+TxvkZZJUupG3qvA7xsO9iEgDsD0LNEm
         0qVsyonBzgWb/6IzgK7ZEtiLyHg3RIXvEiSYeFHh/gHXExAMvj036qo7obgotCxXMHzh
         3D9g==
X-Gm-Message-State: AC+VfDwJycaIYvWWBLP4g1tQe6KkY89gzjKSSHGhnnm8fx0uUDOTK1DL
	JZV3UnpMeyIYxjzMAt1AZFM=
X-Google-Smtp-Source: ACHHUZ6gRGaj8CmMP5OiUdZSJOOz009LavNEvPAaZCowyc0pATarqRGnruCUsCUfxNjdFeVyiWvVIQ==
X-Received: by 2002:a05:6402:42cf:b0:516:39bf:1223 with SMTP id i15-20020a05640242cf00b0051639bf1223mr22336730edc.2.1687701231917;
        Sun, 25 Jun 2023 06:53:51 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id f23-20020a05640214d700b0051bc58b8dbcsm1783471edx.59.2023.06.25.06.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 06:53:51 -0700 (PDT)
Message-ID: <6469d93a-585a-06e8-a441-84f738f08c69@gmail.com>
Date: Sun, 25 Jun 2023 15:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
To: =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>
Cc: eperi1024@gmail.com, =?UTF-8?Q?Franziska_N=c3=a4pelt?=
 <franziska.naepelt@gmail.com>, hdegoede@redhat.com, johannes.berg@intel.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 quic_vjakkam@quicinc.com, tegongkang@gmail.com, gregkh@linuxfoundation.org
References: <F9C4E29E-C355-4B08-A2EC-2197A6EB7AFD@googlemail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <F9C4E29E-C355-4B08-A2EC-2197A6EB7AFD@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/23 15:33, Franziska Näpelt wrote:
> Thanks for your feedback :)
> Since not all the patches of my first patch series have been applied, I thought I have to submit the whole series again. Submitting a series of 5 patches, where 3 have been already applied of course fails.
> So does it mean, if 3 of 5 patches of a series have been applied and I want to submit a new version, I only submit patches for the remaining work and not all of them again?
yes
> 
> Thanks, Franziska

Hi Franziska,

please only submit the not applied patches because the others cannot be 
applied anymore.

Thanks

Bye Philipp
