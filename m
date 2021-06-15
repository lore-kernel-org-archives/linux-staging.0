Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D5D6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:16:07 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id u13so21454160qvt.7
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJQtqjTXQnGdHs9kZE7OUYlBMJLNxudd4m7R2tkcZzY=;
        b=DaDyYut0R3HYxNfPxezGH6YONhxmpNkkLbMJ3/Gv9Slez4nU46Hsu65mKRunVwbzht
         ipa9d+uyUVJga10iQVNJnWk6QndJawNqyLxYbHJADCXNDD+r438XpTJdGBlMi1JkLnpa
         wKBphFMPnTU7M1v+y30WQ6KVtCADbzpiP2wBMfBnOvJvU6Nb6wzZ8hKH5dGEov0SRsuB
         1Kdw2fLjDMzRFGcewxlmMNh9M5bpH0X+HA88W99slWYHa5RhK21HUY3khAtndRonxP2t
         6D1c/0Ul+MttNEdx3+0W/+tP1E8tNlotWdz699YJxzV+ydtygsYgYUfR7dBcvUlMVKWq
         VJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJQtqjTXQnGdHs9kZE7OUYlBMJLNxudd4m7R2tkcZzY=;
        b=f+hPaZDZArIx1BOhJhU2SQS7XXduM0kvnDz/eqK5wZMXo7lSH7zUGP53vt4pr5/mvl
         7mf8ED1EAZLtp25o2FfPvPl1Kn5W7tO74o2c6mnUFcTp1j1iJJKobFGZh41UxHMxjE3v
         tP1cwkjJVmbUs0vJf93obukyrqFpBelSPtTQmoxD8YjnLYNifBTqW/rS8C44Qjv/xF1k
         0lYYkhUTiFo+iFShW7bhz1Pa2Om9wVvoRgy8T/o6dR5opJ1YrIMAOO33YAFTU9cShElZ
         yIcZ9Mxy5ALpzgQBcENF0l9l5FOSguMLLl1SsfOB9M60k/f4gaXselCcTxObFYZqftHk
         1gww==
X-Gm-Message-State: AOAM5322XyIDsvyKeZcvA++X+moeFfWmut1B1VuIFY1YmN4W8A7hLZ8s
	f9LrKbe1V9RtyDtFTANKGsJlFQ==
X-Google-Smtp-Source: ABdhPJxpBbI/D7gkShY1OA4K1TQqFoFg8i3t+XEMqXuR2NlR05Su6yFqI7RK45uo80aJ9Ny8mWiX6w==
X-Received: by 2002:ad4:5426:: with SMTP id g6mr1418723qvt.47.1623716166847;
        Mon, 14 Jun 2021 17:16:06 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:16:06 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/28] staging: rtl8188eu: remove all DBG_88E calls from os_dep/mlme_linux.c
Date: Tue, 15 Jun 2021 01:14:53 +0100
Message-Id: <20210615001507.1171-15-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from os_dep/mlme_linux.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/os_dep/mlme_linux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/mlme_linux.c b/drivers/staging/rtl8188eu/os_dep/mlme_linux.c
index df53b7d52618..8af58e847afb 100644
--- a/drivers/staging/rtl8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/mlme_linux.c
@@ -144,8 +144,6 @@ void rtw_indicate_sta_assoc_event(struct adapter *padapter, struct sta_info *pst
 
 	memcpy(wrqu.addr.sa_data, psta->hwaddr, ETH_ALEN);
 
-	DBG_88E("+%s\n", __func__);
-
 	wireless_send_event(padapter->pnetdev, IWEVREGISTERED, &wrqu, NULL);
 }
 
@@ -167,8 +165,6 @@ void rtw_indicate_sta_disassoc_event(struct adapter *padapter, struct sta_info *
 
 	memcpy(wrqu.addr.sa_data, psta->hwaddr, ETH_ALEN);
 
-	DBG_88E("+%s\n", __func__);
-
 	wireless_send_event(padapter->pnetdev, IWEVEXPIRED, &wrqu, NULL);
 }
 
-- 
2.30.2

