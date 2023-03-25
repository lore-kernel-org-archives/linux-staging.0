Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BE3C27
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 19:05:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d17so4827824wrb.11
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679771138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVG1/vTeUPSv0lVRqc/slNoTE0wnNu/kVSAojkvVCso=;
        b=n5CMAAmNFnxhBVPxChS/6p5Xk9rlp/lQAqdjDsqoI1LS0BfevW5kxRRo/gDmsyPxr8
         V+atEXwHAKb3t/D0SKVghwelhUXwz0ZV4pToYDXLof5STCSM8X1Kk2tpy561F+/i5zOr
         eD36tMtaTU1LNqo/if9tNxQSQ0pyETTmlMJ4mTe5MqXZUdqsbag9R3Pu5q3/mKW6+XBm
         cCzPE9gvHUk7dqAdlSIAHwey2CC9yTkHotopqOc8cf43xZrndwDGskupJN4Juo8/lkT9
         Z7taFvKqESFKMafZSAATqWRaSLWrma38AgV72RHyeRmmNC5axgT34Fc63Uk2eNBDLQYu
         vQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679771138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVG1/vTeUPSv0lVRqc/slNoTE0wnNu/kVSAojkvVCso=;
        b=H+nwz5T8Ae2bpd1wEFHU5h3HOPpoAOWFc0enEgyHXl6MylOMPi5ZD7VyjFLI22/bTu
         RjWEKSyf07j2z8qYaHDQG75BGI9S70jqqgVuyXnIecYeYSOBiUH/bqn4nqTenLJEx6W5
         MzgenWAeobFDDguGNNdzQcLgE2xXJ17avfr0ABQYFIY67/Lw6hRMvnHgz3CXJNyK8dH8
         lpvjScx4FpBgnxs3C2p3jNAOPW2jX5m9t4KB1llpPyFQhaZbuzS32RZ5zfDA61TLHTcq
         gFiy1pfbHld/m3Y8G9YgBpCWmNPr/5DcVPPyqWA6v3MfZ67DCPqHhyV52PQMrny6EcXq
         95xA==
X-Gm-Message-State: AAQBX9cPxmFRtBCSo5skFbZmOyLlp0KTTEGN/+73KCuBrGDnHgR5IUEu
	0CSYJuu0yhpQCXdraxkMDIk=
X-Google-Smtp-Source: AKy350aNp6hJbEUjWrapJV7T2v1a06DH3rhtArXO2rI85tSpZZK3Ric7a9iwL49VouIFnwXoowLxDQ==
X-Received: by 2002:adf:e552:0:b0:2d3:1c7d:a3a3 with SMTP id z18-20020adfe552000000b002d31c7da3a3mr4294560wrm.7.1679771138530;
        Sat, 25 Mar 2023 12:05:38 -0700 (PDT)
Received: from [192.168.0.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id h6-20020adfe986000000b002d09cba6beasm21357336wrm.72.2023.03.25.12.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 12:05:37 -0700 (PDT)
Message-ID: <f9ea8f1b-1b16-c780-a08e-476437331b2c@gmail.com>
Date: Sat, 25 Mar 2023 20:05:36 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] staging: rtl8192e: remove rf_type from r8192_priv
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230325132823.22872-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230325132823.22872-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/23 14:28, Michael Straube wrote:
> This series removes the rf_type field from the r8192_priv structure.
> RF type is always RF_1T2R, so we do not need to store it in an extra
> variable.
> 
> I don't have any hardware to test this, so compile-tested only.
> 
> Michael Straube (4):
>    staging: rtl8192e: remove RTL819X_DEFAULT_RF_TYPE
>    staging: rtl8192e: remove redundant setting of rf_type
>    staging: rtl8192e: priv->rf_type is always RF_1T2R
>    staging: rtl8192e: remove rf_type from struct r8192_priv
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 19 +++-----------
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  7 ++----
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  3 ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 25 +++++++------------
>   4 files changed, 15 insertions(+), 39 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
