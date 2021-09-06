Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF4972
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:09 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r7so10593247edd.6
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYfDSWWLfbRbSNVuId0vyBxYwKOU4bWEtZJKFkrF65E=;
        b=DIOXb3QGd6Qs6IXG5XkvUzPdWsLv+hNTwNbdtgd5inOC4qvIcltIuV2Ss+HSsAIvT2
         hYNCD0NIjSs8aVIOt15PhQ++M6N1Qi5WA1tw+DQYxaZHZpuVUDfJ+vhBWBkvDR4kfZ+z
         tT26rWc7oeAzVRHdNof5u+2Jt/Cnu4Tg8m6HVAEaclQc4ICzv8haXlxTNyftlYeh0isE
         wkgWaT+IGamqFe7acEl6tAG+zJ1qHANUfgi5tdL6Hq0ZxaZ+yEDaMEko7sFBYYVsOp38
         q8K/pyWKhzZJL13VycP1FdVG0IVAZSRSbKrtcdPQAHNsYx8IDcZiwrZ9p15FYOzes63j
         423w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYfDSWWLfbRbSNVuId0vyBxYwKOU4bWEtZJKFkrF65E=;
        b=rjJcZ4xB4nOd/pg7qAMFNtk/pyoxXNHIcl201EmngWff44xZdMJfK63M3sSAdKzvNH
         jtMUcBLOY3PqIq4q3UTMc/K+NiDPxzuYQ4VItHewrzAEYxw/ABeVdgT5KlDnv8EldHR0
         YLXj6QIwe3dWekQYmi/p21mNG4lJrou+j3o4bh+oYg82j0rvgYIloVNVh2DDOzuADZFZ
         69C7+kn1/wdBU9AAwj0PgmempbYrehC8FJsGE263tTBILd8vWhiOget3WFpqJ2oRg0hI
         ax6KyedT5ODWIA3jKCSd8zztEQMcY+DYfF+GymN2GbYAZ0DMhgsSqCiDqc4GKWpsVku7
         Frjg==
X-Gm-Message-State: AOAM533SkfL2FgPZHJzwQIPUBotzlAhJAjqCYyFwXzwOASBPbwLUZqDo
	y/6AM9ar2E+5mja8v2xucas=
X-Google-Smtp-Source: ABdhPJx7OAIH9vBzDTkXSK6fIi6CXZuZNh1aivKdKUk9rqdSwEQ3ONh9C/RiTkaehQw+5Ip6xusTaQ==
X-Received: by 2002:a05:6402:b69:: with SMTP id cb9mr14702502edb.324.1630954447801;
        Mon, 06 Sep 2021 11:54:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 07/40] staging: r8188eu: remove unused function rtw_interface_ps_func()
Date: Mon,  6 Sep 2021 20:52:54 +0200
Message-Id: <20210906185327.10326-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
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

