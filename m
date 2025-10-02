Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151D274B3A
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425843; cv=none; b=u2AfnlT6xH4ohRTJNiCtQgkHnEd2qMSuWZ63HQgx8ePpVl8zWknU8aqS3g52chJ6+eNdTn0eUhdCLZIF8wH2EO84CyU/0ljFDzGlkSgznMvCs9Ps/pyecwJg3+1m8KxdC+I132K9dND0t4A6pIpLK/PPjvny9UbiR9AcEYmXDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425843; c=relaxed/simple;
	bh=XLMY6ExyY6u6fV0WN7Z3qcEwjCdaVTdq/bJcMA4pmIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YNoI48Lo8PmrCToQJO56Xd5cP1xoZAF0PlWl9Xx/c3+7IiLU6S1xCwbQ5TaxOPX7oHQmcR7IvS4RZ+0fTakWlM8Qp8AtUE07mf2oNio+6s+2t8X1zLzYkIopQNG0XtUv7iTT2jbr6HPKxUXiRS2zQbLPM/lt7lHb7bL080Geb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huO6Yli1; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huO6Yli1"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4e4d9fc4316so15596061cf.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425840; x=1760030640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoZMG2H5XFtwBXCa7Edxt/CDBvIRhOXOvs0bduMCYtk=;
        b=huO6Yli16LTFVYYfxmXL+PrHqkhV9nzV6ZqNQiq1eOjQ1TVcfNwBBl5sIxTtXsPg1A
         kQkVoLrSIs+BlR5GUCBnuzFB4KO+qhdgAen2Q1xX72QKvle8D6R0zVJWv+iuhKYNqiEw
         ZqBXO2Dck8QNL45tcOeiZ4MJV3nMny8ZKJgop4DJb8H5P7+9ggd+pFKSS96NNg4g9vzh
         Qlivj6rnsOqa+Q5OTS7hIOeD03F40SBr98nQkl4/rVPQcWvK7CLT6o+ONuprdQFquqkE
         XUsTqOoFyzEVA1ge2i3xIn3NCnjNpMY+V7KMI8tg+jmOnsDhKzI+yyUpVktGQViiV+7A
         Tk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425840; x=1760030640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoZMG2H5XFtwBXCa7Edxt/CDBvIRhOXOvs0bduMCYtk=;
        b=Q7itkaaMA3tDRcdnqUE1Z0pXZpGFBJOmqSfcPZAh3C6+2m8o7iTQDRP5w55N70Sy5v
         kw2SWJon8wsDIcqHTVohEIcSedvubLhYllFrTpds3gG0OFvGUz3nYeE00o5wTEGn1Ldq
         YEFvEz5tldaYyYnhaWhNkspUiNng//sYE5ogJ0cDbKH35o7tGcAirnguSoXbh+I/HK9E
         Mea9HZQjsv0R0gUo3/Mi5Kifc+cctHg8Yk+JTxUucEhxB+DGRxD2zMM5dQqwhZWOBRU/
         F+pvrUUUQipUwKMd+ygbab5ZeAQfob/hWNpbXSEy4dgS2vhUJukdmlBbGOCNFE12m5/a
         vkXA==
X-Gm-Message-State: AOJu0YwnlpQrOfpXxL/ZP2Xe7CTR6Ye5TmEBqBoR3QB5J8WtWgNTInng
	7rQonSDEwamRdAh4eMc5hFE4bJxgIPEig/YGe+z4bqY5ddB10Yg3yT7X1pQIlA==
X-Gm-Gg: ASbGncuWfn5ZluadMvgeSmrqP5QImC1geLaNCT/fdr660Y5IdXIoDb4wtYm0LuZTKJq
	lZaNWdvswioRfWvUudZEfziuU12KuEpcAdUvteKBcx+9E6CmLGHfOUOdCNKTauhDvitMjxRqtuD
	Jha2K0N9ZNuSnFgNDsn4kEl9xYbcimr9RXbvJG/sMSl6rfTkU26E4+uwy0bdRFG3TjbA98LtB9i
	fjDkPGIb9UZ5ssTitBmsn1w1GTjArAROI0gXvcaPb4PFre+Zrg6BgWAhwQT9PYvsoVI58aAqjE9
	ThxmkCQ6hYOBNSG1yAvyD4H+lE9lomlnVI7wIgK7FJUn972w5AIhsLB/LJ8b6rPeJFTUUp02DuI
	tLLiaTDvFF8x8lkYZ5LP+GQzcyx4SHER7+rUYY4xpZ6M8mG8MffT1apPgbf+lVdbc0Jae2SUfqw
	Q=
X-Google-Smtp-Source: AGHT+IEb9ym2sEaLOwaU7JZLamaTF20zBlWyIBwnY70sa8szndTtJluJszAmcJXuglcryN7DFe8gZA==
X-Received: by 2002:ac8:57c3:0:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4e57697253bmr1853621cf.0.1759425840226;
        Thu, 02 Oct 2025 10:24:00 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:23:59 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 07/16] staging: rtl8723bs: adding asterisks in multi-line block comments
Date: Thu,  2 Oct 2025 17:22:55 +0000
Message-Id: <20251002172304.1083601-8-vivek.balachandhar@gmail.com>
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

Format multi-line block comments with leading asterisks

Add leading asterisks (*) on each line of multi-line block comments,
in accordance with kernel coding style. This improves consistency
and readability of the comments.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ba77040a8d8d..ac313ec06587 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -217,10 +217,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -322,10 +322,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -489,8 +489,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ * Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -523,7 +523,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
@@ -1891,11 +1892,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 }
 
 /*
-Calling context:
-The caller of the sub-routine will be in critical section...
-The caller must hold the following spinlock
-pmlmepriv->lock
-*/
+ * Calling context:
+ * The caller of the sub-routine will be in critical section...
+ * The caller must hold the following spinlock
+ * pmlmepriv->lock
+ */
 
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
-- 
2.39.5

