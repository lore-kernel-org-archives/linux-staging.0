Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C36D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:11 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y2so8841870plg.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=87FzL2bfn+zBBigzd2S34Gvtwu79/Sjcc2/CQOxweQU=;
        b=MubQ22CpAN1kkt6OD34w02Kt6gDd/Mo619issLItehETO7lPL1JJF/cs4ANeT1NBoU
         f1VNBSl8/PphpLTFZ17sDZz6U5SaCnO3p5ERo4r/NdxT73FI+G8SVh+1ZgqynUpvKMiM
         omnN9swULQHZ3Gxgvj4Hr0ti3PDqiGeRWtooNlVkVAgiZq5QxjWt2oRSQWGTngviELye
         lZrMNG0yhvO9oJlsxa5i9Lta35mTEgR8EY72CODyNfXnnw82wE3tQvdtwjEtRCKz0NRJ
         jAjT+H2Z0dDq/XbQH8EYEiG5MhO6qchB7G5aB0QD/aQ5t1FmAokqRVjPBYClqfgSETyQ
         HRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=87FzL2bfn+zBBigzd2S34Gvtwu79/Sjcc2/CQOxweQU=;
        b=WDaUd5DFDVsBnE+n+GK9UOP5QAUxFqnRa46mMCKBfA07bO6hP5AMLBHWntoRHz7rsj
         Hni5ZsuSZdFKN44TnST/UPJ2bkpuYHvNFwrPmGFJ+GOyiCr5YkQ1jiGaGk5G22OyMZZe
         g5ENhoYPJtR94uirbRoUnas+GGG4lc3yJGVo6YUqkCmpMMVTh983PCQzlWGLbCTB/Vwc
         2SQsZQBl8dAaVgf3K0Y8R+0Z92LjriOvyulXnZu6vYrX3l+E1NsjwC84uuTJwAw2Lhaj
         +VnWn2Nmg0sAT2kHZmw+rU6FihChKe5mDgUEgbTtatXKyLNVrG9X9xOy/YMPKLxUFwLv
         BoVA==
X-Gm-Message-State: AOAM533W4pNUC2gSc7+L4adneWOofEc3S51FmAvxvUEb9xRzwITCBh6A
	E5lw56pJaqvMbHRIks3ioxI=
X-Google-Smtp-Source: ABdhPJxJMLnMvlrNyuI8azlZ4zPLdcHtePAjBxO51e+ihrQaykciRMTvUL0wA7/2BJib4J2hEv5gzg==
X-Received: by 2002:a17:90b:300a:: with SMTP id hg10mr1863313pjb.58.1617777970829;
        Tue, 06 Apr 2021 23:46:10 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id l1sm10927658pgt.29.2021.04.06.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:10 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:08 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 45/49] staging: sm750fb: Rename sii164_set_power function
 parameter
Message-ID: <e84fb623b9b89051758fda1a21877b008b5439ae.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function parameter
powerUp.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index ac1431dcb419..a414afbb719a 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -33,7 +33,7 @@ unsigned short sii164_get_device_id(void);
 #ifdef SII164_FULL_FUNCTIONS
 void sii164_reset_chip(void);
 char *sii164_get_chip_string(void);
-void sii164_set_power(unsigned char powerUp);
+void sii164_set_power(unsigned char power_up);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164_is_connected(void);
 unsigned char sii164_check_interrupt(void);
-- 
2.30.2

