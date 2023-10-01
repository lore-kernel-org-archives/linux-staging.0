Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9C8F5A
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:44:02 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53142351997so3837427a12.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167841; x=1696772641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpJqPIVcZcjgtPzZR6Y1+bljvbB1Yn2y5DRCpOzZBaw=;
        b=itG5btxOvgguiwXtvTUvPqtEufsjQDI4efbD1YrWZ9viG7NFwnOxH8RpqIKbxWtWsC
         AYafmjooiRuEwJJm5rYHnOsb8Mcf2gz5F3huxlz8bXbHH472xZong2NjyAE4zJfBAahU
         6sKIE6ZnWP7U4nBAGGEoVU6AMluT3h4v2dRSzXyC1AHaY5yX4C0Qw//SWxrsMMkdhFBi
         hZ7tiIIdcjRx/WLh4tuQ9eDWjTmVCHI5NKoJxk+hiPs5YyEwouG9xFGpfSn3WY/W62Wn
         TpRx1ecAPP8oZL7CSCh6ATfGLrryAzriliv7h01Wanl3ISqntAxwytkEbQBoXlIHK7x2
         6fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167841; x=1696772641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpJqPIVcZcjgtPzZR6Y1+bljvbB1Yn2y5DRCpOzZBaw=;
        b=gHDDf0MeiqaEtyFW5cWuOJQgf6JXevSAkYnBPwmRaFiuWrWNDuFr0HTbGXF48MyMu9
         A3UWvxUwN8pUEhz2iTQMxJ1vA9GhOEOYJq5ClmUa9pm0gks0oVs0B6RL+C5GhyNA4nAJ
         8/F/arUbKU04LtFKnIB/CtJ6zMMBK0UwGuywPP9Why7fVOV8pmmJIcUHhpdXsVNz6L74
         i0qaYY6kj2uwRIT/Xdy2vAPRZEi5OPWCU2NFciuj7/jd+fXUg3L6lUDQhj4Bg9pqQSor
         uiVuUOI+XEiLCbhj0Ry8Ex8ZQdxzQ9nKWYzEI0ca23C3Huam0wCKRAT/iqOCRxCvopS7
         /UWg==
X-Gm-Message-State: AOJu0YzYbLL48dZf38BVug4r/i0d0msh/LL3ZKk0BJ30lVd1I4Enx30m
	TtNdx1zYC+0Gf3bJRWeq6Eo=
X-Google-Smtp-Source: AGHT+IF5OXRGF43i9gacuTZV4oRdQf2af9FFA391ivlSZkh5dYNLjj+RmPxYqv/6QsIHztrK8uwkdw==
X-Received: by 2002:a05:6402:2790:b0:52f:bedf:8ef1 with SMTP id b16-20020a056402279000b0052fbedf8ef1mr8458721ede.3.1696167841055;
        Sun, 01 Oct 2023 06:44:01 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005333922efb0sm14083826edr.78.2023.10.01.06.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:44:00 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:43:59 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: rtl8192e: Remove ibss_maxjoin_chal
Message-ID: <7c5d512a69e5832263a0a2e8f4ea3608fe286a09.1696165351.git.philipp.g.hortmann@gmail.com>
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

Remove ibss_maxjoin_chal as it is just set and never evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 3 ---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 82c11caeee7a..d0b7332645be 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -73,19 +73,16 @@ void dot11d_channel_map(u8 channel_plan, struct rtllib_device *ieee)
 		for (i = 12; i <= 14; i++)
 			GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
 		ieee->bss_start_channel = 10;
-		ieee->ibss_maxjoin_chal = 11;
 		break;
 
 	case COUNTRY_CODE_WORLD_WIDE_13:
 		for (i = 12; i <= 13; i++)
 			GET_DOT11D_INFO(ieee)->channel_map[i] = 2;
 		ieee->bss_start_channel = 10;
-		ieee->ibss_maxjoin_chal = 11;
 		break;
 
 	default:
 		ieee->bss_start_channel = 1;
-		ieee->ibss_maxjoin_chal = 14;
 		break;
 	}
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bdbd27e382b9..aa198983cb3c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1339,7 +1339,6 @@ struct rtllib_device {
 	u8 active_channel_map[MAX_CHANNEL_NUMBER+1];
 
 	u8   bss_start_channel;
-	u8   ibss_maxjoin_chal;
 
 	int rate;       /* current rate */
 	int basic_rate;
-- 
2.42.0

