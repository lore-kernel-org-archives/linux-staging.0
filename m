Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E46D24
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:49:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id f5so6006292wrm.13
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u2ZJqznXmuhrlSqufTd57Yc8JlZbuqOPMN7Hgt6psyk=;
        b=qdImYatvHktofiASKYB8ZneV6fQ4ZcsLLgeItM7Qmf81hFciU2vSwHHHLaxAzgpQGd
         +4e2BdupyvLtoCjOcOaM2bK83+UCo3A+xvFi0cCry0eaxwEJoaQfEtbDdTXNbX2ObWA8
         341xZL3wAsUJFrvdATgMqokN870l16INMjHjD7KJjmcMRFLs4zdK0kk1y1tNB6M98w6D
         FbwbsZGgm49jkidzkYZNEkg+FgpT0IxS/O/dlVSszTx8PEUjQLDwIbLnUFK5Kj5Xdy0l
         dgq43UtKd3EH7dXdpQZH0fKxZ8y7kMVldun+OjVYejZoQuScjnF9Ll4Pv1JM9Y1sC9Gf
         um/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u2ZJqznXmuhrlSqufTd57Yc8JlZbuqOPMN7Hgt6psyk=;
        b=Z5o74JZVZEXEvBpmA/2eeiBN8AOnZxZ9tgh0MYTmpb2Dn4j0qfmRy0XLy88XO7egJX
         YfvdBDfpgoCI79Npepv+r60Wg+xPQ3sa+bRBYvw6xtApCdXJqKeBliyGpR4O7JNzH9Rd
         4bi1YVimz8P85X57Amv+mIATYlhrE6DjD92rdUtUPHyOXkJIc/BoZThIV1K9/LIbzvM0
         lE+ai+7vGNlFXmweV4SW16H5ZHDftA+Tr/SZq45GaEJwt4e0mPyZ8sSX4B2aUq0pBb8q
         5AwJVq8dJbnWLjMXzlmgndbYOSjNAhIvgJ4m6JpKpD5X5jEG08Fa5Bel5atE9b0+3bEu
         BwUg==
X-Gm-Message-State: AOAM532unnBnd6+se64mfJBJTaPwlUciNx8VIoH7e72NCwOFS1e2MBAW
	OkCANAo1kbiVinA1sV40i88RUQ==
X-Google-Smtp-Source: ABdhPJzXIdFIWaf/YtSDVKUp4W6cG5E/aLEMvMdgpLcIscjLvy4X9I7ZS23z8ai+Z7FqIpOBf8UgZA==
X-Received: by 2002:a5d:610f:: with SMTP id v15mr70861wrt.415.1629330539788;
        Wed, 18 Aug 2021 16:48:59 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:48:59 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 6/7] staging: r8188eu: remove function _rtw_zvmalloc
Date: Thu, 19 Aug 2021 00:48:52 +0100
Message-Id: <20210818234853.208448-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234853.208448-1-phil@philpotter.co.uk>
References: <20210818234853.208448-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the function _rtw_zvmalloc from os_dep/osdep_service.c, as this
function is now unused and is just an inline wrapper around vmalloc
which zeroes out the memory. All previous callers have been converted to
use vzalloc. Also remove the declaration from include/osdep_service.h.

It is considered generally bad practice to declare functions as inline in
the majority of cases, as not only can this qualifier be ignored by the
compiler but the compiler generally makes good decisions about inlining
anyway.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/osdep_service.h | 1 -
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index dba7a7bec9d1..bda435ca9d08 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -171,7 +171,6 @@ extern unsigned char WPA_TKIP_CIPHER[4];
 extern unsigned char RSN_TKIP_CIPHER[4];
 
 #define rtw_update_mem_stat(flag, sz) do {} while (0)
-u8 *_rtw_zvmalloc(u32 sz);
 
 void *rtw_malloc2d(int h, int w, int size);
 
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 8a797bfcb7f5..95ac6086370b 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -36,15 +36,6 @@ u32 rtw_atoi(u8 *s)
 	return num;
 }
 
-inline u8 *_rtw_zvmalloc(u32 sz)
-{
-	u8	*pbuf;
-	pbuf = vmalloc(sz);
-	if (pbuf)
-		memset(pbuf, 0, sz);
-	return pbuf;
-}
-
 void *rtw_malloc2d(int h, int w, int size)
 {
 	int j;
-- 
2.31.1

