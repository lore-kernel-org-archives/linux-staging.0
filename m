Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F25211702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0ddiYwb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c362efc2dso3854895e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702222013; x=1702826813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AX8g/wXZvYEzrNX0i7zijBGLcVcluFx1cTL3h9KKB8=;
        b=h0ddiYwbOgGrvCKZJo+7yfPDgAHoILFjTH3vMtSxLNngHfjp4sUH/2DYHqdTbHh5Vy
         ZUV/bIIXu9Q7c05roNTHSEV/ziN1G4tSEGAjtkldRskv0iAMEvGUdmCjogjTYBLH11uB
         8/aFr/sfGusoQK4K8uwU0wsW6ARMgrKVoVF/ROXMlWHUKka9ys380fc/m7o1F33v4kwb
         ICfZvc7lImoRlZYZB+VDhAPgaB0TJZB03KViLrUAMAfe91hG8+adw+IQ6cce4ifWD/Oc
         NYj6JeVY2ieJMaWVHRZ7tdoZZBbyr2TJQIv7+3eRiUXSsw25rYd0m8p+tOkb7amGPsrJ
         4FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702222013; x=1702826813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AX8g/wXZvYEzrNX0i7zijBGLcVcluFx1cTL3h9KKB8=;
        b=ZyWgBCovEif8UdDTjrLGmCzaHBKOHvuFzMNso3UbnCjMxxDCmNU+Kevenk8qFoMuOQ
         rRnB4Cgc5Jh4ZddDMaoGS5sNrXRzX5yqe01G13ceOv9V/mmwkV02FEmEorK9pKipgg//
         7nvJpmTxO9qggVsR7se1XE30VPu72U+amFmIe5G4Sq67CBOQ78A39Stp9EUGdAH1dkDy
         jtnCOo4A9ecFoB41hFozKmbWhqDPvO1GBkdUtqUeoD/3iIs2RpoDRH7Z3ECFAOz4x39W
         7iF7aWNl78oRZTPYlTa6mGs8Ri8OuYyWI+gpd0+pEzU7x0jHIgNMldnS+jF2MNVGo7Ms
         8gtA==
X-Gm-Message-State: AOJu0YyZ1IpiVjPHwCyfO/P4vTxOtvFQjEmHW2v8WwuFeFKFIVeDCVN3
	f5lAyxUlKQxuJ/zoX3TOJxk=
X-Google-Smtp-Source: AGHT+IFwiSupcld5jHo8mMdVpVgGC1r4PqCFLqRK+5FD52FyqP306qJnkCRLeOOXrzuYK5T28BZhIQ==
X-Received: by 2002:a7b:cb99:0:b0:40b:4cce:baf4 with SMTP id m25-20020a7bcb99000000b0040b4ccebaf4mr3959298wmi.3.1702222013655;
        Sun, 10 Dec 2023 07:26:53 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c138f00b004060f0a0fd5sm9905070wmf.13.2023.12.10.07.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:53 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:51 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove equation with
 pPeerHTCap->DssCCk
Message-ID: <16ec7f928d1c51ffe68b9a1a68d09abaaa79924a.1702212003.git.philipp.g.hortmann@gmail.com>
References: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702212003.git.philipp.g.hortmann@gmail.com>

Remove equation with pPeerHTCap->DssCCk as it is set to 1 and unchanged.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index bedee290e7f5..ca9da96b6f6c 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -471,7 +471,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
 	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->ShortGI40Mhz == 1) ? true : false);
 
-	ht_info->bCurSuppCCK = ((pPeerHTCap->DssCCk == 1) ? true : false);
+	ht_info->bCurSuppCCK = true;
 
 	ht_info->bCurrent_AMSDU_Support = ht_info->amsdu_support;
 
-- 
2.43.0

