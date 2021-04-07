Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9856D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:37:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id bg21so6189455pjb.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OdUv2xn5NTVX4upCxFLBlB0yHvpqXhX8iMiPwr0mJUo=;
        b=feh8cmuNFbOe6K8YLbss+gUYGOmZxEtOYqMSn8UeBRI1QIjyXO6O3TDrS9hhqii26O
         B+Ffbqg/Kw+8upWR7MiKn556v6yqiO5C/cyeacNP1qOsvuAOPncgQ2tMr6jf4LK/W4kV
         LyMUulkNgoKbHkLLjaGwWA6s+GF1H7vJwImQWmTT9PilbDm9oLf7JBEi9+lDxg12GqGY
         peKuuH9WfNA+hfeLlRcvRd5tTZ0WDgmd2gnVLwAFzpq5ndAFHkE/lbGAlA95hqncYlyp
         LbckmrM5O/iJeG0CCVQrnkfifwMLWMImQ5MPCprnuk6DyFTvulKC4vVzE6D8uK4xxpbe
         q+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OdUv2xn5NTVX4upCxFLBlB0yHvpqXhX8iMiPwr0mJUo=;
        b=awL9RXqZfigyM74Q2RD9wE+6vvBk35Za3m3zgjOVapC2Gcb0qtzlb1fMiLfeQ9AD3l
         RPW4CIFZxNey225/RJBwMZcpCro6/sEisEEkUvTRqJp+3edfgiz39Z4yRTT70E96LjFb
         OHPoxrE0F/43HRSChESRSUHsEqaUpMlYrrRtltzOSBrGIsoaLpzEjGw1OVYEY7O847I4
         QVX+BjzR/CGECm4vQROt/gRwZvuWfXNu/iTRL8QrdXZ0OTbUk3Cy0iVFRc/fEKbhooQ5
         j1lNLf6NJteUxvjVfKLjEUjvtwZvyAynHgL6LzXqq9ao3m+zKZfKnbVDavWwRv6dq9yE
         sYDg==
X-Gm-Message-State: AOAM533e19lMH8E1MoqEkbgqDJE+8GfwMcpmXycu6Ac22DscHhc4K/9h
	tny+V71Rnkt1aZYLlCU715k=
X-Google-Smtp-Source: ABdhPJx+jOoVjmVg8eboQUVBADDx/rVM3HKCdPwk2DHla3qTcWnsseF+WE+NAdOnRG5f/Cya6++6jg==
X-Received: by 2002:a17:902:9f94:b029:e9:68a3:8551 with SMTP id g20-20020a1709029f94b02900e968a38551mr835471plq.35.1617777432651;
        Tue, 06 Apr 2021 23:37:12 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id w21sm4180614pjy.52.2021.04.06.23.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:37:12 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:37:10 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/49] staging: sm750fb: Rename gDviCtrlChipName to snake
 case
Message-ID: <eee9dc29bf4e8fa116eb32cad88ebbb92e3ce634.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the
global variable gDviCtrlChipName.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 7e0a481970f5..a7e0f001d96f 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -25,7 +25,7 @@
 
 #ifdef SII164_FULL_FUNCTIONS
 /* Name of the DVI Controller chip */
-static char *gDviCtrlChipName = "Silicon Image SiI 164";
+static char *dvi_ctrl_chip_name = "Silicon Image SiI 164";
 #endif
 
 /*
@@ -269,7 +269,7 @@ void sii164_reset_chip(void)
  */
 char *sii164_get_chip_string(void)
 {
-	return gDviCtrlChipName;
+	return dvi_ctrl_chip_name;
 }
 
 /*
-- 
2.30.2

