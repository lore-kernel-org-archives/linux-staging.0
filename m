Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3192FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so7751560wmd.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6SDVwAxo8MuHClJKgaVJAPWUKlCJYuiKpUSio+EsXf4=;
        b=gMS6SctLHDCRPcwWmcR+TmjFJveV434CNMBCOi9q71OTUw3SiaCW0MEAGoGSEDxw5f
         XYo1zIQ4HKaUVmBQvJxPmw256xes8VIzViUfnppzEhoo4+gYmyCLcdZLx3IAUrRQMTIP
         NZOUt9L9CSpvKEsm+kry1stXCbOdnZYZh0RYyiqymlS1yhSsBvmAcuBam+/2PUFWGiAi
         eGULh3aCHeQm6u9kGE1a29RNjTHLLGjBPYrLxNAY2i8jvFXWxGdQDcUPOOSpgaBnib+A
         EK4gxPIFTff9yCOuGuXvHO/vE+wR7XNt/SfCBYRJ/iWASeky1ECoH/dZIXLxqj0gVho8
         lPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6SDVwAxo8MuHClJKgaVJAPWUKlCJYuiKpUSio+EsXf4=;
        b=XGy9tq09Twrj0Db49XSgOVHFtuqqFXi86vi2L+OtlIu5fskAvfUpTj797hrIBqUqih
         aDcyWTEfvAVpQ+WRDlOSznG5bspYM/TwhHhIZwZzPZ9dPAFj7Ev87swC1cBhWwxIszeC
         9XF1NsZnBOzWeUZ13vcappwziSxY0fzDGMA/vHoejIvyi6sIA6OuN08RKb9RVQzHDWrX
         zYJ8NqkTEl+eFDgv4iGbjrjs0H0gIzl8Rr50N0SPgHT9xmOdZHOnzg4GrIriE9N0msEL
         aGSPWZwF39JgY4h6WwrEQwVO3abdPwQiE3zLDC/V7qPlP17ZiQU3Wsctc+pwM9LEQgC1
         Hv8Q==
X-Gm-Message-State: AOAM531TEojXS62bNIHTxQFzT/LZ15cR5SLUmIa4S7K6k623euKbJ/JG
	BOnRuMXGcxJPMQeSIFzamUM=
X-Google-Smtp-Source: ABdhPJxmJLXuCSsatnpHPIZpX4tl0hFbZodDj/NY74F7Lw0zONQN3VAoXEbdBdeLKLToRH5t9Afinw==
X-Received: by 2002:a05:600c:4b86:: with SMTP id e6mr24184388wmp.110.1628329718022;
        Sat, 07 Aug 2021 02:48:38 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id d9sm1809720wrw.26.2021.08.07.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/21] staging: rtl8723bs: remove unused macro in include/hal_data.h
Date: Sat,  7 Aug 2021 11:48:09 +0200
Message-Id: <13b4f41247d1b8bc10f0576d82e4dc9a285d88e1.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro in include/hal_data.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index f0b26e44f9b9..2bd7a7151db1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -404,6 +404,5 @@ struct hal_com_data {
 #define GET_HAL_DATA(__padapter)	((struct hal_com_data *)((__padapter)->HalData))
 #define GET_HAL_RFPATH_NUM(__padapter) (((struct hal_com_data *)((__padapter)->HalData))->NumTotalRFPath)
 #define RT_GetInterfaceSelection(_Adapter)	(GET_HAL_DATA(_Adapter)->InterfaceSel)
-#define GET_RF_TYPE(__padapter)		(GET_HAL_DATA(__padapter)->rf_type)
 
 #endif /* __HAL_DATA_H__ */
-- 
2.20.1

