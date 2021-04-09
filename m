Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473006D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:01:48 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id r9so7740027ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1P+0nxbW6EE4uDKQ1rz3C7vt8pTf6WjPfY7LnFMvz7A=;
        b=PrSzaPaj/Aqr8e/n9/jDScxkeJze/483xW+Bhsci82xl3hkqLS2guyBKL/GODSl5Y9
         NVLoJig+vwk0SpWPGGSugImfaO4jadiIRFUL+SbV2B/vu3j+YQb87TYaI6NrCT/SSpeL
         EP0RgiczOOtzOb/WiqUijZYhZT9AVvB1LQKBFYU7KvX7jAuIbIj7tvjQBXv1rx7yBkMT
         el6SWmRGlFs/xPRcK09JWsnTxTwBjbCoWirLGb3z0bvV81VnNScHTNL9UwQj3Ok4tFmB
         /5//kU6e07KZFW5xYQygkJZ+Mw6RWK0uqF2n2FDNtEOsyfObffqUAyShopTc3D1rwVJP
         3C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1P+0nxbW6EE4uDKQ1rz3C7vt8pTf6WjPfY7LnFMvz7A=;
        b=oB7NY9qe6dJQ1XZd8vYFRVnsd+JQPS1alAnW3xo+0sjpcXnLKPI8v9Ob0mwcCDd5zc
         sFrwL+cQMSwLRsUf6g5V9FYuB70wYVHDIBbW9lRHGd0ZlYjlyS8GZPzElJDLuJgen1SY
         3BLWYj3IzN9odc0ApgBkrBJt59f06lFL0rY4CNBg7GkFkpp/P21J6OZv9roFqebUurI3
         o5WW1RwOvfNZCgGF/vEoMHkTJwAKlXLWdocijf+y/QElhiM8RMjIAr1npYzDEd7qsRK/
         S/ksiOj27YvVHn3EiDc/l35GwQbLvVYLa8vRcOXBVneqrI2/xm3Lj8vuI/XJRqgWcQjS
         GraQ==
X-Gm-Message-State: AOAM533g9UT0h3HICuclGDOi81y0MMMU8G0PfMpXIWuc7VioxTv6B5bX
	UaLvNBO3St0INHGKlR5r/hs=
X-Google-Smtp-Source: ABdhPJz2jzcpJzXKElStEks8CQzOE6a2KB2Kx6fRATGpv+j33o3ops6DgY/gHBzdeK2Rw+MIrGeJBA==
X-Received: by 2002:a17:906:d15a:: with SMTP id br26mr15428852ejb.328.1617962506839;
        Fri, 09 Apr 2021 03:01:46 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id h24sm984461ejl.9.2021.04.09.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:01:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 00/11] staging: rtl8723bs: remove unused variables
Date: Fri,  9 Apr 2021 12:01:28 +0200
Message-Id: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset fixes some issues warned from kernel test robot in reply
to the following patch:

https://lore.kernel.org/linux-staging/56055b20bc064d7ac1e8f14bd1ed42aba6b02c36.1617802415.git.fabioaiuto83@gmail.com/

This is kernel robot output:

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_cmd.c: In function 'rtw_cmd_thread':
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:390:16: warning: variable 'cmd_start_time' set but not used [-Wunused-but-set-variable]
     390 |  unsigned long cmd_start_time;
         |                ^~~~~~~~~~~~~~
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:33,
                    from drivers/staging/rtl8723bs/core/rtw_cmd.c:9:
   At top level:
   drivers/staging/rtl8723bs/include/rtw_security.h:336:28: warning: 'K' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned long K[64] = {
         |                            ^
--
   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c: In function 'rtw_wx_set_mlme':
   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:1136:6: warning: variable 'reason' set but not used [-Wunused-but-set-variable]
    1136 |  u16 reason;
         |      ^~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c: In function 'rtw_dbg_port':
>> drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2575:33: warning: variable 'preorder_ctrl' set but not used
+[-Wunused-but-set-variable]
    2575 |       struct recv_reorder_ctrl *preorder_ctrl;
         |                                 ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2601:33: warning: variable 'preorder_ctrl' set but not used
+[-Wunused-but-set-variable]
    2601 |       struct recv_reorder_ctrl *preorder_ctrl;
         |                                 ^~~~~~~~~~~~~
   At top level:
   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:36:27: warning: 'iw_operation_mode' defined but not used [-Wunused-const-variable=]
      36 | static const char * const iw_operation_mode[] = {
         |                           ^~~~~~~~~~~~~~~~~
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:33,
                    from drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:10:
   drivers/staging/rtl8723bs/include/rtw_security.h:336:28: warning: 'K' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned long K[64] = {
         |                            ^

First and fourth patch remove these two issues introduced by the patch above.

Other patches fix other local issues described in kernel test robot output
and other local 'make W=1' compiler warnings.

Unnecessary code blocks are removed as well.

Fabio Aiuto (11):
  staging: rtl8723bs: remove unused variable in core/rtw_cmd.c
  staging: rtl8723bs: remove unused variable and empty for cycles left
    unused in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove unused code block in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove unused variables and code block left unused
    in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove set but unused psta variable in
    rtw_dbg_port() in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove unused variable pstapriv in rtw_dbg_port()
    in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove unused cur_network variable in
    rtw_dbg_port() in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove unused pmlmepriv variable in rtw_dbg_port()
    in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove unused variable declaration in
    include/rtw_security.h
  staging: rtl8723bs: remove unused variable in os_dep/ioctl_linux.c
  staging: rtl8723bs: remove decl of unused static const variable in
    os_dep/ioctl_linux.c

 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  3 --
 .../staging/rtl8723bs/include/rtw_security.h  | 18 --------
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 46 -------------------
 3 files changed, 67 deletions(-)

-- 
2.20.1

