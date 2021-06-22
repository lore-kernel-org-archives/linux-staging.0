Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FFE2FB0
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so2216318wml.5
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77HnC0dTisnKWDPVh1Io+8wCN1+6InnJC2WdQmork9k=;
        b=eV3bi0QWiS3dhAEukWk//V78hWjn1gLyuq01ztKAwHaJpvOxgK4ny0+fP8C3gt/vLU
         SEc4jsi4UEgeMDnfnz2sbrpl9pDuSwg8FAjlcnGGH3Q/M/mr7zd62FIVq9A4xunx/vMQ
         4oSj8GshgGw18zZGfEsRiWbNwzfCWmifzbRh3E6pwKZrig+f5NRcAnv9au+PYabNaF3F
         Fnus9byJgmfxx01prjaVst8aAc3nGIUPAtWqv2A4+zjZpqGSagr/WyVWIIc0Gr6vADkH
         7Mvb/X2blOXE35Wmrox7EckfLaUdLmFI8Nz/mqQfV4Z0V8+68cC2SbyhX1+SU43Pyuz6
         uesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77HnC0dTisnKWDPVh1Io+8wCN1+6InnJC2WdQmork9k=;
        b=YAWUMXb1QXAL5FNlXryZxvS3m5y6llDqja3meM7OPA0VoWy68K53sscDheS9cyH2Eh
         kUsWtfINQjumJUij1KhBJEsf+hqJw1Y1Slr+V/4wInky9FZH1rTNmUBX/MRFw00On0up
         p9s0BkSJM71BN5Ezilhfr9wqP6NWj150UfqDDBwMbmxahFOm2T8pZsWtGtnE6mEChjtR
         /h3g/gLn/erAJa+XnC1dfFzxjDqi2i9uNaN6XsXsnY1bAXVkUUJ5Dp8tnhr//XiQtWdD
         Sr0nl301242txu96TcivkrWfqjxeftmHmjg3qpiZdQPL+za5Z6YHa/Okfkoier1OxwND
         0RRA==
X-Gm-Message-State: AOAM532OIWyZe4ME6IpJQgmPAbfGkPKWyx1lsDwtlEK1QM/bzAxP5hUV
	4nJueDFg1zk6P3ypWMjTtO8=
X-Google-Smtp-Source: ABdhPJyNqUwZwDZ+8p0Oocxb89SguUKQKGgjRotkGLlUznpJwrZchQPQVdPye1BU93oCshc553/iIA==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id n15mr4299272wmq.116.1624367424579;
        Tue, 22 Jun 2021 06:10:24 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id b71sm2451847wmb.2.2021.06.22.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:24 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/17] staging: rtl8723bs: fix macro value for 2.4Ghz only device
Date: Tue, 22 Jun 2021 15:09:58 +0200
Message-Id: <0b4a876929949248aa18cb919da3583c65e4ee4e.1624367072.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix IQK_Matrix_Settings_NUM macro value to 14 which is
the max channel number value allowed in a 2.4Ghz device.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index c349de205f93..abf6547518fb 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -195,10 +195,7 @@ struct odm_rate_adaptive {
 
 #define AVG_THERMAL_NUM		8
 #define IQK_Matrix_REG_NUM	8
-#define IQK_Matrix_Settings_NUM	(14 + 24 + 21) /*   Channels_2_4G_NUM
-						* + Channels_5G_20M_NUM
-						* + Channels_5G
-						*/
+#define IQK_Matrix_Settings_NUM	14 /* Channels_2_4G_NUM */
 
 #define		DM_Type_ByFW			0
 #define		DM_Type_ByDriver		1
-- 
2.20.1

