Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222796D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:04 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso764619pjh.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PxKQLgSh2nb/XH5YpVxCcvU5M202Y3gpnJJ5xTXypQU=;
        b=Pk9+F3zXJx2odkFEnk3qTPJQJawwOiW7zo1VDocATkl0Xo1xLZK1O9MDIwZOax71Sp
         Eo4zma5NCIzHy/LFdHZnkAA/FvAUNUCymAD1GaeIGvrfFHtn9CXxklMr/0i5BU96QDR1
         DzxeUsW3eJIG8OVIocHhKN550jENBzZ9F+ad5bAvKGzcx/SvSVQO7vY/Onr74Nwdz5BK
         H7jiHTq6xkr6a0st1fZE17sGNH8UF0X4nepevpeXwZxts+h7fiLD5ubymz3L5+MvM+hp
         vDGPGHaNDm11XCGe5Gin1/aRGoCPt+9PnDSZ+4IE8FJrA+JhIB8h1rO0hCyr6eWiAZeW
         H9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PxKQLgSh2nb/XH5YpVxCcvU5M202Y3gpnJJ5xTXypQU=;
        b=qIO2QEXaLF7lcr3diJBFwwuNO74JgPEaXbH2zUCmh0s+pUdyFhy6qgnk+xSraIfugg
         H94DHiVTcoiNA5bmU5wXHGWYG7N1//lD0TLVFocT8csbPw5wUhvvXgmqjMKO47zRVAQg
         ELco6DlJTsglil5najstzTapBANUh8yDE4OzZT3qStXRiBorWawS2JxHh9IB+SAzkA1I
         EKf4pOGac9OiQBI0y2aCRIapHJ2328Ht4b5XNNdfRPOYoGZHsuXh/DJjAr7PG9W1bLly
         KIwEZA6Y3MIF/402qh3cTLfjU+fzS3Cgh4CeMoXt3k+njoEhcrMkcD91Bi/Et8UeRDlw
         yCDw==
X-Gm-Message-State: AOAM530PYw1vFcoh7Iw/VP1ZRgbwK6GuJJhb0Q5h8bW7iiDoGmwLDsqW
	HfyP/vpisO1gFEqotZAFiLA=
X-Google-Smtp-Source: ABdhPJz5BHdME/ZkEDDAA94wWwwQO3IeFNw2DCQZ0XToLxKfItLff/Yx2kMf8yf03KEQnHPpjLtUBw==
X-Received: by 2002:a17:902:a513:b029:e5:d91c:2ede with SMTP id s19-20020a170902a513b02900e5d91c2edemr1773981plq.65.1617777363671;
        Tue, 06 Apr 2021 23:36:03 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id z23sm20476921pgn.88.2021.04.06.23.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:03 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:01 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/49] staging: sm750fb: Rename dviInit to dvi_init and
 update param names
Message-ID: <6c6ecf7eee7d41492dbbcc4410db7eefd1fbb13d.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function dviInit and
its parameter names in ddk750_dvi.h.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c |  2 +-
 drivers/staging/sm750fb/ddk750_dvi.h | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index db19bf732482..943cbcafcffa 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -30,7 +30,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #endif
 };
 
-int dviInit(unsigned char edge_select,
+int dvi_init(unsigned char edge_select,
 	    unsigned char bus_select,
 	    unsigned char dual_edge_clk_select,
 	    unsigned char hsync_enable,
diff --git a/drivers/staging/sm750fb/ddk750_dvi.h b/drivers/staging/sm750fb/ddk750_dvi.h
index 4ca2591ea94b..fbc897c7efb8 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.h
+++ b/drivers/staging/sm750fb/ddk750_dvi.h
@@ -42,16 +42,16 @@ struct dvi_ctrl_device {
 #define DVI_CTRL_SII164
 
 /* dvi functions prototype */
-int dviInit(unsigned char edgeSelect,
-	    unsigned char busSelect,
-	    unsigned char dualEdgeClkSelect,
-	    unsigned char hsyncEnable,
-	    unsigned char vsyncEnable,
-	    unsigned char deskewEnable,
-	    unsigned char deskewSetting,
-	    unsigned char continuousSyncEnable,
-	    unsigned char pllFilterEnable,
-	    unsigned char pllFilterValue);
+int dvi_init(unsigned char edge_select,
+	    unsigned char bus_select,
+	    unsigned char dual_edge_clk_select,
+	    unsigned char hsync_enable,
+	    unsigned char vsync_enable,
+	    unsigned char deskew_enable,
+	    unsigned char deskew_setting,
+	    unsigned char continuous_sync_enable,
+	    unsigned char pll_filter_enable,
+	    unsigned char pll_filter_value);
 
 #endif
 
-- 
2.30.2

