Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216F70
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:23:39 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so26512324pjs.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p5uebJso8aQthGFedEwXhZYm/bFWqeh7RO/o/YkMwHY=;
        b=avzHxCZJOL0JfsOGUYPcZsSa5wvQs59Mjbxn/7B6II7lzc0mQ5U3BJEZM5jEvqKiS3
         whnJ8WGQkhyC+XDpT3rNihRZL6ys42Io2lUOz4Lz6Z5maFgaNdJHAP/Deifu8JYmQHTN
         kXA+Icggreyddxk/NT3NzbxPQKSSB+2NtCtuoQhx/63XTzQ4tMH3crky0ZvUlyaccqnT
         LKk8JA324Yq7wVzbZoLuzPyxR1ntYK4ZFZZEOETlu2C4xvyZRDPrMIEppWh0g9hSaq3b
         uiGcRsFO0q8BtZvQxhl4j+y73Ht3fvVBFR8gSxY1H6eJEWxdPGpPfHiCjNbGbR+1aGN/
         1rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p5uebJso8aQthGFedEwXhZYm/bFWqeh7RO/o/YkMwHY=;
        b=Nl/fy3tiuyc6chriZSO5pZQSuB2P/zoJ/KP9CzxrS6Gwe/Yupcpk/1VZnsFQZrWgN+
         k6r2rnsLrYRSJhP1syY9NXUkAzEsST//qZcRfcXe47xpapp8f7vOtb7kZYthRCGSRpsj
         cWf6J/TZYjzANWPNXh5EqRCdqA+RDtylQzjFkm3nB0c0m2UpmC0Rsf/R10ybLdCvYAK4
         MkhFxTxcEw9T4oGgsWn75aFYuoD+uPR51dBQrnA5N4GIYo1MPEPZQiVGg5nGhbtd3kfn
         UPuvasS10yTqd2lFQvNv7FzEZbR0tpBNgg3JE9z9I0ljxazCr7nkzoGNiEhjtZGGIabP
         DlhA==
X-Gm-Message-State: AOAM530iNnGNjuFkTBlovXbvEEHGjf33WxsRfl1KR68IUMJkfJfp86KM
	LoJX+t2BSUO9gTNNz9n6bIw=
X-Google-Smtp-Source: ABdhPJxtvotFxKqBSqPZq6Zo7aM+j70bhRymhGZKVXb+3E7PeXfLV/tSeBO4gMWMcIDCJqa8vtUqXw==
X-Received: by 2002:a63:5c10:: with SMTP id q16mr102391pgb.128.1628331819049;
        Sat, 07 Aug 2021 03:23:39 -0700 (PDT)
Received: from user.. ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id d17sm13290717pfn.110.2021.08.07.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:23:38 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	saurav.girepunje@gmail.com,
	insafonov@gmail.com,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	will+git@drnd.me,
	dan.carpenter@oracle.com,
	apais@linux.microsoft.com,
	yashsri421@gmail.com,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Remove unused variable
Date: Sat,  7 Aug 2021 15:52:28 +0530
Message-Id: <20210807102232.6674-1-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains 4 patches to remove unused local variable
from rtl driver files.

Saurav Girepunje (4):
  staging: rtl8188eu: os_dep: Remove unused variable
  staging: rtl8188eu :os_dep :os_intfs : remove unused variable
  staging: rtl8192e: rtl8192e: rtl_core: remove unused global variable
  staging: rtl8723bs: os_dep: remove unused variable

 drivers/staging/rtl8188eu/os_dep/mon.c       | 5 ++---
 drivers/staging/rtl8188eu/os_dep/os_intfs.c  | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 8 --------
 4 files changed, 4 insertions(+), 16 deletions(-)

--
2.30.2

