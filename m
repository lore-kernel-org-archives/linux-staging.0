Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB213AD2F
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382472; cv=none; b=kunkSOTPKm9xRfO2U4cWHi09bBmY5MY3HAD9wP1tzFeygSx8+54UViuTG1GIgT3fGQOzUcRuaWX53hHm4aK794H28VAq3i8X+4MsffuAV+eOAW3iLFFOBaCLnlwhP87JqChkXrvqA21a98EpRAwpbrqH2ELv1LDC778ijkF6jHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382472; c=relaxed/simple;
	bh=QpT6Z8LG2nnF3VrkVUtoHOFioALPi1x81TYXKQYmhc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J63cYAVmGV9PoxvTfruUX01K5EzaZI9wbF0Oz7oraw4qEljwyENIsMY1w40zi20zjCGoNOQQvVTKle3fpKYec4CWYLbmiptS5etpIefej77z8R5fo7HgB/4f2gNlJ4gRUuvZCTUnuA4pk40xw8IOgxAHTkfrcHc4nvKLdi2mK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/i0x9Fy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/i0x9Fy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8ce5db8668so580731166b.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382467; x=1726987267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/90mJY5TiZ73bUY9rQirJjWNfRoCE6FwinjarxUBu4Q=;
        b=a/i0x9FyQD/T0mzjhLczhXUdCi0v6/RLRaz5BfCdjUWNFswEN7Z9LkpuA21JmmMNui
         QtxOUbm6gqKJVS2S+XHfYxye1MHCMKWZRxR3iKV+rn0uLHQAYr9DZpBT1PZgrm2nc6t6
         uvekaDxXzLbACVR96c9SfBPvKXipJ5yIJ5f8NSteyDJyV6pD+KixKIjS0kPt+wxoL8g6
         XH9k+KtCuojG4XqRXJiwh/gMS+9h+6iUMyFYcNiPTW+RG2ZJIZ8O79PROIzqo9S3FlQp
         87LvQh3OK0YSYnUbYsNlDb0CeePRxH/kwXK0ZN3xd6ha6J1p3uDTc98H9RRTsYp8K7u6
         mAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382467; x=1726987267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/90mJY5TiZ73bUY9rQirJjWNfRoCE6FwinjarxUBu4Q=;
        b=UY46c2cS8wkCbxA+7PHin/gZyk9smSXlt3ppt0a3Jlv8hvGK3Y64Ucb1WrKXHbe6Su
         A05WkxVbDFNg2sKph7iinQB6V2boMKUsleYsFpS+5ppH53KPRbNi0e3/Vt7tqblXpukN
         /4GIulSgQpl4eOZ+acIDoxmplWUvwdgvux4teq54U9a7+dq/1ikloRj5aQWfUNOPMCXi
         E3jyEwpAepb6nyHIIdVEzS5RVryWe41u19yW49tNDUROukdc/iMoYYSpocZgJdvZVaKc
         odVmsvz5wWK/c8d42gGVAuvXsviRDbvAUw53KMMoKhip3XlrZQDEvGm53eW082u9YdcF
         XHjA==
X-Forwarded-Encrypted: i=1; AJvYcCVN5vwIMxWghyma/6+M7FSn8N7W50rSohtL/1CxyvBLL7if8HbdGw4ESkyOOxcu67AQNueeqNn6D9X9mguV@lists.linux.dev
X-Gm-Message-State: AOJu0YxsRvf2w5jgPlhAY2l4QyVm/wUKlPSQRoxtdYA1zn1EWthX+tQ7
	FncVZK+xuEfEUX0nKlgVqEHVKxo364Zb330NAJhdUUDWzFfWhmN43662ew==
X-Google-Smtp-Source: AGHT+IE7qy7IyLD8O8OlyKzAvBJ0r/MYWALYgMTCMFrbVAK7sVLqv7zVLKEWVr8PbnKrt1d2U/lWaQ==
X-Received: by 2002:a17:907:e2db:b0:a90:13b6:3ece with SMTP id a640c23a62f3a-a90294337cdmr1196603366b.15.1726382467335;
        Sat, 14 Sep 2024 23:41:07 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:07 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 16/17] staging: rtl8723bs: Remove constant result macro get_iface_type
Date: Sun, 15 Sep 2024 08:38:30 +0200
Message-ID: <d382321bdd67fdce0ec2357920f67b5dd81ef426.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove macro get_iface_type that returns always false to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 +--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 4 ----
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bbdd5fce28a1..a6383f615686 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4872,8 +4872,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		/* set_link_timer(pmlmeext, DISCONNECT_TO); */
 	}
 
-	if (get_iface_type(padapter) == IFACE_PORT0)
-		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_CONNECT, 0);
+	rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_CONNECT, 0);
 }
 
 /* currently only adhoc mode will go here */
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 6ddd73b9cb29..c60e179bb2e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -452,10 +452,6 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 	if (n_assoc_iface != 1)
 		return;
 
-	/* Skip lps enter request for adapter not port0 */
-	if (get_iface_type(padapter) != IFACE_PORT0)
-		return;
-
 	if (!PS_RDY_CHECK(dvobj->padapters))
 		return;
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 2b12a2313707..57cbe2876838 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -182,7 +182,6 @@ struct registry_priv {
 
 #include <drv_types_sdio.h>
 
-#define get_iface_type(adapter) (IFACE_PORT0)
 #define GET_PRIMARY_ADAPTER(padapter) (((struct adapter *)padapter)->dvobj->if1)
 #define GET_IFACE_NUMS(padapter) (((struct adapter *)padapter)->dvobj->iface_nums)
 #define GET_ADAPTER(padapter, iface_id) (((struct adapter *)padapter)->dvobj->padapters[iface_id])
-- 
2.43.0

