Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5876D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:30 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q26so846946wrz.9
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eJRj1n/cuhJAwDRjHiH4R8KD3m6yCHecaRSvaH7YYy4=;
        b=sqOqRDGvSR7BfEzg6VgpYtisECHQLZ1K5ogP6z626MyVIvNfYQKd7x+uU2yIpuWdjN
         EYoZVyNIuHh3hOk0twgd53u0XkwHqDYt9lvgNMfwp3ZBQxBskqhuekO9c3eRXM1oeZ9U
         o/5N57IulP0O/xhsi0EN2goFMa2vVd8a7o3TfGXn1bwDSW2qbcXUc8Spw0i3FYgM2P8s
         WW2HECjUXu21FuzuUibeCZKaEVWgkg2Kmg3X4/xnBrmoV0CDeTBHe1VaILaMtAFWoKUo
         Z3F+q5GPrHsjdCNjeCxE4Svum+5oK/X/LuIZcMxWZPRW1VlJ4w4JeBOP0YDWLgwlBRf6
         24EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJRj1n/cuhJAwDRjHiH4R8KD3m6yCHecaRSvaH7YYy4=;
        b=WBQ5NxHGysp01MmFewFZRaPtca/QhIipetjuK8bVk+RX98nrCpGNfiiim/aUeSMOKQ
         xN//BvrOEp14bDwM9ouTy0squsPxeJ4ZovIQPR03eT6VFxgcEsCAB5T9Tbl0vib+LH2R
         W+WG9BSQbVuJrHZuAfADB0q+SCGsJjtTpC6IhWMZFzGQoK5I/xN7Ws0AOr+8IWoMYzSm
         fGjc2DWLi/BLPxIdvgkJ+ZtRSC2EEuIst2yMqCGV/qn16OhePxtApYEB/TagMMfKNACj
         mSw0lKB7Ye14XoH2CkhGOR0gvTZfZFo8+C6l0qIq/sU6zotNeMmL37J9miziacVeXrMH
         r+sQ==
X-Gm-Message-State: AOAM533mmmMyyTvfGLnJ0eGGl8TWVpz3J1WlkeqF5QFGY/C+Ad2JvzO3
	apueK9dUQWrARgxs1LXig2Y=
X-Google-Smtp-Source: ABdhPJzrgAZIxt/33N9S6giiTq1PrDxRkXrtuMpkSCIcBYS5RMdn4nXjq5Sl5rkC8jY0aWoYDtG8Uw==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr19392087wrq.61.1617441268633;
        Sat, 03 Apr 2021 02:14:28 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id f4sm18662451wrz.4.2021.04.03.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 09/30] staging: rtl8723bs: fix logical continuation issue in core/rtw_pwrctrl.c
Date: Sat,  3 Apr 2021 11:13:31 +0200
Message-Id: <ecbd557c645e280a801c34d235559d2d138ec67f.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issue:

CHECK: Logical continuations should be on the previous line
22: FILE: drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:270:
 		if ((pwrpriv->rpwm == pslv)
+			|| ((pwrpriv->rpwm >= PS_STATE_S2)
		 && (pslv >= PS_STATE_S2)))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index cc1b0d1a5a7b..fa06144337ce 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -266,8 +266,8 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	if (pwrpriv->brpwmtimeout) {
 		DBG_871X("%s: RPWM timeout, force to set RPWM(0x%02X) again!\n", __func__, pslv);
 	} else {
-		if ((pwrpriv->rpwm == pslv)
-			|| ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2)))
+		if ((pwrpriv->rpwm == pslv) ||
+		    ((pwrpriv->rpwm >= PS_STATE_S2) && (pslv >= PS_STATE_S2)))
 			return;
 
 	}
-- 
2.20.1

