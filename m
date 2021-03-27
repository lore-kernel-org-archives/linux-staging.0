Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5870
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y124-20020a1c32820000b029010c93864955so6300280wmy.5
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4bDUFCmEc/JgFVMSYx3LH+3oCkwKnVB4YXQ1zRko3yE=;
        b=sVh6F6LrZ8LqBgRGbKRVJbJLbhs4ipKSApPtZP/Kg2mDsx+XGbVTje8mFWe1X/AKnU
         audcO7MC60tppVo/GfZ7k3iUR/V2uNpCijquMqEe/pE1oCKW3cQg21mBtPS2yVPPrv8w
         tKvz2BwlwBsqwMEuOGA/gMxdbZvB3jG6GnoNBb5Qd5+n+6PsQoH0srOyZgDcPCTNN5TG
         NvvwohDjbTni/URGIWs0tyE8HRVWo1itxMy8QA8iSrpjXkCRDPLvrI1IPEp3Fi/2GJrY
         AVv2seKFrnnas8wslXV4xNZEQL2A4wi6hDmzj8QDsA2Qu7BByx7vOkX5jyuDYVq3XoGw
         +7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4bDUFCmEc/JgFVMSYx3LH+3oCkwKnVB4YXQ1zRko3yE=;
        b=ChIKvRUBp1XwHj2eWTIyfw+8u9ut/tL4fedvyj1Vp57ho/BsKdQhWEpssjCE0VvP0u
         AiSrYQacAAV/77rYdJceY6ZUFyGSCGd5Jm2IMMTPKW6iYlmq+OCPcKCeDh0SSplSh0Hi
         qGcZzhZuspyUcFEWw0Pqigm9io1bIFb8uDSEgKghA8v3iwAlHTU0lz3J5Na91VSBI7AY
         BAUQ9R/uCcd4gFP212/Yb9t4G8HNthxcOZQmSFmXD+C/Uq+9SNNKIuM+ot7Y4gdT1tgX
         N4eIqebOucrZeXM3oTlZoaxI14yC+4gCDETGw5JsWTpeYzLF3CK3GLGvGt8hk05AxEam
         BuZg==
X-Gm-Message-State: AOAM532ityM2H9u3+GT7s08XmzO9Oeb9V8Nqc8PiSkScxZPPTEYgjidY
	DlVJXFQXRGirvCf8CNdQ9q8=
X-Google-Smtp-Source: ABdhPJxA61eWCHJWJNa4WTQ+9rN8MxNQcWBTVVXG1jY8U1zBhOSKO9vPOQuOoCHqKkqIzBIrdkFqwg==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr17313579wmi.132.1616855104065;
        Sat, 27 Mar 2021 07:25:04 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id u17sm19607092wrw.51.2021.03.27.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 11/20] staging: rtl8723bs: remove unused field in rereg_nd_name_data struct
Date: Sat, 27 Mar 2021 15:24:10 +0100
Message-Id: <e47b4092f12c4930b7185ecdd59b1d0611dd09e7.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused field old_ips_mode in struct rereg_nd_name_data

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index df1dd9fa7b90..7eb59a16d00e 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -412,7 +412,6 @@ struct adapter {
 	struct rereg_nd_name_data {
 		struct net_device *old_pnetdev;
 		char old_ifname[IFNAMSIZ];
-		u8 old_ips_mode;
 		u8 old_bRegUseLed;
 	} rereg_nd_name_priv;
 
-- 
2.20.1

