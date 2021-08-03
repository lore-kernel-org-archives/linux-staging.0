Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247B70
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 23:05:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so348972wmb.5
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wGo+3f+0qTZCTY2bzh5gM59oDyvCliepgg7Xmjd7Xh0=;
        b=oUkS9JYYee2kyFpt73yJs8PEtusYbKrP9q59yi0PQ4mYkTtzQBfpQ2PuJbF8df8rbj
         r+aAybR1b2NuVC3slT7IzObd2AJw1GBTmNTWql2n4W2ddqxSbxe9anN52wAl04+OUj30
         y5H61VUEcT9xzTl5e4ARooKNRPviwR7Ozl0AbLrBwOz/ceC9R/zPMx2iCAKX4A+nZETM
         RXHpMZlFYCKTMStsS9a7japYgLVEzSbbaTE3Cbm5ye/xaaQLd57g/qtw4frkAG3P513v
         nEXUZFLhXE9ljUBqFd8zDRbVj2Ym+2uVFouDHt5kSnoyCyQx51y2SOkDWKYNRn7FOMEO
         7FUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wGo+3f+0qTZCTY2bzh5gM59oDyvCliepgg7Xmjd7Xh0=;
        b=cZrrkxEEYaCnNkdSCOzohyvBj03BwF9t2i4lF+NwigVRNYC5waY0W+8WGG/hVnpGE1
         aT+fS2oHEBQSh9m3IVPx/dA98k1Ll5w7D+SSLRElp942zn5/fFQnfk9zlkhfTgqsqZIJ
         384lrjkMbaFzx8hQdkxVIDO2nKBma7BBqEfZSujqrlhGvawLkkvzsFL9BUvA7ViAGr8f
         ehy4AV/5UKteAGTzdQwYw+z8ED3hQvMiSuR7xflSFhn5Us9hPExliqaBR2bLYaJqs8rV
         CzCmpxiynKDFUF8r4/k60S4IiWBN9jyxMjkEpQX/qcAJb9W8Iuw7rDHThUaBXDzbBdjE
         xc8w==
X-Gm-Message-State: AOAM531+ipvDb+4gSZVe2I2PSvI2vvUm4Kup1K0iP+f43cyorevyGPye
	r9/Qo5n7iiYaiTY7+EWymlzb8A==
X-Google-Smtp-Source: ABdhPJwMqQO7IKbT+ttT387aVvzDnJ1By97F1xzxR8yvA65qzG0BxKbQmt2TGNGIFFfdJmAVfJG9yA==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr6635299wmi.177.1628031938857;
        Tue, 03 Aug 2021 16:05:38 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id i29sm330045wmb.20.2021.08.03.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:05:38 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: r8188eu: remove RT_TRACE calls from hal/rtl8188eu_recv.c
Date: Wed,  4 Aug 2021 00:05:29 +0100
Message-Id: <20210803230535.74254-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803230535.74254-1-phil@philpotter.co.uk>
References: <20210803230535.74254-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from hal/rtl8188eu_recv.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 2e3f624d0f22..c544e5d89226 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -47,7 +47,6 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 	precvpriv->pallocated_recv_buf = rtw_zmalloc(NR_RECVBUFF * sizeof(struct recv_buf) + 4);
 	if (precvpriv->pallocated_recv_buf == NULL) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_recv_c_, _drv_err_, ("alloc recv_buf fail!\n"));
 		goto exit;
 	}
 	memset(precvpriv->pallocated_recv_buf, 0, NR_RECVBUFF * sizeof(struct recv_buf) + 4);
-- 
2.31.1

