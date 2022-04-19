Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C671384;
	Tue, 19 Apr 2022 18:19:53 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id i14so13764136qvk.13;
        Tue, 19 Apr 2022 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1/ie4QuWSXXgB+xp4DMhBE7HLrajOsmWcuUCsf6X4I=;
        b=hdaKTXpzMgU7K+djFEqGEew0POFWTwy/yslxAuKNMD0SaPrYTGwDse6J9unjK/yYxf
         AzS+9BkBWpKwFPb4/aIKs8q7UvilGIyCwj2WD+n/jWJxeWhJalWfhaWW8hArwixxnnJ0
         eVRAcApf3qBVWKS8MaMqxYL84fMNZRMfBH8H2jGJ1y2iTyFmAJjQv23fMYDdx8sMj6Pt
         cZxwt/kcmcvqIsDghKsSDTUCoNUhm3zWRKjYGjbamswqYxwjTVzhxKJ8Qa4HwrBM0B2D
         xNWNc0zxv6VNqUMMC8nTUg5HY0jX0rR/V0nFtUlxsKed8aawq3f4S0OYyBpnWS93/WZv
         FeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1/ie4QuWSXXgB+xp4DMhBE7HLrajOsmWcuUCsf6X4I=;
        b=EZhEy+unMloHmxN2ptcfBAcibVf84iD7GCK7IZAvp5mNMc5JbN34hYHbTkaaMSHJIG
         vc7KuLHZ8uxi2Z/C/sqIPLhRLRk/+y46eB5U4isjzYC0lHrhayBtlWUkxmoWm/vKpgyU
         jJVBvUlunzWQc6OYu4AEMXqAhjFsrXCa5/BeXJ+/gCah8rItfQDxNsVZq3BqMOhJDJC+
         t30XkJNLVUhmOJrS8JXRRc6h2hsshipkMAWhUYmqysQFCc2TyT5Z4SAwpO+6tzDjMUi0
         6oHsV2serkZDOkUR3+bXDsTjopyFZ1PMYo8+cTR+DjnedJzGhgaXrigxGUqE8NAR0GRG
         WROw==
X-Gm-Message-State: AOAM531n/rXs2dSoIoXcfw5YW2txIDY50xh39Y27IaFhYxYYRJxFLvzO
	DdgHKGTvlYzJXRsfosTR5EI=
X-Google-Smtp-Source: ABdhPJwJtueRCrxqkAyYZLYLe58f+CxKoMRLxIKN75UObTXcycf/iTcnWI6/CrsTLzO4xhztd5vGNQ==
X-Received: by 2002:a05:6214:262c:b0:446:3464:57cd with SMTP id gv12-20020a056214262c00b00446346457cdmr12636468qvb.89.1650392392426;
        Tue, 19 Apr 2022 11:19:52 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:51 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v3 5/7] staging: r8188eu: replace spaces with tabs
Date: Tue, 19 Apr 2022 14:19:36 -0400
Message-Id: <48b324c1be1c26f34d793a0b5cf7933b41882a26.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650392020.git.jhpark1013@gmail.com>
References: <cover.1650392020.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tabs instead of spaces. Issue found with checkpatch.
WARNING: suspect code indent for conditional statements

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index adaf0f813a97..173754c127e3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -704,7 +704,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
-			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
-- 
2.25.1

