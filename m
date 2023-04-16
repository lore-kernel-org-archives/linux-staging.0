Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBB210FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:20:02 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-2ef1e98d6bfso847238f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629601; x=1684221601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90mE4vdn9DzTlSbEbDUJ0ZvC16lpbnbcfCKswzbdsYs=;
        b=VSdKfd6tV+8i05h89Gqj1/SH4zXlr3DvwA7iTIRF3rbn0aSxn7thUq4cJNwm4a/nDP
         viD1eCUNbN/SwsZwS6SbnljvK0WLZVu0x9kpv/6LkJNzRgqvi6IIpHftz8efjIubOJvR
         +JcupzZiYw8X0HNjGoTh/nxDMq/JP6Tgyi38p8RnaicRp0YrqMra6uP/OkevglzP9QF2
         3OqTWTmhi/xu/s9iHs7c+HfbOrPJG57tbTo3gPZMhuHrodS/WbAsr2zZulFTnGHpILNH
         otGQh1JxICB4TiNMaVGgP/6Yna9VBdCYmHYbapv7x2UiS6Hryn4gN0v7eHxa/xMpI1hT
         KCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629601; x=1684221601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90mE4vdn9DzTlSbEbDUJ0ZvC16lpbnbcfCKswzbdsYs=;
        b=ZioVOGBIqHF1xhu1yUk/ESCD7vTMO1NK2pC2bCBsBBOEMUJBqAprfrceBnf1RHCLeT
         qCY/VXwl7MV1ZVKcbJUurp/xdZo2cZtmofiTbiBvIFrzUlE79Uj1vcQ17Tme8jBBorBP
         hFCQJ0nNLpuIuZggTXPoydaWmRblV/IxzSbsXMN5dkMuFw6Q5+xBYLYPY8D6bUiyzdbt
         H4zENO33jLfHQKd8Tqo+dJoYD8sqLNKdNsiez7t4cPGp0pfIKeMOJ0FaIcOu2Ii9Xqto
         YgWlMekPZdrTiHcg2SCq2XhYGdB91GEC7Q8tnxz80RJOAb/ra0nRs6L0GvBZWJuyAO/m
         00Ew==
X-Gm-Message-State: AAQBX9fKygdVcubJNJk043pVdjBq8KBUP3By1ZXvWizVK4dN7CqJEZgW
	dh2Dla1HDlIUnaozTXhpuS8F0RTfWu0=
X-Google-Smtp-Source: AKy350a4IN4nnH5XTOwrfTuJMdHp0biWw11GVr9plvTPUzlCsevkSGG8ElTmF0/m7+UA5g4YDCZa7w==
X-Received: by 2002:a5d:6d4c:0:b0:2f7:dc6a:9468 with SMTP id k12-20020a5d6d4c000000b002f7dc6a9468mr3384392wri.3.1681629600725;
        Sun, 16 Apr 2023 00:20:00 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id s15-20020adfea8f000000b002d1801018e2sm7388202wrm.63.2023.04.16.00.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:20:00 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:19:58 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rtl8192e: Remove second initialization of
 bActuallySet
Message-ID: <ebf51fbd56bad4f8fd7fb51fe031f376c3ab6d2c.1681627603.git.philipp.g.hortmann@gmail.com>
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

Remove second initialization of bActuallySet to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 93504d5a8578..7342ef591169 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1539,8 +1539,6 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 	enum rt_rf_power_state rf_power_state_to_set;
 	bool bActuallySet = false;
 
-	bActuallySet = false;
-
 	if ((priv->up_first_time == 1) || (priv->being_init_adapter))
 		return;
 
-- 
2.40.0

