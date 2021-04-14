Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A306D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:08 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id e7so24777759edu.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYMye0IWAuj8RFeZy63MkMZcxL0iTXzS4xtWYLiHck0=;
        b=yyXxxjs4IKHkj4wqcKroBryTI4rZQIegaaGKaAxZLY6tX0F6fdM4pMjkoT6R3EJTpl
         NtX6HJNG6M9w+OgqUOefcuXQwjTfShrEbVVvQIQe7EqzNkohAzNoOe4kS5W7443xtJ0k
         Xss/6U47Uyo2jesmXehzExNPzJ79Wgntv7QBy0LGoBaENwvA9RjQKxBcmnIpP5d5j4Xo
         C7xaBiNjWyVw3ZfKGiko9jjQ499ZmkIknvIkBMK+PNswu5NpQBnDK58CtVK6tcwNydWR
         +Cky4KD8RHcEJLGmVXU7OohKg68+zYmS6Y5VQF3f1UFPzMJdeYxWHv3EsSLyuN6hzFEK
         qU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYMye0IWAuj8RFeZy63MkMZcxL0iTXzS4xtWYLiHck0=;
        b=faSEI6ukYPBN+UZKJtN25Zu2zY3JpOsP15bhekka7TdaXazHQkoHkxPiJfS6Znb9Ss
         eh8+YLvcupIi0J72qTU81vjNakuzraYCqnYnCAg2jmjQSkr1q92Obr8pNHtHkry943Jy
         eGttLtdbY3JMIbgiJnaFhkWd2yxqRMTHLu+wFsf7gN6It49JI1LMGdykMPRg7ogin+lk
         VOgjltKc1gWuVOFnBpmlWnniX0FOOwGR5+sFIktFLuI+XsHsglHf9bgiQx19T/AkAMQU
         wa8aloAVOoksY4lzIEICxZzs1shm93BddMxH3ZhfsDdrhnufKt7ZCoKbJlycW+Kmtyma
         FRgQ==
X-Gm-Message-State: AOAM533A+CgWTm2tJDPwKVYPcfMjJ/8poPj7D+eUo9pYLC6ludQa9+AI
	rKhNZ6JOc0SPUbqAxZ0XWtle7w==
X-Google-Smtp-Source: ABdhPJyf++VxWRoCuEVm0bnW+BwiCWtOScPptcrs64C6V2Xn9nFfEGPc7ER5jnI3NBYwMx7RkrHCuQ==
X-Received: by 2002:a05:6402:ca6:: with SMTP id cn6mr162082edb.169.1618423926974;
        Wed, 14 Apr 2021 11:12:06 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 31/57] staging: rtl8723bs: core: rtw_mlme: 'retry' is only used if REJOIN is set
Date: Wed, 14 Apr 2021 19:11:03 +0100
Message-Id: <20210414181129.1628598-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_mlme.c: In function ‘rtw_joinbss_event_prehandle’:
 drivers/staging/rtl8723bs/core/rtw_mlme.c:1192:12: warning: variable ‘retry’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c624887aeed0c..f8ce4f2d31e13 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1189,7 +1189,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 /* define REJOIN */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
-	static u8 retry;
+	static u8 __maybe_unused retry;
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
 	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-- 
2.27.0

