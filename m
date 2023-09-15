Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1128330D00
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:06:42 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-404724ec0dcso4969955e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794001; x=1695398801; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dRUCqTPE6auQEVTrtndtlI84Jy0D1OtStetAdLqgP7o=;
        b=HqaKT0UEEBw6Qtc3IqASEQ3PyE1nxPgIkk8glOKKqb/rgWkQlurysZeuc+UoUvGk4V
         ZfrKwOs9Dqd840lOhfrfKVpJ8S33KzFCEYgEdd43/czrS/JzswKV3xdAICRCLlhtgeCA
         GzALRp7ifT6VGSuteVb1ZBxju4GkCxvT5YonjimUy8E/aUJzX2fHWRSGr+1WmTF4UMm0
         SHLv+h0JnKFeScEWE/quSo+mUPRAqEVmgPXmKGd0ZifpYoJS/wKAA0uoFrJOKQ0Gz8J+
         QVkvLOSwwnqhN9xcf1iksNK6Cqpf4f/JiPmRd0d+ykN/jRn0Czjdga6CbY7oOG0QaNaf
         2Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794001; x=1695398801;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRUCqTPE6auQEVTrtndtlI84Jy0D1OtStetAdLqgP7o=;
        b=pibwDGlf8oknsleL7R2fNF2UU1cB+TfRS8pUczfAwLKqRNt95rdwPgH2dqMm3j3MBx
         VPC2kvwdAEznhe/hrPh+29mBID4ME1Wv+0nZ/9FctGDYF4emFbr8AGdr8+40PwqY061p
         ottKF2UPu7NdpGxfGEyFW/67WGCd71rCragEuWtJqxpmQay5+UgJ51Blao//niTXzM2N
         elO5Nd12CWdWb08fLY+f9zRAtcICRC4POSx1DKtpryPz1PaNUjp6lECSFmakbKUCl2sB
         tKOiI1rpRVr9N+gjADpFtgKZv3XBZZAeu0LzkBxUBjy37XhVBOgc4ZnQGNLumkCOJdDz
         FiCA==
X-Gm-Message-State: AOJu0YwkBFEcvP289Ibsh2wi9rA/jmeegCWJrBwmmUbQMz3+2PUl0o4a
	bWq/urL5DH/04jO8dGh65cI=
X-Google-Smtp-Source: AGHT+IF1D5kQXidw8I5QOt1/oTEv1JnRn6u/Z4yHMvC0UGDBmEPXPH5VkrVfA8j4DH34d7Ot4foPlg==
X-Received: by 2002:a1c:7919:0:b0:401:db82:3eda with SMTP id l25-20020a1c7919000000b00401db823edamr1981061wme.1.1694794001023;
        Fri, 15 Sep 2023 09:06:41 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v15-20020adff68f000000b0031433443265sm4777995wrp.53.2023.09.15.09.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:06:40 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:06:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] staging: rtl8192e: Replace struct rtllib_hdr_3addr
Message-ID: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace struct rtllib_hdr_3addr and and similar structs.
Replace management subframe types constants with IEEE80211_* and
similar constants.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.2 MB/s)
Transferred this patch over wlan connection of rtl8192e.

---
Here some tests regarding sizes of structs and one pointername change:
printk("size rtllib_hdr_3addr: %ld\n",sizeof(struct rtllib_hdr_3addr));
printk("size ieee80211_hdr_3addr: %ld\n",sizeof(struct ieee80211_hdr_3addr));
[ 7413.371188] size rtllib_hdr_3addr: 24
[ 7413.371196] size ieee80211_hdr_3addr: 24

delba = (struct rtllib_hdr_3addr *)skb->data;
delba_ph = (struct ieee80211_hdr_3addr *)skb->data;
pDelBaParamSet = (union delba_param_set *)&delba->payload[2];
pDelBaParamSet_ph = (union delba_param_set *)&delba_ph->seq_ctrl + 2;
int ph_payload = pDelBaParamSet - pDelBaParamSet_ph;
printk("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!diff: %d\n", ph_payload);
[ 5608.787297] !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!diff: 0

printk("ieee80211_hdr %ld\n",sizeof(struct ieee80211_hdr));
printk("rtllib_hdr_4addr %ld\n",sizeof(struct rtllib_hdr_4addr));
[ 8182.169990] ieee80211_hdr 30
[ 8182.170023] rtllib_hdr_4addr 30

printk("ieee80211_pspoll %ld\n",sizeof(struct ieee80211_pspoll));
printk("rtllib_pspoll_hdr %ld\n",sizeof(struct rtllib_pspoll_hdr));
[12277.846879] ieee80211_pspoll 16
[12277.846900] rtllib_pspoll_hdr 16

Philipp Hortmann (16):
  staging: rtl8192e: Replace struct rtllib_hdr_1addr with ieee80211_hdr
  staging: rtl8192e: Replace struct rtllib_hdr_3addr in rtllib_rx.c
  staging: rtl8192e: Replace struct rtllib_hdr_3addr in rtl819x_BAProc.c
  staging: rtl8192e: Replace struct rtllib_hdr_3addr in rtllib_softmac.c
  staging: rtl8192e: Replace struct rtllib_hdr_3addr in r8192E_dev.c
  staging: rtl8192e: Replace struct rtllib_hdr_3addr in structs of
    rtllib.h
  staging: rtl8192e: Remove unused struct rtllib_hdr and two enums
  staging: rtl8192e: Replace struct rtllib_hdr_4addr in rtllib_crypt*.c
  staging: rtl8192e: Remove struct rtllib_hdr_4addr
  staging: rtl8192e: Remove struct rtllib_hdr_3addrqos
  staging: rtl8192e: Remove struct rtllib_hdr_4addrqos
  staging: rtl8192e: Remove struct rtllib_pspoll_hdr
  staging: rtl8192e: Replace management subframe types with
    IEEE80211_STYPE_*
  staging: rtl8192e: Replace control subframe types with
    IEEE80211_STYPE_*
  staging: rtl8192e: Replace usage of RTLLIB_FCTL_DSTODS with function
  staging: rtl8192e: Replace frame control constants with
    IEEE80211_FCTL_*

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  18 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |   8 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c     |  48 ++--
 drivers/staging/rtl8192e/rtllib.h             | 183 ++--------------
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c  |  17 +-
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c  |  40 ++--
 drivers/staging/rtl8192e/rtllib_rx.c          | 206 +++++++++---------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 100 ++++-----
 drivers/staging/rtl8192e/rtllib_tx.c          |  36 +--
 9 files changed, 257 insertions(+), 399 deletions(-)

-- 
2.42.0

