Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AAE3FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:52 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id v5so10634036edc.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYfDSWWLfbRbSNVuId0vyBxYwKOU4bWEtZJKFkrF65E=;
        b=mVMMFtWojmvkwy1ZiTea5EpVlP1GnhalgNZCiTDcbS51zW0+9yykvMDw7H2IYdbFvh
         1SuJ8U+uAeA+p/AmWtQ6FnpacOGh2CiD2qPib/Dx8liT0pp49s6Q08uv2nA3V/4od/3c
         77T0xBHuLnJ/JUqXf3us1uopYc9A5ngH0S8B2n+QWZXJKq+/15UIjDERaZ2DvraTW3M8
         xjMPH05itNIZXomhAOEcdCO9K7GDvPfi5OYysgFKex7yFHGFuXcMXKSUxTMAVwQbQ9It
         Ff7fzQaalbSQQOFLdN+SvbTqpXNTwll/ppMl0OdICFP6rGxgsmvyOgMZUU9xi21tLgf5
         NNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYfDSWWLfbRbSNVuId0vyBxYwKOU4bWEtZJKFkrF65E=;
        b=JeS5LqV3dzvBDbfcfVwqIfZwFyZ9l9vIEKT2liwHzHTv85S5sqXWtYGEUMoDUAIz6a
         G6NFRqo1RCGkWbcQj4n0c+YKWNcYIM/uTKKydKJTg9SKc/8qUlot6o6Z4ZgKA1yMg6Pz
         zTmFTA90m3Ui5YPzTeWLiigvF+TpuGSIir24xSW6HmcnDkiqa3hklQak0vonRzZn6AIp
         3c19rnJ9KWoBlCSxUjCK2Ne95GdfUUvGu9neQ3qX5AANI60kBKyAfg+AqlpKu63CyIEq
         iMbCavL5FHKzRkYHkJT+rsB0x4yfTPUk17ZM3RcAXLeJReIZKkACzORkjXEKrw8jXfgF
         lanw==
X-Gm-Message-State: AOAM532Bw5tgirIRoE9qVVe7A4g/e+wAxA05wAF8mC8ZSLl4/9FAAgIB
	H6F9wtLXj5lXIW+UB+RQ3hU=
X-Google-Smtp-Source: ABdhPJyaWT7nm45C3Kk3YTkno9eFpYoLPMnU0ivEEbloEWLULeMJC46Cwe/TFKnD+0YwETE0NRHW2Q==
X-Received: by 2002:aa7:d2cb:: with SMTP id k11mr14746208edr.227.1630954970696;
        Mon, 06 Sep 2021 12:02:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 07/40] staging: r8188eu: remove unused function rtw_interface_ps_func()
Date: Mon,  6 Sep 2021 21:01:50 +0200
Message-Id: <20210906190223.11396-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
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

