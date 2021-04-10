Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792072
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 15:00:44 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id r9so13142145ejj.3
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HBudnlgBbgfTMMB5wWvaY2YPBfD3jKz3AvHUYC6wfiU=;
        b=KXn/WS0nh8U5TCwCHs9nhls7+Wi1VipCJrtUFEWprx4nvj05F0iCWB/h+lQGtbTTVd
         5GqPxxgtnUH8u1uUkNYjYxa0KaxwjC38zR7sJyZZ4Q4FDxbNU6bxN2QBsofVr11NVb/w
         /Ub0Gz0e/QrXCmviLRWnpZQNuWzv1dGrVpfNJYN/OyP0NkE4khGkp+s5XHOfV5LPSO4X
         1OO3f1IeNn34shVpRBlzlqtHkp1pU7p6UyVIMdRpRo6ytbn+E2yg40K8rU0BNLgHuwSD
         5rMoxaSOMmebyLrC88halSacUYyBuGGoqSMQcqFbXHtFZEPvknuWPdqX1aV8LmY/tp6J
         ioOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HBudnlgBbgfTMMB5wWvaY2YPBfD3jKz3AvHUYC6wfiU=;
        b=TPmaEXEKqV3zL3C/mTzgb135i4UnbhhfYZ+Wz4ct/yOjQtUA7ivamW45LWsCTuAXDn
         eS6tPbSyrETylCeMWIyny7uL6N0q5QAwIhnk1dqnFPXmKfqytnlsKivU4r+gNEVYGYHg
         Heno+R4cDxRKXTgG4gvDdn882uJjybIaZGSQQ3dr70tpjce6hSftLGTlmUt9SOIU2jZ5
         j9DVfb1K0olniJAsXFdDK6RKVdPGH3fVcoO6kXehZCGZl6+tW6JFElPyreuDL8hnIXwu
         khU2tF7W0B3LW83z/hVXZ+23eGQ7XBx4awXp/RjSaOhuiL0Bs54FaJA1gm9+qsSU2nGI
         mjRA==
X-Gm-Message-State: AOAM533jCvC4j+BR96fEyYjsAry/MsXk/qi3Mkv0bC8YEr+1j2vYpFv2
	0A4SDeuCQux4SVVyCvyzQd8=
X-Google-Smtp-Source: ABdhPJy3Pso3VQyp2/erSKZ1q+PkaTfsXQRbsZgriQsRZJIomIIh6WMSQ6NXwDkOOz4Wcs2NQXFy0A==
X-Received: by 2002:a17:907:9858:: with SMTP id jj24mr20174686ejc.212.1618066842785;
        Sat, 10 Apr 2021 08:00:42 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gb4sm2719494ejc.122.2021.04.10.08.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:00:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 5/5] staging: rtl8723bs: core: Change a controlling expression
Date: Sat, 10 Apr 2021 17:00:08 +0200
Message-Id: <20210410150008.5460-6-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210410150008.5460-1-fmdefrancesco@gmail.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change a controlling expression within an 'if' statement: don't compare
with 'true'.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: No changes. This related patch is new to this series.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 32079e0f71d5..600366cb1aeb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1507,7 +1507,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (pwrpriv->dtim != dtim)
 		pwrpriv->dtim = dtim;
 
-	if ((pwrpriv->fw_current_in_ps_mode == true) && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
+	if ((pwrpriv->fw_current_in_ps_mode) && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
 		u8 ps_mode = pwrpriv->pwr_mode;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
-- 
2.31.1

