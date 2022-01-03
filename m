Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B5173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:11:48 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id n30so27336727eda.13
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8LpbJ40RMtGdL7dvHZ4+rXlOz+sMuPTGwqmKmFyNXJk=;
        b=gzruZNCqvf+NZH4xW1qDIXaQKtspAUmzfbOYOr5VgwPSfY6qb/Qlzm5KXEQpL65bQ1
         ySjCIy00tCVD5rAsLxLymFpCYctUXKQnJkEjHWmR7R8K+Hn7voYWARmCJB0K5Wxa5Yle
         QNj/ymRmuW8sWJgtadS8hT7+3OzuWuLmU3XhhZm1iQawVJrDi4XJv5SZJ8TBfueXTzPA
         H5i7Zi0E3H6SA+cc8GBk8IeLNL2+Aoc/k9Zq20IR0IX1JAX9DEx1Lp4+FUiLNmfE+859
         0RebFYSsWNR90CN1vFoKx9ZCvs8dv5+kkNHebhKgGSfcwbD92iiCoGtlEKemkz1t/WT+
         z48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8LpbJ40RMtGdL7dvHZ4+rXlOz+sMuPTGwqmKmFyNXJk=;
        b=DPvOMo6zTA0Uit9arLvbKl3DdindGXeuIC1tj6F7/ifJpdNGghzfbAVwH+xU+pUxBz
         YRJPKgcv9pxm3Reg9whL0Ipz6tz6uwAWayP7dQX/0BkMrHr6XGae6BhcUhaog+TFqPlZ
         GKBEyDt+7xr280VbU6w73e4LIreS+YgQDbDw2ZFrTfPjoJmuBV8aFfGXSUAfG0CJg8hY
         SQhk+TZnbs+IXq1FTwvxa58ZhIEnXZyGjSgKPljUDyJp2LRL1JmOoM50VjkMB9TJfeQR
         shAJrqiPi7j0KzjVfOTxPaUnuvH+/dV6Wji5UQSE9PpPsPTD9AAAv8Nv7rSIrqY1pNrj
         LKOw==
X-Gm-Message-State: AOAM532Al61FFmj+EGGspES/66YKLWqvVP5l62h+17ut+QeMsWCIzB7o
	2dGSsitnwZPF8Cr20ZPw6Ko=
X-Google-Smtp-Source: ABdhPJz8ii42Fhw8J3V8PDp9kVvGCo7GA3FfPxfVQ4KKnG6JfenvWXwpbYNjzNISPUSkh5DfZelrjA==
X-Received: by 2002:a17:906:7d96:: with SMTP id v22mr7613314ejo.538.1641237106997;
        Mon, 03 Jan 2022 11:11:46 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:11:46 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/56] staging: r8188eu: add parenthesis to macro SetMFrag
Date: Mon,  3 Jan 2022 20:01:42 +0100
Message-Id: <20220103190326.363960-8-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose in parenthesis complex macro SetMFrag

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 1d24d798c5f9..6e39a72e49db 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -176,7 +176,7 @@ enum WIFI_REG_DOMAIN {
 #define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
 
 #define SetMFrag(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
 
 #define GetMFrag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
 
-- 
2.25.1

