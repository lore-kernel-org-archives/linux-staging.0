Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383710FF
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 04:53:08 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 184so15044550pga.12
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 21:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siwRRlWSHlqBGRmLfqz7WxH0j7k4YZlDP6vTKzeSc6c=;
        b=CoRfui3AvkifJVNvTBqxSBEUD1RYlSXklq1JdozIQVHQLvRrzsjtovZ6Isp0zGwCMx
         DlGkQdi7McDlD7RLEBXitXtLnQiHq99dxMG1x0Cph1euVOhRRelQlHa/6Q9a/Kn2m64R
         /bFjlHnkKZaz519snylg4U/yjnub5c9OFZNIHCtDGAxxsGD7w/dR0xN7DS0o9ClkrIVy
         yISryMCuR61H52bL+z5G/JvXswHwHkIMFh42GU24bCdBSVnwMndMfE02R87i3RHy/ufV
         qCfoNusCj/ZOTQzYFhqs8epqOED/FrCxnben1Wbe4fKCU1bQRQPHZzwFzdDvCoZ4wgqU
         P7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siwRRlWSHlqBGRmLfqz7WxH0j7k4YZlDP6vTKzeSc6c=;
        b=jA5UGDdaekx72m+cxgHG/0nFLTPkVPMA3/peFwXYjpxXJxWfxDnXNZJRgr90ZyqWkO
         fkY+LpfEl0c7Y5xk5czliNFXQZYl36vSmJZN3V+ymO9rcnUtIWiJkABgnkI92OVW+vxA
         VN9a0sYwdzJZHLJq+KQpb6iqPNJvparvTxa4StWq9Y5p8kQRt/Y/2YpbZIeNZ0L7iV9d
         rn+oqEm+qbNGMBxgDjniN9enKhqXYVB0xp91Nwxkx8Hv9W40SkqC4fAjqK85gmBcE+um
         K/HXZcMA5SF/J/npCf6rba5qk8axkVhygVTWI0zWEflt2qMyGUS114WAF5Xhbq3yA1Hk
         DPaw==
X-Gm-Message-State: AJIora9HEpMQrviOL9NRc6t01vIV1UOlOoUrPLrpZ4On/bY4w+E3fDQi
	B2LIE/bE5uk7nOWpIsc8vtw=
X-Google-Smtp-Source: AGRyM1sdcPcXr3djCCbq3GGXESutAPLO30Bkk1Op95VLl9vFeB8PwZCYQFGaNzHT7jnyDX0WLathSg==
X-Received: by 2002:a63:78cb:0:b0:40c:e4e0:dfde with SMTP id t194-20020a6378cb000000b0040ce4e0dfdemr1381517pgc.87.1655873588301;
        Tue, 21 Jun 2022 21:53:08 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id gf23-20020a17090ac7d700b001ec9f9fe028sm5564482pjb.46.2022.06.21.21.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:53:07 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: Fixed a function declaration coding style issue
Date: Tue, 21 Jun 2022 21:52:30 -0700
Message-Id: <778c21724752f2de136d82b31c9ffc2bf35ced55.1655872968.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655872968.git.marcus.yu.56@gmail.com>
References: <cover.1655872968.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added an identifier name for function definition argument
'struct timer_list *' as per checkpatch.pl

Note that for the same line checkpatch.pl will also complain "extern
should be avoided in .c". I am not very familiar with the codebase
so I decided not to move the declaration to a header file.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 36ea79586992..7e2f5c2f9111 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -24,7 +24,7 @@ static u8 rtw_rfc1042_header[] = {
        0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
 
-void rtw_signal_stat_timer_hdl(struct timer_list *);
+void rtw_signal_stat_timer_hdl(struct timer_list *t);
 
 void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 {
-- 
2.36.1

