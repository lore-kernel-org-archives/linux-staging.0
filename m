Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768CDED1
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 16:31:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso16164023pju.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IMj05DlNH3/duK3OGv5ITfGzW1UwrXXvGGzncOUobEQ=;
        b=bub1+D+Fm5rOeIqLcFoKetxFrtLwdrbBPZQSSBlmveQnl1H9giDv5FUo2qL31Yj5We
         E1S+MaKLluNaBeg1FHjG9ZnqxINTdrcVpL0bFuutRoW5xVhVy4gPnBfrB0enlMO1bCtm
         IB8hQIFKnSxsQ9qOphQwYNqS/Yit3CE+Z8FqckXdUjJQ6nLteG04HsUabtvUxKXykXKp
         F4ctDaiZozvCgjBZD/JSzibH0RySCb0sS3cQlNO9CIcrfEvXyKsKL5ez5wDqEVhXIoT4
         4GE2WpBfLI1MKVV64HGOvNfLK4/GEfXTI5pIqz0iz9Me1fzOgjtgccsYG2L1eQXhU/w5
         QxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IMj05DlNH3/duK3OGv5ITfGzW1UwrXXvGGzncOUobEQ=;
        b=Sm9GNPQRcnFOIWs1FdJcPXZHDsli+WXyzZxlwOFg4bgZVUHN/49L2Nei2izK3ZEkLF
         ilZ2pi8ldJqYOXJLa+9HIvhhN00ZUZsbSptubGjqmIKLh8TgoxLqg6X2HtfSJZLv8v2D
         EJ2oWvZ7CLNRybSrfk9/XpGk1PosxsaGVYyG7xg568AjWAQL0WZdGZZCpBhTQI06Qd1x
         jiy1y9khV4dLZ4O6lr5dp1YgGajBl9MV5qJivePmm6D+1EvXuulLDNTe/e7hnF1yYwe+
         P3mWmc4KojcQNK1VxNig1otXHPgUK+FLodztxYBKewUfgWMLzR5wKOZifcCLDVy6yn7k
         m5sw==
X-Gm-Message-State: AOAM533KQcsQKxZ/uvyX+TifXjq3yDd6n8MTTDLyh4iER4oMTNV1dK5R
	1cXsTgUVC83iTbO5FULmgeE=
X-Google-Smtp-Source: ABdhPJzB2GG1qcmGG+RG76cxoMtd4oF3viTx/4NMGsMqsA/Jhw1ui1Rop9F/IKTxF9XXEf86z5wTKQ==
X-Received: by 2002:a17:90b:4c8e:b0:1c6:d1ed:f6b2 with SMTP id my14-20020a17090b4c8e00b001c6d1edf6b2mr32127156pjb.166.1649608315895;
        Sun, 10 Apr 2022 09:31:55 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:606b:10e4:2085:6825])
        by smtp.gmail.com with ESMTPSA id f12-20020a056a001acc00b004fb37ecc6b2sm31940021pfv.29.2022.04.10.09.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:55 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 2/6] staging: r8188eu: drop unnecessary wrapper rtw_init_cmd_priv
Date: Sun, 10 Apr 2022 22:01:13 +0530
Message-Id: <20220410163117.3964-3-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220410163117.3964-1-makvihas@gmail.com>
References: <20220410163117.3964-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary wrapper. The logic of rtw_init_cmd_priv can
be moved to _rtw_init_cmd_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 11 +----------
 drivers/staging/r8188eu/include/rtw_cmd.h |  2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 4d88bc847..d843e9997 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -15,7 +15,7 @@
  * No irqsave is necessary.
  */
 
-static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
+int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	int res = _SUCCESS;
 
@@ -139,15 +139,6 @@ static struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue)
 	return obj;
 }
 
-u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
-{
-	u32	res;
-
-	res = _rtw_init_cmd_priv(pcmdpriv);
-
-	return res;
-}
-
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
 	int	res;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index d3a20dc23..ab47d3785 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -82,7 +82,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd);
 
 int rtw_cmd_thread(void *context);
 
-u32 rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
+int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 702e5b350..c611e9246 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -466,7 +466,7 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
-	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
+	if ((_rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_cmd_priv failed\n");
 		return _FAIL;
 	}
-- 
2.30.2

