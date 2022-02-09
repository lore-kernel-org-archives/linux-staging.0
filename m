Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB52C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id w1so2675634plb.6
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M2QkYn3tS9YYn/jL8dJZWX1Fky3rroLkJnwOHTcUHaY=;
        b=f5pDTcIQdMzUEvSNgxCenI2gIq9xhGYg0sBWtjg/RY7ArchFqKtD1sdNQGa8iMdBQF
         Wy49+eJYPpNrKwkFI7HUXTXx8i7yP2XR2K/1IeWGmZO253L6icPfqsYCP/xjsRipKn3A
         mKnOtVHDJZ9lKVg/77Es25y5RUfBLjguaNxA0ZIiq4IqfcWNJ/1PBjf9HKEfmUmATFVo
         Mnu199ptCD2qtwJQfbHzvTi8RgBOgT3B9sTMJZ5fe0MAhUTSja6kM3B7qYFIFEKEEr/k
         PfRCdCW1QMD/wTOuq9dXXdzOpzAI3F+X9/06qTINwQrnTHCM0XYTuCz8w6siu8063ZSO
         +5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M2QkYn3tS9YYn/jL8dJZWX1Fky3rroLkJnwOHTcUHaY=;
        b=i8xzQWuQ4PiIRdePJsRDoG4bYv8KQk95x6mNgQh/eBYfQPV/GmmuwqoMMIKNYvIrK/
         mZw+AUwRUqPlTxg+R1KdMXdFVPsWGxAHBMSxEgew9gZFx0Ml8hNhglIo79uSaqW0aZbE
         wI6dYmIhmyNli8brD6K7Wul+7lF5KV99jmkcRqU9qPuP4SFnyEwPUBx7mrSeIsfIU9cr
         VhG3aZZb6ACbCUNT/oeSs5+euXukmYHH7NDzuXJ7e4nJGwBxFdZdoLFSz9PuC3oq2fa/
         URV8GId2ZgbSLC9OoLbskeapfwBvbHyLbbDWmPaHTMa/comAQDtoW9a9j19SMKa/X8xb
         qFsA==
X-Gm-Message-State: AOAM530aLk+xGlzrPWy0VtI1obaGdZ8zxwws5kq8Q0clpy8zzscfPCx+
	BewWz90zcgsKiQsOsGtojv4=
X-Google-Smtp-Source: ABdhPJydEnNGbrkPgmd+XKv2WxFOj6agK/nbiYf61Loy5AcF0Htpgjq6Y1eGWq88gKOeqnjKyyWR6Q==
X-Received: by 2002:a17:90a:d991:: with SMTP id d17mr4315457pjv.150.1644424649914;
        Wed, 09 Feb 2022 08:37:29 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:29 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 2/9] staging: r8188eu: remove empty function rtw_get_encrypt_decrypt_from_registrypriv
Date: Wed,  9 Feb 2022 22:06:00 +0530
Message-Id: <3d84df54e73b49464d2a0732b44acdb71687b3b1.1644422181.git.abdun.nihaal@gmail.com>
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

The definition of function rtw_get_encrypt_decrypt_from_registrypriv is
empty. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 7 -------
 drivers/staging/r8188eu/include/rtw_mlme.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 038bddc361c3..e1e358c94ea4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1020,8 +1020,6 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
-	rtw_get_encrypt_decrypt_from_registrypriv(adapter);
-
 	the_same_macaddr = !memcmp(pnetwork->network.MacAddress, cur_network->network.MacAddress, ETH_ALEN);
 
 	pnetwork->network.Length = get_wlan_bssid_ex_sz(&pnetwork->network);
@@ -1857,11 +1855,6 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 }
 
-void rtw_get_encrypt_decrypt_from_registrypriv(struct adapter *adapter)
-{
-
-}
-
 /* the function is at passive_level */
 void rtw_joinbss_reset(struct adapter *padapter)
 {
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index ed2a50bad66e..1e16fa615b94 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -549,8 +549,6 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter);
 
 void rtw_update_registrypriv_dev_network(struct adapter *adapter);
 
-void rtw_get_encrypt_decrypt_from_registrypriv(struct adapter *adapter);
-
 void _rtw_join_timeout_handler(struct adapter *adapter);
 void rtw_scan_timeout_handler(struct adapter *adapter);
 
-- 
2.34.1

