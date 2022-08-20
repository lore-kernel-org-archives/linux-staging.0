Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4306A3201
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:41 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r4so9128575edi.8
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2iiedlofv1fkN9T2ZU3EkgMCuLITjKpLLf2R2cOJIQM=;
        b=AEsz7o6e8ncSjAOisRGbrXWqd6Lb6D6i+Z46CZA80zY6RxUf1xaBjVShI90lhKPXKR
         zU+/SM2DNkL779x9nWZWNDKECu5BZNErW6zC1rey/U8ti8qN1Tdao/jwIsCpw+Iuc8KH
         GBEQW42nGsInnKpWDqbmLIkpo/wYn3kgy4Vlw8JAiv3IQJ8rq/vVflTPQ/XWXOuL97qH
         iiyp1D2ai5XI3rNjIkwnKQEqBaBVe1EKoAQNh7ibChZo0TGPGWBrdADpqgW9ChcFCVcz
         tTxe/Ltte0jSnuX8QvmCb70JMcFkb8TtpjZY7kMebKZ/vR5GdNdxd3vMKKAmAj7CW4uT
         sUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2iiedlofv1fkN9T2ZU3EkgMCuLITjKpLLf2R2cOJIQM=;
        b=FYhFc8lWiPQc3Eihcu+S7wYtCftTSxvvD7kFYwhd3LUHYe5/HAKuQgvDOSaf1sU5JB
         JbcMUNoChK9Hemdtvln7tdk9LIqECvlSd5dqLciPARynd5j24PFQb/DXVFW/1ezJCmQt
         EdKS6S+LHhdQ8OPlTAa33zbZo98wuxeOTo//Crw3VQlb3wfPB1SWjwQBiXNJrS89V3ds
         oWQxxrAcSBHKcBNs+CDGpCYqDZe+DtZpB8Kc611WY1TN+evOgJXWZghoO4UMSwDp23xA
         1IMkJPoYJCLNzNS7g3zq2RP6cMmmq5PcmnU1o4QomsZ86WQQ/pCPrGVUanREX8Tk+zyh
         iGrQ==
X-Gm-Message-State: ACgBeo3Yp7h/YesGziEjldZs09FvzB0j+Lo9Q4YrP/vXKVhYA3HSLyYW
	OgWLd3YCZ3Jmhk4YHwjM+gs=
X-Google-Smtp-Source: AA6agR74IV2U1FDGPjYlwqqWQ+oKl5C3hY8cBbfEiMjNzHak9YgN3Jd3OCf4FlS7WuUG6IED/0FoSQ==
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id ew4-20020a056402538400b004316d84b451mr10086593edb.46.1661019399652;
        Sat, 20 Aug 2022 11:16:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/19] staging: r8188eu: rename rtw_os_xmit_resource_alloc()
Date: Sat, 20 Aug 2022 20:16:09 +0200
Message-Id: <20220820181623.12497-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_xmit_resource_alloc() was moved from the os_dep
directory. It looks like the driver was originaly written to support
different operating systems. Obviously we do not need an extra 'os'
in the function name that indicates that the function is operating
system specific. Rename it to rtw_xmit_resource_alloc().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6f3a70a1ab3c..a1d2c2f78044 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -33,8 +33,8 @@ void	_rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv)
 	INIT_LIST_HEAD(&psta_xmitpriv->apsd);
 }
 
-static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf,
-				      u32 alloc_sz)
+static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+				   u32 alloc_sz)
 {
 	pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
 	if (!pxmitbuf->pallocated_buf)
@@ -142,10 +142,10 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->ext_tag = false;
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
+		res = rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
 		if (res == _FAIL) {
 			msleep(10);
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
+			res = rtw_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
 			if (res == _FAIL)
 				goto exit;
 		}
@@ -179,7 +179,7 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->padapter = padapter;
 		pxmitbuf->ext_tag = true;
 
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, max_xmit_extbuf_size + XMITBUF_ALIGN_SZ);
+		res = rtw_xmit_resource_alloc(padapter, pxmitbuf, max_xmit_extbuf_size + XMITBUF_ALIGN_SZ);
 		if (res == _FAIL) {
 			res = _FAIL;
 			goto exit;
-- 
2.37.2

