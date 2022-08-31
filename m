Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A5652
	for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 05:36:53 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id p16so23069136ejb.9
        for <linux-staging@lists.linux.dev>; Tue, 30 Aug 2022 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=iq7MNHMLWmoXJu8LSGb5KsjsJLnznH4nitQ6n3bLOfY=;
        b=cD0eE0gMPJv6AFsCkaSAtRjcgPv2FR6ypXADkQQKhnu27aYKO3ZBX0Ct17ci3/voBV
         GIrbnH4Datq2VKuyi2ykWQZN7yDHX7qNkS3Tjt9kaPBxPyQimzyQXW+LDcOh78498Zlz
         0CDJrccF6OD8snGITZAIJXSko4ec274ZbqvsXUdANjpbUEiKWy609QrE3F8On6jdnABW
         xWu98ysZwwFFMd0ivK1MTz4Bm0PE+x1FQSpeyc+5CrgQo6crRmHgCspqWwtdEk89JgQ0
         IbuwDkz8xA/LOLRlXmql83RQB0R/h0vSjm7UdhkAclbBXLWcrbelkrKpuLE1YxkDUUlb
         R3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=iq7MNHMLWmoXJu8LSGb5KsjsJLnznH4nitQ6n3bLOfY=;
        b=A4uPiBDCzPmCHvd2Tb/pf+lwXbqGi/smKiERxqb3cj67I/I5SPKVtT8TnZV+TnZA6i
         MA0O1qw6GTGzWyh7KkOzLiQf4EK+wiwB3PWm7vTqoJ9gZtmbXw3KUXOPP41VOccv4/Xs
         Lr+cbsBY+Jr7eytOa09ywzaFS41AiikFsf2xsrWp3ze2ViGowzm3Jm4f9QOAemQl5nf1
         Fu2EGO7lGLcLI1eXUOwsAWQ//1T8zm39bgOQqTflBa1pl3M3YY7nhehhycr+spQFChIl
         U0t7d48wAfcFHpTN7rqtSIcTGqFQ5X5vJZneOvFHYbSgTk6j7fZB9fjlBa4Q+zyYG1wI
         4NdA==
X-Gm-Message-State: ACgBeo1W5+IW4n/Qx8E8uQwzvUZMkCMPmNt2Rv7ntYWz02IvS0QpEZ07
	GPkY5pHtq5hD1Xd18W9IeMk=
X-Google-Smtp-Source: AA6agR4/jNoZrVh8xVKkfGrl7+YhbIpStB2JYJbHDsN89h+kY62UO+m17JSt/ryTwVUSBUQNBfw00A==
X-Received: by 2002:a17:906:cc5d:b0:741:38a8:a50a with SMTP id mm29-20020a170906cc5d00b0074138a8a50amr14208343ejb.650.1661924211818;
        Tue, 30 Aug 2022 22:36:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb89.dynamic.kabel-deutschland.de. [95.90.187.137])
        by smtp.gmail.com with ESMTPSA id gh21-20020a1709073c1500b0073a644ef803sm6610135ejc.101.2022.08.30.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 22:36:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: make two functions static
Date: Wed, 31 Aug 2022 07:36:38 +0200
Message-Id: <20220831053639.8559-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831053639.8559-1-straube.linux@gmail.com>
References: <20220831053639.8559-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions rtw_join_timeout_handler() and
_rtw_scan_timeout_handler() are only used in os_dep/mlme_linux.c.
Make them static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_mlme.h  | 2 --
 drivers/staging/r8188eu/os_dep/mlme_linux.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index e8168e36fac2..d827ea7d841b 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -433,8 +433,6 @@ void indicate_wx_scan_complete_event(struct adapter *padapter);
 void rtw_indicate_wx_assoc_event(struct adapter *padapter);
 void rtw_indicate_wx_disassoc_event(struct adapter *padapter);
 int event_thread(void *context);
-void rtw_join_timeout_handler (struct timer_list *t);
-void _rtw_scan_timeout_handler (struct timer_list *t);
 void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall);
 int rtw_init_mlme_priv(struct adapter *adapter);
 void rtw_free_mlme_priv (struct mlme_priv *pmlmepriv);
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index 5bd2b2c31342..2f8f866d5362 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -7,14 +7,14 @@
 #include "../include/drv_types.h"
 #include "../include/mlme_osdep.h"
 
-void rtw_join_timeout_handler (struct timer_list *t)
+static void rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t, mlmepriv.assoc_timer);
 
 	_rtw_join_timeout_handler(adapter);
 }
 
-void _rtw_scan_timeout_handler (struct timer_list *t)
+static void _rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t, mlmepriv.scan_to_timer);
 
-- 
2.37.2

