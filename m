Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040A86136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:31 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id e13so2627917plh.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfjmzJb7Lf/yi4gvZp25594w20L/weNb6/LvpO1ErKw=;
        b=BwkeGewl6EZdwpTRoprC7vshGyUOaTZ9Ep54pSQhaW+CtWm8bwPFuwZdJn/3pWm7OA
         buyL9eBt1HB4fqXwsQuZo9oOIO+oNc4iFbI2ahiusqON9FSe1mMPQbhBbxu5lcsblgqR
         1j4YCsxTsuKZHcE9WQWEZZ9JokB3LcJmxPstPjZyUVcx+rHdgb8z09UUQklx7kIpgKos
         yxlA/TLi9/C5npuqSCZYFR8VHaTV9TBLCaa7/GCHTl6OZk5nwXMzi+gzpXZdfo5gQOLH
         RKtbZ8CDScyL9UyaUljLPx4HXYi0D/HtLICw0pnkCQjP4Gjtr5SKHdPNyer5rucjJE2v
         eotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfjmzJb7Lf/yi4gvZp25594w20L/weNb6/LvpO1ErKw=;
        b=ZsijGrK2GsOn6QCo+QWWfnsjhRkRXCIXMT3GaV/d5e8VZFog51oq0sBI0ezPqKZjnp
         Z4j5QPgkgmGO5TzlNnU041HGnFugLE81L0QzsuJ3gzQEyjg+tNDTmqm2rPfdcQ2mj9gK
         WOxEsFJ154DEMdDLs6dCcDX3XE9oWo7XzbVvnDXqa7kBzr6OFfVkiRTIw3x8o+pXJCu4
         tOPo2Pa4fXU9gLhdR4Qc0I6afOcajOZ6FBMib4ZhxWkGCpi6T/5kc5aMr9DY6QsjBu9a
         qFPLSEnXnjb/wS1FpHWC+87lLVg1S+eBaehA/wJwxIYgjW2mCzEvQmplv3I0M6pGiKvt
         BYTA==
X-Gm-Message-State: AOAM532hGC/oxQtZUINMZrj2+dJZdMx44MDxbzuvJlQa0nOJ7u2OFamM
	A0W3l3KV9yeFEPo1NVCL7V4xiZKO1bvGaA==
X-Google-Smtp-Source: ABdhPJzYhlHCySyM0DDJxZvonduU8G3iFcUviunLI3CKrlUUK7fMzuF2ZGG7kZg8CYNfDVOlLS0X8Q==
X-Received: by 2002:a17:90a:550b:b0:1bd:1e3a:a407 with SMTP id b11-20020a17090a550b00b001bd1e3aa407mr1671588pji.112.1646254111543;
        Wed, 02 Mar 2022 12:48:31 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:31 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 09/16] staging: r8188eu: mark cckratesonly_included as bool
Date: Thu,  3 Mar 2022 02:17:30 +0530
Message-Id: <20220302204737.49056-10-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark cckratesonly_included as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 4f58c8970..eef8523c3 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -57,7 +57,7 @@ bool cckrates_included(unsigned char *rate, int ratelen)
 	return false;
 }
 
-int cckratesonly_included(unsigned char *rate, int ratelen)
+bool cckratesonly_included(unsigned char *rate, int ratelen)
 {
 	int	i;
 
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 21c7f020a..cf397ac68 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -633,7 +633,7 @@ void addba_timer_hdl(struct sta_info *psta);
 	} while (0)
 
 bool cckrates_included(unsigned char *rate, int ratelen);
-int cckratesonly_included(unsigned char *rate, int ratelen);
+bool cckratesonly_included(unsigned char *rate, int ratelen);
 
 void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
 
-- 
2.30.2

