Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F951870
	for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 20:14:32 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gt3so23204460ejb.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=5wderqoELsTLjghMp/IM+PXHINVRCuk3zx8LINvIKws=;
        b=XxLdjwXpYcSieF9CW8HBoOS3cQ+DgN/sIBQV0LTkPVYO+ZR3zJE6Y0iMOoBKY7W/5D
         Zin4S3yv/ej1awd6KT3sMaOZOAVK34IDl/lWip4rPIu/H2TXqNkcyQyRnxu/SIGr5rB7
         93joR9k2B5XZQ3XolrryZpIVl8MFylwqbPTKI6z+oLq9ASxybRwFOGhDAUvkqrYmrbjj
         nB8HDBUnE/sLJtZpZHnskApcE2U5Qngoe2lFbQ4zmjmiQIktA2CLOrbZ7uzD5hAQihfS
         oOUAeVJX2/1KeUbHnKo5kZXJu/T7aUts8zhuaYHSNsEpFrFx3R7aBKgxL0lrPz8fKXdq
         tMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=5wderqoELsTLjghMp/IM+PXHINVRCuk3zx8LINvIKws=;
        b=gIj7PAp68bGoIb+PwDm+KBNT6nhLTWP+sN8zz/fyKHo8ZtT+x3zERPHHHP78103/nZ
         qgfdZVaRrVJIT6YOivaM8h2BksKa5pbNvdbSY9nU+m4UtQNwS24wDD4mB+Fqmcx7dwaX
         bv/+wHdhPQZOAt9Z4uthnGlFi73jMNCvjW9Eyzy5beSul0Y/7LJmgOvToFap8HcwpxwJ
         4Cz9d+tImSy7H0V7lcu5TK/6cIrBNpvC+pHjJp7d6DQbjQ2CZSjjr7dY68JSHKMUHnzj
         lMhUV4GvyxnibhpyuJExLgzAMHCzbBkoeMTMFKK3X3pYQNiQAEHDOf8kNzbStDOqzxRq
         nYTw==
X-Gm-Message-State: ACgBeo2YciWx9LYn2wiIUifzsnUFnJUNzuza16AefeMMgt1uUugSlORX
	FNt1Vkd98GM9ZA47HIFwi3o=
X-Google-Smtp-Source: AA6agR6WLMPCX9zOhMSJKoDPqvnocG0tgnhURzf5jHERcYQZZI1RODLqHOu6dpSOa/sESEQLY2iGUw==
X-Received: by 2002:a17:907:3f9d:b0:73d:a90f:197d with SMTP id hr29-20020a1709073f9d00b0073da90f197dmr370845ejc.460.1661372071174;
        Wed, 24 Aug 2022 13:14:31 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id v6-20020a056402184600b0043d1eff72b3sm3587060edy.74.2022.08.24.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 13:14:30 -0700 (PDT)
Date: Wed, 24 Aug 2022 22:14:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8192e: Coding Syle of rtl_core.c improved
Message-ID: <cover.1661370978.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Following Checkpatch errors are improved:
- blank lines
- CamelCase of TxCheckStuckHandler and RxCheckStuckHandler
- "Unnecessary ftrace-like logging"
- CamelCase of PHY_SetRFPowerState

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (4):
  staging: rtl8192e: Remove blank lines in rtl_core.c
  staging: rtl8192e: Rename Tx... and RxCheckStuckHandler
  staging: rtl8192e: Remove Unnecessary ftrace-like logging
  staging: rtl8192e: Remove PHY_SetRFPowerState and rename StateToSet

 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |   1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 166 ++----------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |   6 +-
 3 files changed, 18 insertions(+), 155 deletions(-)

-- 
2.37.2

