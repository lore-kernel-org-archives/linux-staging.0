Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B73D3987D
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272267; cv=none; b=DWk+GmgNYqziUOF0AQXiVvTN1zUBe79QFhVcpLinsnYxvE+I2kvQmR2Ff0vSSQBxnb9QSI9C1/DV1dPB9jCKu6WFZWb27vHoL4r1e9p3yU0uBFMN60GiMzbVfafIsAYJnGdp6oYXK8FSgaVFg0Q3M2OYqhnhtLdu6u0ubShYym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272267; c=relaxed/simple;
	bh=jfK1JCLXX0AQ/C2AaSK8OfLO9I78+U+gJ/g5BtnDLp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5zDdXmCKmCkiWW8n+uj9FTIJ82ab2TG1HQxfsVuB2b6oohxVZ1rUF1Lau56GjBhbItyTMav/QNiCmNtDMuHoBl4CqkHUqUlVRzYsK+fttO7WKpHCRAS4mO3R7fva+B8M4TKmvv7by6ier0fQ3sL9J/f81nh9Sy/YQ7dOzvpY1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RC8JEiTR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC8JEiTR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so773955266b.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272264; x=1751877064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8JjQ+1mhu7w6AzCypUJiqd/c0GGf08rutzFlOhZeNc=;
        b=RC8JEiTRE6Cqyi6pABJz4cYw6VxNUsNNr7mpRbRn13qPPQFgWGJ4wf2gvDX4tX7yi9
         p9t752Tlamrqi47oXNIXFAmtOPfc3jIbeLU17lFfzSDc4CDUKiZecNuGcemtEDdUPrV2
         dI/ltrcqUsVPujiSI6/zJgKnH0Wr959GXp5jxvG2yEa5ARKsQXC59IzS0eKGj8YZMwQY
         jfktf3MHgWwbn22QEi6AM/UA+87IY00lfqJpnggf75r+sAqbib5gCx16Ws49SSEMz0Hw
         Re6rJApcfd4KajruAYhGJ8nPkAfr3NagXVlWcRbCRTig825lWuLKmKV1ksnzHu19j3lB
         eGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272264; x=1751877064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8JjQ+1mhu7w6AzCypUJiqd/c0GGf08rutzFlOhZeNc=;
        b=OQCf4duyuSN4TFQXhBEpWrtZU+L2VU1qHKInUW9X78wIsf5sY9Pa2pPiUWliTWxsYF
         khHNPWvOAADZSGBkgLIUyDXf4wEE8b3VhCAnuFAgDSFciD5T1UkS7PviDs6BCJb8Z0vL
         YtuWJUn1Kt3vVHR93Khr5MPu7MO5+HaL0aRgjme3dUPUa7iNfHXHePVHR/YXqkl4j6Rm
         Ln7/LzucUDMd3E9XZjWfRq7/jtYal1AXj1O7lU7iVTGPMtwZ1RHG8quaYq0blQq1Pwb7
         bOdSOogxQVA8Ku+NBGxk50MKcdt38JXMZAQzsUiKy4M5R0t3q5f6PdtkrUqMyYlzusX1
         5krw==
X-Forwarded-Encrypted: i=1; AJvYcCUk5s9s0Mt4UsMdGvb2EYcPrg+vgEAByjqeKeOY6XQ9JauaEII0Wugzf01BOem7DwYz0SXaRHw693mE1U/N@lists.linux.dev
X-Gm-Message-State: AOJu0YwjCyuVdd04xxRPFUuVZGcLtavszDOmz1x17LFQAOLPrnE4keo4
	n5zf4hifzeGkP/C2/VpnTV/JkbDXs8tSh/moMfFVFvBZ76O1YOF9QYdQtnoZrg==
X-Gm-Gg: ASbGncvbg+xg1tUj90mwUp5sn4bk95Usqa7T+ZvSqx2lS2oZeB9NVmke5BXPSvazXJG
	2grOCbHDdq/4UK77xUVr+ZxHihwTDmJ8qntHl7eJ9aVKEyJqxUc2dJJen28GmTZH+vaBlklYKrP
	/E5ugyQt/fYfnEhKa/Iklt9eGsN/rEs4c8Kno+HLxWu/ASHo3tVLXXn4iOIjL8g1Vk84kw+jPYz
	FVfpzL1tY8j3vxxoW5co1cmnLurGsUJK9gZORXmfS5rMrpSwQzRR3Ixt06JEAZMk3MWaQ32HLky
	AIJqN9Ll0fWjdBAtzJXFGT3dbx02L+TrqEcl8Db8LKCi2HHFnegDVi/auhvnhK8jtWiZ6qXAU6+
	5eR0=
X-Google-Smtp-Source: AGHT+IF3kNEHTgHmk6z+DnoXffq1NyoVg6tYWzSNwERgNq0HjPGnqOvaj4L2dW7mN0yNlOJYAJh8wA==
X-Received: by 2002:a17:906:eecb:b0:ad8:93a3:29ba with SMTP id a640c23a62f3a-ae34fd985femr1030293566b.17.1751272263321;
        Mon, 30 Jun 2025 01:31:03 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove unused function parameter
Date: Mon, 30 Jun 2025 10:30:47 +0200
Message-ID: <20250630083049.103734-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630083049.103734-1-straube.linux@gmail.com>
References: <20250630083049.103734-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter 'band' of rtw_ieee80211_channel_to_frequency() in
wifi_regd.c is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index dbd4bf531339..ac0b58a8b5d3 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -41,7 +41,7 @@ static const struct ieee80211_regdomain rtw_regdom_rd = {
 	}
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan, int band)
+static int rtw_ieee80211_channel_to_frequency(int chan)
 {
 	/* NL80211_BAND_2GHZ */
 	if (chan == 14)
@@ -82,10 +82,7 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 	/* channels apply by channel plans. */
 	for (i = 0; i < max_chan_nums; i++) {
 		channel = channel_set[i].ChannelNum;
-		freq =
-		    rtw_ieee80211_channel_to_frequency(channel,
-						       NL80211_BAND_2GHZ);
-
+		freq = rtw_ieee80211_channel_to_frequency(channel);
 		ch = ieee80211_get_channel(wiphy, freq);
 		if (ch) {
 			if (channel_set[i].ScanType == SCAN_PASSIVE)
-- 
2.49.0

