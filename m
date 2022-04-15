Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F8182;
	Fri, 15 Apr 2022 02:48:43 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id g11so5895002qke.1;
        Thu, 14 Apr 2022 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DuvNiOMRUwwQNAgae4RO4Yy4c00pHQf9eI9auEdw3WU=;
        b=cMwRXLbz/+KCr2KPo1BXciRxgs5UmkYQtzj2Cch1JQ1/he1OhcKzvHa7AmeyMK2GEr
         pQ14VkXnV4xb+T46aiZM+gIj3naedd4fkxSJwxHevi5kiw6rTBh/hEZQ9Jf7J+ee8Awn
         Zd4QAlmDqds78tLjDD4nnrss68DhU8CDksBhIbQb7SDvzSWqmA3Wiei623g1Ywe0I6hW
         tBGhbgEl3dQjI+sZRp6+YE6GHS3ZITCew+FIBU7gVNjbW0HIXjgGHPxOvY4wLaP2QV7J
         ZOWCJ1oSSTIJL5omAuhadPVoPkYrxZBEqIYeq9PP3RNLLr7QG94fTspiN0LtY4tiDNSd
         WfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DuvNiOMRUwwQNAgae4RO4Yy4c00pHQf9eI9auEdw3WU=;
        b=iSvg7X02HMslXK3eWHYst+VqVwU8eEiKT9yn1Knwp6hHdwYZi0y5aXJDMcooW13tEu
         8H2PMX7msarZsiHHwl8Zefg4Tm4us9gK0O9uLmpi/eC7noQ9raoNMHF4UK/IJDvWum22
         xxSIZtbrUxlIvSpV4H6WirkaWyj2GjWvKeAB03wQiURsiyuiXcw5/LJwFJg1PyeqxA4Z
         DdoIMiYGloLaCZaJwsT31G5kIcevkRHKXUpSgnkPlla/eEWOsYzZnNAtC5vyfAQFCy/b
         FtyyoVruC5f/rKWNfx/rVspd094uW64x7VYXtE6tsMKHQp1UEA1gaS8pTrrj1fMcNqzL
         43FQ==
X-Gm-Message-State: AOAM532hJ7qcpZBjz/mCbuKAB6yXPAo2LkjtwxsZx/vHuArZ6/8UmMPR
	K3GxlW/JjB+N8Yi08omKxgk=
X-Google-Smtp-Source: ABdhPJyD5NNq/9/AN7WV0PFPNsXoc2Vjsp3xcRpCH4w7V1D1Hl9Ri8Nv+u+Ins4Hy7BL8+iQEfxwrg==
X-Received: by 2002:a37:c443:0:b0:69c:8386:f2e6 with SMTP id h3-20020a37c443000000b0069c8386f2e6mr3213525qkm.436.1649990922620;
        Thu, 14 Apr 2022 19:48:42 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:1b7a:2349:50b1:5db4:a2d5:7054])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a22a700b0069c37e2c473sm1800085qkh.94.2022.04.14.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 19:48:41 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v2 0/6] staging: r8188eu: fix warnings reported by checkpatch
Date: Thu, 14 Apr 2022 22:48:31 -0400
Message-Id: <cover.1649990500.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch in the
core/rtw_mlme.c file.

changes in v2:
- changed the first patch to from removing braces around single-lined 
statements, to a patch that removes the entire if-statement (because it
was redundant). The member within that statement is not being used so 
this patch has been changed to a patch that removes this unused member.
- the log of the third patch has edited.
 
Jaehee Park (6):
  staging: r8188eu: remove unused member free_bss_buf
  staging: r8188eu: remove spaces before tabs
  staging: r8188eu: remove 'added by' author comments
  staging: r8188eu: place constants on the right side of tests
  staging: r8188eu: replace spaces with tabs
  staging: r8188eu: correct typo in comments

 drivers/staging/r8188eu/include/rtw_mlme.h |  1 -
 drivers/staging/r8188eu/core/rtw_mlme.c    | 46 +++++++++-------------
 2 files changed, 18 insertions(+), 29 deletions(-)

-- 
2.25.1

