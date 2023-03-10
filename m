Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50223A1
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 08:35:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id k10so17261921edk.13
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 00:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678437305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTybWXU5IAL8XI2UexysnpWqhELXal8JVfpL47ufHeU=;
        b=ZS5IRumERN7XotCqRgichugZm5NATDs6rD7+6nLJ8lTewXz8bVwp7meppGEYhQlrHu
         za0mWrnIn7xrRtTS0uSHFHcIM/7/wj8L59zQBB/fn8wK92nNYHqmf2CObRW3rPZSuMeV
         VmogdopmyeF8q9LS59zLU2+9QWI8/aKS7rSV0Dd3NH/G9Fv4kssxjXHF5FNyQMcOXiW7
         UiEujl+otrBdVgEXmp7I7n1PmGFy4EAuJ22XivJlShCLWY6kusnzQYCL12gQZU4rPWb6
         bg65G06iM31loNZdIlvTuVz3B1qxFukvtqo+ar7PHx/yp8e4K+O4PQ5hap84Pl06zSwl
         empw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTybWXU5IAL8XI2UexysnpWqhELXal8JVfpL47ufHeU=;
        b=TD4PThW1JNBwBh2LCfz9rj0GHSvVsOUdw8UMIcxF8Y24QrcdCP/CiHzn6aXR/q7xqZ
         vK6GFhhXrDu1PlgA7sjMuvY6DrSzDd6yWA+A0ycaqHx3W32bGyQ8jz5DfgfmnpqJtpNF
         R/e13JDORq52MGsWXtbn6/a5FW7XpFlWB/9FySnT02AERa+m+bwYyD56FAsVitJoDTNq
         rB4URqmQt7GyTkAu48Sb9yvQendtLmAcEXfCMgQwmwcvEJTnV8cK74u7+QLjKqWpd/Jz
         13RaeuBWDlBvRX1fPr+wm4ITdkS7LFuQvcPp+rRqZ6v9o+/OtdZ+FXcR7Aw+KgF6+0bf
         hEsg==
X-Gm-Message-State: AO0yUKViTvEJbVXJtbNxEzQNfuXfa1R24MeBDu6YFSzTaidmGH48gA0j
	Cgm9x6W+Vh/p7IEdt0ovw3k=
X-Google-Smtp-Source: AK7set+gayih3x7n+jeDpUGIM5rn3g0D4qfBqFHPLtWulfhKu1RZ/W3r5jXyorBFQ4NOoWuzG3hHug==
X-Received: by 2002:a17:907:9713:b0:8b1:a3c7:a9c9 with SMTP id jg19-20020a170907971300b008b1a3c7a9c9mr29926324ejc.70.1678437304904;
        Fri, 10 Mar 2023 00:35:04 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090619ca00b008ce5b426d77sm697888ejd.13.2023.03.10.00.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:35:04 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: remove some unused functions
Date: Fri, 10 Mar 2023 09:34:44 +0100
Message-Id: <20230310083449.23775-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some unused functions from hal/hal_com.c.

Michael Straube (5):
  staging: rtl8723bs: MapCharToHexDigit() is not used
  staging: rtl8723bs: ParseQualifiedString() is not used
  staging: rtl8723bs: isAllSpaceOrTab() is not used
  staging: rtl8723bs: linked_info_dump() is not used
  staging: rtl8723bs: rtw_get_raw_rssi_info() is not used

 drivers/staging/rtl8723bs/hal/hal_com.c     | 108 --------------------
 drivers/staging/rtl8723bs/include/hal_com.h |   9 --
 2 files changed, 117 deletions(-)

-- 
2.39.2

