Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CB62F80
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g18so14563000wrc.11
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AAHgeCZ2aQN7mfS6aEnntPuA7ia/SDZIlFdYCZ9jF4o=;
        b=OSFOFuAqKf3goy5aqvTEuxY4R0/5tVaD5DiqZnoLAJqP9CuavD8yx9doe8auBn5ysV
         cFiEXeNcKhFrJvN4EbMieJXobHNLv9umzPrwiPIG6B/WO9WQdEaJsnBdBylCCvhRaNeH
         6eV4VWv+4VGMys/TNHv3PYdsCvvdUYS/xXtUCh094cfiIy3VKxpILXuCXjlF/aXq+mQK
         CudRq7LO/iBoiHf+EXwUkxQaAesaXFa/0ZuMr+NxV5q02YLaKMsSajBhim0ZHhM50ngY
         dCYdiBq6Nz1EWLCDbWk5MW0lJJFvoPcdTHBpRADE88PAlhI+PqWfrGy+uv7ixXbn28iB
         qPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAHgeCZ2aQN7mfS6aEnntPuA7ia/SDZIlFdYCZ9jF4o=;
        b=cFS9bRwuUkYrfwz3QFEIUSnML44povMvklbvtvG8MFcLUb7OKSIJ3d6hZRA3/XYTOs
         +KFc37kljamTTqotAchvD6WU3vsUO9aiCqOWEcDy+nxS/3Yu5Jy3tZhnsDoYAKbh/vcY
         pPX7dWRQ1ccD4q79Y4dzBLjWM6/uaI7qXnWw6NOcHBJRYTnrq4HW8h9ZMxnc2JV4h5//
         wfiy3G0UNNx6xBHdgBEiwPHbT89opgSBABUdoidHOH2TuLAk38FpNDn/NZFL9FfioNt1
         P3LVF2+qWgK+tzkOAZq/pbr/auh0Vun8NDrKiziaHV+AVZIy25bMBsK9fngywuKmZRye
         Fj/A==
X-Gm-Message-State: AOAM532XH31WQ5sPEPCwfsauCMKR2EI6C9g3oSgy+H4r28eoAwzlsBKJ
	m2H+EuKwOKbVfPk7zsHASDI=
X-Google-Smtp-Source: ABdhPJypqxFGS369zI3GE3gLDaemspg7op8bOEXngpu5ewOgDuspaUna0hIi78teLSe1aShNemZycw==
X-Received: by 2002:a05:6000:1627:: with SMTP id v7mr4765552wrb.195.1630325074726;
        Mon, 30 Aug 2021 05:04:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/8] staging: r8188eu use mac_pton() in rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:04:13 +0200
Message-Id: <20210830120420.5287-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830120420.5287-1-straube.linux@gmail.com>
References: <20210830120420.5287-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of a custom approach use mac_pton() to convert the mac
address string. With mac_pton() the driver also validates the
input now.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index b3a74198596a..205798b76cf9 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1024,13 +1024,11 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 	if (!mac_addr)
 		return;
 
-	if (rtw_initmac) {	/* Users specify the mac address */
-		int jj, kk;
-
-		for (jj = 0, kk = 0; jj < ETH_ALEN; jj++, kk += 3)
-			mac[jj] = key_2char2num(rtw_initmac[kk], rtw_initmac[kk + 1]);
+	if (rtw_initmac && mac_pton(rtw_initmac, mac)) {
+		/* Users specify the mac address */
 		memcpy(mac_addr, mac, ETH_ALEN);
-	} else {	/* Use the mac address stored in the Efuse */
+	} else {
+		/* Use the mac address stored in the Efuse */
 		memcpy(mac, mac_addr, ETH_ALEN);
 	}
 
-- 
2.33.0

