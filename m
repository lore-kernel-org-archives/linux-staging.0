Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555E6AF88
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716285441; cv=none; b=qYbtX8qVW+t0IgsW8kHMx/31z+sDPgbCeWqY3Ss4jwT9zFGKSg9LIrf5lJ51o+WbwmSOks9no7nCbAzmKQEy7Tc40sW5MykwbN36CcUWA0a/0jbWsfR4urJNC7awPGerpxoZozmu5FNWXJnNEzo8kijLnQickicRLZU8I87Nbwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716285441; c=relaxed/simple;
	bh=0qPzwHfPxwiH9bEgiufqWDknYV680rVRxHR5kSQNXs8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hAMvtj5tv/k2vMmRyjL7aDjDPKc7jKrje4CPRR1GhT5UMpaXAAHB5aVXbiyScJWg/KpRnye+j9Cw5pCJrNLKrUauvddZdmkRQMX7MMbBpr2pEpH1WhuNFQjKsOrGfYo4lVwhR+M05hUkXmveK02mRmPtVHlZPuwJc5suXKWYVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjXXHpoZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjXXHpoZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f44390e328so1290170b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716285440; x=1716890240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6v+LqDl7PgsDQchADwzDPsfHMrcim6MA4Pe4W269OQ=;
        b=DjXXHpoZnIAFdP4/PBZGJJhw6f96QHGupHXH4k0tx4c0vmKIgzumlHyxWsZB0p8UzZ
         9HzULH9oztCd96X3I0ZAKyQyGNsgxywFzpQQ+k8h93MZ4U8zXJuW6rkHHHzchxcxGGOT
         SnTMdFlCU3/GHL8Bt/teffJij1Udk+lzyngw9KvgmNccjN5nM50jsSddneGosSlTgHdg
         he2g4ZXifxvWGlLBVLY+h9Kw2GjzzP5rrMZPXlgslItyDNwoLrZZ1y8gkERRt/2Fd4MV
         9TvMtJTge0lypjw39r+GtJ2swHK28EbAV1sWYB8AC/gX6z9E4NnbwQDs/RlT/qwgFh/L
         yYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716285440; x=1716890240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6v+LqDl7PgsDQchADwzDPsfHMrcim6MA4Pe4W269OQ=;
        b=HvOePff3Frej+UuV1TXWI6haB7CG/WyWxdAZlO44qJthMAYDysWUC2Whv3fcBL7L01
         mJK5Dx9JO6UkxJRGWyALJ6q5zjE9AcGveZx0/dlICH10Zi1EFFhCWosWSuaNh2tbcWul
         ByHlLB8WaPBY9gtXdgyNid/3ArgyhGqjEIjzs9yLqqrClcRXAUnBdM6c3PrhmzjU4OBK
         s41DSvUvmpYEaIzkQYTFmDlKzb0zlee3YOXBRRBPEIrkkXqX+kT5RQimWTUDk0ER18Lj
         Hs+Dbm1JQGqzrZwSrpY9OenA/NMNuekTPMvFimx57ditagGGEgoRipKcpCGGVqcRhCNR
         DX9w==
X-Forwarded-Encrypted: i=1; AJvYcCVBQ+/VaW7bJU9w7Tdkjz1xEudLHalXplRo+VMRiN+MEI/gDO/4oz33nwuCopg8jIoXjes0HEMe7CnHbEwOwCYvVPE/WLXXRCWMIQdipA==
X-Gm-Message-State: AOJu0YxedXjnWCyP56t/DgKkQcJa6iJ86I7GasHOwlWpLX7XkY+qjr3J
	l2ri04HKDYk87vHJxn6LK+7PwCstouuzwFt1V6WrhaiRkTnIeY5M
X-Google-Smtp-Source: AGHT+IHwg/ycMSP4zLIilBIn2Qoz0J6SpMwS1AKx/OEKZQgsMDwvxYZJsM4P7HVHFwTkABW/MGFNEg==
X-Received: by 2002:a05:6a00:39a5:b0:6f0:c88e:a0dd with SMTP id d2e1a72fcca58-6f4e0384b45mr41097087b3a.28.1716285439636;
        Tue, 21 May 2024 02:57:19 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a817cbsm20332785b3a.58.2024.05.21.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:57:19 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	ayushtiw0110@gmail.com,
	dan.carpenter@linaro.org,
	namcaov@gmail.com,
	linux-kernel@vger.kernel.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3] staging: rtl8712: Fix spelling mistake in rtl871x_event.h
Date: Tue, 21 May 2024 15:41:33 +0545
Message-Id: <20240521095633.50753-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled joining in rtl871x_event.h. Correcting the
misspelled word improves readability and helps in searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v3:
 - Fixed misspelled word "readability" in patch description
v2:
 - Changed "mistakes" to "mistake" in the patch title as suggested by Philipp
 - Updated the patch description to reflect why this change is important
   as suggested by Philipp
 - https://lore.kernel.org/all/20240521082510.50422-1-topofeverest8848@gmail.com/
v1: https://lore.kernel.org/all/20240520064750.48912-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8712/rtl871x_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_event.h b/drivers/staging/rtl8712/rtl871x_event.h
index 759a2d27d8f2..0cc780cf4341 100644
--- a/drivers/staging/rtl8712/rtl871x_event.h
+++ b/drivers/staging/rtl8712/rtl871x_event.h
@@ -37,7 +37,7 @@ struct surveydone_event {
 };
 
 /*
- * Used to report the link result of joinning the given bss
+ * Used to report the link result of joining the given bss
  * join_res:
  *  -1: authentication fail
  *  -2: association fail
-- 
2.34.1

