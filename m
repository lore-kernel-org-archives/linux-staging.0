Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910E70
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m19so6973110wms.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eCgskwqPbTbe8zjqvIB45iWyLT95wxbQES202Eafyt8=;
        b=LNLV3qGYyuZbbs3XO4TvP4ubXFI2AATA/JPPRJvLOb2kdcA3mfLWDbNJoza+Ksim+K
         p58Tcgu3o6Ps/Q++YsISXfxvad2pLVBtW8LwTUU4IoQ+tj6q1xYpoJbmNxRJbjWQpPgB
         v0+egIbl+/SDKSrby9njIiti94LWxvW2TuWGo/77RDajsMrY1O1sBTnBiW/VmNIzOpQ2
         iHRDSL4Q0j9sNa+bjOeJw05brgGqezDj3mNT+aik1x7r11cBQmWYxVEgOog9bX8BbGyn
         lM1ULnLYiqaf9XZR0KWM1aozuNHU2zSuOLdNIiHMBXiirfys5NCZ8dIQAeHlDySwK8Ho
         oolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eCgskwqPbTbe8zjqvIB45iWyLT95wxbQES202Eafyt8=;
        b=PcJbJvIrMQtYrPEImE6VnOS4UFEJdM9ujJv8pB5QPvQk/rxGH6TkzDf0RJNiZNe5SV
         xosPVtsmJ3Zmj8TFZyzHwjqqwxY+MoCmz71Y689kXc8AMIR0tBKmZzRtDMRHLY/CfgLl
         ymn99H9Z2i1YmHsAjB4Fhh8QCrKUn3jiXNykrhxu6eRfwVpuOTO9tlqdiX1em5PJOeCy
         ckW+iZzhoX5AaULQGrcGXxAvQdtRxMr2Se/1DAmFxu3L83yz6eKjW8oDq0ZUEj0e6Laz
         8XBVdlleJ/SB1aY/xzzqdktQMBpeHc6HMRp24iLKGKqZLEREywCQ6Rw7HC1T+zTTGpwB
         7LYg==
X-Gm-Message-State: AOAM531na5VeK4LrnHHgST+abHHnp0rfTN6USVoLLsL9IIq+WLlWb/2S
	/bOD5xAdJgJ51dNQM1PmApF7tA==
X-Google-Smtp-Source: ABdhPJzJk6UpvsTPUAu/lU46b4wtzgeRTM0yMxas/uoyq7+jj5JmHuEAZrxqyCP9TVIzciXOAK/TQA==
X-Received: by 2002:a1c:6245:: with SMTP id w66mr5760019wmb.143.1627691980815;
        Fri, 30 Jul 2021 17:39:40 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:40 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/14 resent] staging: r8188eu: remove ODM_dbg_* macro definitions
Date: Sat, 31 Jul 2021 01:39:25 +0100
Message-Id: <20210731003937.68615-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731003937.68615-1-phil@philpotter.co.uk>
References: <20210731003937.68615-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_dbg_* macro definitions from include/odm_debug.h, as
they are called from nowhere and are therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index 53ab6debb6f3..73fdea598707 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -104,9 +104,6 @@
 		RT_PRINTK fmt;						\
 		ASSERT(false);						\
 	}
-#define ODM_dbg_enter() { DbgPrint("==> %s\n", __func__); }
-#define ODM_dbg_exit() { DbgPrint("<== %s\n", __func__); }
-#define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
-- 
2.31.1

