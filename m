Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFD6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:25 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id k9so354351qvu.13
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=arf2O8mNj2CjfUwpKned7GmEP+iVp6VeDjXoD+oq6Gk=;
        b=eiBBJLYnzvTgFwQ3ZS6i7Q5rVcwrTBg6w6TRnsgKZI9BgH50njJXCGuafILLGjUWAx
         wXyf9lPhtNfk5utiV8gXz9lUh9MxSj/xfTy6p3p+SYbav0SvXgp4P/tAyrYvDkgSFF4P
         3sNSujvIPQoZppT20YCvwJNPcjLaj5AN0qawX+21J/H6XO4COJoZzW92GcIdc9Syo4xc
         RkF6GbfWC5xtrs/e+ygmZ3gGA4PXezpV5bIe3LY3N6sQewPoz3B9OugkMFaGiA+oQjDW
         5QZPYLlOKb793WRfVV9Kjym7Ey0HppLLstUVW5G0MtYwLXov7O1NjtCi9Uw1BeMUriR/
         zznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=arf2O8mNj2CjfUwpKned7GmEP+iVp6VeDjXoD+oq6Gk=;
        b=EipVLoDJBFOF7jJclDyIRAivghZsalJpKuwrDrApQttaMNSRj5aT5zT+CXaWfcq5wz
         LXUYXVz4hcddSgqUHWnCdDAk5HViZN/rlqyNIW3fX4p3oZnND0mtZBTPxuxtWbVgmKRP
         1dwqTWLXHSXRElY5MrhIOyQI5NUldyyLTCZLt7F/GggQwgjI4v4ZL2RHCd/7zxY2bGLi
         ujiHurn8+lYxDzg0BxwEOe1jIb9V4/QI8aqqtYpam7dhn9pv58hNJCc3fhyD7f1JJa7r
         LF7HESsk+7zOF4KbSWwXegTIBue3oXpRM7LSUDMMQgSeh2MUPPxdiIeZwmYeWsCLCCOu
         1orA==
X-Gm-Message-State: AOAM533VtE4cyuUtwSHvSlbE9JpjuSbpXShDj5z+ja+sHhBOm1Ke8ulz
	QqqxjiWZYqoXDWKdKPWnZ5Y11A==
X-Google-Smtp-Source: ABdhPJy2chXCy/XcQ2wBwS2HDq3sEZxaI11zxGHHQHGhkx5c3Ueh6JDTsUT5afXPM5BKFBGbNhdy2w==
X-Received: by 2002:ad4:4c0c:: with SMTP id bz12mr1898654qvb.21.1623716185180;
        Mon, 14 Jun 2021 17:16:25 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:24 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 21/28] staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188e_xmit.c
Date: Tue, 15 Jun 2021 01:15:00 +0100
Message-Id: <20210615001507.1171-22-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from hal/rtl8188e_xmit.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c
index 9b8a284544ac..0d5608766a0e 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_xmit.c
@@ -33,25 +33,10 @@ void _dbg_dump_tx_info(struct adapter *padapter, int frame_tag,
 	rtw_hal_get_def_var(padapter, HAL_DEF_DBG_DUMP_TXPKT, &(dmp_txpkt));
 
 	if (dmp_txpkt == 1) {/* dump txdesc for data frame */
-		DBG_88E("dump tx_desc for data frame\n");
 		if ((frame_tag & 0x0f) == DATA_FRAMETAG)
 			dump_txdesc = true;
 	} else if (dmp_txpkt == 2) {/* dump txdesc for mgnt frame */
-		DBG_88E("dump tx_desc for mgnt frame\n");
 		if ((frame_tag & 0x0f) == MGNT_FRAMETAG)
 			dump_txdesc = true;
 	}
-
-	if (dump_txdesc) {
-		DBG_88E("=====================================\n");
-		DBG_88E("txdw0(0x%08x)\n", ptxdesc->txdw0);
-		DBG_88E("txdw1(0x%08x)\n", ptxdesc->txdw1);
-		DBG_88E("txdw2(0x%08x)\n", ptxdesc->txdw2);
-		DBG_88E("txdw3(0x%08x)\n", ptxdesc->txdw3);
-		DBG_88E("txdw4(0x%08x)\n", ptxdesc->txdw4);
-		DBG_88E("txdw5(0x%08x)\n", ptxdesc->txdw5);
-		DBG_88E("txdw6(0x%08x)\n", ptxdesc->txdw6);
-		DBG_88E("txdw7(0x%08x)\n", ptxdesc->txdw7);
-		DBG_88E("=====================================\n");
-	}
 }
-- 
2.30.2

