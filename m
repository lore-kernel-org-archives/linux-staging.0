Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1723C02
	for <linux-staging@lists.linux.dev>; Sun,  2 Oct 2022 14:35:55 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id bj12so17597755ejb.13
        for <linux-staging@lists.linux.dev>; Sun, 02 Oct 2022 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5vFN5yAOwmazqPpcOCp2Q/JnJyLAgqeK+WWJJECXgaw=;
        b=Lp/NcjbUdSbrSK41+DIIG37FiJ3JuSZ0adZCyhcOFOJ+Ya/19D8126rVt6M5Pi5yBW
         q90awo980VKUM9KSG2OjuuZih4ZHZscCwEDCXvwXD34XzBZGEsouNzHuorrmXbIvddRu
         mCmDy+o4DsqLV23rJ+BK8gV/HEDT453nEtWsNPvngdykfYGnEFeMNH7sLzE1ec0m98hq
         GR8+vMz+Yt7nyxB0KbnaSECo/NUwUpOquBHuAGusIgT8AeoelYnG5DK9M16UEzAbcJga
         PAvEZISk41gmx9++UZhx3f8PqYRkxC9Jv9SHlD6tyrXNBlIwYi+U5Ei1ONGJhORC6GAV
         OBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5vFN5yAOwmazqPpcOCp2Q/JnJyLAgqeK+WWJJECXgaw=;
        b=S2LwXGhiA6dhRhjzNSst9tEYqgAfR8mQSRuC/FK24xemZioLexfM63QJ6g2WSaw7vA
         avFXXzVe/fHNRNgdnWOd1wCSBl0GS07/aBxJNNud4VFrJTm9DBQ+eaQs4aT2oStvqRyc
         zGR5gpNTAgMkmD3exsLYTscSxjeeY+l89YP8Z8PoehZHXp97QNNW/9CPkX7R9ll8J8qA
         LU7RecdE+fkMieMVWQpESSAyhZY1UYRNLRWiYfzIjtQ6lRN3+wUBrb1h5ivBrr4GHw17
         oUb/ijXThiju1YAQX8mPGdaxTCtL7G3RqfuT48VkBiuHsLjJKo3Z/BV5sZgq+sa6gFm4
         WvGw==
X-Gm-Message-State: ACrzQf2HqL6V/QXK/8hEk6zNTBwR7lUFshJF22I2VtR/bsl0dm+1VjsG
	UGveZgbhdVPE6gN5NcgDVYU=
X-Google-Smtp-Source: AMsMyM6aEey8/d0zs/pRHrfr60+37ltEDeun6YHe6l8/DHqwPje8J1l+PtB2xUZkn44dNVTJwfFPaw==
X-Received: by 2002:a17:907:3f13:b0:782:1266:8c10 with SMTP id hq19-20020a1709073f1300b0078212668c10mr12372449ejc.197.1664721354033;
        Sun, 02 Oct 2022 07:35:54 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906301100b00731582babcasm4082334ejz.71.2022.10.02.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 07:35:53 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: convert rtw_reset_drv_sw() to void
Date: Sun,  2 Oct 2022 16:35:43 +0200
Message-Id: <20221002143544.7974-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221002143544.7974-1-straube.linux@gmail.com>
References: <20221002143544.7974-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_reset_drv_sw() always returns _SUCCESS. None of its
callers use the return value. Convert the return type of that function
from u8 to void. This is part of getting rid of _FAIL / _SUCCESS.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/osdep_intf.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
index 36511c469546..ce8e1bc4a61c 100644
--- a/drivers/staging/r8188eu/include/osdep_intf.h
+++ b/drivers/staging/r8188eu/include/osdep_intf.h
@@ -44,7 +44,7 @@ int netdev_close(struct net_device *pnetdev);
 
 u8 rtw_init_drv_sw(struct adapter *padapter);
 u8 rtw_free_drv_sw(struct adapter *padapter);
-u8 rtw_reset_drv_sw(struct adapter *padapter);
+void rtw_reset_drv_sw(struct adapter *padapter);
 
 u32 rtw_start_drv_threads(struct adapter *padapter);
 void rtw_stop_drv_threads (struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index e43ef7e5ba70..2983e665bd5c 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -433,7 +433,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	padapter->bShowGetP2PState = 1;
 }
 
-u8 rtw_reset_drv_sw(struct adapter *padapter)
+void rtw_reset_drv_sw(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
@@ -455,8 +455,6 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 	padapter->mlmeextpriv.sitesurvey_res.state = SCAN_DISABLE;
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
-
-	return _SUCCESS;
 }
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
-- 
2.37.3

