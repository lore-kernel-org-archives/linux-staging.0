Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF0470
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:30 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id y4so4293570qvs.10
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJT2fBX6NUBbqUgv9TUGV++7TztXDzAOBouwVbFp1ZE=;
        b=KF6aG8pQ0H2Pgw8lJN88sY3d6CYc3bghX1qOm7CurysAfZelrAcTbPLOgmeovuqF66
         NbbJTNjc0KOgYsMaeKmKE6mJb2sJgiVMgl45Zwyn83i2/0HFe695v8pJXJqa5oEceSQn
         tQsn26z9ZUdsY4KNNkVfhzIJGBiMOq9cJ1TLAG6jbjbZP/kxDv1/VOgCGU5ZqWEenJNG
         7/5/CYYrjHLySnI+wbhG4QVvi6HIX7zJEmHsDDMF9duyoOEjM9lyJ7wcE9WsdKHD8WaV
         7/iASOmXMaDr9L0rS1bWUPTz80tXL7AeEarLNcah5pdPhpTEeRUgITS1aAzrTJP9GK/I
         nVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJT2fBX6NUBbqUgv9TUGV++7TztXDzAOBouwVbFp1ZE=;
        b=FFMbZcXs6Rzx9NzqqXrilGCnpZb8OirYHjjs+LUxcmg3ZnoEHUvlWoQkW1qdJHLkYy
         Iod06GcGdTcvKIoVWPXs9tRIRwomNn8UPApiHrc/wsR8KSCAJ47tdp9oI/tW5/uftd3D
         jywWecebzpLd+kMDHbcKAwBPZtbzgiwyRPtLMVxkqzU5PmCeguxsPDeizerP5v+TeP3O
         su0vGttBUgqc/85LFIBUt09OFmLuoZLhs+8tuz30JeA61o4Htung8C7w+lC2J/Tbfrml
         VEKbHDKi6BH7xnQpUsb5OsLw+PZun0zzdQ1amESVzGjrFmzRB12GJs4U7AiAJ4wnOJJq
         NbDQ==
X-Gm-Message-State: AOAM533VUbEbZLhQ5AIL38oUqPc91Wy0vXOWo1BWcwPeW7B2D4erq6zI
	0FppHxRi775GC7zaLU5duuyVpw==
X-Google-Smtp-Source: ABdhPJxJ2DyS+SWJLNddWMTzRCOUC93Y4pYd0evQmlPQJinHBXwY7xKx1AvHJfV350z7KodHWtQLFg==
X-Received: by 2002:a0c:fbc7:: with SMTP id n7mr8328215qvp.36.1624579709268;
        Thu, 24 Jun 2021 17:08:29 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:28 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/23] staging: rtl8188eu: remove all RT_TRACE calls from hal/rtl8188eu_recv.c
Date: Fri, 25 Jun 2021 01:07:52 +0100
Message-Id: <20210625000756.6313-20-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from hal/rtl8188eu_recv.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c
index 2d7d3d932e96..aa69fc3880b3 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_recv.c
@@ -31,8 +31,6 @@ int rtw_hal_init_recv_priv(struct adapter *padapter)
 		kcalloc(NR_RECVBUFF, sizeof(struct recv_buf), GFP_KERNEL);
 	if (!precvpriv->precv_buf) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_recv_c_, _drv_err_,
-			 ("alloc recv_buf fail!\n"));
 		goto exit;
 	}
 	precvbuf = precvpriv->precv_buf;
-- 
2.31.1

