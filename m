Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE62F3C;
	Wed, 13 Apr 2022 20:11:46 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id z19so2212912qtw.2;
        Wed, 13 Apr 2022 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mu1OAjP3SMnZkiz81iTb0qSVH6tSWJDl8+n68t1vXxE=;
        b=BvJqGIXBkaxZ6cFuP/skqWxhW0WFquWrQFsXQyCwtTZDbrsG7wPCFnMl9VAo1hRimX
         5K4rp/x3o6C2ap3DrWJculrIIVqUrjX4f2Z5EBQAzoamuHRAB5jxD3z2l0nwzgunCtwi
         buWTwmi9fLz09m6yv/ENfSUlEwADTUpUeQesL+JCgKyT6LqcZa9yK0dRabPg67s/nLmr
         clYqTZFuFcTn8xL31/iIhirgMMZq8/9p+j+do206zI8XSNr1a7jfRFlYteLTMK82xQtk
         /wNUqhrx3gPIEEBhtUEXJ/bmZ9K1TIyI+0ufOFWsjpdbRnOwbxgUbpcLGPQqBqkZiEA0
         fnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mu1OAjP3SMnZkiz81iTb0qSVH6tSWJDl8+n68t1vXxE=;
        b=yP3oaSnZ4rhxBBa0fhvgKkJm0NGP0GgcsReCxdx9eOyb1oe3pCBQah4vfUYN2Tc9+V
         sD4+UmBWeh/WaByDrT6pnGbZ+bN4Llne+CGTH1FKIVlUBNztBwWL53Bi01VOJho1LX3P
         Hno39QABISbureeMEdUQEV6WSf4qJ6FloZXJtDYgYDtJ3cljakKD7MW5Vl0WvDDMgNH0
         w9lOl8jxJ/x/ZhHfMexA+C3jzW+4hWEoXxh0ZiO8+JJmlZ0kbQrwXUiSHaDt552nozNc
         ZMyFg1k6rZ6cpQNaxt1Jox3qR5R5e+aGp6Zu/19kWttFNfC9Lns5IidRUaPFDfhoYQfQ
         6sYQ==
X-Gm-Message-State: AOAM530kY7l90srT2XrBB54wKFTJrxRq/t4ETGNJjW0/V3AXOZoG4hSf
	SdObPbAR+5XsK17DsYxcsaU=
X-Google-Smtp-Source: ABdhPJzWCouMMzzabzOWqJItVPit5N6AJ34ifKNKxlogdLuP54DDtWbfXAVgf9JrI/WQqR5+J+CISg==
X-Received: by 2002:ac8:5f46:0:b0:2e1:da61:9734 with SMTP id y6-20020ac85f46000000b002e1da619734mr8625056qta.205.1649880705951;
        Wed, 13 Apr 2022 13:11:45 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 7-20020a370907000000b0069c5598584esm1469827qkj.105.2022.04.13.13.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:11:45 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH 3/6] staging: r8188eu: remove 'added by' author comments
Date: Wed, 13 Apr 2022 16:11:31 -0400
Message-Id: <c0c0a0e748ad85585b65e73841d431adefe86a59.1649880454.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649880454.git.jhpark1013@gmail.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Author comments "Added by Albert" and "Added by Annie" are sprinkled
through the file. Git will keep history so these comments can be
removed from the code.

Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 2cfd8e8d74a4..5adef9b9108d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -909,7 +909,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
-		/*	Commented by Albert 2012/07/21 */
 		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
 		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
@@ -1628,9 +1627,6 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/*  */
-/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
-/*  Added by Annie, 2006-05-07. */
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-- 
2.25.1

