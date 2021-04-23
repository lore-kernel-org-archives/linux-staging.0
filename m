Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44772FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e5so20048795wrg.7
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xT7xLGR/u98oUeFxtP8FIkbPXzcjRalBgVrGk8h35HY=;
        b=mlrh+t1+toJD+jvvYVxjAwWpjhowFNzMA6Pq+99h7jrnxG9gUpps/g2fyDgvAbaWXz
         zLnVRkV1PURSJzPfKtczN8wAXLi9h8QxW0vr56qS/H61mfP9Sxg3V+chWYTilNYSURYt
         MMU9jxbdV9nyct0jqH/tTtqU30wq0wa2UIBZITgYJ4yky0RA8F9FBq7J8fSrz/pGchkg
         9LbhvZbNV4peYTxU0fj3RaJaHXRjuzZX5otk5ko+frBWZaOAx97trf3QuuiyVp728FDG
         2FhqsBBWxN5N1FaDVo3WMluOSzHQPUhj3hf8k6oLJrLZkWFXTRUqBrAp11CAIUxJz00J
         NtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xT7xLGR/u98oUeFxtP8FIkbPXzcjRalBgVrGk8h35HY=;
        b=iuLqJIEbDfhTX2LekBO+U/dc6vh4YkUqT+gqxyESnc9HPtQXzPQfa1sP7o3LxRH4gL
         aUhrG4lF7rJKJQcAzp1x58DweFRxn8BB4AqUAxGUAemvIXAZ157wG8lN1WL9xsz+2RXk
         aP7XOKnrxIk+yYG7d2qA8igCreC0cDlSeMh59DJGMnNusWrrfPn0Mg5nA/dQqk6kFRbK
         O76AVutvkfep+4zgzwIQh345ppNGkdnNsBS25L9fimowieiY8exoQRDpg2TgrCm4Bg34
         oWa1GByb0ws2SCAeSec3KHqpwT4NwEVod/k88ehMxp6Ld12ZyKDQKeKiujjxawR6XiW3
         96ng==
X-Gm-Message-State: AOAM531ueFftDxHMXBLns3ivCwlyj5VAOew5mQ1irHQkPl/Wfug34VNR
	/5Uvn6HNk5LrbYeqRXoK0IM=
X-Google-Smtp-Source: ABdhPJwyqPevWd+FJFUXDiBY0cbq0n1y7jtD7eSQyCVrztIZRxneeF5GW391yxNp86CiEFIywfGE2g==
X-Received: by 2002:a5d:69d0:: with SMTP id s16mr5286531wrw.102.1619189959406;
        Fri, 23 Apr 2021 07:59:19 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id l13sm9356780wrt.14.2021.04.23.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/49] staging: rtl8723bs: remove obsolete debug macro definitions
Date: Fri, 23 Apr 2021 16:58:14 +0200
Message-Id: <dccf1519d6da1d646d493bbbefe7cab45954b539.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definition untied to any tracing component.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index bb56d38e6b7a..6e6dea4779d9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_cmd_osdep_c_		BIT(8)
 #define _module_rtl871x_io_c_				BIT(9)
 #define _module_io_osdep_c_		BIT(10)
 #define _module_os_intfs_c_			BIT(11)
@@ -35,9 +34,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _CMD_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_cmd_osdep_c_
-#elif defined _RTW_IO_C_
+#if defined _RTW_IO_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_io_c_
 #elif defined _IO_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_io_osdep_c_
-- 
2.20.1

