Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB602F49
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 16:58:42 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id z5-20020a17090a468500b001d2bc2743c4so2257622pjf.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y/JwM83vEyJYw4lhNwuusBWh1f+jSke6lCkPjly6Ebc=;
        b=cjLxjZ5pPM/pB7JnFzLZXYKAccowQfJbaFGPyDuax5hjiGW8t39TNg6rtkpShjEIC2
         iRsEDGwejDrW222GwsVt6E7/hz/MnB1FhiKwFYq/WAZTB0G5fpqWzXTbgVOLU95jUwo9
         V1XdeM2tBzhDz1Lw5jRcxLTi/4iKhiDorhwJApIT2fzfEBE/4PEmjHRlR/hK6pdN3Fbf
         byTeUyjzVC24F0W48i7MkUCL/a1VebVEQG/AVZ4cXq/iU2wg+LNWvkI85IahkpnrUjhm
         G+Yt3nFRy6+OfAujsvis2Gy2DVEO1lpMRDGFPXmCsbutYWOO+3TdY4A08SEksQ7NByyw
         faTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y/JwM83vEyJYw4lhNwuusBWh1f+jSke6lCkPjly6Ebc=;
        b=SKEflgfBSLVbIDQKJxaqrhgClQLnQAUdnryZ/zX+k0adkv5KaM3Ad9GxiOWIBVZqKp
         uk+mXux1AipUXGSVvy7N0TyXQ6GZl3Xl8Y4nDp4nUvuwIf1p0OBXbQeVZU7uVf6Sjp0a
         mbV3GcA/MDFWHI6k721dN50B5AoY047xSc6ZNcGAhm6Xe/1hLb2l1JhFDN4rTHvAm/sP
         wFiM70NfgP5WVt34KNlisycLSAshGst+BS07t+rSIpEdm5lrk+0xFlmShAvnLhCPNMrB
         fa8azf890z1dx/vJfBxmJCWzD31dNiCVDkamQNfHmjJtORkYo6y34YufBfl/bGJxlPkf
         QzJg==
X-Gm-Message-State: AOAM5303yV00WPOkgE1aUh/xLKbs1PVFYp1f77cT4DaxndiLs+usSo2q
	6iRscg71JyPAfq/4LoBr3ls=
X-Google-Smtp-Source: ABdhPJzrsOeX9sw7o07/w+XFOTLhvPc45yPbOC5DIw81qtPrtiKqiDsXw9GVHNrIhLFVqpN37G6Hww==
X-Received: by 2002:a17:90a:d584:b0:1bc:e520:91f2 with SMTP id v4-20020a17090ad58400b001bce52091f2mr45201814pju.192.1651078721541;
        Wed, 27 Apr 2022 09:58:41 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:e0d6:603e:265d:6bf])
        by smtp.gmail.com with ESMTPSA id t15-20020a62d14f000000b0050d3846c538sm13050483pfl.57.2022.04.27.09.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:58:41 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2] staging: r8188eu: drop redundant check in _rtw_free_mlme_priv
Date: Wed, 27 Apr 2022 22:27:49 +0530
Message-Id: <20220427165748.10584-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a NULL check on pmlmepriv in rtw_mlme.c:112 which makes no sense
as rtw_free_mlme_priv_ie_data() dereferences it unconditionally and it
would have already crashed at this point.
Remove this redundant check.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 v2 -> v1:
    drop the redundant check
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 080e07385..353f3eaed 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -248,9 +248,7 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
-	if (pmlmepriv)
-		vfree(pmlmepriv->free_bss_buf);
+	vfree(pmlmepriv->free_bss_buf);
 }
 
 struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
-- 
2.30.2

