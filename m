Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66C356759
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612004; cv=none; b=LtbniO20vaamaT2+M8ypSTX5g0O1r97KORiiEA3u7naHaDUkv+1nrQFJAFW0U/tXyrp7JblYun5/vwYM5h7cNZhCPJwFEFgsNTwyMiVjwC84gbeqiipIWCGq8P7BoH/Tv74FKnpJoavk6BmudkeV/zUzp4OTmOftTDaG36Ym4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612004; c=relaxed/simple;
	bh=LAirslufXhcU/zQUZvYYJOjZCafr8R8CaOjBXAQBPzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjtLDyFuqZZH6jb1awxqNAJ4doWaqtTrgzre5qGf4mJaDyhdYelmcIehKoYitJJ3BzsMmMobO/B39bK3PKFnWyVpyI4UiCA/iZN+xhm9SWmyUqZ+UMTjnNtK2gk/sq3qXn4v/UdJP8VcmWbLGX4Zt25wVkOP7OvuxeicUeDg/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjD6C05m; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjD6C05m"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2babfd18435so30700555ad.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778612002; x=1779216802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a365Xb3W5xgA7Mz12JLcwxcS5EFg0mIyVbQ1el6LorM=;
        b=JjD6C05mmklMpx8EX7b5xu6V8cJXHPGpUAyqeEP7YoVr+/Pzd+1ylBlMI5tk6dgTp2
         JU3BHP7+b2VvrIVbWPT1GGLoKRkBHcK13XssMqG4pFVrlY9c5OV/hhr+MUc6dJY20DDY
         2q+Dh9tfgDQERDbM2KoGMPv3X5CJcHGnSRbrneZZQYKIcbtYiVrqBiEgciJzJecaX6p+
         cDrLaBYLD5jQ1jOi58l0R2ReMFJ7jftzCySUcJzvHY9EMyLWZVRQHUPNN0lxOkDqR+m1
         IUoMjvbSu47Q3YbrVlSnj1n6iRgzYczTmMedjSf2pNRQznFszzoghHqjTmQYc8ZrldxO
         +BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612002; x=1779216802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a365Xb3W5xgA7Mz12JLcwxcS5EFg0mIyVbQ1el6LorM=;
        b=r6wTZy5ftnPJhdDRbDYF7Wbj0uuXrkoQrA9Y/NtAct/o0EFWJjeQPLC+r8h0E4calB
         lZtNkunuHWaUC2YVglMTdJk+ve+Io7qiwEdxQ9CU8RkbfO5on1/fjG2xmabiRJt8xULh
         31Thsd5ajEUhB8Iwc3FNDYxvoh3KOYNL5Tna2k18NJLDdTmkYusgHlxOEGWnieKu/kqy
         GdDI7/vv6JJBYYXPdoNP3Md6H7XygYXXe4O+hqxEc32WTqM5vGxgE77q0GDVFIBP9fvg
         /3/Zto98RNpdGvOh9v+P+YShTeqUzuwrKRRZ2E6SK4swMX61t9IEskxhvm55dBqqpeok
         6XWg==
X-Gm-Message-State: AOJu0YyKhT/4cRmufUuC1AKIOFBdMGLdT+s7Dx++1JIlGPL4R2MYEJGX
	5NFQjsM4YICT3GOqWKtIyfJOfgL1wboYS157OviR68DUEZXt+xsOtUVQ2ZZsEQOINC0o4Q==
X-Gm-Gg: Acq92OH6D/GVRagmIIUbM+0TApaz7y4Yx17lzQ1AxQdK8Gy0hQGefooYiWCDwwMAklD
	zxd/v/72twpsVdN3g2KvOgtfTEdNEsDSCAz4NNJZHpIQnmx/2zewLrq5L7IC61oEm1v9aMETpA/
	z2GWvVn5+d1cDE4ljr/8nPKwMEBoAhgyYLmydeweMUSTSNuPaSo8kD3tM02gmd0oUWwt5RvmGD/
	vofRA/CMLd1yFJbS/okq8fwBDr3zippBFDbyK6xBhq6qQdnUn1oVHarhPSsAizOrkPh+HWBbM5/
	ZPH/PW3VJulv3ekJTO0c4JsM3OVRXxhax9Z/mwarbnFq3iRCDOwQQEu92cfEAxSR/oghLUkJKeQ
	yXK6m8hVvrw28HxutVDXJDZBbe+ovaBBi9rbsKN/TWan1Uwh3WZ8hRY+ykyTMAPlnVU3RsclVYX
	cWUNX2nZJd4DQOOJPKvGC3VVqAzu11SRg8wKmxBWdq
X-Received: by 2002:a17:902:a508:b0:2b9:ff02:a159 with SMTP id d9443c01a7336-2bd2718d9f0mr1879655ad.18.1778612002127;
        Tue, 12 May 2026 11:53:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27062sm144887205ad.3.2026.05.12.11.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:53:21 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andriy.shevchenko@intel.com,
	pramod.nexgen@gmail.com
Subject: [PATCH 1/1] staging: rtl8723bs: Fix line length in xmit_linux.c
Date: Tue, 12 May 2026 14:52:54 -0400
Message-ID: <20260512185254.604090-2-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512185254.604090-1-pramod.nexgen@gmail.com>
References: <20260512185254.604090-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap long function signatures and a long expression to comply
with the 100 column line length limit reported by checkpatch.pl.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38b1a..1c53b7bc00c5 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -46,20 +46,25 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
+int rtw_os_xmit_resource_alloc(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 alloc_sz, u8 flag)
 {
 	if (alloc_sz > 0) {
 		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
 		if (!pxmitbuf->pallocated_buf)
 			return _FAIL;
 
-		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
+		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)pxmitbuf->pallocated_buf,
+							XMITBUF_ALIGN_SZ);
 	}
 
 	return _SUCCESS;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter,
+			       struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.52.0

