Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72D2FB2
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:17 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id t9so3500138qtw.7
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vyXiGbUTPVepoHZ7bOHMdBXo5lqZpc/ltE3OmxZPO70=;
        b=pbBDD54JQp6KUz53Bh0Vws/9OxnhRAZP2Z/hKkxcDdQaH7yIVJuxsqlthhgC8XpM1s
         BxyicpxmTFq0f08zur/6XAe27BXoQxh1a1GEltx3EmFdBRrdWsHG9SREX895cAnsHYTW
         vV9/5DXSo4r8IVRvwRANeu88K2O9zD30FGe0NC3tEVmkcspamATABpd/nQhGIEOdT5NP
         IdXH3eS1j9neCkXrUaYa5tIy4RhcCV8KjrakVjXYsjKNluErqEtffYgfc27SR1yqAiUP
         GGCMMjTtJlkTSHJKMr7qswkNvM3BmEHMAxAAG+sJbV/NxsKnZOXhjx1QSuA7ITEBWWBb
         vdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vyXiGbUTPVepoHZ7bOHMdBXo5lqZpc/ltE3OmxZPO70=;
        b=YbmyEmBHZloC3I1jfkhiOgtLpezgUZtT+gsHRxdJMx93E1PgARhtAJ6ZlyZZB1P29N
         WfvdhjvaWwXJJQ/H0dsPHSqqDhsNLhLr0vvk0h8xrRl7u/AQN/DxWD4Vjx0nhyDZOjCK
         sTMIfsKySr67D2HogS3gxvGICKMG/XXyEYRtg/t+K6nwsRWImuxMIZSQB1sNGlPa3IVk
         b0pKLA4fYRU3Dtywc3SdVXxyJaI1zbNDQV0AmRbqmrUJbsd2PLwKq0hw+ib2mZS//nAF
         jnU/G2Xg1O2obwH00EfWlVxHGIOR8BCZO4eciRUyr5nRs5OTRpu9WdBBltloTQZ6yTuE
         t1Cw==
X-Gm-Message-State: AOAM531rk+YicdC+G15j7iTTbHXwJIbKG4SW2xKhtXlBKQgik3MVzBP3
	0IBP4Wb0oJm6fhHM97CKTCWvew==
X-Google-Smtp-Source: ABdhPJyk+GnUxV3CKcJGp6Fh9gDdpmhDiRwJ/E65pwjPaJgogmw9J7+eKbscSuSJiMcMMf/KWktc8g==
X-Received: by 2002:a05:622a:c6:: with SMTP id p6mr2387802qtw.99.1624492156590;
        Wed, 23 Jun 2021 16:49:16 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:16 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 7/9] staging: rtl8188eu: remove MSG_88E call from hal/odm.c
Date: Thu, 24 Jun 2021 00:49:00 +0100
Message-Id: <20210623234902.7411-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove MSG_88E call from hal/odm.c as this macro is unnecessary,
and this call is dubious in terms of necessity. Removing all calls
will ultimately allow the removal of the macro itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/odm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
index 9febdc91b66a..73b63e2ea0ff 100644
--- a/drivers/staging/rtl8188eu/hal/odm.c
+++ b/drivers/staging/rtl8188eu/hal/odm.c
@@ -827,7 +827,6 @@ void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm)
 	pDM_Odm->RFCalibrateInfo.TXPowercount = 0;
 	if (*pDM_Odm->mp_mode != 1)
 		pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
-	MSG_88E("pDM_Odm TxPowerTrackControl = %d\n", pDM_Odm->RFCalibrateInfo.TxPowerTrackControl);
 
 	pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
 }
-- 
2.31.1

