Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681D2FB3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:05:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q11so2040620wrr.9
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kzpNgdEMIJX6MOa30CBr2IcMHgxrWwdQxWt6kBWPTvA=;
        b=bW/2qXXJym88CkeDFqO+3P5aw7aERVGeI/N6bKLEcd0Mho15e75Fav0XYtH/02+KHF
         EZe8GdBry9zQZRk3zWns/mJgnLWb8kkViKWODMQfFCICd7rbscDdCpFA+WuKdSisN3VP
         SN8p3JGohBn9PoiH5WI91zMck9cZ0J39cDTavF7+zX9nCq1htkCMKkqCOe7rDw8+T3mP
         1//xRroJiZAPFt9duIlDmrQ1taCvF8a3r5lqxWmX0sKQmRzR7P+loovmlw+DfCNgisz6
         UYSDDeRmSAuraCHY0edoq4ghMmRz9+IX25BJmyzTL8IsnDAwuHDAKvnH5XM8MxIQH3CW
         n1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kzpNgdEMIJX6MOa30CBr2IcMHgxrWwdQxWt6kBWPTvA=;
        b=jf/sOrHAyctE4SxQbkHFqTJ4UgTZJ2x//b2GCWVF1oOb+U1cEP6DTlXW+MvCP8l1mb
         VBA9sb0srYuwjQRSqzaiiawTXo2woDTQgeLvWCP2HJaG99RAPIudx3i8nX8aXS7smBVm
         EDqbeWlsVVxs2nEfjQC0XfiJ+bnXJG8ymTxq6A8//feveSToIwJknK4vrq+ry30lzpX6
         vPtS5jNMomrqbjjnxzgqBIy2Z5cLskZbXlz+0Uec9qTYHEnWW+bKHOVFvaenXAzKcCRo
         OnTcNmKVsgNntM1qCbpCALvPhXN78Mpf+gRd+IghzNdQ8c6Sn2hNeuJspolwUIYZWADZ
         GVYA==
X-Gm-Message-State: AOAM533AFOE+U8D6KNOaXs4xjNaKdNaNlVa8X0lyUYMYV1CzyH30gn/U
	Lf6VWjDVDLjBtGHwvnm8CmY=
X-Google-Smtp-Source: ABdhPJwkHCQWmhoKX5ZbRXEL4lzvu6OwvHOxKhYK/+sxtoL0PMRILq8568I3vnp776Ko+DNjerrvMg==
X-Received: by 2002:adf:9063:: with SMTP id h90mr8946295wrh.121.1631271938295;
        Fri, 10 Sep 2021 04:05:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id h8sm3920783wmb.35.2021.09.10.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 04:05:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: remove rtw_IOL_append_LLT_cmd()
Date: Fri, 10 Sep 2021 13:05:26 +0200
Message-Id: <20210910110526.4093-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910110526.4093-1-straube.linux@gmail.com>
References: <20210910110526.4093-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_IOL_append_LLT_cmd() just returns _SUCCESS and the only
caller does not use the return value. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_iol.c       | 5 -----
 drivers/staging/r8188eu/include/rtw_iol.h    | 1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 08677552e5d6..ff08861b7acb 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -72,11 +72,6 @@ bool rtw_IOL_applied(struct adapter  *adapter)
 	return false;
 }
 
-int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary)
-{
-	return _SUCCESS;
-}
-
 int _rtw_IOL_append_WB_cmd(struct xmit_frame *xmit_frame, u16 addr, u8 value, u8 mask)
 {
 	struct ioreg_cfg cmd = {8, IOREG_CMD_WB_REG, 0x0, 0x0, 0x0};
diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index a07c3ae0bed7..bb2c9fcf8985 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -33,7 +33,6 @@ enum ioreg_cmd {
 struct xmit_frame *rtw_IOL_accquire_xmit_frame(struct adapter *adapter);
 int rtw_IOL_append_cmds(struct xmit_frame *xmit_frame, u8 *IOL_cmds,
 			u32 cmd_len);
-int rtw_IOL_append_LLT_cmd(struct xmit_frame *xmit_frame, u8 page_boundary);
 bool rtw_IOL_applied(struct adapter  *adapter);
 int rtw_IOL_append_DELAY_US_cmd(struct xmit_frame *xmit_frame, u16 us);
 int rtw_IOL_append_DELAY_MS_cmd(struct xmit_frame *xmit_frame, u16 ms);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index b428d0b36171..e3e43c8cd11c 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4021,7 +4021,6 @@ static int rtw_dbg_port(struct net_device *dev,
 		switch (minor_cmd) {
 		case 0x04: /* LLT table initialization test */
 		{
-			u8 page_boundary = 0xf9;
 			struct xmit_frame	*xmit_frame;
 
 			xmit_frame = rtw_IOL_accquire_xmit_frame(padapter);
@@ -4030,8 +4029,6 @@ static int rtw_dbg_port(struct net_device *dev,
 				break;
 			}
 
-			rtw_IOL_append_LLT_cmd(xmit_frame, page_boundary);
-
 			if (rtl8188e_IOL_exec_cmds_sync(padapter, xmit_frame, 500, 0) != _SUCCESS)
 				ret = -EPERM;
 		}
-- 
2.33.0

