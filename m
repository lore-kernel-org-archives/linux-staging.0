Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2446136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:12 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t14so2648896pgr.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mIoDn3EA8TVCn84Dm3V6h82LZaIrnrhUBixZa0FUPlg=;
        b=QBqqUc72LLt5d+ZGpIgqsTAeFT4aCrxKy31QdV+QmSbhssjwBUnECJIze7uFxMYIso
         rJidVw0y8hcrdZeuUeTEYGRiKDJ6K7NxRs0PoK/kZk5yt8vvPdhDFmVP8KZ7sDvnXq2s
         3GDP/pH/VS+8RNhqUYmEeHD7DdKfbnytG1reFyGq+dz16BeYXpLNJP1+jpZtzUHLkYV2
         skg3pxcWlV3e1/HzKYhh2il5lQ+MdJDeHRMjuv/iGr7UJ0S9iHDkECQNypyrMMKaZApY
         l+QQaXBBGQPYbju8XkRonZQNCkkLcRXqbBVzREaeyQ/dUgyN3pa0FWf2BQhZyQRZ5Hwl
         kP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mIoDn3EA8TVCn84Dm3V6h82LZaIrnrhUBixZa0FUPlg=;
        b=pxLyl4rz0xIwNKVn0OdqMX5pwB9jq4l4sw3OAmBaPK5FUgnZHX0srQCneMFMxDTiMU
         iWJYz1ruI6h+xxqufryVXA/Ih+YSQ3fniXi0nYEmep3Ha7aydeJFds+zmW124xVci9na
         YiqnAwTInLzXyg7ocDt816i1v9s/3e0YIH6M6O6YK1B0mz7SFSoM7XPf/VJvI+nl6t5W
         SueXtC1GmvB6AhaLg8i9YxMgRlplbjoufg0Bcwf/XvtR1a1xB1Ed4Tn4K4G0Eg6zvEZc
         dJdM8xngN6UXu2fJZGMBRyvTGzGMydv5caQ5NXXgCj8w1H2Akj6CzpwoGalgSPMitD2/
         sFvw==
X-Gm-Message-State: AOAM530GV8Fkx4OfgF6Yv7qEJKR9dP4rNdXOQJjgQZpYZ9gc0K9q4FKx
	lGnXUvuFICCTe/HOWezLw40=
X-Google-Smtp-Source: ABdhPJzHcQw6NXwzbiQcgQvYzhpVcsxMou3WjWWtCbyNYfAdOvDSYYW1ccpmo2MSyU3WBYLYNbsH/w==
X-Received: by 2002:a05:6a00:1593:b0:4f6:6c38:f75d with SMTP id u19-20020a056a00159300b004f66c38f75dmr394165pfk.81.1646254092559;
        Wed, 02 Mar 2022 12:48:12 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:12 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 03/16] staging: r8188eu: mark rtw_is_desired_network as bool
Date: Thu,  3 Mar 2022 02:17:24 +0530
Message-Id: <20220302204737.49056-4-makvihas@gmail.com>
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

Mark rtw_is_desired_network as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 4bb6edcc0..8d36ab955 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -571,7 +571,7 @@ static void rtw_add_network(struct adapter *adapter,
 /* 			(3) WMM */
 /*			(4) HT */
 /*			(5) others */
-static int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
+static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-- 
2.30.2

