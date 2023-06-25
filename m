Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A36AA1
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 16:00:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so2227149a12.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687708827; x=1690300827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hG/25rXMoqPrP3Tjboz29CAT2Eb1EYcAQYXNo5YWZvc=;
        b=c9c38HB37VE/iwHwIt39e3BuInPDZopPtT7zqLzHHbIQnx335cBnNyaT9m3NsTwNcZ
         MU79NtMPe7WFrfy+2hE+ta1x+hPS/q9nn9vBFNtC6DiXwolyGaAgAqhg9jpfr836i4Yg
         67TFssyE5XP/vplY5q3a/wjeqhMvv6lATVxgg2bGkOEebLfPYIlirO/kkHtx5fAaykTE
         TF4k/prSrRhYw5UBxPBaNDfR4toIj1n8cNzPcyVlwEe8Y+MY4SrXJnkyYkwPBfOTVQch
         Vc+4rlvL0l5QtSQwQIC6rGJW0QausMtJAYZb3XJkPT13gDOsnQW0XOBIf3slBY4pHc5d
         SWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687708827; x=1690300827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hG/25rXMoqPrP3Tjboz29CAT2Eb1EYcAQYXNo5YWZvc=;
        b=VYlbAMC6r5aVK09ECzlBRjN4k6qzeBtxksJuQ44VXAeLEJWaVTzKyQZpiGhYB8Cmt+
         LxXgSVVo8P/NdpZCnntNsc3xKhOCrr8g89ObiF+dGY2nfeP8TcrSoFxcJ2keH16K/Xlv
         3547a0Y7SYcc7ZkTyvuqE62qErh1t2ADCY9wmU7fAc+xniS1O8dmPD/9/l1nEpsGO0bh
         dxEnuc6Tg6PNkDZFOIb5ovYfzH8bYBvDZMRPBEudnwt5rdJeewZvXy5je+fPJT1VT9lO
         KiV27kZtZGau2mgOjjB6PUvrCFQ59FuUkbHTKa5alGTrf9n8qfQw1QcRypakZt6mrNW+
         TuFA==
X-Gm-Message-State: AC+VfDzpawYSG+Uvw9KMNNN8MP3j8yxtWUuVzTPRnCFbwZEfTYL1k5ev
	fFlRaZouG/79UqmLGPws5k8=
X-Google-Smtp-Source: ACHHUZ4tqpEJiYvZaeySsYlQSPef9pgtu5Yo46eD4zRvjEU7iFJYhXw9Lo81nZmvXhjgHqCb+H3Sig==
X-Received: by 2002:aa7:c2d7:0:b0:51d:9362:5060 with SMTP id m23-20020aa7c2d7000000b0051d93625060mr1679703edp.1.1687708826863;
        Sun, 25 Jun 2023 09:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:484f:5091:3ba0:ecc])
        by smtp.gmail.com with ESMTPSA id r16-20020aa7da10000000b0051d2968b26asm1895469eds.77.2023.06.25.09.00.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Jun 2023 09:00:26 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
X-Google-Original-From: Franziska Naepelt <franziska.naepelt@gmail.com>
To: franziska.naepelt@googlemail.com
Cc: eperi1024@gmail.com,
	franziska.naepelt@gmail.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	johannes.berg@intel.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	quic_vjakkam@quicinc.com,
	tegongkang@gmail.com
Subject: [PATCH v3 3/3] staging: rtl8723bs: Fix remaining blank line issue
Date: Sun, 25 Jun 2023 18:00:24 +0200
Message-Id: <20230625160024.32530-1-franziska.naepelt@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230625155632.32403-1-franziska.naepelt@gmail.com>
References: <20230625155632.32403-1-franziska.naepelt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch blank line issue:
- CHECK: Please don't use multiple blank lines

Signed-off-by: Franziska Naepelt <franziska.naepelt@gmail.com>
---
v3: This fix was accidentially part of the fix spaces issue, moved to This
    separate patch now.
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 8f30098168f1..292cba045023 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -266,7 +266,6 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	}
 	/* spin_unlock_bh(&pwdev_priv->scan_req_lock); */

-
 	channel = pnetwork->network.configuration.ds_config;
 	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);

--
2.39.2 (Apple Git-143)

