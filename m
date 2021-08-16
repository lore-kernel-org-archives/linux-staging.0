Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C976D19
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:59:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r7so22806865wrs.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wR4etS7LkvgWmuOBz+KzpKiTXVRl5T3V83fQFCpBf6I=;
        b=R9Q+Wy+jCbiITxuqmiy0hBIfWxM28fGm44OldkwF3+cJhkVcjrXrYULX8G72d6uGPE
         5b3Nc/hKQS6OfRCzDpcJGyzKiVB00GNfA6ivR6CVjmQQ8myIMP1KLK+VTvgPExGQfgTg
         dRIx2LmiRYRJ5abGrAbLywntiroTqOfW94RjShxixPc6PpxhCV/cY22QL3QcyOVsS22P
         zeIp0H0LsuPQBxIMe1jJ92TgCdPxKNWXZ8kN/S2FA7BkCcTkMo9sCzxc1mRkPSsY/3Sa
         ZSDbvfdM+iLXsVyxYQZWWhWwt7rDqfz5x21xODYOgmPY1NvraSfdMHy0fnixPph2jPR1
         KrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wR4etS7LkvgWmuOBz+KzpKiTXVRl5T3V83fQFCpBf6I=;
        b=XVopnXIwnq3QQtkH958yDKJLELT12n1Jl4gYQKXWw74sJhQ8XTaH1hkpJ/BE3b5Nlh
         unmWryDeC4l3BCimrXnCvrqPo+zYI5igARVU3A/wdYGDqCbABzyVpNhPYEHO7TYWzXVB
         f3FOjRXRb+VnB6MCn+Tu7zaY71ppbKpl0DwmTwy1HZQ7StcECC7yXWFwWWlCdX99WCjj
         kwl3c6zWFVlI/AD8KV57Evdg7gUK9gx/G+wHQ+YthgrEBrTNFgOCJFv0a0gmGLxKjsis
         T4Kh0vWGDEPWqkncB8Iw6i4S51E6QRHxsQOMzG5c+l5/ov7y+C+KsbMf1uskMUoc1mLi
         kQkw==
X-Gm-Message-State: AOAM531MnlEbOh3qHssGAMlcLFnKDFcpTFKaoT34BM8PkXO4KyXjoGii
	ur8omX3rrW4rzVO+EgAkaTY=
X-Google-Smtp-Source: ABdhPJzwGKBIw1vPLsIBcJjtG9NF95KO2AWGXjypFjLrUv+NLmuJdXHbYOeURnlF+YuQxA3GxfuOTw==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr17288770wrw.86.1629107976024;
        Mon, 16 Aug 2021 02:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id g21sm1946635wmk.8.2021.08.16.02.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 02:59:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: convert rtw_is_cckratesonly_included() to bool
Date: Mon, 16 Aug 2021 11:58:40 +0200
Message-Id: <20210816095840.24259-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816095840.24259-1-straube.linux@gmail.com>
References: <20210816095840.24259-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_is_cckratesonly_included() returns boolean values.
Change the return type to bool to reflect this.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 drivers/staging/r8188eu/include/ieee80211.h  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 200c90b8ea51..fdbedc99f798 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -80,7 +80,7 @@ bool rtw_is_cckrates_included(u8 *rate)
 	return false;
 }
 
-uint	rtw_is_cckratesonly_included(u8 *rate)
+bool rtw_is_cckratesonly_included(u8 *rate)
 {
 	while (*rate) {
 		u8 r = *rate & 0x7f;
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index cbefd7af1d4f..1205d13171b2 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1207,8 +1207,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv);
 int rtw_get_bit_value_from_ieee_value(u8 val);
 
 bool rtw_is_cckrates_included(u8 *rate);
-
-uint	rtw_is_cckratesonly_included(u8 *rate);
+bool rtw_is_cckratesonly_included(u8 *rate);
 
 int rtw_check_network_type(unsigned char *rate, int ratelen, int channel);
 
-- 
2.32.0

