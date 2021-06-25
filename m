Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC070
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:33 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id y29so15845180qky.12
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S+BOvfpoBE/0SefPCjcRJNtWH8cTGF6wINDg41h6Lqs=;
        b=n6bYAR7N7hT5q5dxX20+1C+2svqE9JOQ6xL/1JvW6Lh/puP9uti7jEMLISS5mRiGyl
         2quq5/SYz4VxGQXdBJQzFf9fUKhI2CXT2TcnzV3YMzS9YUOGlfhACefagNlguNziWcgD
         yFGRqH/uUPrdSTUYkU0Ss2wiDSfqtSHBxArSZHDkMmbrgHpVNYJGofZNGcArKQl3dSZy
         25RtO6zmPa5o9AaDdF2qpj1i8fS2vQwn0Z/BJwNrdAdE0zn5clC78sBl9TeoEmc7SwfL
         0rhPx/5p5rXv6vI0RfBNfNcEk+/5oQaEJA5NwtdXuiAr6uokfAKvNgkgdHN3DgcFJe9L
         saKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S+BOvfpoBE/0SefPCjcRJNtWH8cTGF6wINDg41h6Lqs=;
        b=bwiKbVdiqwdEt036ZsMdh9/AvRsCORE+Fy1StbB+3eI11o3WWWeTf/ZGWfUJbKMiHM
         xxPi8TIcoqLE+eeY4qkQhv94D/OL+H5ELi7urHBAQ0D8nzR7Y6E4cvq4GnvTiwVmtMfJ
         QIUSB6cVX5Kqd7jujzJaC81cmcJLa5h6w6clNe4tkvaT/m9B+xHjTBTBwhSGqRDKkE7w
         iwktctsXDQGTYaYmHn8/N934Xc+TZKDh+2B0o8Qrn4M2gVfijkDFd4SRm5A2Ztqo9YLM
         WSMQo4bDprrDwG36IORgpDCit3HWGLkMuvdIoKv/6ApiMYvpP5oSkno3X3apMaIfRzo/
         W2jw==
X-Gm-Message-State: AOAM532B4nop3NT74XaYaKgI1AbHbbgbVSMWUxjMTXBGrrv27F54p0YA
	GLHn4XfxgBYulPTo5U8TLgWPhfc9yromag==
X-Google-Smtp-Source: ABdhPJwl0FcQ7RxtklTh514BKWKw4Ea5qJujW1ncQD/CyL96FrLQR2Ud+2cdDsC4Y6MupJW0yzSCOA==
X-Received: by 2002:a37:aac1:: with SMTP id t184mr3978428qke.163.1624579712263;
        Thu, 24 Jun 2021 17:08:32 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:31 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 21/23] staging: rtl8188eu: remove DRIVER_PREFIX preprocessor definition
Date: Fri, 25 Jun 2021 01:07:54 +0100
Message-Id: <20210625000756.6313-22-phil@philpotter.co.uk>
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

Remove DRIVER_PREFIX preprocessor definition, as well as the short
block of dumping code that uses it in core/rtw_recv.c - this code
is unneeded, as normal debugging facilities can tell us what driver
this is simply by pathname etc.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_recv.c     | 23 -------------------
 drivers/staging/rtl8188eu/include/rtw_debug.h |  2 --
 2 files changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_recv.c b/drivers/staging/rtl8188eu/core/rtw_recv.c
index 5941db901dd8..ff2ef36604e1 100644
--- a/drivers/staging/rtl8188eu/core/rtw_recv.c
+++ b/drivers/staging/rtl8188eu/core/rtw_recv.c
@@ -1032,30 +1032,7 @@ static int validate_recv_frame(struct adapter *adapter,
 	pattrib->privacy = GetPrivacy(ptr);
 	pattrib->order = GetOrder(ptr);
 
-	/* Dump rx packets */
 	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(bDumpRxPkt));
-	if (bDumpRxPkt == 1) {/* dump all rx packets */
-		if (_drv_err_ <= GlobalDebugLevel) {
-			pr_info(DRIVER_PREFIX "#############################\n");
-			print_hex_dump(KERN_INFO, DRIVER_PREFIX, DUMP_PREFIX_NONE,
-				       16, 1, ptr, 64, false);
-			pr_info(DRIVER_PREFIX "#############################\n");
-		}
-	} else if (bDumpRxPkt == 2) {
-		if ((_drv_err_ <= GlobalDebugLevel) && (type == WIFI_MGT_TYPE)) {
-			pr_info(DRIVER_PREFIX "#############################\n");
-			print_hex_dump(KERN_INFO, DRIVER_PREFIX, DUMP_PREFIX_NONE,
-				       16, 1, ptr, 64, false);
-			pr_info(DRIVER_PREFIX "#############################\n");
-		}
-	} else if (bDumpRxPkt == 3) {
-		if ((_drv_err_ <= GlobalDebugLevel) && (type == WIFI_DATA_TYPE)) {
-			pr_info(DRIVER_PREFIX "#############################\n");
-			print_hex_dump(KERN_INFO, DRIVER_PREFIX, DUMP_PREFIX_NONE,
-				       16, 1, ptr, 64, false);
-			pr_info(DRIVER_PREFIX "#############################\n");
-		}
-	}
 	switch (type) {
 	case WIFI_MGT_TYPE: /* mgnt */
 		retval = validate_recv_mgnt_frame(adapter, precv_frame);
diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index 88575c4a4633..d6b7975e59d6 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -54,8 +54,6 @@
 #define _module_rtl8712_recv_c_		BIT(30)
 #define _module_rtl8712_led_c_		BIT(31)
 
-#define DRIVER_PREFIX	"R8188EU: "
-
 extern u32 GlobalDebugLevel;
 
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.31.1

