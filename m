Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D71FCC;
	Wed, 25 Oct 2023 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYPj2XyD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-408382da7f0so43818545e9.0;
        Wed, 25 Oct 2023 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698222430; x=1698827230; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BIEpeDhsmV1MGZX+rkMhWOfAqR84yFETrjktILCYvg0=;
        b=IYPj2XyDNzOu8eLQ/WK7j/piCYod8pZ1k3Zm/gOar/EZAfRg7aKb1LehyA+rRmreVD
         au6gJTWS2h6PnVhyxULc0UsM9woq+xOt6lUh8Wh5YCa5CyTV0Yb+8Q4jxUQTMjaE/BFb
         EUMeLV5TB8xz7YoVzzZKA5F0rGlJ+R8Zpu4S3uPVpSoQVJqVm73sRaDy6V7ENa6tVm6n
         tvdPA0hM0/CzPwUjVMOo0EtlF+yXUG95XaFbvAfWdbIxrfUb5ieNpSKDErL+AeU30KJ+
         tYu1fcZLjmCOa3aCXljyGf+/+d9EOqILnPJF38IfH3aOnYY7jy2Ub1Pmwtp+csGbE93F
         jx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222430; x=1698827230;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIEpeDhsmV1MGZX+rkMhWOfAqR84yFETrjktILCYvg0=;
        b=AHqPIuyIwVwyF53umfY+8Jztx3fx9A2JmdUlzamTRj2gqTtujo+hjza5Kkd/YJ162O
         LnJCFKbwOIDqSlwAq2DknsIx3s4dX+i0Dd+Tv9cZ77DqvdvDc6x33uXdkcUnjuabqdM/
         j0u0susSRDOHWaP2d8qG0MtDBE0fKDq98uDZbDmXc2no7yoEozTEzXQJgzKpQbT/laAr
         4tHuCWAGPV7+akaTQHzM4zUM0Z0/X4qadA/0yK1dL48w3FhaPSCUCGr4valNSlzKyDUv
         H06UKnWg/DeXeakKIPQi7fAZUFLjwojxndgE0mbb8OwhP6XE/Ft8sL55rMeuQayVozTu
         uxGw==
X-Gm-Message-State: AOJu0YwsggT4QJeyVXYhjRYfT6xSOUAu4oqP99H7iptGKwzj5szvawxC
	BAmGjw00kA2VUsbcPlqf+Ak=
X-Google-Smtp-Source: AGHT+IHReVM8jgrUJE5dcVe4EUHcU8ycUKGqfApb7ktOI86IcTS14d+3EAtNR5vCIr187yj+5RqmLQ==
X-Received: by 2002:a05:600c:1d1e:b0:408:4160:150a with SMTP id l30-20020a05600c1d1e00b004084160150amr11575395wms.33.1698222429636;
        Wed, 25 Oct 2023 01:27:09 -0700 (PDT)
Received: from lab-ubuntu ([41.90.66.64])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c210100b004068de50c64sm13759396wml.46.2023.10.25.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 01:27:09 -0700 (PDT)
Date: Wed, 25 Oct 2023 11:27:06 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.or,
	Julia Lawall <julia.lawall@inria.fr>, Deepak <dvarma04@hotmail.com>,
	Calvince Otieno <calvncce@gmail.com>
Subject: [PATCH] staging: wlan-ng: prism2mgmt.c: rewrite flexible array member
Message-ID: <ZTjRWkqXeoS74E52@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Declaring zero-length arrays is allowed in GNU C as an extension.
Although the size of a zero-length array is zero, an array member of
this kind may increase the size of the enclosing type as a result of
tail padding. The offset of a zero-length array member from the beginning
of the enclosing structure is the same as the offset of an array with one
or more elements of the same type. The alignment of a zero-length array is
the same as the alignment of its elements.

Declaring zero-length arrays in other contexts, including as interior
members of structure objects or as non-member objects, is discouraged.
Accessing elements of zero-length arrays declared in such contexts is
undefined and may be diagnosed.

There are some instances of code in which the sizeof operator is being
incorrectly/erroneously applied to zero-length arrays and the result
is zero. Such instances may be hiding some bugs.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/p80211metastruct.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
index a52217c9b953..c8b73c867391 100644
--- a/drivers/staging/wlan-ng/p80211metastruct.h
+++ b/drivers/staging/wlan-ng/p80211metastruct.h
@@ -71,7 +71,6 @@ struct p80211msg_dot11req_scan_results {
 	struct p80211item_uint32 signal;
 	struct p80211item_uint32 noise;
 	struct p80211item_pstr6 bssid;
-	u8 pad_3C[1];
 	struct p80211item_pstr32 ssid;
 	u8 pad_4D[3];
 	struct p80211item_uint32 bsstype;
@@ -95,6 +94,7 @@ struct p80211msg_dot11req_scan_results {
 	struct p80211item_uint32 capinfo;
 	struct p80211item_uint32 basicrate[8];
 	struct p80211item_uint32 supprate[8];
+	u8 pad_3C[];
 } __packed;
 
 struct p80211msg_dot11req_start {
-- 
2.34.1

