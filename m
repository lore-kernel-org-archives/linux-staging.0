Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36BF3FC4
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:51 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v10so22147238wrd.4
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUNc+8qOd4ajvWM/OEIrPhkDwrj3YE9cjHuomOPXBzI=;
        b=rRbnYXQ5kXpBufM1R/4cySspS7BM4bvj50xz7aiLPVNrpq5epQJ1ZlvPxWL8hrTY+r
         qnsnA5jKbBUL98O2IP5iOwdoveiQqfFqEfPxDqDGmJO5l4O93ZQb7XOKRmnV5pfUPhcS
         UuXUs6RgLZFsm6ZeDPTIoOYboITtuv6crpfchJ7xXiRKl59tkPoCnvj647656JEC4oyl
         jr0hDu4hdlZ16Xz7qXVn9QAYQ3OsISMpVz3hKH8HVx+OnOpdsMB/G1AM97WggImluiUb
         +fe1ofxtp8uEWZXetdry0yIe//SGuiXofPeNr9fvBnXXEDjFiQksRWJsF1lEGEW2vsyJ
         0ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUNc+8qOd4ajvWM/OEIrPhkDwrj3YE9cjHuomOPXBzI=;
        b=siPdXOVgMy5mO0+Z7FrgiPYx6kDTdcPa85rpyQi+nOrdDlmPBU2U8SINSoFqXKcExZ
         9v0zSof+9nRwSNHvV5SkW8CPq64nP5paoLLXSwnjSug5fMw1OvzOvv75kPNPUSCrFrNE
         Sz6sNekpDmsuRPKeCvzRUvH0IAHc6h8U7zp/mKyU/2GCPo88QefM6W+yF3/OEwtLMm07
         Gjlq26dYvsxSWj5sMM86MvmQ8io53kDrzgnToSiXpwDSn1vdI8PKXY1LbME7DXM+hqRj
         9Cjisrn2M4KwN793jvoX+LjjaeXbpDvH8fJrbV7z2vmaP4OsdQXSpTnF3jvs82wfjUAv
         w4NQ==
X-Gm-Message-State: AOAM533bSr8rO0G8m6jlimPD2IPmqTbp1sN/4CfnC15jCrt8rEJ2tCfZ
	+2pLCXu3LIDbBJsFTeT149E=
X-Google-Smtp-Source: ABdhPJyuW+fj0yXGx3zbL679xht8cWxAR7xD+OJgGGnVo9gd4cTgzxgIe+AJzEkYhuZX1djjTkl/xw==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr25044113wrn.303.1630325750307;
        Mon, 30 Aug 2021 05:15:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 7/8] staging: r8188eu: add missing blank line after declarations
Date: Mon, 30 Aug 2021 14:15:07 +0200
Message-Id: <20210830121508.6411-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing blank line after declarations in rtw_macaddr_cfg()
to clear a checkpatch warning.

WARNING: Missing a blank line after declarations

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index c37358be631f..f76c762ccd4b 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1021,6 +1021,7 @@ u8 key_2char2num(u8 hch, u8 lch)
 void rtw_macaddr_cfg(u8 *mac_addr)
 {
 	u8 mac[ETH_ALEN];
+
 	if (!mac_addr)
 		return;
 
-- 
2.33.0

