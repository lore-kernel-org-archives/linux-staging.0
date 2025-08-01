Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725C20C001
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037160; cv=none; b=i+H67SPNiArvisS16R2ypyCLNL0OtPJU8xkOqoMlY7z9GcErLbs4a/rbkRMNFxi9b5jOL8HdKl95o16fVParJM3mVZcwjO6D3PAXOkntLBChYe041LJ4URA4yR1/OSYvJsOuruDr3T3LLKdVeGwaSP+/WcH5E5bZvcHg+95ymr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037160; c=relaxed/simple;
	bh=/+vcYsI4ZQyJ++t1I38Ppuj4VT8P+XooHoXgtmskaOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beRpNJw+7v/8+zV5j8L0bHvfpQcxi/YJMBOwrYr+YDd4QhWFuNbbN4FA3NUZtT3ulo0XgMIJlciDKP7cSCYTPjhyu9ZQNsAu2EvMeTBqPm4W2PvfUVHGw+8qZ7QdpklzoO6h5wcuNPwSZur7GQtDKBTEPG01eIPlDKMHsyVsQlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3+qX8OB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3+qX8OB"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so3176200a12.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037157; x=1754641957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6jMC12tEugVk5aruwhIYXcetQLysBmEwE741CRW/oY=;
        b=l3+qX8OBkLDmaLHxvEsdtPTrKLkPIC2urIhBtNpOSn6aKu1bbaD5z0Nb9cxOqD/ris
         2l4AdazSTjm7Jh+u96OspzSnD7UWbzcURMWRE39C9sLZj9iADjdFbDSS8QFrlepFK1Jn
         Ota8DPYWxaIw4MjZSjX0rIeaWTHUKz1+pQ9OT06cDwLTCGFeeJHbypq/vQIsaln/LW8z
         7CHQkUreH4X5s9P7gwqWp+y60/quu/od4mvPfEVOEYscTfwPDyagmj8Zsn1mVpW7pvU9
         aKrrNNoFGkQTPuEjkQap5G5dEuXbUDEPv/ZDiwPIsMwIyOrp8ML1PWBXLlWEdnGDLUnr
         zitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037157; x=1754641957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6jMC12tEugVk5aruwhIYXcetQLysBmEwE741CRW/oY=;
        b=Dg33oUNr4QxtY4J0MWIt/6sHjsX87XyYf1gt6KrnNELcSLpxPmIJsTNtTU67wp/p07
         Ln/secD71a0ClYDk92xLwnLmrvtFZ8DsyT0l6dRrNiCeGEuYsnYMKRxqd5VXvYkt63bU
         onJZDpoA96diT64ZPdcFjVPPspottp9j2OK+R43oP3qZcpsmNQY0XBPM9wD8D+XPqF2o
         65WiYg/4gEFObpxqWmM/B+jkqdZ2IzEk8DQ7nV9E95omNw3q5l7ESLfV+ndFtfuqPhhR
         zMgQQQAxaKGMhsV16pslnlcJUKbOVve52O+1ldF5c7qh9HlPX29WcJ55C+5U3m6SaePe
         5THg==
X-Forwarded-Encrypted: i=1; AJvYcCXTx5HrhZ73AJqLDJCss5A1pwEeh3WDAZyFLWzO6VUH57szH9mhP10yvpKVK+G/THRkCXViTVldnd2oUoQt@lists.linux.dev
X-Gm-Message-State: AOJu0YzCfw4W8VIe9xlucECNc0xnK3RB2vmIFMunP7J988rzNQp2acVx
	IQuCGfAtvXgoOUYrIjFcjS4z6fS6aLPS1sR+JIjP9cEd3bYrYV/Wq+xb
X-Gm-Gg: ASbGnctgNCUFnQ1S5zgrAI0iohzoXVcYR1ffWqvFQ7wNrnv4r627dSzF+vKivLN9A3a
	6GiJeUskYVrtcXiDhyV61JZS6ZSFu63EBhYwrVe6UUU0SaKCwhdrcO/MXsSGRpnW3OLCV4a235H
	9m942bmPNs/bV2uhg482Tjcm5TIGPQyjE+c8Dnq/tyERZG0jTiUIR6A/u1r+NR1CV0Tystz06nD
	YqjGsjZHjPH1iak36w7ej30apCTVotyWDK6uMJRJh13ReiRy1iKCZ1zchskYS5J8yhG0DQjUkwK
	bXg1YgJc1WIC2Gd2UTuBmra4RehNPl5joNDvGTH3Cip+sbMqXp35J9GHCFebsDISr9VGdrR0f57
	5mSKvuirbiu27rFxesuUBqFdZjdeqf41e9Gpy0tUz9tNSMLzK848=
X-Google-Smtp-Source: AGHT+IHciq99BbuZpWhzmGyVurHmceDhuGv0VyhSlty1GL9uJXllpooZ1oSHCxPfXsLTyOQc240QsA==
X-Received: by 2002:a05:6402:2809:b0:615:4c85:47a0 with SMTP id 4fb4d7f45d1cf-615ae19999dmr5006820a12.7.1754037156991;
        Fri, 01 Aug 2025 01:32:36 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/8] staging: rtl8723bs: move init_mlme_ext_timer to core/rtw_mlme_ext.c
Date: Fri,  1 Aug 2025 10:31:25 +0200
Message-ID: <20250801083131.82915-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801083131.82915-1-straube.linux@gmail.com>
References: <20250801083131.82915-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function init_mlme_ext_timer from os_dep/mlme_linux.c to
core/rtw_mlme_ext.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 +++++++++
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c    | 8 --------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bc980d21d50e..0e685c0f2f2f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -374,6 +374,15 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	return chanset_size;
 }
 
+static void init_mlme_ext_timer(struct adapter *padapter)
+{
+	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+
+	timer_setup(&pmlmeext->survey_timer, survey_timer_hdl, 0);
+	timer_setup(&pmlmeext->link_timer, link_timer_hdl, 0);
+	timer_setup(&pmlmeext->sa_query_timer, sa_query_timer_hdl, 0);
+}
+
 void init_mlme_ext_priv(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..58e2d8e159d6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -426,7 +426,6 @@ void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
-extern void init_mlme_ext_timer(struct adapter *padapter);
 extern void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 09bf363efa8b..d22d6cf3cb11 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -164,11 +164,3 @@ void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
 	timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
 }
 
-void init_mlme_ext_timer(struct adapter *padapter)
-{
-	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-
-	timer_setup(&pmlmeext->survey_timer, survey_timer_hdl, 0);
-	timer_setup(&pmlmeext->link_timer, link_timer_hdl, 0);
-	timer_setup(&pmlmeext->sa_query_timer, sa_query_timer_hdl, 0);
-}
-- 
2.50.1

