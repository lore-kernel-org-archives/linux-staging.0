Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7239259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 21:09:56 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id ay2so3972339plb.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IWVLq4cGetylmYeeCZo39PJuYByM8tFivG4dPSxGTKE=;
        b=VDI1CPOgECenibvItdnb1mxjiv9HsuQPF7RJ6a8Fvkj46Ud3O9wVXJaHiGN7pJAHfb
         zrIPl0YqF85Xo4OJdQEM3RI/+IMHlSyLlpKu7HiORc9jATk1TsqaPrNrT6GCO7IkA8Ie
         J4aYwyqhaK9ztY+k3J35iyfizTJLYQJCettOhK3jOTmBlyYlvRPIfEXBVdnP/4YClsbQ
         PLVklhuYJpfgc/sYlrZq3sm5z6XEUlgo2WDwfcX169H/J9lnfGYvIVaJJSsFiFEODldU
         iYoMNwjZO6WwtaZjVRpkdTP7FyTzvLc4YdIxlHzPfb5+iQ78UPmf4I4bMkrwjEFo92C+
         zQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IWVLq4cGetylmYeeCZo39PJuYByM8tFivG4dPSxGTKE=;
        b=T3WSqsHpDNpSfqpDtz6MQEqaX2Id/6+kGnMz4+eDpzZSNBHVS8gyFBX1tYXgBcBpe5
         Fn5LeWqjUFrrVuQURS2nXdb014rabNok2DjqX/RljQ41qb+Naqk/870JUBSHxtbxICO5
         /tz4oICTdp8Sp4dNnxcxYMEZvc9pSoWDd63apLexMDuJvRyuHOvymWukQtUF96NIg8ZQ
         JbtPF56zzJpH8jUJehli4YkH8NozKxZDOMCcYPPBdRq1GdZ6aflZGD60Q+mVSFpb1sNy
         Nxqg5BsA3g6j9oXgwmFC7hSSVBCAMywDhHNBZqb8s6GVbKckw9zsIYUmz4tF094z5e9t
         C1Rg==
X-Gm-Message-State: AOAM53038icK2yUglP5znnCF9rUdah30NmPpGVNNznyyQXy7aP8LXeum
	cWPray5r8v0FEllWVbINhtw=
X-Google-Smtp-Source: ABdhPJxhE5EJ9rfWUx1ZpiMrI8xHdQd5ciCxdftyndGRFA/YTc6IS/33qX3EY71OOLDKk8fNGobvwA==
X-Received: by 2002:a17:90b:4b92:: with SMTP id lr18mr20181032pjb.86.1617484196282;
        Sat, 03 Apr 2021 14:09:56 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id j3sm11628447pfi.74.2021.04.03.14.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 14:09:55 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	insafonov@gmail.com,
	martin@kaiser.cx,
	simon.fodin@gmail.com,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] staging: rtl8188eu: core: add comma within a comment
Date: Sat,  3 Apr 2021 14:09:30 -0700
Message-Id: <20210403210930.17781-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add a comma to separate repeated words in a comment. The comma preserves
the meaning of the comment while also stopping the checkpatch warning:
WARNING: Possible repeated word: 'very'.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index ed81cbc5e191..99e44b2c6f36 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -1243,7 +1243,7 @@ s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
  * If we turn on USE_RXTHREAD, then, no need for critical section.
  * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
  *
- * Must be very very cautious...
+ * Must be very, very cautious...
  *
  */
 
-- 
2.17.1

