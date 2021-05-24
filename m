Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C552F80
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 13:51:12 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id e17so10287025pfl.5
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kqGP5YDfLqC7BOTyOowLlRvP4iahKUX3sBcrSvGeSxg=;
        b=bOU5PR7ndXGJMpjlv0h/UDJTk9D3/yN9bzIkstWdC5zR/tI+6940H+q9s+JeKxGkSM
         VsoGZToq0Ieb3k+SRxc3URgs2x1WAUWMASfeFaAn1yP5i7cd5Fa8G8pd7uOZ26zAf2Au
         6GSnnLkkImEOCgCYkKzqoOH7Ow1tc89HyJNulGfhnobiS4g2CCR4MpYmKPucN2twxAPG
         AHojaTUPkLq4vFB6tneBhKj24kfJpbIjc6MDNtd8o0Cw6DFSl46tS4h8XfE4omFbfIl2
         ZhMnLSWx2TZSUKwBdskP5IN8e0m+XDZUkTVqfXNwtjABMW1LAlVd04jBvS9Qj5BgaLK2
         srNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kqGP5YDfLqC7BOTyOowLlRvP4iahKUX3sBcrSvGeSxg=;
        b=O/Y1aJdz/VZ1nBL4DBXkMoNepIJkZzjAwC1XQDLVzSvMSrUCBBfLtn3abiEif8NvMD
         1U0Ck8fBUymJNay3m7so9k6Bmc5CSCPS0VKN53OJ2OOGXVOuOuWZx2JRfVYFBlbt1dlQ
         cbfw1g85sq9UHsXxLRN4sLYnHpsrt2+n5FGk/UpLzrUZ+Rc3uMBg+CRSPuq/Tx4Xer+t
         GozqNc7/e1u4KjV1r6WU8CwL3tN439y5GHtjnYaCh1j9/fDuWDREw2V6UexO3eEnpv2W
         H/XLgN6OwTUj2XyqNj1HQkGR3irCpFUaRYbadR+ZZTosP9ZEXmLUrLq6lgEOHvYrlRn4
         9OHQ==
X-Gm-Message-State: AOAM531QiETilzM+GN14fd2J6aU0Me0W+oRmBMGjTy8LT5uSKfqwDbRc
	72PLQGSMaqZnrfqJtJDAIhE=
X-Google-Smtp-Source: ABdhPJy5xN27Q2qcI63Y5MrM5mkQQRABU75LRMVS0Ms/y9lkvrdvOhgSIAA3yenK7NO1grIKy8yG9w==
X-Received: by 2002:aa7:9a0e:0:b029:2dc:70d1:2224 with SMTP id w14-20020aa79a0e0000b02902dc70d12224mr24931034pfj.1.1621864271784;
        Mon, 24 May 2021 06:51:11 -0700 (PDT)
Received: from fedora.. ([49.36.218.98])
        by smtp.googlemail.com with ESMTPSA id z9sm8638106pji.47.2021.05.24.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 06:51:11 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com,
	fabioaiuto83@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: fix indents in rtw_wlan_util.c
Date: Mon, 24 May 2021 19:21:02 +0530
Message-Id: <20210524135105.5550-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to solve all indent related issues for the file
core/rtw_wlan_util.c.

The first two patches fix the follwing issues reported by checkpatch.pl:

WARNING: Too many leading tabs - consider code refactoring
#887: FILE: rtw_wlan_util.c:887:
+                                               if ((edca[j] >> 16) > (edca[i] >> 16))

WARNING: Too many leading tabs - consider code refactoring
#1528: FILE: rtw_wlan_util.c:1528:
+                                               if (pIE->data[5] & RT_HT_CAP_USE_92SE)

WARNING: Too many leading tabs - consider code refactoring
#1536: FILE: rtw_wlan_util.c:1536:
+                                               if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_BCUT)

WARNING: Too many leading tabs - consider code refactoring
#1539: FILE: rtw_wlan_util.c:1539:
+                                               if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_CCUT)


The last patch fixes the follwing issues reported by checkpatch.pl:

WARNING: suspect code indent for conditional statements (8, 24)
#1257: FILE: rtw_wlan_util.c:1257:
+       if (p && len > 0) {
+                       pht_cap = (struct ieee80211_ht_cap *)(p + 2);

WARNING: suspect code indent for conditional statements (8, 24)
#1260: FILE: rtw_wlan_util.c:1260:
+       } else {
+                       ht_cap_info = 0;

WARNING: suspect code indent for conditional statements (8, 24)
#1265: FILE: rtw_wlan_util.c:1265:
+       if (p && len > 0) {
+                       pht_info = (struct HT_info_element *)(p + 2);

WARNING: suspect code indent for conditional statements (8, 24)
#1268: FILE: rtw_wlan_util.c:1268:
+       } else {
+                       ht_info_infos_0 = 0;

WARNING: suspect code indent for conditional statements (8, 24)
#1271: FILE: rtw_wlan_util.c:1271:
+       if (ht_cap_info != cur_network->BcnInfo.ht_cap_info ||
[...]
+                       {

WARNING: suspect code indent for conditional statements (8, 24)
#1284: FILE: rtw_wlan_util.c:1284:
+       if (p) {
+                       bcn_channel = *(p + 2);

WARNING: suspect code indent for conditional statements (8, 24)
#1295: FILE: rtw_wlan_util.c:1295:
+       if (bcn_channel != Adapter->mlmeextpriv.cur_channel)
+                       goto _mismatch;

Shreyansh Chouhan (3):
  staging: rtl8723bs: refactor to reduce indents
  staging: rtl8723bs: remove unnecessary braces from conditionals
  staging: rtl8723bs: fix suspect indents

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 161 +++++++++---------
 1 file changed, 82 insertions(+), 79 deletions(-)

-- 
2.31.1

