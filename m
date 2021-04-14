Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B26D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id w23so17009298ejb.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SbAXazZwEPOa8QMUmxDI/WPc1uOvEQup3qCoBf+KKJs=;
        b=vPyh8mTPY9H0tHSkG1qu7FQQnOhKO7ZGdFNVM6cXvOG3v+QBzxkYVq4uNlFaJJT39h
         PDHK25ayBZqQebu44Bw+3RlbbTnrpzr7ym4a8gUmp/WTqgjnLFUeZvYecvoUep5O2REz
         fmDF6P459U0zuQ2UaV0QlKn/UXquzzFtjLYER0tKbaQvY6r0ZLOL5Ke1wtrFDD7fjc6i
         GA0lngqy0Q0+4sMCqNchlrgBRvI4XPpDKp+LQqp7dkTP8OCs5892hLN2y6B1ljOELYQ8
         MMUVSZXKVRERRn7XG7uSAxKYVSahrDnbeWuxmjUzSYFHo3ovVtYClk6IIn8ELzN7bd32
         T+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbAXazZwEPOa8QMUmxDI/WPc1uOvEQup3qCoBf+KKJs=;
        b=nOvTNa65AbfPFv1cqHIFyygIfrb3dGzA3zS4MWiq2w2zWMJopMGm5UdoX1PIv+1kDw
         FwF0jpfAf2eA5bkc5Xff7SS92sC86XCwDMuQ5ix8IjiMJYGTEd8Xhudw6MoZPyad2p9e
         TSqrMJRsZgUTGCFIug3yOZiB2RVNMXTE2lvV7rFc9CAE1oXz0YuGsDYkeTKWh6UA23Lq
         MyKO4w4Kw6qKmHAcMawTThs9A8FO/0YI851s2xiqqmyU0z+/zIvJsq2Ea6KyegeO/tkY
         b9a0hqqwiNz5vBYmbGqw51/9pUstMzzodA8/4UGgwp+uoN+zitCsq3KmuAU/OmIGQl2A
         eSVQ==
X-Gm-Message-State: AOAM5320H0Ao0L9r36YO6h2zVsx8gEcgGUsj7RVP3RxyuG5QYCcbXZTl
	DyndzUcZ2zFyj/MDFThh1t+pFg==
X-Google-Smtp-Source: ABdhPJzvkH3wkCA+A+Omoi/ffhJEH7y4cAUic+rqXF1Xb4VMZJWQIeS3ESYCgk5iPfHRzLzOqmD9WQ==
X-Received: by 2002:a17:907:94ca:: with SMTP id dn10mr142839ejc.123.1618423942690;
        Wed, 14 Apr 2021 11:12:22 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 46/57] staging: rtl8723bs: hal: sdio_ops: Mark used 'err' as __maybe_unused and remove another
Date: Wed, 14 Apr 2021 19:11:18 +0100
Message-Id: <20210414181129.1628598-47-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

'err' is only used if debug is enabled.

Also remove 4 year old TODO.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/hal/sdio_ops.c: In function ‘sdio_read32’:
 drivers/staging/rtl8723bs/hal/sdio_ops.c:170:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]
 drivers/staging/rtl8723bs/hal/sdio_ops.c: In function ‘sdio_read_mem’:
 drivers/staging/rtl8723bs/hal/sdio_ops.c:381:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 701f1abbd0f07..51d72262d11e4 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -160,7 +160,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	u32 ftaddr;
 	u8 shift;
 	u32 val;
-	s32 err;
+	s32 __maybe_unused err;
 	__le32 le_tmp;
 
 	adapter = intfhdl->padapter;
@@ -360,10 +360,7 @@ static void sdio_read_mem(
 	u8 *rmem
 )
 {
-	s32 err;
-
-	err = sdio_readN(intfhdl, addr, cnt, rmem);
-	/* TODO: Report error is err not zero */
+	sdio_readN(intfhdl, addr, cnt, rmem);
 }
 
 static void sdio_write_mem(
-- 
2.27.0

