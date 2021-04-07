Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131870
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x15so8871727wrq.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=agWTThKJnzpXbfQJioyYRi1VTSU31768MskVIC2gqW4=;
        b=jmtsFcqklHHmMrKwWd2iroaNilgCYrRb+1g4cmVaqB2uWDAGz3svccfiPd5VWa1pVl
         rCF4M5Vq/Rij8svJt/Jw+GUMin9bZDzUUYRrALhgqv+1ayIhb3pfsU4rFrvaMpsqywZS
         DwEvz/GPMuyuzxp37lEgmS+qNuMG87UqV2I+LTJPa5Zd4Vuy3/6BJCrhCUbC1N9EsoT/
         mIq1x3g96qmIHdxNmhKJc4cpiTywL8l3TmGAMN0/q0UUqD1mT5z6vkWEOgtIi4R3Z1XO
         7D0Om2+5p8DYtR8tE7Jv3qUZlhhg2cpU/vUTNSncWx2krAurdpJoOL2oP86wJ/KPEDYc
         B1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=agWTThKJnzpXbfQJioyYRi1VTSU31768MskVIC2gqW4=;
        b=An1EGb9Vg21GN8A2IbmvoENMOz/2lG6X5/9BZ1o93VItbCqOZdAjO0JFEQw0nGCc8N
         1mlQiGTh0sck6vMTU70NMDsPrRUAiCYzAWHBMSFFWWfVd26P4IpvUl7OOeZVtggOK5mD
         47EAaSNLVpJ0VRxDzZanxGlSgHGio8QmB0jbJEtf3+j9Ijxkz3VkRBc8t2aV10NnStaB
         izjOMMO/cNr2DiD/GbGzs9oQsCtEh9tG8J/dmfg1JteghSVdufLUIBOMTq6V0DuS3AcX
         XtDJ4+bSvzO0eG5q9TjIPYyLlWHhLbanfZMmuJ2tRqwVtjInye/7/kQ9jkbV76MfEJrm
         WIjQ==
X-Gm-Message-State: AOAM531iEBPwC5TlmBPetyPI8Hyj9b5csiVMRiF/iFgAWZ76HXzomlrR
	eLG50LQThaqM1qiXIKqXxqM=
X-Google-Smtp-Source: ABdhPJxphLhhA9NmKcBRuu0OvxDwttWJGTyRAzXCv/wE8fUhmujzISOt9xPFniIeNtqT4cSAf28Zew==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr4572832wrp.203.1617803423995;
        Wed, 07 Apr 2021 06:50:23 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id k11sm8714212wmj.1.2021.04.07.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 17/19] staging: rtl8723bs: fix comparison in if condition
Date: Wed,  7 Apr 2021 15:49:41 +0200
Message-Id: <b32610045cad3c385b236266d7a10665ed202150.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit checkpatch issue:

WARNING: Comparisons should place the constant on the right side of the test
1833: FILE: drivers/staging/rtl8723bs/os_dep/mlme_linux.c:151:
+		if (NULL == buff)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index f5c94509ad71..0a16752f805b 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -148,7 +148,7 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	buff = NULL;
 	if (authmode == WLAN_EID_VENDOR_SPECIFIC) {
 		buff = rtw_zmalloc(IW_CUSTOM_MAX);
-		if (NULL == buff)
+		if (!buff)
 			return;
 
 		p = buff;
-- 
2.20.1

