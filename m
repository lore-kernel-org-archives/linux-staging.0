Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE65A320C
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z2so9159857edc.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=MiGVrw4JALqFboIbdo0JNwpxU3evPgpPsmBSJG0+KfU=;
        b=iJI5prIZyNpks5TyznfeEWp2hYghqEdV+Xt/0Sgb1PurTzOm+1bVNpbSXH0MajAbzn
         q3+CfLRPpkT2S5OWFX0PBvkob7HLl0+K8G1pwW58SsAA5gJ/2vdw7MRswQfpphFxKwGz
         dNF9iUqarZLj39LWt/2DjIacoUeCmz1tnoo315mDAIprdJHAEnOkIE1Q+nme/ghF7LkR
         hmrN+4kDm+ueoYZPCIT1N/cQ+MddjpzXwfdjBmXrxv3JQiN3wpy0bDsXFBgOYVQlyCrS
         09m6G5j1fAWA8+gY603vJGEIGfvDsOkEx5A5M9nIUZM+tbo4oAuUUWssjwPjvgRns4zR
         Lc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=MiGVrw4JALqFboIbdo0JNwpxU3evPgpPsmBSJG0+KfU=;
        b=IjNEFyP44CstbSTR6LGNB8wZ6Lb2J28Za7WiN43JyaVF5jHSh+k4c/SfGIu5JME26H
         jhtHvv669XozcsFoxpa6ItjrN9B8ABTusG5MRK+5M9uZh4jGI5hRua6+w6ekb6sMOBJP
         rH/0T0cyyKdOfb22UVSS1BsT75mM39jph/g9Nekwrwm9caGYlRqnjepzLEMPrkNNHRWv
         Kmhd3xyLvq+Cn2Wf32eci1EnP6ysuCs/zsj/xmrokxf26p8gqzpF8DyhIuG2ZRGVer1W
         DuyOriM7SqvJKOj89GHpkxlQeESFFyC9g+z9FhQBeC0hQOk8BlCdFnZu1vA5WiaV57iO
         OFhQ==
X-Gm-Message-State: ACgBeo0+XxEC9OreyTfdcdp7bZKuy1QeuOclEp9QWFqwCQqsvK+vG6Nk
	5a+aZz4pjtQXt1lnM2Ey7b4=
X-Google-Smtp-Source: AA6agR7t1pTTzCt11SKy5ZAq0leRubnuSHeY4d/dJh7WN7mvzLRaXh9ytv/Qnqkd+l/MD5qHxBysIw==
X-Received: by 2002:a05:6402:14b:b0:43d:a7dd:4376 with SMTP id s11-20020a056402014b00b0043da7dd4376mr10098052edu.89.1661019398268;
        Sat, 20 Aug 2022 11:16:38 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/19] staging: r8188eu: rename rtw_os_xmit_schedule()
Date: Sat, 20 Aug 2022 20:16:07 +0200
Message-Id: <20220820181623.12497-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_xmit_schedule() was moved from the os_dep
directory. It looks like the driver was originaly written to support
different operating systems. Obviously we do not need an extra 'os'
in the function name that indicates that the function is operating
system specific. Rename it to rtw_xmit_schedule().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index c7f69f7918b8..9e7e0034d352 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -641,7 +641,7 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-static void rtw_os_xmit_schedule(struct adapter *padapter)
+static void rtw_xmit_schedule(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv;
 
@@ -736,7 +736,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		p2p_ps_wk_cmd(adapter, P2P_PS_SCAN_DONE, 0);
 
-	rtw_os_xmit_schedule(adapter);
+	rtw_xmit_schedule(adapter);
 }
 
 static void free_scanqueue(struct	mlme_priv *pmlmepriv)
@@ -1134,8 +1134,7 @@ void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	mlmeext_joinbss_event_callback(adapter, pnetwork->join_res);
 
-	rtw_os_xmit_schedule(adapter);
-
+	rtw_xmit_schedule(adapter);
 }
 
 void rtw_set_max_rpt_macid(struct adapter *adapter, u8 macid)
-- 
2.37.2

