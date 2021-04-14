Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1971
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:18:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so462098wmf.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+1jG1dzHX+50HCkskqxQLY0J0MPw/2nqF2RozJga14=;
        b=SszNMDiKKLM3hPhNqMklgKNgNfugkPmp+JsqTi6qSlYDAhuttTmnSDnsiCXe+ILUhu
         WxrjD1DKMI7Y0FL8cDhCjJSpV5HWLZBQTKRWtLBP5mhxo1ESlxV2TkuFttdKzhIhjaa9
         T8NTuEPHfcVaUqbZNrTx8X5TIE/33/+cZPXjerJ1DPauM41oQHJgkCjJd3FTrFdf/Yxg
         jUEp3uMTASNTNtyzWRtXS6oUZvfwI/eNmXn7cjKNU4R/ygSyuzCiIg4u/iEplHlLJztT
         7bKmUUIytP/Ei8kKBfl2inF7Ybwnr0Rwz+l5x9C9lx2ngfzq0CChoc+XRFsIKdDBomuD
         FhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+1jG1dzHX+50HCkskqxQLY0J0MPw/2nqF2RozJga14=;
        b=bxFSIkZh48ARKrwVt6NkjXKgy/hvd3CTqnB0WkcPah1lpm1aA8Q+f7O4KkFNzyitjI
         96zzZ7ZnOr0p0UtKAUeovwpkygPf8wMtWAPT7jpJZTaCxZaPyND79SYC7xxgHtuxp7Yl
         Fu6aSrholdgWBjcBABUwhOpG3coEd4DVshS1sT4fAZhDZoKq3c4XLz1CRC/BCF4mrUor
         ChnN79+40OgX2wdeMHSEEdEHanSSskTnS9fUsj+vCDllemhiu35kcqIJBolei6dn8rnP
         DeoH8McgP2ua/2zELEpfk7te1DUVBnsyC+H/+UAKzoxTFnXuJRvjE5SY78HCSVsigVhU
         Oigg==
X-Gm-Message-State: AOAM532HkmTs8xzLKXJGYgED1b+DzUUMtn85C93NrU+zscQ46VCfF+sN
	tKiwvUX7F8OE/lk8g9KG1UM=
X-Google-Smtp-Source: ABdhPJyoRaJuOLJASJ0h2FyLCvm7tEZHyu5H1LCNmVY2l1pPoTnHP5TmU8EZMSwG4PLERU/jFUTLyA==
X-Received: by 2002:a1c:2541:: with SMTP id l62mr2745112wml.188.1618402732316;
        Wed, 14 Apr 2021 05:18:52 -0700 (PDT)
Received: from agape ([5.171.26.216])
        by smtp.gmail.com with ESMTPSA id m2sm4750602wmq.6.2021.04.14.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 05:18:52 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8723bs: replace DBG_871X_SEL_NL macro with netdev_dbg()
Date: Wed, 14 Apr 2021 14:18:47 +0200
Message-Id: <cover.1618401896.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset replaces DGB_871X_SEL_NL macro with the driver
recommended log function netdev_dbg().

Here are contained the patches not accepted yet in v1.

Macro DBG_871X_SEL_NL indeed executes a raw printk call as
default behaviour. The other behaviour is doing a seq_printf()
call which never occurs.

First patch apply the following coccinelle script for macro
bulk replacement:

@@
expression sel;
expression list args;
identifier padapter;
identifier func;
@@

func(..., struct adapter *padapter, ...) {
        <...
-       DBG_871X_SEL_NL(sel, args);
+       netdev_dbg(padapter->pnetdev, args);
        ...>
}

added by hand a newline in coccinelle output.

Second patch removes DBG_871X_SEL_NL macro declaration.
Third patch removes an unused function argument after
macro replacement.

-------------------------------------------------
Changes in v2:
	- Excluded patches already accepted in v1
	- Added by hand a newline after coccinelle script
	  application
	- Dropped the patch applying newline separately

Fabio Aiuto (3):
  staging: rtl8723bs: replace DBG_871X_SEL_NL with netdev_dbg()
  staging: rtl8723bs: remove DBG_871X_SEL_NL macro declaration
  staging: rtl8723bs: remove unused argument in function

 drivers/staging/rtl8723bs/core/rtw_debug.c    | 16 +++---
 drivers/staging/rtl8723bs/core/rtw_odm.c      | 52 ++++++++++---------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 31 +++++------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  9 ----
 drivers/staging/rtl8723bs/include/rtw_odm.h   |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  2 +-
 6 files changed, 50 insertions(+), 62 deletions(-)

-- 
2.20.1

