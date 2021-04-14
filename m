Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2026D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id w3so32850530ejc.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mMvMZ7W6bZe0+bru0DQKOTFCdHX7bB5LkX0PxyNngz0=;
        b=RB81IZeLdw++N+5RqtrSsU+EVFSVnlpI3rTQfiAy4UZQ3kRbOZxtNOn4A0BC/Oy5nK
         iMI2AEbkx+KoA+bmmBGAME5O/sWkkaJOiwCpypH5JjyXd9AvI+GmxURUiVgaSNwOVi9R
         UNfIOigJTbIu5il8TG1dWCavk0zHoi4JDqeO4tfHkqg1j9H+p7Wq5xb99IlTLCVywKZL
         VCwxfGuIHTWLo6sv6Rngm21t2wVh4ktEylzurbQCNHCfMsg0GF2s5tcI88oQkdznLTC1
         JFNX59uVNGL7SY5ySDNOWLOzDd14ZabwxXSt4NBPvDHsp/tOMpWEFXiJa3na3q/n0zWw
         7/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mMvMZ7W6bZe0+bru0DQKOTFCdHX7bB5LkX0PxyNngz0=;
        b=g3NsWLKWDQJxnMIV9N+iIMWymIu4h4SYIDpUZfMJcD6knD+Rl/5+c/88LN96vIm07k
         Dx7qDbe9Dcr1+698gRyDNzlturg4A1pmXWuUHQs3I/nJPBtHHmlcjO+EBu6y/mKnfAzp
         bBLEreTRdcfC2+aYF3FC52X4T+KYO+y1sVcFSA9ZcG8vlUeNKhFtDNLpPsmYAHjyje+D
         oZApjROMu5W++5EC087EwvTNyj7sRklJTbTN53BGHsbv+3EajY/dSiPYd5Uszo/EwUAQ
         JmHWHvyVj9kqtNMpGph5pcDKElF8LnooDATgdNqleW065BqjC52A+JhFUCpvy7SHiIoR
         MjhQ==
X-Gm-Message-State: AOAM531rZXw6CkoJcPz/eYgzH+UX/4Vde58zojmURATQLLTNsPvbYOPZ
	y++MP+FHoe2F7k25HtFFUG0pRw==
X-Google-Smtp-Source: ABdhPJwCCWJs9HpQKyyzwnABRonUB4rQx1O7GfRR0qVQNDUoWDgVnOiO3Ll+OBzIkRWGWN70YX4Ogw==
X-Received: by 2002:a17:906:3455:: with SMTP id d21mr145260ejb.11.1618423914456;
        Wed, 14 Apr 2021 11:11:54 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/57] staging: rtl8723bs: core: rtw_wlan_util: Remove unused variable 'start_seq'
Date: Wed, 14 Apr 2021 19:10:51 +0100
Message-Id: <20210414181129.1628598-20-lee.jones@linaro.org>
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

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c: In function ‘process_addba_req’:
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1774:11: warning: variable ‘start_seq’ set but not used [-Wunused-but-set-variable]
 from drivers/staging/rtl8188eu/core/rtw_wlan_util.c:12:

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index c1b893451788b..3bd62567dec50 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1711,7 +1711,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 {
 	struct sta_info *psta;
-	u16 tid, start_seq, param;
+	u16 tid, param;
 	struct recv_reorder_ctrl *preorder_ctrl;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct ADDBA_request *preq = (struct ADDBA_request *)paddba_req;
@@ -1721,8 +1721,6 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 	psta = rtw_get_stainfo(pstapriv, addr);
 
 	if (psta) {
-		start_seq = le16_to_cpu(preq->BA_starting_seqctrl) >> 4;
-
 		param = le16_to_cpu(preq->BA_para_set);
 		tid = (param>>2)&0x0f;
 
-- 
2.27.0

