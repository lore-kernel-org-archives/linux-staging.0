Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148061860
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 16:20:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z97so9506997ede.8
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mslrvAnEr3TpSO5X38U+iS/S6NUXdhZVFElJnWUwu3s=;
        b=GD3M6ZeYw41YJxJi7HhErMRuFz+d5shSG79sMa/sNp7AOJBdOFt3pHVyTrMIB+ckvD
         ueHwsKZ6/A3gNHX9f5S9CywFaseSlRQsaIX1M837b8IsWgdB5KlMBqAG5J5AYs0PDapi
         N8jfeKJS3hdsd5doN2zbEb2qwxUUzXwVK56eGGtqquBfAdz+3YCrUrt3o2NejE8qkz6v
         nuQ5QQaHh5ND6TXbabOrE8GCx3QMQb0gT4eVrmeNdsnPN+k65x6pFkDrD6WutUWGdqjb
         acznzub9cg8fMmrkfxMnuUDfIv1wGPjPXZ1zjrLNmTIUxSqlVs4Tm4Y+2KDgZFrwmUvn
         MEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mslrvAnEr3TpSO5X38U+iS/S6NUXdhZVFElJnWUwu3s=;
        b=fmTKekM255oF+xSv/BTtPGumJ5q5yYwDtSgEGz0lzgHp58zqKfa4QT+WG2vIzhCYOW
         FTPBVDHMmWLfFDUID7X3IFGj+mlDt6s8vy3Pm5sDi7m+pCM+kKwc1b3wrYzwuoIHNrkX
         4t18/q28FlPi/re6CXoILgcUmSE1nc2cGXfxuPx+KD/axhIHIawwCCKbZFTPgt4HW0S1
         gQp0n93rWoWxpkCCuKQGn9GBJ6CCG/tnwID46B3IU6kT5Jg38binpHjv+K7qLXWnuhE0
         l2a7bdW3O9Pl4gPo8M7ufW8MuZ11BWovzJFHiGU/65cyaGASGtLMSomKoL+EkXLTEnie
         cMPg==
X-Gm-Message-State: ACgBeo2oVQ/5Xnsnw6MXhkLPjoDSkmRQvtzE2d1qH2tFiXWsKAfkA6+w
	0B5gg15XakXAtCZi+CmGAYE=
X-Google-Smtp-Source: AA6agR6tKfXAXP4ZvieTYvpgPNZkdMlKGl526lwtq9Jt3HoZKR16Wluu3yKdKmixn+UXnjxGsaHQ7w==
X-Received: by 2002:aa7:c1ce:0:b0:44d:d5b4:adf5 with SMTP id d14-20020aa7c1ce000000b0044dd5b4adf5mr19845305edp.182.1662913202426;
        Sun, 11 Sep 2022 09:20:02 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id bt6-20020a170906b14600b00779dc23be62sm3055346ejb.120.2022.09.11.09.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 09:20:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/6] staging: r8188eu: remove unnecessary initialization
Date: Sun, 11 Sep 2022 18:19:46 +0200
Message-Id: <20220911161949.11293-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911161949.11293-1-straube.linux@gmail.com>
References: <20220911161949.11293-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'retsig' in odm_signal_scale_mapping() is set in the
function before it returns, so it is not needed to initialize it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 5fd53c60f762..a557c5d1542e 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -15,7 +15,7 @@ static u8 odm_QueryRxPwrPercentage(s8 AntPower)
 
 static s32 odm_signal_scale_mapping(struct odm_dm_struct *dm_odm, s32 currsig)
 {
-	s32 retsig = 0;
+	s32 retsig;
 
 	if (currsig >= 51 && currsig <= 100)
 		retsig = 100;
-- 
2.37.3

