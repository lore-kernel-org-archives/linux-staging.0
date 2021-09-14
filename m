Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7659F3FD2
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 12:14:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id m9so19878556wrb.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OSOSsriq+ikZA4mrzrbiyfyFu2Bj3tXb4d5edmqNKB4=;
        b=q70A9tlWOBPLy1DiAfiSONQK7Sw1+AW/aaL4siomehOjHGn0VgZkP/qoGVyBhPYldj
         fHE1wChINyLhDfdIKrtuLCnvTwEoJvK6t+GCGu7IH+kxNMLB0R3cshL2DKevdWbgf86C
         c6piviBnczb+GDkuAM35WaOZKoBqNhhwbsPB2y+/a42dODfV0tEqXAixp4sDhJ5qKhXO
         aW7MKYiv8aPUOhKzi2w3FoxzFLi31dvMLhfwpNbMzfIHl/Esm0G2/UZtAA/AeO6P0nH9
         wmnvOhrPnyw8r7x9YULJ/w0Wkm1XtjdxuvOgBtyrZPuR68e1uqYEMFDZ0KdBoCHuhaIT
         BmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSOSsriq+ikZA4mrzrbiyfyFu2Bj3tXb4d5edmqNKB4=;
        b=gxgkgmWfLCb++Q+2tf5uOOkRYrtrE1azn24uDBbMv/PedJW/nJfocB67dbWYK8lMxz
         wRk568nJHFdKp4t15z35mcIDXpPij7k1ir2JvBEYO6zLAKLmdcDHoDYwX3sdpGL0A8OJ
         x96huY7vvcD3IndTpNvk3Q0R+2uRyql4hJRpLy5OMzecjJqEZajmEz9Bb0wrgo5Uc/Si
         v/p5fJZjFgF/uu6kfgOZ+N2ohFHVRFnPBqVqGzKXc4nW9Fkrsr2wvHaBAwYPwURODII9
         hLL/Qyc30IYtuWjQfCMFZq/pdMXb11zjnIgOybmgiO4YmEG5W12pxvOAyobCjnyVOhhB
         b3hA==
X-Gm-Message-State: AOAM532wHbL0S6oOg+6XGGrzOYccLnlp/KDZE6GEBFo73XeLDiWzS768
	uIBiKjg+DWjmRRIWKIomcl4=
X-Google-Smtp-Source: ABdhPJwr9vRCEnsCKAXJFzsbqAbtHD1/njk0Rbl4uW+ULWc/VzV7RFguKM6ix7w3Oi+nvsbMes1hsA==
X-Received: by 2002:adf:e810:: with SMTP id o16mr14205084wrm.219.1631621645909;
        Tue, 14 Sep 2021 05:14:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id j19sm10028100wra.92.2021.09.14.05.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:14:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove unused field from struct hal_data_8188e
Date: Tue, 14 Sep 2021 14:13:52 +0200
Message-Id: <20210914121352.26052-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914121352.26052-1-straube.linux@gmail.com>
References: <20210914121352.26052-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Field BluetoothCoexist of struct hal_data_8188e is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 17913dcc9fbe..e7e7064dd356 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -289,7 +289,6 @@ struct hal_data_8188e {
 	u8	CrystalCap;
 	u32	AntennaTxPath;			/*  Antenna path Tx */
 	u32	AntennaRxPath;			/*  Antenna path Rx */
-	u8	BluetoothCoexist;
 	u8	ExternalPA;
 
 	u8	bLedOpenDrain; /* Open-drain support for controlling the LED.*/
-- 
2.33.0

