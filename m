Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323F3FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o39-20020a05600c512700b002e74638b567so3636928wms.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kL68p0tfdTAUziYOxEZ4ok/eKSJ9jhhvpxDDusc0v0c=;
        b=bGBWWfDfAc7uqJCyLTgiFYOBpcQiZw94mfDRtYodAoqo+92nkjH1brkaMy2HR7/Rwk
         B0vI1kOLgufQb9F9QRxgKwznS7PI1Axaoi85ep4U90lnJ6YamWbOHvsyMcgNvsKV+9+G
         v05C7sQm827Ro8V6PGdOwq09PbSaVFoACf91gaT60+qTTQUBHHAZwxEOFaGBdLkfGm/V
         IODcUdpvooDbz7SraXKuQnhmCrxMO0CI2SsGxhVJVvUnrouly6OQYHBbTE1hsv6od+iJ
         c24zwDw8iD69nWRSqoff6BK/3A7XxTdMI91wUjFhjRhxsyfYU3imGVwOqUNQicD6r1g2
         pPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kL68p0tfdTAUziYOxEZ4ok/eKSJ9jhhvpxDDusc0v0c=;
        b=jporBsyPJ8FIW/E1Z90zI63ftJBktNpBUgBKrqYcrv35DbstJOrOwGcAGieHIXbYCd
         XEVWBuQ76luBSFywWl/mHmYcvXwUhLyAfmGjMepnkCnwt5a2igWXUMXVW2XAl6YnUV2f
         Eaf+eg+G9erBjkoirKJHJHfDKLu0NRR/ajXwG46qnr2/kN2uv2JaKNfclF0IPk/MAX4J
         E9Y1eAJMDjpTPjUfT3op/NIL+pFIG9LhBboq1CUJHIwRzLRBeD1o82f9+TmQPPZvWf6R
         LjWcy6gtQMo0MnTgkkgxC+q37lhRpPaE4DFOgCEsM384er0eL9noFzviJ1HciVwvXyDu
         iFtA==
X-Gm-Message-State: AOAM533Cbq6WiXzYwGmZyJoXtwwRg9OsSlrRjfLJ7IUDC+40oAqugNA2
	6Azpkx1wchT29s05nBj8zgF2Ag==
X-Google-Smtp-Source: ABdhPJzv7wWobcF1i9iLzFdqxmQYH/m5q2dR3ENF2yeyrvxIu9jYfvBZULwyeQVYUe/Fh1E+QVaHZA==
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr8905088wmh.60.1630890072714;
        Sun, 05 Sep 2021 18:01:12 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:12 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/14] staging: r8188eu: remove enable_interrupt from struct hal_ops
Date: Mon,  6 Sep 2021 02:00:56 +0100
Message-Id: <20210906010106.898-5-phil@philpotter.co.uk>
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

Remove enable_interrupt function pointer from struct hal_ops, as it
is unused.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index e59a482cc139..f4cb3727030b 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -156,7 +156,6 @@ struct hal_ops {
 
 	void	(*read_adapter_info)(struct adapter *padapter);
 
-	void	(*enable_interrupt)(struct adapter *padapter);
 	void	(*disable_interrupt)(struct adapter *padapter);
 	s32	(*interrupt_handler)(struct adapter *padapter);
 
-- 
2.31.1

