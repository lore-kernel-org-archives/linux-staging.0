Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0FF70
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 08:29:25 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r22so11334705edq.9
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ctk7dRosetR2M8O8IdMtpC+jlxdgFJPjI6tvTIw5feY=;
        b=tmhaHz7ZqgVIZJz0lOxCaKh4MNrtGA7X4zjXijxQZ8nExXRMiBGlm1WX5UHGAfmztr
         kyjxSoDB249xrmC83NgCFZpGLEnAKHA7fmbGPeiX0JI/IfatapP0cwoWwFZ9HAcXILLT
         E3Z9TeiJ+3wnVWG9+rJonCe6Sy1kKgu0xylwyis3gIGrQkFP1EfAM3wAhjpenUnq4BYc
         aJnHflQwY36hz8Apt6OKzWbV4XvrlC67XAetbNBqNGiq0jbL/+ZWCPV4R/ICUW8vmEIH
         VNPk2ymc1nEsTDBR478l4Qobi8gmXnWvta9B688UfNnf3J5JUYXgpXFuGE2skR+gBWRQ
         9e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ctk7dRosetR2M8O8IdMtpC+jlxdgFJPjI6tvTIw5feY=;
        b=cs7vdmA4c7Fyaxqmsow3a4PhO6FMjWVqjLVVMA/7hRZ7xb9VyRrniHPBM4Lwj9eXoo
         CDYDVHfQ+oBb4OdlynqnPjHrlbr8Il07Db8+hE3E9QIwzrThCSgMS3mUW3mzD/7g8lsz
         sy5l1cF1d0Zr18ywV4lMCXfxb2C0sS5Znbb8jdTLf47LcqBG4cGOWZs3uszOiYeymxKU
         di2U2WN24WsTe+GQOf3wRVzg//NcpIaaRv2vKntB6FLnY9iAa0rR1cClSypfHSGYrX4D
         57u8i1j0bFwWS4MmMYuYsl7VYF0EUjYCzKH0/mkDMDn/DFH4yTb3h26mnrq13J3xSyRS
         XaLw==
X-Gm-Message-State: AOAM5337mnIiJEtW+dmkVWTZ3+rCwjugNGNOA/9zfrhqW/oEZ/Z5bbxt
	K1UWOfQgkE1ICFm6vsCl2RA=
X-Google-Smtp-Source: ABdhPJxXLKKBH+tv6toOyicj/bNhkVaHS0BBk91QS63N3+kCIeu/sKhSAmaQRNm/LnJ/6lLTYJFjCw==
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr24457347edy.142.1618129764057;
        Sun, 11 Apr 2021 01:29:24 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id hp12sm3682541ejc.46.2021.04.11.01.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 01:29:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v3 4/4] staging: rtl8723bs: core: Change a controlling expression
Date: Sun, 11 Apr 2021 10:29:08 +0200
Message-Id: <20210411082908.31876-5-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210411082908.31876-1-fmdefrancesco@gmail.com>
References: <20210411082908.31876-1-fmdefrancesco@gmail.com>
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

Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
series because it had alreay been applied (rtl8723bs: core: Remove an unused variable).
Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

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

