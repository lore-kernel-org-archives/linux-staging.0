Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883A2C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id r19so5216920pfh.6
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hs9DY75/VY6KIjzo1a64wWbEFVmS6NW//YA6Jf9CUb4=;
        b=L7NbQPE0syDYGE1ddofCCp1z+t90MeErgcI/4BbheKn89HzKUitNQ5QSSSJO4DHe51
         piFRwUAm4OH3rcmCpE8Zg665LX1GuxSqbhEQVp5vKXC+ijsK4nSHWLCI/71xSUzWT6p1
         DBUzn7sBfmaZLL75vKUt4p5gXd9+ixDfLBSs1Id88GVQKCMMioMxr8eQQrSZuwJNywcg
         K7mUfTaHL2tSXLDNoTpsTjSTxMW7B7yZYeONmjWKnW3oZDNDFN+hcW4zxrebck/O5Hqb
         CmaXPo0vt9mXGaQaCdTthcmg8GcT56QqWfP/fTf5StZ31TDQ9C8y2iNxz6oSOweFM6Fs
         pGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hs9DY75/VY6KIjzo1a64wWbEFVmS6NW//YA6Jf9CUb4=;
        b=VuaRr7/JUhdAb1ujKgjpk3yaxUK1o24+Se8Laa97/JG70zzvu7PAadKG9ZdudMf/r2
         f2ZUh7Ll/Eh7vZ0PgyVbIi08X1b8leSGQwHE0lX3kiYWsOc9aUs33NVomN0rwTOXCjON
         jC2haTc4kPLMCIdhTN5fcqTwPn+67UGwQdwnx1EYic1X83mk06ZPYs5MePfDf5+BJ+uq
         vP0uEmDqxFebLY9ziHgxwXMTnuNa7RoSTvdrNyKm4ogdW0GGy7EMs7letpVg+E+2xHAt
         WX1SB5FNeJTl+gKhW3HQSGQQRaXdA1/s/+1RBIVa9XKvLNk7CSEX8saKtkuhy8LU1UMm
         vJvQ==
X-Gm-Message-State: AOAM530q3I9elXbFLEp7rN8QLuIhmBl7cVU8HmOiucRRB++JSZ7ExwS4
	QBgC2ukHIfPKyLPkoUSOKdI=
X-Google-Smtp-Source: ABdhPJxbcKappCAHTfHoKEJ/GFWu323ixU8DxvXUynUmEGcR/PzlHcfMhmJ6pzCtPMf088I7eMxfSQ==
X-Received: by 2002:a05:6a00:1382:: with SMTP id t2mr3211098pfg.31.1644424654196;
        Wed, 09 Feb 2022 08:37:34 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:33 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 3/9] staging: r8188eu: remove empty function rtw_mfree_mlme_priv_lock
Date: Wed,  9 Feb 2022 22:06:01 +0530
Message-Id: <8b6d750b049f875370996258aedaf89cf0f198d4.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of function rtw_mfree_mlme_priv_lock is empty. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index e1e358c94ea4..0abad3c78f82 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -85,10 +85,6 @@ int _rtw_init_mlme_priv(struct adapter *padapter)
 	return res;
 }
 
-static void rtw_mfree_mlme_priv_lock(struct mlme_priv *pmlmepriv)
-{
-}
-
 static void rtw_free_mlme_ie_data(u8 **ppie, u32 *plen)
 {
 	kfree(*ppie);
@@ -118,8 +114,6 @@ void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
 
 	if (pmlmepriv) {
-		rtw_mfree_mlme_priv_lock(pmlmepriv);
-
 		vfree(pmlmepriv->free_bss_buf);
 	}
 
-- 
2.34.1

