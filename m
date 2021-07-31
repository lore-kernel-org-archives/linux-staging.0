Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2153486
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so8074731wmd.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2g9UxZdEMaE3vJpbZr7oUx7+ltJAKf8EpUn9f9NHS/M=;
        b=yt4sC2HCLdHy+96eNPNSvuOROQ70MFk+iw/9dU7k7X1NFYSKMJh7bzpfZq2Tv5aGYY
         gE5hDVSz4bNTmb9+vAxkkOq0NYvDjPL3cOqBOAQJul7TlKypFYcfhfrv/JN75dsNvOo+
         BMO9LGnWdiJy+d+G2oFDzKDpH/e087j5Ni74jdcn6MkpFAcBn7/pC9YLCH3H/aSu54ca
         79SyUvKE96i+rYgQAnDY3lX1Cm8H5QYzE1B1La5EjKNHX0Cxnr8m0DZgHwBq6LEjnG+w
         tLkW3pPiBZmMXGXsP+1fc/6FgOUJlJUyx/vD4NzDrWErS/WLZDADAMDqVCBoO4CGSnv4
         73Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2g9UxZdEMaE3vJpbZr7oUx7+ltJAKf8EpUn9f9NHS/M=;
        b=A1lRGCnmSDy2QFpi/JIpSTAo3V6r4MCvIvOjMRLj9LthgwV0xlCfOkBP+L78wGl0t4
         gVtK4dHO+QW6cJBt45pDtPEHmSJWpn/23pZdaAVgY2gGaBaLo3V6j97faQoMMlmMXw5X
         JOb2Lu0pQywYHP2CLE32LWN3fAzFWYmlbvPxaOofFPxeiTOkbBs9sDWtG0sN/cKCf/IC
         oy7fulnVWE5ErJ0DepASLVeoZJ9BOZxa7fabd2tmWydvqoSfKOSMcqxJlaanHDd3aKb4
         YfSOOtq6g3aDIGlmF/9/MVyUlAy5wU0mfjoOjDSV8YbBHSvNE4Pu1NxU3RHO8XUJtnkm
         /5Ow==
X-Gm-Message-State: AOAM533NU3GeiKugWW3iDgRF5la2xJfMGHOHXM7FKhCvy3GJ8Wlh5WZJ
	FKMi5saxmsp9TFbcqQs48/y02g==
X-Google-Smtp-Source: ABdhPJxA0gOJ29/kWaucIm/hfxV+YOor3TlXyBCoVNhhQpgmEMhALINYtlrNomGuoaZyJ3P5odPcbg==
X-Received: by 2002:a05:600c:354e:: with SMTP id i14mr5581038wmq.96.1627691983052;
        Fri, 30 Jul 2021 17:39:43 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:42 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/14 resent] staging: r8188eu: remove ASSERT ifndef and macro definition
Date: Sat, 31 Jul 2021 01:39:28 +0100
Message-Id: <20210731003937.68615-6-phil@philpotter.co.uk>
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

Remove ASSERT ifndef and macro definition from include/odm_debug.h, as
these are unused and therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index ef0d6b84b2d5..c70fe73e3339 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -68,10 +68,6 @@
 #define RT_PRINTK(fmt, args...)				\
 	DbgPrint( "%s(): " fmt, __func__, ## args);
 
-#ifndef ASSERT
-	#define ASSERT(expr)
-#endif
-
 #define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)				\
 	if (((comp) & pDM_Odm->DebugComponents) &&			\
 	    (level <= pDM_Odm->DebugLevel)) {				\
-- 
2.31.1

