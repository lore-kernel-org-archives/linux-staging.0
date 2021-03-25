Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707A6F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 09:57:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v11so1617240wro.7
        for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZS88VoX8ZZlakrWWcv16+p54kgnbozpp/01RtCA8wMQ=;
        b=Dr9wbqWxgaGT3xu69eZKsUhoP4rMuflsB4BORRHGacKySHutIurjd2gOQgbpxi/ht1
         cJcU/LsVh0UDrdAWnPZCgtr+TLb66VG/XVlvNgSKVDUmqWJ5pngDTHRh86voH5vaZ3+F
         Q4P81DCQbCXeoH01g2zf5p7KH0j5IGTLhOENXrG0sHEBy3iBJnaVh5a5pbKcAgGr6rwd
         T/qRhsnO4lszIJMhN2BVB3T9UfiJRpoD8aVZfR3BwdEZjZSIm0I0gHOzZ0ZlZhykODxR
         CjpIak7iIvcWrFndDQFy49tBmRWoNL8NNxFfUiOEDprEP/Mh6tzR5NB+PLsvKYhjmKc+
         JJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZS88VoX8ZZlakrWWcv16+p54kgnbozpp/01RtCA8wMQ=;
        b=c9HmdK9QujtO6Q8SIb71aboxfW6GNjrWQpDwMGr+/8N1fiHEWwQfDHRvhi7t6Pezji
         VJngtQ9v78PQNO3azXqbhExjJTimk0ApT8ZT5xTB93k6x/Ys4qn4QYSnDNB+n7vB+3jk
         1DqZ34ExfklFrU99NMWj/Z+7eA7jdzU8MBTiTbSQFRWhB5snsXKD16yvDrAhvKVmjkQV
         kAKtTTpo//44eEDwjuHTwv4ZTEztTS6whHRGxnrXkav90XupIOc7VTCh4+y5PqUONbVX
         xfdCa4lt8jko4q0Fx9TRsk9zAj888Wrpfv+RR514Gh2c7gi+AnHLD8MKDQJ2Eh/W6/8H
         C3tQ==
X-Gm-Message-State: AOAM531VUTYOyk8+K+UaaGzxNxK+dknV8t2DjMVCmQDofTObQ+N+LEsC
	4ZsJy0C+IxEosC7FxVZhi74=
X-Google-Smtp-Source: ABdhPJzOqMoRetThYDOZu10Es0oWF6yRvuFTRNTOAl4zuslzDGZGzdXlvhMAMfmkEj2WCJW6kFEceg==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr8332721wrt.115.1616666232709;
        Thu, 25 Mar 2021 02:57:12 -0700 (PDT)
Received: from agape ([5.171.80.127])
        by smtp.gmail.com with ESMTPSA id e17sm7101891wra.65.2021.03.25.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 02:57:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix indentation broken by previous patch
Date: Thu, 25 Mar 2021 10:56:20 +0100
Message-Id: <20210325095620.11251-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YFxQSJXXQ4dFPGS4@mwanda>
References: <YFxQSJXXQ4dFPGS4@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix indentation broken by patch removing conditional
code blocks checked by unused
CONFIG_INTERRUPT_BASED_TXBCN family defines

https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3cd9c61eec99..dc56477eb084 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -907,9 +907,9 @@ void start_bss_network(struct adapter *padapter, u8 *pbuf)
 	if (pmlmeext->bstart_bss) {
 		update_beacon(padapter, WLAN_EID_TIM, NULL, true);
 
-	/* issue beacon frame */
-	if (send_beacon(padapter) == _FAIL)
-		DBG_871X("issue_beacon, fail!\n");
+		/* issue beacon frame */
+		if (send_beacon(padapter) == _FAIL)
+			DBG_871X("issue_beacon, fail!\n");
 
 	}
 
-- 
2.20.1

