Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217610790
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 21:00:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id cy23so57552964edb.12
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678222845;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a29C3RqRFTjCabKMwALBA2dvqdxdfVXnv8KYiR92qGw=;
        b=CE8MsnmDuJZhDfn00ZI2O1Y5pI6jrd07thC0NYiDNwd09YYLw6WUy9x/rq++ql2bYJ
         +Osvfx7kmCkk6LBjClBfy1cqv6MfnK6epR3nF82CaceVwkvl72ECwdS+5XPjLRh1RqpR
         Aac6MSkDI/figjyG86fruA/ttZcuvuPxPq/+0GBlRy9yljY6XOtcArUkP6igomY2dRUD
         djGO3LOwdY5akn/SIdpvPq18Nf2niMLtFOwmOt5lJUWuOApoCqr2eh/WkCfyIKFpPAPV
         blp9c8qbFsMcp8OZGl+YAS5Y8CDr/pBOt4v7xAbljBgemOMsldqWGgAPiuT6RJ7DSsqL
         GW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222845;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a29C3RqRFTjCabKMwALBA2dvqdxdfVXnv8KYiR92qGw=;
        b=IM6V2wsHkm8vIIafqr6Ud+h4tG2H3F4ahUVgTyUaEw8vrhf56ZFAdAmrNJyqGB/WCC
         V1l4HFfAoGBpl1cK/tMaBZSS2Ks4sQcRCoR8aX9PHg8k+SRqrOet/buKEC9MXEx6Orl1
         sg60MxppwhbcDhjRzfCz/9jz5IlgEZep6rnTIWTCqs6exytQ5GHk9P7ENWjKEpUAKcJK
         ZUU7lx8Inu4AbtNwSB1VSjXe2ArLrvZAb7Z++5A7HemSvLVK4ScKgLAVpxDuk+Jw6vM1
         YZP9jWsRPiLXUjc9o2c9t+IN09CTZgbGg73Q585FlmPMys3sttU+sg7piP+iySGzvjDo
         hSrg==
X-Gm-Message-State: AO0yUKUFvyVUyd6dt3QTnLNVNy67DXuaxRh99xeG64Jx297TZJDEJDBL
	ispqej07k3/h+KSP675gcRE=
X-Google-Smtp-Source: AK7set/ABNHMeuJ4zdcbao1bn4CWcWZWK02gYdzoTSOsmVfK6JFc3Q2JR/ygF76r6BYwwpkgh/tSqQ==
X-Received: by 2002:a17:906:5199:b0:8ae:ea08:3842 with SMTP id y25-20020a170906519900b008aeea083842mr14272853ejk.7.1678222845063;
        Tue, 07 Mar 2023 13:00:45 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id mb3-20020a170906eb0300b008e772c97db6sm6532417ejb.128.2023.03.07.13.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:00:44 -0800 (PST)
Date: Tue, 7 Mar 2023 22:00:42 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8192e: Removing unused arrays
 ..RadioC_A.. and ..ERadioD_A..
Message-ID: <cover.1678222487.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The array Rtl8192PciERadioC_Array and ..RadioD.. is only used in function
rtl92e_config_rf_path which is only called in function rtl92e_config_rf.
In function rtl92e_config_rf a termination condition for the loop is set
to priv->num_total_rf_path = RTL819X_TOTAL_RF_PATH = 2. The loop is only
executed with numbers 0 and 1 for eRFPath. So the function 
rtl92e_config_rf_path is only called with eRFPath for 0 and 1 and never
with 2 or 3 that would make the "case RF90_PATH_C:" and 
"case RF90_PATH_D:" be called. Remove resulting dead code.
---
V1->V2: Changed argumentation in the description and subject

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

This patch series requires the patches:
"[PATCH 0/2] staging: rtl8192e: Removing rf_type RF_2T4R from driver"
"[PATCH] staging: rtl8192e: Change filename r8192E_hwimg.x to table.x"
"[PATCH] staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh"
"[PATCH] staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script"

Philipp Hortmann (2):
  staging: rtl8192e: Remove unused Array Rtl8192PciERadioC_Array
  staging: rtl8192e: Remove unused Array Rtl8192PciERadioD_Array

 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 24 -------------------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |  4 ----
 drivers/staging/rtl8192e/rtl8192e/table.c     |  6 -----
 drivers/staging/rtl8192e/rtl8192e/table.h     |  4 ----
 4 files changed, 38 deletions(-)

-- 
2.39.2

