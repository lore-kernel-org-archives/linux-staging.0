Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB017724
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:45:02 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52f1ece3a76so4227463a12.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167901; x=1696772701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsEg8H7d6fgrWJRtj3vP63E33mgGkOeEm3YkuheUnaU=;
        b=FDFOu7m3QOyQvJ0jKD40hONwEHZL/VzYN/ChDDhyK+Wov9jpH74RwFQqnukvH1YlIz
         vEv5YypqltumZ31yeG7c2Tw/AdoExgHojRbne04CJlKBF6QMl+hz63dLKjnrXNveCpjI
         JjzDnWYk1/Vi3wnd5ehXc4uwEHkHzvxFvfy6cIqUAZrKb2XvJLIZCUiHbXYJyd04MQIX
         vVk5mxFcxE+6Pg8Syn+3uu0YaBWwUQu20Liwgz/zy6WAuvB3laeVMWY0mBkgTr99Xkjs
         ay3AO29xwnpC8o2FZ818tssLLOCmjCqDQKlKa7uiv/LXgdUHKeFs7SzZmNh+hf7cfWZ+
         Tzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167901; x=1696772701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsEg8H7d6fgrWJRtj3vP63E33mgGkOeEm3YkuheUnaU=;
        b=iX6OKNxmQmyzE4RO4ahZci5siHR5OHfua/NunpgyxQaPme7AZUBpvtE4si1z6sh5M9
         KUh3aXMlBg33VN14GrzdsHGbEFVRu3EUjmlR1KAaMg0Cgxbbv+mcxiYIMGahs1nJpcbZ
         wNeh599ybR3g6n6ZnRJLSKeXqjboMfM+kaUlAlYjWjCrvkCjM/G/CVTycxoF4c1YQ3wu
         ZrywL1tfJZuTB7ErtlxtzygXUJRtUMALwWT5iRDAXVtgY1HlorIM5IJjPHVHVozo959h
         /iTdkFAq1Q2uphz5GZkq/k2eRDm56jEAX8F7heRvrIWRpKGqt/qA0K4vTUyUo4TWtd7R
         wNuQ==
X-Gm-Message-State: AOJu0Yx6Q2uHOrJK6ZzUKSgcZe6PXH1jIXy5LxRrZKKOGWAfqF+FQPn+
	qh953HjzgpTPfwecnYFk/QI=
X-Google-Smtp-Source: AGHT+IGxP2K/34ynK04IRN9ZJtAvrHaYasGn81qD0BfShuuharbUUq9C3XyGoopLntj41nhu3xDzJA==
X-Received: by 2002:a05:6402:2792:b0:51a:4d46:4026 with SMTP id b18-20020a056402279200b0051a4d464026mr7106424ede.0.1696167901402;
        Sun, 01 Oct 2023 06:45:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id f5-20020aa7d845000000b005364b54a4basm4297223eds.80.2023.10.01.06.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:45:01 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:44:59 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8192e: Remove unused parameter from
 _rtl92e_sta_up()
Message-ID: <105beac3b04bd73267b3e30e6b944b381dcfa8a1.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

Remove unused parameter is_silent_reset from _rtl92e_sta_up().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 9da858510211..94a73f9cf888 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -588,7 +588,7 @@ void rtl92e_set_wireless_mode(struct net_device *dev, u8 wireless_mode)
 	_rtl92e_refresh_support_rate(priv);
 }
 
-static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
+static int _rtl92e_sta_up(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_pwr_save_ctrl *psc = (struct rt_pwr_save_ctrl *)
@@ -1709,7 +1709,7 @@ static void _rtl92e_cancel_deferred_work(struct r8192_priv *priv)
 
 static int _rtl92e_up(struct net_device *dev, bool is_silent_reset)
 {
-	if (_rtl92e_sta_up(dev, is_silent_reset) == -1)
+	if (_rtl92e_sta_up(dev) == -1)
 		return -1;
 	return 0;
 }
-- 
2.42.0

