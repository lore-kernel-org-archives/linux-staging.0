Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBCC5A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 18:54:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id dr20so14057025ejc.6
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fhARwSk59a5Uz7mUXe+CSmtNlnGMtOE8WUL+HBpEL8s=;
        b=gJEiZ5pbFpu+Q5+e+mj4H5b3YtUTfxZmHD8SIR5M/zWqCaq5N8hA0lxcB7vaAh1pWQ
         QVzybmLIeF6C6jI/Q5TeraMf2FkGBPD+5nGloD3CYUWKX94gU2pguKxdb15cChgH8oJG
         0Z/IPEbvneAkEm/Itlec/wVgMC9tAAKdO3Xq8ovwd2a3NsmUnWbmJPzhhiNTXXbDvABI
         Y8j8+/8B3Mfwq4EHl+ZhzZk28250Vrnnz2TdfSCH1Ht0hZLKAkyJ7hXLALXg8eJ78w3z
         NgJ2zXW1y1+5rOy1xrz5eQvswO0KC9eQOJo1lqCQdFrKaG0jP13+BxnSvCJJTwVQDppI
         pGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fhARwSk59a5Uz7mUXe+CSmtNlnGMtOE8WUL+HBpEL8s=;
        b=nrXQSfN99iM+DEJjdyq6na8ikMhrO3y4G/D2g8iXmywuf40ywR8eAItjKTwPAgpvSd
         ZmsaDTle4xaxkpc57DKN9rAx9DnyL10SagGCE8GT0SqwUbi3Sfg+lZjDwu775dSR2o/U
         1pLj8iYukibF3u9IOKE9fuVSivTPiepi5/mSIGiUQBhC/l767h/cTznvrXrbGMP63MH5
         4GSp7T7EhKP4yA1PZDZOUyeFpXt3tQbX/EGvmvw7mwduy1nkaQpONkQT0DPDlqurRWO6
         o6jrLBkCULZNvi3yOA3DEv5gaRTyCtogBNla+WVB5FTT1MXBbekn43B9PwKGdbuUXNAO
         nhgg==
X-Gm-Message-State: AOAM533le0uwis+9v/EmSCLT+gwqla5rX3rUOgxfoHI9p9UIKvxv39gM
	NS5s/exvUFJ8D76xPqhzY0o=
X-Google-Smtp-Source: ABdhPJyTgmOIZm0kPkXY5GYaUgp/MS1/PJK7T0oGeoWhD3+zELUe1ZiOjcyrrogDqAz69SM9xEfsHQ==
X-Received: by 2002:a17:906:4e8a:b0:6da:a1df:98fe with SMTP id v10-20020a1709064e8a00b006daa1df98femr5477651eju.66.1646938460527;
        Thu, 10 Mar 2022 10:54:20 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090608c700b006cef23cf158sm2087174eje.175.2022.03.10.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:54:20 -0800 (PST)
Date: Thu, 10 Mar 2022 19:54:17 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: vt6656: Remove unused rf_type in baseband.c
Message-ID: <77dcff8602084484532fcbd734aafd138087c5ee.1646935331.git.philipp.g.hortmann@gmail.com>
References: <cover.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646935331.git.philipp.g.hortmann@gmail.com>

Remove rf_type that supports 5GHz band.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/baseband.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vt6656/baseband.c b/drivers/staging/vt6656/baseband.c
index 1e1c5a7d8968..c04fd052e467 100644
--- a/drivers/staging/vt6656/baseband.c
+++ b/drivers/staging/vt6656/baseband.c
@@ -255,23 +255,18 @@ int vnt_vt3184_init(struct vnt_private *priv)
 	dev_dbg(&priv->usb->dev, "RF Type %d\n", priv->rf_type);
 
 	if ((priv->rf_type == RF_AL2230) ||
-	    (priv->rf_type == RF_AL2230S) ||
-	    (priv->rf_type == RF_AIROHA7230)) {
+	    (priv->rf_type == RF_AL2230S)) {
 		priv->bb_rx_conf = vnt_vt3184_al2230[10];
 		length = sizeof(vnt_vt3184_al2230);
 		addr = vnt_vt3184_al2230;
 
-		if (priv->rf_type == RF_AIROHA7230)
-			addr[0xd7] = 0x06;
-
 		priv->bb_vga[0] = 0x1c;
 		priv->bb_vga[1] = 0x10;
 		priv->bb_vga[2] = 0x0;
 		priv->bb_vga[3] = 0x0;
 
 	} else if ((priv->rf_type == RF_VT3226) ||
-		   (priv->rf_type == RF_VT3226D0) ||
-		   (priv->rf_type == RF_VT3342A0)) {
+		   (priv->rf_type == RF_VT3226D0)) {
 		priv->bb_rx_conf = vnt_vt3184_vt3226d0[10];
 		length = sizeof(vnt_vt3184_vt3226d0);
 		c_addr = vnt_vt3184_vt3226d0;
@@ -305,7 +300,6 @@ int vnt_vt3184_init(struct vnt_private *priv)
 		goto end;
 
 	if ((priv->rf_type == RF_VT3226) ||
-	    (priv->rf_type == RF_VT3342A0) ||
 	    (priv->rf_type == RF_VT3226D0)) {
 		data = (priv->rf_type == RF_VT3226D0) ? 0x11 : 0x23;
 
@@ -446,7 +440,6 @@ int vnt_update_pre_ed_threshold(struct vnt_private *priv, int scanning)
 	switch (priv->rf_type) {
 	case RF_AL2230:
 	case RF_AL2230S:
-	case RF_AIROHA7230:
 		threshold = al2230_vnt_threshold;
 		length = ARRAY_SIZE(al2230_vnt_threshold);
 		break;
@@ -456,11 +449,6 @@ int vnt_update_pre_ed_threshold(struct vnt_private *priv, int scanning)
 		threshold = vt3226_vnt_threshold;
 		length = ARRAY_SIZE(vt3226_vnt_threshold);
 		break;
-
-	case RF_VT3342A0:
-		threshold = vt3342_vnt_threshold;
-		length = ARRAY_SIZE(vt3342_vnt_threshold);
-		break;
 	}
 
 	if (!threshold)
-- 
2.25.1

