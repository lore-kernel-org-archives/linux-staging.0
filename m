Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A106136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:44 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id bx5so2843746pjb.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T5m/cqv3Mn+iGeCNDHoqe+Z9VT3KHz2Fko/1l3SMOrc=;
        b=izcLZLSJM1oBEyIaxI3ikTlntnFW8G/mJQqDzFunT2m3XSfuZXK+Fx6L+2v2hQuDNX
         Atgi6SLH15gCf+0cYbx1Snm1ZUDP7QQJf/iZHkAaK7RTgeKYVj3Ncv6m5ZGtDRduLobJ
         5Nn1LmHx8pWT7u43Fe9ADKbTj59v+sN3MJwVdUAcabl8knIcx2ZrRrNIEbSAyBkW/NZk
         ciuIb0E/VUPbfbYhB8yFb6n3JuaQYZcZFcHTSNztDWkp5cpMBKXxAF/EOA/7pP667sac
         w1KPfoQKt1/eQh/kHbNwMRWVYgXRSj0VGfblvz1LE7PB6enUfZkfWKmf4sXeAPU3ELek
         uaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T5m/cqv3Mn+iGeCNDHoqe+Z9VT3KHz2Fko/1l3SMOrc=;
        b=rJKLAF1WMOfx2+RB+4vemQGwb+QqMb3JnRPnOZXKTEB2jkTyqlfSWwf5mA8U+Spixc
         S/wlOZ4VJC4jfeKaX4cQZnXcL8Ztrn/ibwK9aDrnf5KbCBdLzqcMf1QTg7TeONdKeRHd
         s4X3bk9VL3P9XaMiI6kV7ZBeCdF0eW5yxSSZBk87BWbBlRxqT0UKZRBsRnOJeoDYsYkp
         hTVofv++IrWUxXu3X7I8b4WB8l7GOw8B7T087t3hrzKSX21kQmTuNplYyAi7XAuNcLee
         rrpPWcsfEFQukVL6oRr4J4o80BwKiLEp3r+1TAlXzo3r+mBBbV+oh6xd18IUqJbs7kXY
         bMNQ==
X-Gm-Message-State: AOAM530VeT5arx0Ytvs64+lHU24yLEg7wmMun/+CUpO2DuvDqrJBRTh3
	TdV970RUtNXnzipGaRr0ufs=
X-Google-Smtp-Source: ABdhPJx0S6YfaJ7sUkuS65oaMCO3SAZAQgVpDCTl4kScDgWskXGknukzKtSsD9s8P0XXQhTx3zjW5Q==
X-Received: by 2002:a17:902:b087:b0:151:842a:d212 with SMTP id p7-20020a170902b08700b00151842ad212mr9755227plr.92.1646254124100;
        Wed, 02 Mar 2022 12:48:44 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:43 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 13/16] staging: r8188eu: mark check_fwstate as bool
Date: Thu,  3 Mar 2022 02:17:34 +0530
Message-Id: <20220302204737.49056-14-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark check_fwstate as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_mlme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index d418d57f9..42d850f9d 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -451,7 +451,7 @@ static inline u8 *get_bssid(struct mlme_priv *pmlmepriv)
 	return pmlmepriv->cur_network.network.MacAddress;
 }
 
-static inline int check_fwstate(struct mlme_priv *pmlmepriv, int state)
+static inline bool check_fwstate(struct mlme_priv *pmlmepriv, int state)
 {
 	if (pmlmepriv->fw_state & state)
 		return true;
-- 
2.30.2

