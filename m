Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0A68
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 00:20:51 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id f20so14758485qtb.4
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 16:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xGalONJjum8+BTCilr/6jTZ2Yy0ur45TjitrLdlzsXE=;
        b=JmjNbHSSE+LeDUfc62PHSleBpZ/2IvXEV0avhyW0e9HzmbPYhEY/iZLoVVh3vGYFVa
         ir7pvE8h/PBY/WH+mCRkiIV5msI58O4R+S2YauZVixpCgUSp7BjxLx1MqLcmi9Xc1rkA
         3X31V+y76OYzcO50TXmO6BKhpclfGL/XTHnr9wTPRsM8YBmKjXe1xW9XiOvyRywrS26P
         lb2QxoMvfStlZ1+NVqqMb8uBVuqrqVWYotrMijuoXL0WPwEDzbgw2KepMxkEItgVoQvZ
         kvI2QAeod6J1EwhGWRfiBVwEetZ2JrXmq/ARVNWnexObktuC9D62yeO4HznY+TtjdINm
         QEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xGalONJjum8+BTCilr/6jTZ2Yy0ur45TjitrLdlzsXE=;
        b=S3D6kGQe8WKzOgiOerdqdanp9LUcHh4Y0C7Um2be36cIjAwIxUEQa4KxOU3mO8QYcz
         /Z/rCNN0MRwVf/gmfC0sqyGNWsKyAl5GNTKE1iOgFwftNwnpVI4s7XZgEHBTRZSdmB/A
         TzVWtqmzZy34Y+eTXHc6lTWBYIRqSc+id4kTUe8nahthUc6t5uEH8XlVxREtZndFZfZF
         7dFeQ5gIwQDYax4zntYXlg3NSF1Lxd+QX8Q8r5jZLcoIlYZ3G9SH9Z6hexRSDZ6NJmOO
         3bFhm8XDX8f+oi4WLIRthvXzTgsAkwlVHbf7UtGC2tpTV5u1pS8l21KrlFXjpgv4CXSD
         G1xg==
X-Gm-Message-State: AOAM530LjHcimOCOZSlL0wG+jUodys0UV6/MHcsVoMjcx35eAmun6imq
	ryhOk4+T+zJFGqILexU0wCc8Fw==
X-Google-Smtp-Source: ABdhPJzBz2buafsxbc5aSGnsT0eoavjN1Blo7UiQJItNDS5b+RYVSXS4OyWV2YIWjPRoJzBlFoC8Ig==
X-Received: by 2002:ac8:7c56:: with SMTP id o22mr30602254qtv.524.1638145250464;
        Sun, 28 Nov 2021 16:20:50 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id n74sm5681022qkn.83.2021.11.28.16.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:50 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: r8188eu: convert DBG_88E_LEVEL call in core/rtw_xmit.c
Date: Mon, 29 Nov 2021 00:20:37 +0000
Message-Id: <20211129002041.865-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129002041.865-1-phil@philpotter.co.uk>
References: <20211129002041.865-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert single DBG_88E_LEVEL macro call in core/rtw_xmit.c to plain
netdev_dbg call, as although the information is potentially useful,
we should be exposing it using standard kernel debugging functionality.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 0c033a077bf9..8503059edc46 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -461,7 +461,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 			}
 		}
 	} else if (0x888e == pattrib->ether_type) {
-		DBG_88E_LEVEL(_drv_info_, "send eapol packet\n");
+		netdev_dbg(padapter->pnetdev, "send eapol packet\n");
 	}
 
 	if ((pattrib->ether_type == 0x888e) || (pattrib->dhcp_pkt == 1))
-- 
2.33.1

