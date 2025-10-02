Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619292877E2
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425861; cv=none; b=UK4kbVB5QWQKsPa9ZZpI8fJZLNlFxowL2Y+AThdB6irDplQs5nb9XbcZxxhKMsWf48sjkc1tIvKs+yH/LX25bTWWju3dwVEb9bS9tRNhXXU7t5nA3oTSTPKSuMm+HbKN+CU06nTY6A/ciBVqkmA3ow32cl4NJWJZHU2rsQxRoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425861; c=relaxed/simple;
	bh=bNEWBZRyBHfKqr01S8/SKbTmlXSajYDu9W7EMIMQC6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gVnCymEmO+LzZyV1S8R+6s0MPs0fnbinKlXkIMPJgqdSB91PyQz+bSOo9wVhKKdUd68cjhlTt6LhiQeLCM7tq1omkoLdiy/gNFjjYomD2y+vWpuPKDbW3+YT21tkyDyz2/PXhUIJ+SNOS2IcvzyWl/k2KrUr86M+cWZSikQLL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG7nCgbr; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG7nCgbr"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4df60ea79d1so15459691cf.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425858; x=1760030658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMViGqdfcDRKE+thTCkDFhQYc4S31LExZ+nrwKtGa20=;
        b=fG7nCgbrqjSQHvXXp32UamXxKsm+qJAJ99dcAmS/gUkEz//J7VY7PfHTTM/3RqaDpx
         M+Us/sUi+CZUv6hj0kp7WShKw+cpEMEJVFae5CMjSsjXRtM37dfQRSEkfZe5kK8uOvyp
         i2k7ZgLLcl6WE8mZ+vtwI6TLqGJ+1KH7Gf28boauxLqUG6vSWWraHHZ7ewLhAR6jIzYC
         oQlx3D0Jm+dHKUgFl19WDOd4h1euGhKgVgnftyhV5S32lZHIHTOwRWvwp9bfTgOsyl6E
         fvpLx9W5bDGaJhyZq02ITZ13y80e6tOCIZl3CrTeK3+n0DpxvempiSQ1J9IEcWffrkHi
         VR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425858; x=1760030658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMViGqdfcDRKE+thTCkDFhQYc4S31LExZ+nrwKtGa20=;
        b=iHWB824XWEEZcc7pufQavb7pkhQug64KML5FcpEPO6Nh3jXk3az2dJu7znLvkLHmJW
         r3P582uhpXcCOdQ4fa2agtt0M1n0wPz5cJoMDaA54Uu2YT8gtf47+CkGWy8Q/cqrFY+a
         L/Ae8WFZqZcFArl8I1To+/s+EtgUwGuzK5l4DfRBsA0FaWy8TK93LuvAEi5skPOQVM2+
         JygYvlShWFNdtvNKxoHhJUog0loznmXy1we7/qvWXKKpDfNrZOwPSwHp1LGvX5JaX5or
         ISjZ4mFo94SMG5YAOriE5QYE94hEhnN4/jCNgKYhXgF6L3hZmYyaWzPyNd23FVaqu63v
         gtgg==
X-Gm-Message-State: AOJu0YwmWQWZGywWTxpfP65yDIOZjhguoCQ8bIdKjJoIWj98B624qe7p
	oPNZQQBcT2uhxdcCeb+5A4nO3lYFcSd4ZPz4C6ie79H9uHcXBqL3+EBsXoCvvQ==
X-Gm-Gg: ASbGnctwEy6Sfq+tu5yoL3FgF9QE7LboqJo1k8BsJHVV39WWAHZYhJlc3YvCyAaeRHR
	sqGMjzOzqxJulFjGalb1pHEP95iJuwRHoNfBSUsWmZ2FpbrFdjzh6rA1TxIhRpmbqhl4XYSkxgG
	8qkBLu0gfPx0oYWSiTbt9JiWA7S4C9JmaABR5r47/MG/qBWZxmSHTdXrRPLeIR2QdnCviKVw2kB
	IfKZ0CqMj7Xdp3EvJWkXyFFY1D7Y1GWXJjcIGV6+DaEACINksC2N5BKVC4D5IZYWjLQjohqLkYi
	eyDcySXQyQ7Gi++4QcgFJB2t9ozZXu4mAWNns8FPfrnTmMcH8EdMDf+GHJbizdp5gNqH5WLHbRt
	kpStd1slXGPUsYkp4coMcSgcLBXyjac8vyc4F2tPKq3ISdSD/Lv75zpvhqVQPoaJgzY0iq+10Ji
	yki7zt85DvIN+DiSrkTzBZ
X-Google-Smtp-Source: AGHT+IFBR/DbvZ6VQiaghYjkQSXWBduaHlJ0TVnRxV/BRzfotDhZefmEwz9LpFxscxCFJZEtu8XB3Q==
X-Received: by 2002:a05:622a:4d95:b0:4cf:8fa2:ccd2 with SMTP id d75a77b69052e-4e576a453d8mr1892611cf.13.1759425857952;
        Thu, 02 Oct 2025 10:24:17 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:17 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 16/16] staging: rtl8723bs: remove trailing whitespace in rtw_mlme.c comments
Date: Thu,  2 Oct 2025 17:23:04 +0000
Message-Id: <20251002172304.1083601-17-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing spaces shown as error in checkpatch run in comment lines
around the IsInPreAuthKeyList() comments section.

These were pre-existing in origin/staging-testing; git blame points to:
08a2e17462dc3 ("staging: rtl8723bs: fix space-before-tab warnings")
(2025-08-05, Zhuoheng Li)

No functional change.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f17b16fe8819..6f147a6f2345 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2093,7 +2093,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.39.5

