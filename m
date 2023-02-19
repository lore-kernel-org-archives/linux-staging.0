Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E02322E
	for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 21:15:26 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id k5so5678913edo.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 13:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hW2ocK3CJdB874yEAAEAF0LaIVuHAH0k3ElV8Y1gCXo=;
        b=UdsJ3T/NnB+R97oklibeADStpFpn/mUQS5jCqpMdkRB4WkYqp+C1s/8IR8g/n78bhC
         WfEBgxDR4CiKvAGPOX07KIHOnUdSsCG1+UajpHLS40ZBU85tIXoAL02t9Ic/FB4fe5h8
         zBR0VwJHFcIHU4S8cn4mi72IfPBvM340rHK7Z9hLmzk/2tsgIJUZqeM/COEFZUF7h2PO
         RF6kjkTKy5EgTk7imrgvgGMWhRxvHaqhMoanU1q32PGUpikA9InwOhhwn515VKCbABOw
         VLFF1HLuhuXguRYI0RYobZDPPczei+EFPZHI0loVlAa8bOLzayfL2DFJrVrWWj5/3YGI
         ULlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hW2ocK3CJdB874yEAAEAF0LaIVuHAH0k3ElV8Y1gCXo=;
        b=fi4MtejJ4iLfLE49igMRqcsEftylp6yBZNnBtneYtoFYWf1PWoB3ZevLpgxF1ayVye
         suhf4Ygt1TvVeEjIkHAy1QUjDNBysrHZYvBmOBo3X64aWuluYwmN1BwxUWM6tv6WFWQM
         dx5aNCSBf5Xt3/8rnduyDrzBnzZ/ierselIeYNtV1Np1RxeuysTKg0oJaQKzYbYDvJqQ
         kuVCh2Dqatk7Q/Zjoyr3LsPi6WQjMvI7nDeGoufg50JPRLrsAjxs4tARpxVZNCnrLFXh
         35mUIGyHSygLpyBXpEWqOxeeNhAIn9l6NqpoxuU6mraCB6bl0uddk4MJ7+Hu01bCWknA
         ZZ+w==
X-Gm-Message-State: AO0yUKVeTAKHouPDFMIgMbCwX/EnmJ5gGfvhyR4sS+TVC8Bupk5oFzAV
	tA0Y25Z0LvrjHm9hcbLpeV8=
X-Google-Smtp-Source: AK7set9/ibGxXrpLWDJkXADKUzmabiJsuLvdcPjLuH6EcUu4i1WwLKbEsE39YEekU6AkfG011Pp3Kg==
X-Received: by 2002:a05:6402:4413:b0:4ac:8e63:3008 with SMTP id y19-20020a056402441300b004ac8e633008mr1616870eda.3.1676841324987;
        Sun, 19 Feb 2023 13:15:24 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id m25-20020a509999000000b004ad7bf8be72sm4105089edb.53.2023.02.19.13.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 13:15:23 -0800 (PST)
Date: Sun, 19 Feb 2023 22:15:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove entries from struct
 rtl819x_ops start with .get_eeprom_size
Message-ID: <cover.1676840647.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary entries from rtl819x_ops and replace them with with
function names. This increases readability of the code as the reader does
not always need to look up the corresponding function name.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (11):
  staging: rtl8192e: Remove entry .get_eeprom_size from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .init_adapter_.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .initialize_ad.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .tx_fill_descr.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .tx_fill_cmd_d.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .rx_query_stat.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .stop_adapter from struct rtl819x_ops
  staging: rtl8192e: Remove entry .update_ratr_t.. from struct
    rtl819x_ops
  staging: rtl8192e: Remove entry .irq_enable from struct rtl819x_ops
  staging: rtl8192e: Remove entry .irq_disable from struct rtl819x_ops
  staging: rtl8192e: Remove entry .rx_enable from struct rtl819x_ops

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 42 +++++++------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  | 20 ---------
 3 files changed, 15 insertions(+), 49 deletions(-)

-- 
2.39.2

