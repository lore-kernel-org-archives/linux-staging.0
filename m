Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE241A94
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261444; cv=none; b=KjbtPbqalzyq9zFCs7NprzFQvYUhqq0U2hZr+xazR96tgAXWNFVAvXZmpnv8hPO8TFh2WpQKEjN+I7xtC91wfb0oHo/gRuo6WBZSO3kbaoMXHT41svEbsC/TvcCp8He4mgcUJUuTZthRx5LgL8xX+krQsNVIz6AihHGkKzM7m8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261444; c=relaxed/simple;
	bh=BDYFLsz+/qdUa9ORrrhrQxUmtbfPzFNySy6nqCUl4C0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbpwzlbQBLUV/mRULQuOapvK80ALdbuxZ7TejZW0QfhRgLrH8pOicSXe8PCyc0T8bNIrcrow+kbVY0FU+U9mlL4m0wi11gsFQnsqE3vWBicnBXGdrTiQkAFquZ23gGx2OwwkmeB37lq3vSw1gXBCRf57b97Xwb0Ig1owI3CLwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gtUxoQEN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gtUxoQEN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1eecc71311eso95628455ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261442; x=1716866242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBJmvHjrIZD4J5+8YalNZy3ccMmTqVm1w0JgkzYgp6A=;
        b=gtUxoQENgVhMve27gcOPhL8XV59vmOAa9U96jbx5oTsy6q80M2lVfGcuaiuivWe/oS
         xgI1l+HsXDjyYayBpU/OcEA+ZyhvUj047Rr1E52+Hs1GeeJuld3ZYEg08V3TasV2Cbnu
         YX+Elpmw+OSghUBBrAbr3vY4K8bDgD8HGiEnocaDC2v85FhXWJw7Htf/LYseJg5hjvFz
         Gk/9wZF9GHoR5PK33wD26IaltkNHTbsyv6UylYN8zpnQWO3WOO6sAmtm6eyTloCpaZfg
         8qdp02mLWm01FPojWC4+0kJQb/V5goeRH06vU9Bycqt4Py6b9WS6iuPa+lgAxrJgT3ay
         v/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261442; x=1716866242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBJmvHjrIZD4J5+8YalNZy3ccMmTqVm1w0JgkzYgp6A=;
        b=u3Wc86ExqBvU05HUZzN0uYv5W3eKOFhO7EAWfDjXNbYYr24DdJX7O8zRLYcROWQtU/
         ld4Wx3+6SGmztmqBSWdtWcC8ve63RYLPpLgyZIPgLrJVoV1VIUazUV/2+tzfnm55aY0i
         kvZvy1Bn5vod6A857jAeLjhtx9e9HjqV+XOeM8rx8Ln0iACU28nQyEtKOhtXEOy0+Y67
         21f7J/+OSBk1t8chxiKhv3B+WPqI4koMfYbUiscpipHrCVQeL75ldsj4eUiGo4/kmDsD
         shRWhgDUlaeeczUUo9CcIDYy9dlDo9buB1sjs/nRTaqB7a3OjGFjIalwE4P0whqavvM/
         LvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0XP/hYQ2qDCVOmu4pSIu8tUdwYDDWSlMeO1/HBX3cTrgVb7bBlGmUXDpeajgyUiHYTsGpumjpvk6gll6S636cFunKJKjQVq2yl3eEKA==
X-Gm-Message-State: AOJu0Yzeu5ccC0ZzI07Vtj8Z+TG1CCwk4LN3rvKkTL44bk6G18KQOoYe
	7Ks+ruTV3UtHrd+27BG52Avyh6zxWCQq1im5vjcjkA4MnMAxWvGd9j8wfSTY2aU=
X-Google-Smtp-Source: AGHT+IFNy6BKjfAI2rtz8anl6N+itc18Z32U8IcDCV9zSoM7IeBOmMW3L7ublaurf44C/d1dCLLr7w==
X-Received: by 2002:a17:902:f683:b0:1f3:4e4:f76a with SMTP id d9443c01a7336-1f304e53670mr56219285ad.65.1716261442263;
        Mon, 20 May 2024 20:17:22 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:21 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 01/31] Staging: rtl8192e: Rename variable IsPassiveChannel
Date: Mon, 20 May 2024 20:16:48 -0700
Message-Id: <20240521031718.17852-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable IsPassiveChannel to is_passive_channel
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ee469c9118b8..4a0db2dfd5e9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2356,7 +2356,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
 
-static int IsPassiveChannel(struct rtllib_device *rtllib, u8 channel)
+static int is_passive_channel(struct rtllib_device *rtllib, u8 channel)
 {
 	if (channel > MAX_CHANNEL_NUMBER) {
 		netdev_info(rtllib->dev, "%s(): Invalid Channel\n", __func__);
@@ -2432,7 +2432,7 @@ static inline void rtllib_process_probe_response(
 		goto free_network;
 
 	if (ieee80211_is_probe_resp(frame_ctl)) {
-		if (IsPassiveChannel(ieee, network->channel)) {
+		if (is_passive_channel(ieee, network->channel)) {
 			netdev_info(ieee->dev,
 				    "GetScanInfo(): For Global Domain, filter probe response at channel(%d).\n",
 				    network->channel);
-- 
2.30.2

