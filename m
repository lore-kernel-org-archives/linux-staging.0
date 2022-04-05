Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6928E5
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 12:43:42 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id b13so12046728pfv.0
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ihb0Oo6uzrJ7i7ES6RnGudcZVN/CipVYf3jNZpUHQLI=;
        b=cOtTwbNQi5IfZUAxRf50Bs1HOneUA1zU2agmrl/ioAeT0pNG68hoBDlfq3E2n5c/lm
         v8Vz/drHW7M/EqTvitrTgJprz83zD6CN8Y5ZxNedn4ZiF7oQdLiGXSPhNe0bnbhEEFyI
         GLeckXj6/jek9wnvFOTbFHCwxWPEJ6PaHEZsyqCqfB9+apiJ3mJMirM9BKGgRFqs6Lav
         862usk14tutu/G40euP+x93V7lpLIeWn/TYYAkaL/ScLPPhMjCh3tmbzRbivvSUTrpST
         /1XDrd79VUwISEPz95aoQNWKFRZxnz4QN3yFvd2ryTAUAWTeiIwv4uQU7yZMHkO0fwxm
         jZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ihb0Oo6uzrJ7i7ES6RnGudcZVN/CipVYf3jNZpUHQLI=;
        b=WN8eeOFfBcG6j4CK1pmVaDv1GefUDdQM53rZziRzAS6ztF88CWtpZKClmJpp3aKkcf
         wLwkG+lqVHgoOKZrm4UPGz5ZQ9AlOtbzHani6CL7Gtc6m/7VEms5kNXCsc2bwbRktwHw
         LtCK/bBh+uDL5zJI0ZNXW4B9uJqY+DDp3x1ew+uFsLRYivY8H/YHG443grANAxNOjgmm
         WpXCbdEHHKg+QtejRA5Slsn3d63iSvgz8aGs6Icw3kQ7wwbP380PsXIuoc1XHpGJygle
         UkL04bAe9JAojAPu2W6QnVGtA2ZdK/u71uuk353WtbMj4AkgXQNzSir8F81ihKjDhqlB
         NqPQ==
X-Gm-Message-State: AOAM532Xn7dx2Pevf+QR5003C/pSZYLgOZbEU+UphcuCh6c5mwv4uct0
	F5dJkg3i4KxuvOZq/czmkQY=
X-Google-Smtp-Source: ABdhPJxdx0qvfGREqNKAZXchciButDkbJSdfo8FktryPSKjwwRp7EPJLapSK7+0w1ZkCu7xQo4BqpA==
X-Received: by 2002:a63:2d47:0:b0:399:53e3:5b4c with SMTP id t68-20020a632d47000000b0039953e35b4cmr2741835pgt.165.1649162621998;
        Tue, 05 Apr 2022 05:43:41 -0700 (PDT)
Received: from vihas.localhost.com ([103.85.9.59])
        by smtp.gmail.com with ESMTPSA id nl17-20020a17090b385100b001c70883f6ccsm2760014pjb.36.2022.04.05.05.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:43:41 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: drop redundant if check in check_fwstate
Date: Tue,  5 Apr 2022 18:12:39 +0530
Message-Id: <20220405124239.3372-3-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405124239.3372-1-makvihas@gmail.com>
References: <20220405124239.3372-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if check is redundant. Drop it and simplify the funciton.

Also, drop clr_fwstate(), clr_fwstate_ex(), up_scanned_network() and
down_scanned_network() as they are not used anywhere.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_mlme.h | 43 +---------------------
 1 file changed, 1 insertion(+), 42 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 37d217aaf..3b6f70ad8 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -453,15 +453,7 @@ static inline u8 *get_bssid(struct mlme_priv *pmlmepriv)
 
 static inline bool check_fwstate(struct mlme_priv *pmlmepriv, int state)
 {
-	if (pmlmepriv->fw_state & state)
-		return true;
-
-	return false;
-}
-
-static inline int get_fwstate(struct mlme_priv *pmlmepriv)
-{
-	return pmlmepriv->fw_state;
+	return pmlmepriv->fw_state & state;
 }
 
 /*
@@ -487,39 +479,6 @@ static inline void _clr_fwstate_(struct mlme_priv *pmlmepriv, int state)
 		pmlmepriv->bScanInProcess = false;
 }
 
-/*
- * No Limit on the calling context,
- * therefore set it to be the critical section...
- */
-static inline void clr_fwstate(struct mlme_priv *pmlmepriv, int state)
-{
-	spin_lock_bh(&pmlmepriv->lock);
-	if (check_fwstate(pmlmepriv, state))
-		pmlmepriv->fw_state ^= state;
-	spin_unlock_bh(&pmlmepriv->lock);
-}
-
-static inline void clr_fwstate_ex(struct mlme_priv *pmlmepriv, int state)
-{
-	spin_lock_bh(&pmlmepriv->lock);
-	_clr_fwstate_(pmlmepriv, state);
-	spin_unlock_bh(&pmlmepriv->lock);
-}
-
-static inline void up_scanned_network(struct mlme_priv *pmlmepriv)
-{
-	spin_lock_bh(&pmlmepriv->lock);
-	pmlmepriv->num_of_scanned++;
-	spin_unlock_bh(&pmlmepriv->lock);
-}
-
-static inline void down_scanned_network(struct mlme_priv *pmlmepriv)
-{
-	spin_lock_bh(&pmlmepriv->lock);
-	pmlmepriv->num_of_scanned--;
-	spin_unlock_bh(&pmlmepriv->lock);
-}
-
 static inline void set_scanned_network_val(struct mlme_priv *pmlmepriv, int val)
 {
 	spin_lock_bh(&pmlmepriv->lock);
-- 
2.30.2

