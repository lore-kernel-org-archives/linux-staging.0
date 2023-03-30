Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CDCC2FE
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 12:09:09 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q206so11150085pgq.9
        for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 05:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680178149;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJN/Czq4gYPwe47Url11H0QkQkrvpH2S48xhzpmgh0M=;
        b=e0Hje/9IerS8i8MDIgpqNvqqkesrKwAP9AqAXG1rPI0YRQPXNXuliMaFNsOyyB5DO7
         87ou31fOIIJcmoDNAWw0pbpmcRsJQFQdno8UnxR/o526zvoLorsHuTf36cxUcbzPOIK1
         orF+AlOC1NKhj32aEOI0PdtCS+Fksil/7VRMBdf8Dlq6SgesdmOSTUp8n84gyVnqTayF
         XTdBp9/CZ9zaeUL3FItmagVdsOjvzQ2NU+s1aw1s5pdNcu10h9vIvyFJeqIheo7VOgg2
         46Qvz82eDIxof2xtBHQ97/SjEJaUju8h/RMYUe41btBoh83K+Oxli1oZ45hGF/W5oE+9
         LXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680178149;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJN/Czq4gYPwe47Url11H0QkQkrvpH2S48xhzpmgh0M=;
        b=CFz0IW4NAIz0li5pMKOaHgmDGFruJLnHzmaoxJsNHfJST+sWe5W6HgfHkHdyLjc/aW
         vvwwpRt92Xlg95TuT8V7VkOI1D09avAkRVs3O5CXZmHSHi0pmE61QoU+P4c7hvqX7NqV
         KA0WPVJJwI6x1e3vZjmgtEGBG7jFKLK7QC+qDpmUzMuFNTq6L25sYuoCI098jZ05kmqs
         hhKrkpzhm0sINReS/PQvPD3XIR0eKW4l5AFw8UqTBr8Yo1x3rRXIwPHgSe5y2qAJWBtz
         3ci8CdVZL8fHnZbDEnKpQ+XmhEHEGLc2DqBsu9kzFMpWrZK0LZPXBZmVzqNyNw3qHwrs
         SKlw==
X-Gm-Message-State: AAQBX9cXLO/QJK68M4CYczfryn0Xlcb/0WPrRK7qGJJ1AAbaT/Pnl0ZH
	CJ6SwiOENTmMJ+Q9Et0ajWeAa6qJn69CGw==
X-Google-Smtp-Source: AKy350aoVPsGGRoTS9WV+WnwYMuA9E6PjMr6dfV0cSbx+5Xb6zjV1VkGSth3oIC1e3OI4pv9n7bp5w==
X-Received: by 2002:a62:7b91:0:b0:625:cc03:df33 with SMTP id w139-20020a627b91000000b00625cc03df33mr18637495pfc.31.1680178148838;
        Thu, 30 Mar 2023 05:09:08 -0700 (PDT)
Received: from joel-ubuntu-desktop ([2407:4d00:2c02:823f:14a7:49e0:2d87:e0ad])
        by smtp.gmail.com with ESMTPSA id z24-20020aa785d8000000b0056d7cc80ea4sm24773084pfn.110.2023.03.30.05.09.06
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:09:08 -0700 (PDT)
Received: by joel-ubuntu-desktop (sSMTP sendmail emulation); Thu, 30 Mar 2023 20:09:02 +0800
Date: Thu, 30 Mar 2023 20:09:02 +0800
From: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
To: linux-staging@lists.linux.dev
Subject: [PATCH] staging: ks7010: remove unnecesary parentheses
Message-ID: <ZCV73vSkKb5WzHa9@joel-ubuntu-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove parentheses not needed in if statement

Signed-off-by: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
---
 drivers/staging/ks7010/ks_hostif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index af3825578d85..8bded7e88ce7 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -129,7 +129,7 @@ int get_current_ap(struct ks_wlan_private *priv, struct link_ap_info *ap_info)
 	size = (ap_info->rsn.size <= RSN_IE_BODY_MAX) ?
 		ap_info->rsn.size : RSN_IE_BODY_MAX;
 	if ((ap_info->rsn_mode & RSN_MODE_WPA2) &&
-	    (priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2)) {
+	    priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2) {
 		ap->rsn_ie.id = RSN_INFO_ELEM_ID;
 		ap->rsn_ie.size = size;
 		memcpy(ap->rsn_ie.body, ap_info->rsn.body, size);
-- 
2.37.2

