Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B56D22
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:49:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id x12so6018367wrr.11
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s0lQauJnwT0JHwXU++inhEOx2/Px1wNJxlMsWSCzhy8=;
        b=OMGkr5DgF/GGPCeDetn45yN7Me6xBUlENpOwjGk3HnZyPIfMdmPndPa99EcmPNccvO
         AcAOW/rnnxxG6DArxyz7NGgsXNDwBTnQ5I10ORKUxrQIPWnLilg87MHTk4ZMC/Nw4Hd4
         cV9jIpHlPVvZmkj0lPAtzeXnd0dR+izYzgvKFjDSpGZOz7gpz2OOEKyfR/I1JiOhJ9Cs
         FRcIj1NR1DfDkrJNaPqjYuKT/Reir9PBaZQ2EVWXtCvcTgTr/scB4DUBoBgwaDYYbAis
         /X2WhwbTSIC+A7NrcwekLnYnVyJtn5aN9d53qRWmIRjVSfx8HM1VyKOmn12yWwfabLZa
         Xizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s0lQauJnwT0JHwXU++inhEOx2/Px1wNJxlMsWSCzhy8=;
        b=VHg5e4F2SKT+2yePtE7NKMVOZUg0Wsnu1j1EK8kerPk/0DkZJwb9tNaaMgvCJVWcbu
         UlOmxixObkwjKMog7hghsXeOTh6rVoQu5GJ5wjuVOqSw6MB+54/7prdNNLLkG8n/yPQV
         5osV3hRZQMpLyr7k56rmWxn42042ZiVs6F7a4+R89TrM3ZdjQ/MQJuyYAPz0/9lrnOj/
         6I0ix3cZqU2a99D+dJA18cJmAbMO7DLV2Imq1tQpNP9QqU/ENe5Rg4XL6laOt8h3iwa2
         sTxenw40pCT4J9TLjKAU011vFX/h8n3DdXGWtKfzF1pZimUW6Q5+0h4S1594gJa0JAbR
         Xi3A==
X-Gm-Message-State: AOAM533bLH9msF7WUWlQSTCpUNlZsQikAZjFE65a3Dqu/lNHok2hPqQq
	f7uSuBeUfGFjJeV95ljFTUjRwg==
X-Google-Smtp-Source: ABdhPJyHx7P5hh/ySyRCY9xN7Ct1mapOcAW8sVeLF4E0bCRunjTCcAgjFJJ7H+j2FA/4quSuVrsnIw==
X-Received: by 2002:a5d:64ce:: with SMTP id f14mr72952wri.17.1629330539063;
        Wed, 18 Aug 2021 16:48:59 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1205916wrt.77.2021.08.18.16.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:48:58 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 5/7] staging: r8188eu: remove rtw_zvmalloc preprocessor definition
Date: Thu, 19 Aug 2021 00:48:51 +0100
Message-Id: <20210818234853.208448-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234853.208448-1-phil@philpotter.co.uk>
References: <20210818234853.208448-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_zvmalloc preprocessor definition from include/osdep_service.h
as it now has no callers.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/osdep_service.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 4c00adeb72ee..dba7a7bec9d1 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -172,7 +172,6 @@ extern unsigned char RSN_TKIP_CIPHER[4];
 
 #define rtw_update_mem_stat(flag, sz) do {} while (0)
 u8 *_rtw_zvmalloc(u32 sz);
-#define rtw_zvmalloc(sz)			_rtw_zvmalloc((sz))
 
 void *rtw_malloc2d(int h, int w, int size);
 
-- 
2.31.1

