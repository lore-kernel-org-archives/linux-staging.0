Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFED946A
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:42:51 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id r11so14329658edd.5
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819369;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRp0G9zV+IpJpjwrbya06k2MCshxxUQ9b9AfNFz9fbg=;
        b=PqSrTGTaCHhNpWzFEzre5RVXgxXSJ/fTDTZAutXrOiSj2pWds3GO1ZA0ux3kjM3ccQ
         ClUikDiQ/+vUNKaoHBiMJ8cUgVaWEzJPf08i/+yrXsqIdoxDrS8+HMVT6RQnGWrNDjwk
         KJQQ83/dmNBFydH+dOW+KhBnhQzOepP1saS+4+ttTK1ZKxlTkqlnpvaluBXPAIHbgp9L
         rHDsSZoHMsA0nyipaA/FTZNRYIPC6BwH8gyDIumbMJknzGZ36e/3Vn1qoR7i4lW9TvNq
         00R3gBbjk6mbhH0kIktI6x7cNj4tTRQ0N0rhOHEgRvf3YBaPaktUrmt9nO5mNQo/8Vx2
         uXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819369;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRp0G9zV+IpJpjwrbya06k2MCshxxUQ9b9AfNFz9fbg=;
        b=0vw81HtxLV1zu+NtTkOUjpkhGDntIhV9/0Fk5ojMHy2dPKnor6vcudClK4MZfZTNch
         vEkaUfGtpVocrlEudsMQ/pOnLs8lD9i/gOYYUjIdeQg+6LgMzZy6yf997AzNi6NHQHNk
         VOmolbnp8IvTTfOim3irsAX4De1X49q527PyF6AexMudWiL6jy2hLnzG4/pLulxkrKQs
         f4eH4pi1PEvosoFlpmqB/EranafZ9Kqnb5+XFe+aKHv/Hx42I5RrYPJnqs3qvY3Y/8/e
         bzghU/bmspqaMhgGzCwIpZoHd71SL837WKeLoP+c2gRusHIKqL47lyu4qLPGDky0AvTG
         OR0A==
X-Gm-Message-State: AO0yUKUuZ+X7pdLraihnPR/8TXfcCy9+JWIjmj+xyS/dWR8SSPcBY/ap
	2nMbxX5j81tXOGydV2KDovQ=
X-Google-Smtp-Source: AK7set9rAFO1c8caKsEvbn6MuLyhvNmf4LXQZHYxUwsQzyfL7MA606GRESVhYZLUXkNSDgUPwbuafg==
X-Received: by 2002:a17:906:5349:b0:8aa:f573:4ff8 with SMTP id j9-20020a170906534900b008aaf5734ff8mr15251442ejo.4.1678819369291;
        Tue, 14 Mar 2023 11:42:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id qk28-20020a170906d9dc00b008f398f25beesm1471489ejb.189.2023.03.14.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:42:48 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:42:46 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] staging: rtl8192e: Join constants in r8192E_phy.h
Message-ID: <cover.1678814935.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There are a number of constants that change the name with a similar line
like:
#define AGCTAB_ArrayLength AGCTAB_ArrayLengthPciE
This makes code reading very unconfortable as there are always two
searches required where one should do the job. Renaming the two
variables to one to increase readability.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (12):
  staging: rtl8192e: Join constants AGCTAB_ArrayLength with ..LengthPciE
  staging: rtl8192e: Join constants MACPHY_ArrayLength with ..LengthPciE
  staging: rtl8192e: Join constants RadioA_ArrayLength with ..LengthPciE
  staging: rtl8192e: Join constants RadioB_ArrayLength with ..LengthPciE
  staging: rtl8192e: Join constants MACPHY_Array_PGLength with
    ..LengthPciE
  staging: rtl8192e: Join constants PHY_REG_1T2RArray.. with
    ..LengthPciE
  staging: rtl8192e: Join constants Rtl819XMACPHY_..PG with
    Rtl8192PciE..
  staging: rtl8192e: Join constants Rtl819XMACPHY_.. with Rtl8192PciE..
  staging: rtl8192e: Join constants Rtl819XRadioA_.. with ..RadioA_..
  staging: rtl8192e: Join constants Rtl819XRadioB_.. with ..RadioB_..
  staging: rtl8192e: Join constants Rtl819XAGCTAB_.. with ..PciEAGCTAB..
  staging: rtl8192e: Join constants Rtl819XPHY_REG_.. with
    ..PciEPHY_REG_..

 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 32 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 14 --------
 drivers/staging/rtl8192e/rtl8192e/table.c     | 12 +++----
 drivers/staging/rtl8192e/rtl8192e/table.h     | 24 +++++++-------
 4 files changed, 34 insertions(+), 48 deletions(-)

-- 
2.39.2

