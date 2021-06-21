Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D171
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:30:45 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t9so13326357pgn.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 23:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=egG/8H8k1FIQW1eeP8u9B+Da2dJJKlM4jubC6uROXf4=;
        b=Q268DNz62F71wMS4Cplm3HgJH77oJpCtCLVEFdjsVgw8Q1RRrPvRZd+OS7BVG5+eMZ
         qs9vnqGHq//kDH1NJYIeEzCdJrWiC2ZV8Osvw/M7BWqGL3sfWPJtk5nMKDwsTbfOF5E6
         3/DiehMMFA0YSuyjzUp2JnfB+eeTj/6kzqTcs/QhfYjpUet583JRckUysgMrqb139Op3
         oOf/xwirMU4zHccBlgBDKQHfABfqbp9mT43JYrflCSi1/Hp+UnGq1vrHK+fBu8pAVBOK
         d8dNnSQfExUsNd/V+xuifjTvoX9TOOwDbOnUEJk5m8HWyXyXNozYzMBzW/UCy4J9Hh4j
         v0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=egG/8H8k1FIQW1eeP8u9B+Da2dJJKlM4jubC6uROXf4=;
        b=HxZ70NlI8AZZuEMcopDk6CopfrPcvxsLyC3o9XMzCjctG8xg2diCo2ERhpQc1p5k1B
         KPNzYhY+wVHE2uN2gIZvMuZPWsuNx8nS1o/LIIgO6sJ44yubulwLD2iYi9i7yj9l1XiL
         /e9Hi4Ktvsfg5mvtfLfR87Wb2ig4BNgltrrUd4JUV4fJzWABwsTkaNysh2Jl1VLxQpmA
         8fo0HPOfmzkrhbURjMfW5XwfOo6EB78j3MhQOOOAy0OF22dCtRtr8pbjvOIqssKnMKU7
         Ap9RxKVDRp/z+xkaLwHcFUGPdOHJHoQmruVvmqewSf9CT+JyyKXkRm2je6SnZXAbEpzu
         RVSA==
X-Gm-Message-State: AOAM533pOa8Xc0zYKVqm9IFF73aKChk1Sx0WNdKBY14kIx0lSe/mKXAI
	wDV7xFh4oh6dS8zMmJP6LU7hmDikoeXEjQ==
X-Google-Smtp-Source: ABdhPJwle2Tq0PtDoSd6aweAGamJgaSsOaUr1UD99o9QXjLQP8PnWQSHjzThpZ8XFX4q2BIY9TCayg==
X-Received: by 2002:a63:d213:: with SMTP id a19mr22527683pgg.28.1624257045137;
        Sun, 20 Jun 2021 23:30:45 -0700 (PDT)
Received: from gmail.com (36-229-229-123.dynamic-ip.hinet.net. [36.229.229.123])
        by smtp.gmail.com with ESMTPSA id q4sm16025356pgg.0.2021.06.20.23.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 23:30:44 -0700 (PDT)
Date: Mon, 21 Jun 2021 14:30:41 +0800
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [fbihjmeric@gmail.com: Re:
 drivers/staging/rtl8723bs/core/rtw_security.c:95:9: warning: variable 'crc'
 set but not used]
Message-ID: <20210621063041.v4u35pxgglgwn2go@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 19, 2021 at 6:27 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/0day-ci/linux/commits/UPDATE-20210619-155350/Jhih-Ming-Huang/rtw_security-fix-cast-to-restricted-__le32/20210616-131056
> head:   ed0359e3fa64928e48021387a694f211bc840ff7
> commit: ed0359e3fa64928e48021387a694f211bc840ff7 rtw_security: fix cast to restricted __le32
> date:   3 hours ago
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/ed0359e3fa64928e48021387a694f211bc840ff7
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review UPDATE-20210619-155350/Jhih-Ming-Huang/rtw_security-fix-cast-to-restricted-__le32/20210616-131056
>         git checkout ed0359e3fa64928e48021387a694f211bc840ff7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/staging/rtl8723bs/core/rtw_security.c: In function 'rtw_wep_decrypt':
> >> drivers/staging/rtl8723bs/core/rtw_security.c:95:9: warning: variable 'crc' set but not used [-Wunused-but-set-variable]
>       95 |  __le32 crc;
>          |         ^~~
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
>    Depends on SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && HAS_DMA
>    Selected by
>    - SND_ATMEL_SOC_SSC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC
>    - SND_ATMEL_SOC_SSC_PDC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && ATMEL_SSC
>
>
> vim +/crc +95 drivers/staging/rtl8723bs/core/rtw_security.c
>
>     91
>     92  void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>     93  {
>     94          /*  exclude ICV */
>   > 95          __le32 crc;
>     96          signed int      length;
>     97          u32 keylength;
>     98          u8 *pframe, *payload, *iv, wepkey[16];
>     99          u8  keyindex;
>    100          struct  rx_pkt_attrib    *prxattrib = &(((union recv_frame *)precvframe)->u.hdr.attrib);
>    101          struct  security_priv *psecuritypriv = &padapter->securitypriv;
>    102          struct arc4_ctx *ctx = &psecuritypriv->recv_arc4_ctx;
>    103
>    104          pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
>    105
>    106          /* start to decrypt recvframe */
>    107          if ((prxattrib->encrypt == _WEP40_) || (prxattrib->encrypt == _WEP104_)) {
>    108                  iv = pframe+prxattrib->hdrlen;
>    109                  /* keyindex =(iv[3]&0x3); */
>    110                  keyindex = prxattrib->key_index;
>    111                  keylength = psecuritypriv->dot11DefKeylen[keyindex];
>    112                  memcpy(&wepkey[0], iv, 3);
>    113                  /* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
>    114                  memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
>    115                  length = ((union recv_frame *)precvframe)->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len;
>    116
>    117                  payload = pframe+prxattrib->iv_len+prxattrib->hdrlen;
>    118
>    119                  /* decrypt payload include icv */
>    120                  arc4_setkey(ctx, wepkey, 3 + keylength);
>    121                  arc4_crypt(ctx, payload, payload,  length);
>    122
>    123                  /* calculate icv and compare the icv */
>    124                  crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
>    125
>    126          }
>    127  }
>    128
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

This warning was introduced by my pull request,
but I am fixing the sparse warning and the unused variable was
declared in the previous commit.
The original author did not compare the crc and payload in
rtw_wep_decrypt, so the variable 'crc' was set but not used.

Should I fix this in my pull request?

thanks.

--jmhuang
