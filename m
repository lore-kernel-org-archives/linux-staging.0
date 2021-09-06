Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258B3FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:17 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so2882293wme.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SO/Jocqxu+IOs3sdvJh2k+WzMJN/xlAm6Qko2Xrfsn0=;
        b=2L2dI9zPAA6cXt7gicaLBZtxQ+JDoSdl0FDbZAFCx8fyPMqNoOZOxW5r/pHphayhR7
         QIW+oYqIDWUyku2257ZduQoMYzXQzzOe4RePDhPgs5a4y/uAdYQQ/SVT/kvFXcIT29Ri
         GJMj3Kq/BhhSPWadeFrNc/39bFEw5XzhggmO0J+/cCDGaizTfCClvHgdIh9QZTzE/R/F
         vy/6MMlAMIMMCnbdV7MrwLbhD0vBn4FCdhJFbioOVAREYAbHVBpsmqyccp7Ytv221yw5
         /z51K/IBzGVwqAqY619qDwfhlmGRcJkIJ3CtkmlFxpRKTMmd9PNYm/sqfduM3jm+EzgE
         IHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SO/Jocqxu+IOs3sdvJh2k+WzMJN/xlAm6Qko2Xrfsn0=;
        b=nkoVuQUTE635nxG2JSlhHbG0h+Iih8vaGU5z2BJ+UaJnTlEPGWymkkq75//0A0YPWF
         SkEgfNQQJUWZ5R0QZnNNyoeWHwcAZ30M/eQKoVqxtd3iSrdpthAir09Wi8hD2epuJ9pz
         E4D+mClCoHCbxCckWjDY/Kkcfiurq2IecaAaJ0fG+FmmE+VN4UPzQ+rgYqBZ72ys+5q4
         dJFB11U6irfKq4OUdS3VlcU5SKYvVAN2YA9VxNRQoi0FjxR9ec1yx2sbCeogX7ZUyJ9Y
         kP0mj8Ay9R2H59JJHNUwJisSZWhlMIcpN1hQHZul1LitjWYZY+mgOA90mdDks3r04+9K
         4Fcg==
X-Gm-Message-State: AOAM533ExTbXs5AeIOVmiSTSvlD3/BHerYSogfsjtcjKFlfi7hrV9MsO
	g1S6snbG3Wv5Gc5k9HnYc1ATIHNO6cBbRA==
X-Google-Smtp-Source: ABdhPJwY7z9AQegBqrJ3fbGKy1g1YlTg0s3+p6zSwNbqu8aCRqjWrOuS2T2NwQOX7STqXdpxSIggCA==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id n35mr8618291wms.166.1630890075576;
        Sun, 05 Sep 2021 18:01:15 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:15 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/14] staging: r8188eu: remove interrupt_handler from struct hal_ops
Date: Mon,  6 Sep 2021 02:01:00 +0100
Message-Id: <20210906010106.898-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove interrupt_handler function pointer from struct hal_ops, as it
is unused.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index fa3c09e3c2f1..c4c04f929225 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -156,8 +156,6 @@ struct hal_ops {
 
 	void	(*read_adapter_info)(struct adapter *padapter);
 
-	s32	(*interrupt_handler)(struct adapter *padapter);
-
 	void	(*set_bwmode_handler)(struct adapter *padapter,
 				      enum ht_channel_width Bandwidth,
 				      u8 Offset);
-- 
2.31.1

