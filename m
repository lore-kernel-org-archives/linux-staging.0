Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7273FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:08 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i6so10555164edu.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYfDSWWLfbRbSNVuId0vyBxYwKOU4bWEtZJKFkrF65E=;
        b=MHbWuWVD0vZCejmgPY/wtmLFAlAwwMFzuocwyanmRVnSkQ6mCTwhicCyyamb09x+Gq
         k04cDeqCkw4SXZ9Ai0Cu9NcApzxIiunRfgiaANz0Ea6o7AY57Kzr4s+cfxCq0NyGtSYK
         5kBeBiJ6lwk7OdSKWuRmTQVjGwh2XYHRoPQVhesDXqNQ68/1DElrdwzOnV9TRV6mA/n4
         CiNHddzEsICv1mnDVeUTRQf4rAi7NOPVBcCZT+k7VmMXLZrJimdC9/w8pu5A43FvPGG5
         Xc8Ru4rT4J41By+qwPvLQ6oU2HD4/VO+bhe9x14zxGOzAsnbGroZR/c263LhS3pH2pFC
         K9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYfDSWWLfbRbSNVuId0vyBxYwKOU4bWEtZJKFkrF65E=;
        b=Z5RvKnI5yF4VtUHDHJbsRfCTViNyq397HwID8CMWeOzcjyi/9bQ0PDOPeygGTB2yf1
         s69lJTKnDQcORl2kWW8eWsKPk6aHMIzUsqUSHQ8aSEBOVEOiy1bOYjEEUtFvV9JI6SZH
         sJzNo0OPhHUrGbkLnV4X+AZ53orNow8aRmIHUqcBsg3S85kt5t9Ve8t5tOYek8RC8z21
         SDDid9XukNDKiVO00pZmSVJUiQB6Nbdknv0DCgGHjuFP4Q50J/VIgiZPeGsMUyNX10qA
         yA9ma4l/Liz2pwBou0f+X/FVhUTReI0xGLsTemDMsXqqNM7zxnPPgZR0pc8QCtBpFx3V
         wXTw==
X-Gm-Message-State: AOAM533SO/4q3Y5bb9zAeKpJghk/ufqHg3qlAk0WhXVab2r5guNq5VYu
	g7gA3EcxWW8gXB9tAV69XHxjiMbcnilHsg==
X-Google-Smtp-Source: ABdhPJz9B+j6Nntr0yDi/jttSoTS9bICVvyHFwLLk4MWkQtGrZqBUS7SNS03NGsE1ba5cgLi/PSt2Q==
X-Received: by 2002:aa7:c790:: with SMTP id n16mr14723358eds.223.1630952706657;
        Mon, 06 Sep 2021 11:25:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/40] staging: r8188eu: remove unused function rtw_interface_ps_func()
Date: Mon,  6 Sep 2021 20:24:05 +0200
Message-Id: <20210906182438.5417-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtw_interface_ps_func().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 8 --------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index c3897b29121c..00750394c50b 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -473,14 +473,6 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 
 }
 
-u8 rtw_interface_ps_func(struct adapter *padapter, enum hal_intf_ps_func efunc_id, u8 *val)
-{
-	u8 bResult = true;
-	rtw_hal_intf_ps_func(padapter, efunc_id, val);
-
-	return bResult;
-}
-
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 543f928e8089..8446dfb50f34 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -251,8 +251,6 @@ s32 LPS_RF_ON_check(struct adapter *adapter, u32 delay_ms);
 void LPS_Enter(struct adapter *adapter);
 void LPS_Leave(struct adapter *adapter);
 
-u8 rtw_interface_ps_func(struct adapter *adapter,
-			 enum hal_intf_ps_func efunc_id, u8 *val);
 void rtw_set_ips_deny(struct adapter *adapter, u32 ms);
 int _rtw_pwr_wakeup(struct adapter *adapter, u32 ips_defer_ms,
 		    const char *caller);
-- 
2.33.0

