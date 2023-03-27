Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158579CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:02:30 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r11so41577188edd.5
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679950949; x=1682542949;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VplZUCE/F+ZasISe1VnumDQIHXY4z8OCN0riUDX9NXo=;
        b=NR+8vW0rMBEOyRvzlwqszktNTwI919fiPJfbppGSDeUL3/V7ybiQTJWQgN1N+NUb7H
         5y+Au3GmD2Fr+8IY79MXBt8a0FfhzbWDfKAnK2GMwj2Mbq5cdpMu7pRmjg+cB8JCqAFA
         NJXo7pGPMdu0mhj3d+SsoybmDLl2pNWoY8zPacrj3UULF+fqF9ZublArIJsBEjXTnwDx
         DS33E4jErwKIPXOg2fWzuppNxWEmqCXqwRjdxF5JZeSnzH7/VW/odevWAe8w6GGbTUn0
         XFs6yGgIbeoDJ2AhBL6ggg2gGpV3hffBU7LOoK7jO16PcPOydWw+pgvMv0zcU+wVW9zY
         +LJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679950949; x=1682542949;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VplZUCE/F+ZasISe1VnumDQIHXY4z8OCN0riUDX9NXo=;
        b=K/dlvt88u3EuyHz8b1GVB4Jjq1eoXGopC56GkG1rJhqDWbhJ1DG+6FZlSq9wdGg5i0
         b4iM9qt46+m84YvgJKM5HPHgKC/JHZUZgLZRuZgnAJ0dDSpWgnyvjSaLP/UgTnU0BeSw
         r0XZAguF3aXsiwpjvILKEon9aj0NNH1yGWjq1IzNL3sgwsFI97vrgUZB3yPju/FW2BQy
         gzBXQ2peq3j8YgOynSjBUgtFANf161yaBda4hkOAL99OlpwmMW6G+VG5PmOK7b5xa3NV
         lMHJcev/4YVleg+vlu9CKaFr6yP/++rVAP0I3QIHUs6Uz7kU0Z7Jo3euPhe5QY05QQNB
         67yw==
X-Gm-Message-State: AAQBX9e8EGC6qtijQg8sZQlR/LmaN15f8AfTBAQGZkDkVH7uCStZ12+t
	TQXjHvn4tY3dP4dk4W3/ktV9tkBX2TQ=
X-Google-Smtp-Source: AKy350ZV1SG1a821aOVmRUPrdv2s4yPb3AMK0fs99e8CQ0HQQIr4r0nrMyko4ChjytsuACkAAw1vGA==
X-Received: by 2002:a17:906:214:b0:933:23c4:820b with SMTP id 20-20020a170906021400b0093323c4820bmr11951323ejd.4.1679950948706;
        Mon, 27 Mar 2023 14:02:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906520400b0093a35f65a30sm9262830ejm.41.2023.03.27.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:02:21 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:02:08 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: rtl8192e: Remove wireless modes A and N_5G
Message-ID: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove WIRELESS_MODE_N_5G and WIRELESS_MODE_A which are not supported by
hardware to remove dead code and increase readability.

Tested with rtl8192e on wireless modes: B, G, N_24G
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (7):
  staging: rtl8192e: Remove rtl92e_config_phy
  staging: rtl8192e: Remove _rtl92e_get_supported_wireless_mode
  staging: rtl8192e: Remove 5G wireless_mode in rtl92e_set_wireless_mode
  staging: rtl8192e: Remove unused if clauses in
    rtl92e_set_wireless_mode
  staging: rtl8192e: Remove wireless modes A, N_5G from _rtl92e_hwconfig
  staging: rtl8192e: Remove wireless modes A, N_5G from
    rtl92e_set_channel
  staging: rtl8192e: Remove wireless mode WIRELESS_MODE_N_5G

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 19 +-------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 18 --------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 43 ++++---------------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  6 +--
 5 files changed, 12 insertions(+), 75 deletions(-)

-- 
2.39.2

