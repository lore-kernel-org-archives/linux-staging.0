Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7331411CB2
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzcUCwcp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5451faa3aa7so923216a12.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432129; x=1701036929; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M96xGnsTaxvh/GugqakyW3PVEINvxqNUDY6nmJN518w=;
        b=AzcUCwcpSUzFLP99pBydF7m8jkzKslRTJFO76NwS/xZfrSUejWwBYJ8WKemvnpIgO/
         WpeSM4WxOT0zUo0JEkUpiILstRMmhCobI6txdBndsTiVnF+Ta81CoLa9g5nrJNbWK8oi
         r85nJ3D/k+Lw1jtzD4mgd2I8sYjnOMhAffjLe40433gvbSw7hR2qBvBEIHZav+eolaEi
         r/k/9yNWjQnkFcVLqMy0u9k1zwSHdLTLhIenMHbxG012JtjeSmVxeEZfMkAR7bPxhVFr
         qk075kWg4YNsViiZ+l0ZvdMBO4PVRQeMSyjNC3fHVEtRbOFQHXI08NtJebteSbDNAc8v
         v8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432129; x=1701036929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M96xGnsTaxvh/GugqakyW3PVEINvxqNUDY6nmJN518w=;
        b=Rz/KbAzJ2hLt3f0QA7a0OI/oMPS+yBN3q8NAm5NfI2I4PaVQqqQ27KHucUCMQu+zxQ
         ij0rpkiL4Bq3OHKk9y1PuuPFarvlptOwz2ywMNNBSm+2gOg0C2eCxHzhTnHmQR+YOhMq
         67R9n0OpsbElKyzoPSCMNbfJ47Z7Hho8oWOsUZm6PyGuDmPwtVlIQeey8mSRPsTKvV2L
         kBxCtjtg6czSLra2Y1O9HI8teZBIcyTa+Q7zQ8sG6ByWYrEnFbWeyJbpWzT+DLgjE8Zq
         IUl3AFydQUGxD/cNPZflPtXMS42U82vbbydKltP6yGm5WX+wPyzA8M2l2BvgJKmjOgv6
         Xlew==
X-Gm-Message-State: AOJu0YxV8WKdJSrdWn0x245aJrW/uxcwVIXUb/rqtQD1ifuiCCB3qEEh
	TWzxYmQYXXZCWVug7pHRj6A=
X-Google-Smtp-Source: AGHT+IGCqcpoqkPHVkbsl8wRZnw2336e7c4mDnffCQE0+l/HiMGDj1l+o6w5qI1dchl2sooI+rbIWA==
X-Received: by 2002:a17:906:5191:b0:9e6:69d:46aa with SMTP id y17-20020a170906519100b009e6069d46aamr4332001ejk.6.1700432128727;
        Sun, 19 Nov 2023 14:15:28 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id xa1-20020a170907b9c100b009fe3e9dee25sm523882ejc.61.2023.11.19.14.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:28 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:26 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] staging: rtl8192e: Remove unused variables from struct
 rt_dot11d_info
Message-ID: <eeb9915d68c353554973e1056893371d15381f88.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused variables country_len, country_buffer, country_src_addr and
max_tx_power_list. Remove comments about usage as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 2 --
 drivers/staging/rtl8192e/dot11d.h | 9 +--------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 08cf95d26911..b524ebe31869 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -18,9 +18,7 @@ void dot11d_init(struct rtllib_device *ieee)
 {
 	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(ieee);
 
-	dot11d_info->country_len = 0;
 	memset(dot11d_info->channel_map, 0, MAX_CHANNEL_NUMBER + 1);
-	memset(dot11d_info->max_tx_power_list, 0xFF, MAX_CHANNEL_NUMBER + 1);
 	RESET_CIE_WATCHDOG(ieee);
 }
 EXPORT_SYMBOL(dot11d_init);
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index c7d35ec86aae..64fd39cddc22 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -17,23 +17,16 @@ struct chnl_txpow_triple {
 };
 
 /**
- * struct rt_dot11d_info * @country_len: value greater than 0 if
- *		  @country_buffer contains valid country information element.
+ * struct rt_dot11d_info
  * @channel_map: holds channel values
  *		0 - invalid,
  *		1 - valid (active scan),
  *		2 - valid (passive scan)
- * @country_src_addr - Source AP of the country IE
  */
 
 struct rt_dot11d_info {
-	u16 country_len;
-	u8  country_buffer[MAX_IE_LEN];
-	u8  country_src_addr[6];
 	u8  country_watchdog;
-
 	u8  channel_map[MAX_CHANNEL_NUMBER + 1];
-	u8  max_tx_power_list[MAX_CHANNEL_NUMBER + 1];
 };
 
 #define GET_DOT11D_INFO(__ieee_dev)			\
-- 
2.42.0

