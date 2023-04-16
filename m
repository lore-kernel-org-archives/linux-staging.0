Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F77B10FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:20:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f0769b0699so4542245e9.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629615; x=1684221615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6KW2PuE6P/kp4akhCiH7Sdg4oCedA/I/EoMEq7tlfU=;
        b=CZn/S7FnVfpzAK2O+MIC993MubTweoYi2b0kLcTR3DfnbjRf6cQ4pzcSSmkDpfSzm9
         R8VObwR6/8AG3HzELGMGv8dDvLzys99MxhaOU4bAfCKZm+toknizX+Tl2sfK2N3p/9yJ
         3G2O7PvMV6OfSOIWZ1ZRXVUlrp18DKWiCflvdDKrQXC/h5UOx2eEbNSXHh0xx05p8es0
         xu5ahE5zI/MlpLX/gHB5+4rr1CGB8Ns7uJQMADOYE02YOwp5bF+XvQMyKL+gaXQW+RSg
         MxrvIU/3puKczz5nrPJcfN1HxSNuYyhAj01Ko8tHcqgO+huRw5MfTQcmcZrIn4BTDVsY
         qFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629615; x=1684221615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6KW2PuE6P/kp4akhCiH7Sdg4oCedA/I/EoMEq7tlfU=;
        b=cjBheKYo9ZwsLm2/wFVhxIaPMiAgQqsX/5BF2aClGxLndNzfqrIHxH6chX1N9l5WMa
         c1YurTl/+pm0hfk39jCdeCj+48tTE1nUTPkzrkCUN5QVHv6BkqV29dqVrYC8P0FmXXx3
         04s4Q6mWhLoFrcl46DHTT43PKGs3ArblWJqfAtajQoZwO+wIPA8KpfmBYAjcwhATMPwW
         /akXTLqPqZoiairWhQqHWsEhppiqyD78NojQ6EE+AXoD7ye2YbALhbSyCdXZKD5YpKpe
         +vbKi9Vy5KHk6gvH5zlwMFbVXvfeuw8WpNEQ6Ybt9DH9bahyAs72/p5KiRQ6rmAjBSut
         sy0g==
X-Gm-Message-State: AAQBX9fPMWKXtF/lNev1dAuhYKUR3yn0FPt4dg4DAfq527tcOBHhGFSA
	0F+OYabuJw9yByWSWmDtdVJEaN6AasA=
X-Google-Smtp-Source: AKy350bGjtWeR3gK8kXbPzhir2vkzZs20IZA8ABoWWJWn7J+vjLNB6cMWP/Dn13R6eMaDYboT9i/wQ==
X-Received: by 2002:a05:600c:3ca0:b0:3f0:a845:f215 with SMTP id bg32-20020a05600c3ca000b003f0a845f215mr5380689wmb.3.1681629614746;
        Sun, 16 Apr 2023 00:20:14 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c020e00b003eb596cbc54sm8547121wmi.0.2023.04.16.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:20:14 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:20:12 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: rtl8192e: Remove unchanged variable chan_forced
Message-ID: <3f218531a9d31c399d1351d3da7f9ca13d20df0c.1681627603.git.philipp.g.hortmann@gmail.com>
References: <cover.1681627603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681627603.git.philipp.g.hortmann@gmail.com>

Remove unchanged variable chan_forced and equations that have always the
same result to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a0c6d117211a..88ff54173a1f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -249,9 +249,6 @@ static void _rtl92e_set_chan(struct net_device *dev, short ch)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->chan_forced)
-		return;
-
 	priv->chan = ch;
 
 	if (priv->rf_set_chan)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 51240cbde0d3..0eca73e4540f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -392,8 +392,6 @@ struct r8192_priv {
 	bool		reset_in_progress;
 	bool		force_reset;
 	bool		force_lps;
-
-	bool		chan_forced;
 };
 
 extern const struct ethtool_ops rtl819x_ethtool_ops;
-- 
2.40.0

