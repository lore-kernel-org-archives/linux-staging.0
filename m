Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888306D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so714731pji.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OH0zYh2ZFmb689ReWGztZUI2CNWri3Mtoqhtg+OoAIA=;
        b=q/PqrlHVdCpvFjAw95bHjGsgaRHjqqCSP3+wsmNOWSPAFCBky2VtW8Y+LC+NdU2gNq
         LfyL/RLPB5ly2rl9c4PBIWGvdC44KvWWsWf+3GDVSGzNY7Fun3Awd/99A68XSxrSZs3n
         3cBfuVymGxQ6WMfH8+TuZSohcFrZbBB2jvj1c8vLihkHL4chhss0Ovrspycv0XVP2BI3
         yYMiV6Awwaz1F2qxvHajDd2B5V8g9xvwZXWpvff9/wZhhDDRONIc7A1+YNTwTDCK67jb
         sIHCzb4sILGrx8JxZE/tKGFtcwfBdyInUvEI4JzBQinOxPfL8oeXAM9Ze/Y0OacqtmCK
         Dmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OH0zYh2ZFmb689ReWGztZUI2CNWri3Mtoqhtg+OoAIA=;
        b=RaC3utT1OmGI6tjWMYGv+uiEw+zhc657xEK0EsjfIq/GHO7LEzLXF3ntHgWjsiY2dF
         rgULl/GP0/7iwpHa89T/KLroIWxMdRBcRJ7DCxiTfZTx1YBKTVvpgSbd9ODhJUcXXWvR
         aJRc6PTGEBkW5VJAbnIAREwAMfsfByB1xRmZzB6ae10vaQURKZoa8MPlSVYEts3ktml6
         etsaMRlsXGG9d/E08/Z+dbtyQ6dirgIw29qdSSXW9hksEKR6qQlSpBI/JNYpqAv/JlhW
         N3rEan1e4lA8ZpMYxHMQFsqYW3sY5U/BI9z/Om/OYElIV/IpWgmHD3rYiA9HcQ9mhG5S
         atRA==
X-Gm-Message-State: AOAM5333DFysaEirxNxb6BTMkUSYeErqva/vVJFBP/M+zL4irO15DPd1
	U8RCwQMvSBDq0kj6BzS3ljk=
X-Google-Smtp-Source: ABdhPJyQUOXMZVoOmoZsPyEGgo8FcUEFzPIawSF1BczppHICzW6bmSbZIAGb4ojPKN2ea+3zkDEi3A==
X-Received: by 2002:a17:90a:c004:: with SMTP id p4mr1824906pjt.202.1617777366153;
        Tue, 06 Apr 2021 23:36:06 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id j20sm4187921pjn.27.2021.04.06.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:05 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:03 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/49] staging: sm750fb: Update param names of
 PFN_DVICTRL_INIT function pointer
Message-ID: <fbf0bb3ddb5cfc9a80fe7342b828d3ab5740314e.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for parameter names in the
type definition of PFN_DVICTRL_INIT function pointer.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.h b/drivers/staging/sm750fb/ddk750_dvi.h
index fbc897c7efb8..b2fd56ef51fc 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.h
+++ b/drivers/staging/sm750fb/ddk750_dvi.h
@@ -4,16 +4,16 @@
 
 /* dvi chip stuffs structros */
 
-typedef long (*PFN_DVICTRL_INIT)(unsigned char edgeSelect,
-				 unsigned char busSelect,
-				 unsigned char dualEdgeClkSelect,
-				 unsigned char hsyncEnable,
-				 unsigned char vsyncEnable,
-				 unsigned char deskewEnable,
-				 unsigned char deskewSetting,
-				 unsigned char continuousSyncEnable,
-				 unsigned char pllFilterEnable,
-				 unsigned char pllFilterValue);
+typedef long (*PFN_DVICTRL_INIT)(unsigned char edge_select,
+				 unsigned char bus_select,
+				 unsigned char dual_edge_clk_select,
+				 unsigned char hsync_enable,
+				 unsigned char vsync_enable,
+				 unsigned char deskew_enable,
+				 unsigned char deskew_setting,
+				 unsigned char continuous_sync_enable,
+				 unsigned char pll_filter_enable,
+				 unsigned char pll_filter_value);
 
 typedef void (*PFN_DVICTRL_RESETCHIP)(void);
 typedef char* (*PFN_DVICTRL_GETCHIPSTRING)(void);
-- 
2.30.2

