Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC266136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:09 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id z4so2620952pgh.12
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ueLCg3tmJELA0lOiV59xYuNsQ/Nirz2sRRrkKg8aSPQ=;
        b=jlWEiz82aeDhJ3ZK8Sf2LFDBbMlf/ZiXGxjGK+rpwtBtG8988DC1eHHfhGdDVbZwBS
         Ittwxzux4HQI7oE1YKmpzkti68A8+x/JI1pCNTt9m0dXpr/jdO1RGYwt1Fc1WOvxpD8G
         eMs+s4P6iFjdfNW4zjKmA1wq37ZC6kmfmMkIGYn06TtRXCu1QKwpvl2ZdlP0wwnGVnRi
         jOkszLlU+k0ILUmDA0WYGltY9Ky/kZv01h2Kipy3w9wldoPCMH603rt6ngrKE9YiSXOC
         coa2rP2YhbmpoMXul4oqo99zUMX2nGWVn/EsE/wZ0Pth/3R1g1W4T2+7PrbzVb46EuPE
         JSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ueLCg3tmJELA0lOiV59xYuNsQ/Nirz2sRRrkKg8aSPQ=;
        b=DGdKEvefJP8Giyn62MuLFU93V/NiMqmJigORjqf8+LXG5dFEwN5Xd6yvAksDy6f0xx
         Ub1X3BlHjkQ0xUVMdW5hG1u3q3kIJZQcJA68pdiwtrWvFz+i5/xz1J/vVJuP96UERVS4
         nc7Ca8YZTJYcaVFhQzLwY4xCdrUv30neOXqGnV61Tt0XSN8+iKNRnkO8/lmsLboP8qph
         bFwQP2HprMo0HorhpzqcwwECd8yoVJxJw1KhcbNPelx4fNNM9m/jwlqmZv6LgHP2bOab
         y90Lq1L5FglQQg0BNfoNVgC/7W/MGMkKac09AM2VXpteopu5yUvMJji34xmTfekNMXYk
         /gGg==
X-Gm-Message-State: AOAM531neJ3WzVIPq3zXlKrkl5QKXIsXouW0XvSs0KbNS1nVAM0jlu/+
	J+xi9DvfqzLpdZyKOywbIv8=
X-Google-Smtp-Source: ABdhPJx1drPamGX0OGSlhS8Vzw5ZB39prTM1oS4YnYAxezrAjWyBt6jx5m/KMsttVgoXgBUorMWPiQ==
X-Received: by 2002:a63:28d:0:b0:365:8e16:5c19 with SMTP id 135-20020a63028d000000b003658e165c19mr27463068pgc.579.1646254089505;
        Wed, 02 Mar 2022 12:48:09 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:09 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 02/16] staging: r8188eu: mark rtw_is_cckratesonly_included as bool
Date: Thu,  3 Mar 2022 02:17:23 +0530
Message-Id: <20220302204737.49056-3-makvihas@gmail.com>
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

Mark rtw_is_cckratesonly_included as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
 drivers/staging/r8188eu/include/ieee80211.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index a7b7b0f14..5a0e42ed4 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -81,7 +81,7 @@ bool	rtw_is_cckrates_included(u8 *rate)
 	return false;
 }
 
-uint	rtw_is_cckratesonly_included(u8 *rate)
+bool	rtw_is_cckratesonly_included(u8 *rate)
 {
 	u32 i = 0;
 
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 1a15db097..8c20363cd 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -874,7 +874,7 @@ int rtw_get_bit_value_from_ieee_value(u8 val);
 
 bool	rtw_is_cckrates_included(u8 *rate);
 
-uint	rtw_is_cckratesonly_included(u8 *rate);
+bool	rtw_is_cckratesonly_included(u8 *rate);
 
 int rtw_check_network_type(unsigned char *rate, int ratelen, int channel);
 
-- 
2.30.2

