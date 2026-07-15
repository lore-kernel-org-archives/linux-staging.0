Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B44480959
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119834; cv=none; b=K9Q4FqiQL5X5AxXqTQ9ma4BDMQZIrlU4hcn9PROMgtBoq6jN+RWWrlMNy6wgwOTUtCaBDR7seW3LnecLAjAzBDci4ZiNfUyzbkGqeSH5Jr92YfQ96/1oMMtBowIVgkPQA9NcH5En4ddD2iNbnOhKN42uFxCniINtCeDrzNPqYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119834; c=relaxed/simple;
	bh=AFGOrB9Pa11r7psjjZSqpoL+4HED2uf5W/sWqcZrktk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oquTjM1uebkBqn9qg5unrOytPSWtN1inVR18LDdYGHk+Oe0VTeAGUW9Jn4gxL2Q9E8VGgHka5ag8OOgnTY0OylMfNFmPMByvTaq36uYlYJFnKIwJJd8sK73uUFAeMWRcgIKNNHZqjc4+dwtQ6wSoGukeGXngSwKuPJO/5Svimak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZPA75US; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZPA75US"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so50407571fa.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119830; x=1784724630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnLNMxFbMW9A+osLS4HGXt4qSj8djglE8s86E5aJFnE=;
        b=YZPA75USmtaE5xVfTY2X/ebN6AShR240+FFgKvzw7+AO/PItuCch2J+kCTJFbxkPZN
         tK7NQRHZoZ8kSo87MHc+WNhnayH1XOukZUz1t9ie2qzIhgmiZFDeW9jTR32qd4fNrnLz
         a/hp/cTTRyjs3UFjlFmY8XOrBeu/LOJwequsFzRxxuk4RiJo6iFefWdQTrLvuK3PNtGI
         L6j9N476GLRTEcAr7z0F++TUDkxIO80MUTX4YkIRn+K7R6pxuOyPyzNU0XbVMNhGEMlv
         5GW/7KjCJmNALIa3i8Rh7Wsb1+PceUH3KGgNNt+WVKMkxRy9gEUAChf3sFxxSShdnVzG
         u4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119830; x=1784724630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VnLNMxFbMW9A+osLS4HGXt4qSj8djglE8s86E5aJFnE=;
        b=HTxuc03jIAuOR1iAC48pD8Rj9b+vpz2LOj7S1zgX0CpKkIHsdEf6SaWOCnLFM1Cu+k
         /cj3Y1lbKC/72b7zP3aV2Fq9FwVEaO1o4qPpUqevhlqKWymGcP0aQR4mL93T/s9V8tZb
         LDlBQX3ZRt9IEjhQPKSuOLa1VKN59qbZTf3AOzf+9580BNcY29GbfiFpFFlVP1jzHm3r
         mH9Garbt/6o7UMBmwiZWiVANuVR3BlIIeit6XJQnZGlfEg6GdxSdm1/BHyXHFuAygYQv
         4clzKdyAsmK1lUrfY3J9C1A24LVk3V4oXPgLuUorJ6JuXr0TwISWrVNL9jQplD9BQ4Fd
         huOQ==
X-Gm-Message-State: AOJu0Yzjn+oFD/JM2W5y9LlNfalcFlXoiaYQFpdcsHYcBMZmoP3H1K3e
	/lOLzAApcRXiVZ2Ddp3PhS4rFwNNv9nDhOl5FVhkGxWSFigTDUkeUdVdpA1lVXs0ah8=
X-Gm-Gg: AfdE7cl5JQVIqmO1nSp1feY3mSpzQ9JDF6NJLwWnCZpVMv1wZ2kXxqDvV3dcJ4ICi99
	G0R50mAM1qAiFsh/36GHVXqobS41wyObMSxDUW5CPuE6f4VkgHWCbEg+5/HKnaFFCctOiR+079S
	Zl3AibzBRDtKdLstHdVncqgWgUHnHC6oUpqCUj8jn4dWS6hIMH4l1DVLZM0N/Crdpzu7He9WAit
	e2gV1JB6D2+qwwtVSrXv7LjwZxe5IQk3dmTG5ZI7mcXqGTdL4uhsF7VNuZ1tCkvQEfgwcWcgFrG
	uCDPu22CqPAwfYzy6a6Kh4UcOrPRbR74BAoxHZBRdZRmNsRJO8L1pSGqhuIPs5f3hMygtez2DC8
	HylZubdLrActWG8ZhAwYEHWM5eYr46H6HqI12jMRElUx28tT5ls+yT0xZZpWmS6DKIMmISpRF3K
	WF09CTIT/Ww9XBvJ5S+PenwNEx8Th/qza2dZEcikDHvB5njVfKPz1hBH0mR6Lswp0skLgLbOqxl
	JfnJG4xVoQbcQ==
X-Received: by 2002:a05:6512:230e:b0:5ae:bec7:8b73 with SMTP id 2adb3069b0e04-5b159b8bb13mr1406385e87.57.1784119830237;
        Wed, 15 Jul 2026 05:50:30 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:29 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 19/61] staging: rtl8723bs: make lps_ctrl_wk_hdl() static
Date: Wed, 15 Jul 2026 19:47:47 +0700
Message-ID: <20260715124829.90290-20-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make lps_ctrl_wk_hdl() static since it is only used within rtw_cmd.c.
This properly restricts its scope to this translation unit.

Additionally, remove the redundant forward declaration located directly
above its actual definition in rtw_cmd.c. This duplicate prototype
is completely unnecessary since the function body immediately follows
it. Cleaning this up reduces code clutter.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 88ac64a6b..bc2536c1b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1262,8 +1262,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 	rtw_ps_processor(padapter);
 }
 
-void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type);
-void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
+static void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.55.0

