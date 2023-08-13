Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166E17CA
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:36:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3176ff39a28so679964f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Aug 2023 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691908603; x=1692513403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZksEFWs5gcqXs2RD9fx1RHaWOhTjp65n9mM6G9h1Zg=;
        b=p1pJseAx73KAkF1sWsnQDTQr2UKK8diUs5kBL6oo27OcK7q2qwt7eYq9fdb1hCpAMu
         vcxuLSFJqJHoa4MQt08pViRS6/AJ8qwKiDjktyzTV1/Tq/IF/hjwm9beZmtlqroJnO2l
         Bq96rnZNwfMVdy6Uv2mBuJgTYJ9dlbeBcwrxuSSvqVQGzjnRV+/ZGevkB7Rq9brmhOIY
         Mo+k4BnWinE36K2tRLzXoRyNwykdWyz0OtUvDwhPjCOUvDwOoUJWT/bRiqQJqnIvY6kS
         sU7aLqMudBU5nAmKDkdzOfqQfENfOOZAsSMmD96iwgbDeLnqYImKApgsYX3YJlIdl1vU
         z/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691908603; x=1692513403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZksEFWs5gcqXs2RD9fx1RHaWOhTjp65n9mM6G9h1Zg=;
        b=AUGbdoDHBuL4KNG6SHE9EcBr7EhzNK4PQJuG7PFXjMcOUWL30QTVgdDORBKagCT3nx
         ETY939kYIKqCsNzTLru3Tqk+rf1s/U1F4kefqH88mfrL77gtFN4nOPxBGNJe6V+dWLzE
         tasvgv8KtUeYqIOG7ajhL5V4DYYpyzkpDBjQIevmfNg0I1urkCVhktJWnrkXbAeoRPNU
         vgL2smUxuFkEly50kp43dMWGB8JKOeG8/OXXji0W2Yuem8Htp99IyJ+co+kkgFQzv6Ae
         SjApZA9762JzhI2KAWbXVpWnvS/yvS0yGuCv9gW9TOOizsdl0RHQOWp6Ci+quecZi0mN
         D8GA==
X-Gm-Message-State: AOJu0Yy6gUHlZDbHK5ipb/79KsyDx3fFm8gYCvjEQC/zAZxFRadfOPdn
	Z3ZO1jNTxGPXMjsnqVTO5KQ=
X-Google-Smtp-Source: AGHT+IG8ki56v/UzcesUZ/CiVmYuZaplD51t9zmZ14vEHOrNqcSm4IevbJn2jRH6wlJKbzYZmTYwbQ==
X-Received: by 2002:a05:600c:354c:b0:3fb:a651:c153 with SMTP id i12-20020a05600c354c00b003fba651c153mr6265295wmq.2.1691908602760;
        Sat, 12 Aug 2023 23:36:42 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10259669wmc.19.2023.08.12.23.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 23:36:42 -0700 (PDT)
Date: Sun, 13 Aug 2023 08:36:40 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8192e: Remove unsupported mode IW_MODE_REPEAT
Message-ID: <dc6a0ac89970f5b80a552453a9d057c24f53f43b.1691908402.git.philipp.g.hortmann@gmail.com>
References: <cover.1691908402.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1691908402.git.philipp.g.hortmann@gmail.com>

Tasklet irq_rx_tasklet is scheduled when hw is receiving frames. Function
_rtl92e_irq_rx_tasklet() is then called which calls then
_rtl92e_rx_normal(). In _rtl92e_rx_normal() all frames are processed by
rtllib_rx(). When ieee->iw_mode is IW_MODE_REPEAT the function returns
0. The calling function then calls: dev_kfree_skb_any() which clears
the skb. So the driver clears all packets received in this mode. Remove
dead code in mode IW_MODE_REPEAT.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index b3f5ab33603e..322e603237d4 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1496,8 +1496,6 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 	case IW_MODE_INFRA:
 		ret = rtllib_rx_InfraAdhoc(ieee, skb, rx_stats);
 		break;
-	case IW_MODE_REPEAT:
-		break;
 	case IW_MODE_MONITOR:
 		ret = rtllib_rx_Monitor(ieee, skb, rx_stats);
 		break;
-- 
2.41.0

