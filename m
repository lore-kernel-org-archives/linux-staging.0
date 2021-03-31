Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A66F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:15 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u5so29093933ejn.8
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uD+KHQGrcBkTxOsJmfiY4hqe1Z1zOaYtNrX0KuUk4UQ=;
        b=f5FuYCU1PWl1q0bRnqk60V0438yBuiZSUP8z1vIBN7tUgqtWnm4dw5gOiUgVFCYsnX
         QI0T75onNBerjsQUK3h31q1J7JdZdW+fCbFx28wyg29H1pSyMY1tWPpvLYJ3sosDeC4/
         6OxyKFDWf+Q7SWLZsDWy8Cx5AvQKHSUx3W4o9GND7/HeFQEXhH7ZuURcKI9LxL5TNAhU
         erG1HdhtjhxvG9OhYt7e5BzRa8boLJcQozRkfD0E9TfrRCr7AGmri5YM6aCFD0TxYB6S
         8DgD2jmsXHtLCxf5Zt/+98/4NEg8ITVNPxi2PDjlVCbZBiKYwJ0xKap4RcjAb2IZnqxD
         b9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uD+KHQGrcBkTxOsJmfiY4hqe1Z1zOaYtNrX0KuUk4UQ=;
        b=OMAP3UEPRo2VIGB/pBgytxoGXIkSriPnoV6eYsLjPhTxmTtJnWBMWpyassWsE2WU7R
         7dBsvxElGYrJqZBKungq2jyNy6jNmZUj0/wAuXB7Ps5CwJg3quKSOplGGlIH7wnqtZU+
         iHFeltnkdVfsxzObsrGfEOeLhoyG8Rt8iHHv4u2U0+3BCUUB+OL11FUSAaBYPdUEq9xZ
         KJ+QDbOYoXdOcu/3//NT0BiWftBJncxNLrOvmRf5ksaJ8ukrTzUYG3UM+Y3pqwNe+XpF
         smqQ8T+xLCSy16HnfeS/gzuwmSGZb4nMdSGLzV3dzxhZ+gSal9HIU++bJ+yN5PLHMLdQ
         BJbg==
X-Gm-Message-State: AOAM532NPvx2yVPx9GhMH+8FHksI6q9n+eKt49l2KWu+KukVmTOGQcAP
	QN6lxjzE+VMfHD59f28ewMU=
X-Google-Smtp-Source: ABdhPJxwqbiWJSO7xBFH74FzTu9reUnb9bEoFIIR1BYNy66eqbr/vz4Bzcmh7dqpe8SQRb1X6xvPDA==
X-Received: by 2002:a17:906:5a8f:: with SMTP id l15mr2572372ejq.462.1617183674146;
        Wed, 31 Mar 2021 02:41:14 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id c17sm1266900edw.32.2021.03.31.02.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:13 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 33/40] staging: rtl8723bs: fix string format in os_dep/ioctl_cfg80211.c
Date: Wed, 31 Mar 2021 11:40:01 +0200
Message-Id: <5d80bb72aee3a5755d4daf3a753c9581349bd83a.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix string format in log message in os_dep/ioctl_cfg80211.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4f6398f86b75..260d9fa739ef 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1797,7 +1797,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	if (ielen < RSN_HEADER_LEN) {
-		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("Ie len too short %d\n", ielen));
+		RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_err_, ("Ie len too short %ld\n", ielen));
 		ret  = -1;
 		goto exit;
 	}
-- 
2.20.1

