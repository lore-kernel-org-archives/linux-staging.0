Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67DC5CA1
	for <linux-staging@lists.linux.dev>; Sat,  1 Jul 2023 10:26:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51d9865b8a2so2919470a12.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jul 2023 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688207179; x=1690799179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRU/4EgIG59FlYdUAQY/bxVUjSKGZZK/O/khm55mTyc=;
        b=Ui5ViJExRzULqY2c10lgXVJvlivZipx89e9cDYXQa6aFO/3yHYGLoOkPsq8ip03BV0
         jXwFWbnz4Y/Wa4AbyZljXjV4n8V7BUm0ex5ROA3LHxnKTsH1o7bmYD9PYiPf7lL4Mw60
         itfPn0WxcqM1+8LwCr68P7rYiQ9TGDd4jAvDHs5pfoe1jF6hBohgrTbo7Mngko8EJdum
         QFTn3E8tk1USWd47lA0Eee70JVPg5MYMu6ho3V1xLJ5Wt2WZ/r4HwBovwO9rMRcYOZhT
         CyGBC+h401EV7l/xHo8QyoTtokBczww9frocGE51YT1sySBK0PaOABst9nzNxLxumDqY
         5ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688207179; x=1690799179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRU/4EgIG59FlYdUAQY/bxVUjSKGZZK/O/khm55mTyc=;
        b=eK68yCg/pxcbMyu5Krl9VIrA3UBZQXZzVUgxz25jqri5gwRBJwPrkzWCNikmfdvivf
         GnDZ4natdfst7OmTfQRG/61jACQs0QdHfeKv7VDxvqRyvUwPu/wZiUG689K9G+WQk/tw
         akgOvqwLJxxZ4h30h6X3nFc6TrVdpgd6DcsvJNnLkc2tF0zTdN4JGuFF1/oehkXhncig
         MBySG6wWAtZYH5q4qfIR0XgW416tGxc+9ROBhfAxhCEgIw0EwhVCPhnu078KObfRzY5k
         QzNS6b9o9+h7gfqxK/jSFkeDbuxfVYFc6SaGZZwkPmKtVLfvDA+Dqp7WXFvv+AH+M3Jr
         rfCQ==
X-Gm-Message-State: ABy/qLaEc+7vy5Hio6gdIq89V4cPw6vsgwPPNpzpJ43VWK+xel/BQ+qR
	/dwlO0AGtbjRPeu5DiEPj7Y=
X-Google-Smtp-Source: APBJJlEOM2wyXiO811piYKKG/fldWxWfNc7UGh39pgsxm8pMfnhTINVSYue1eBWNQi8U0ef4m28PcQ==
X-Received: by 2002:aa7:d31a:0:b0:51d:d30c:f1e3 with SMTP id p26-20020aa7d31a000000b0051dd30cf1e3mr3058659edq.16.1688207178949;
        Sat, 01 Jul 2023 03:26:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:185:3db5:c5f0:49bb])
        by smtp.gmail.com with ESMTPSA id c19-20020a056402121300b0051dd19d6d6esm3385151edw.73.2023.07.01.03.26.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Jul 2023 03:26:18 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: dan.carpenter@linaro.org,
	eperi1024@gmail.com,
	gregkh@linuxfoundation.org,
	guozihua@huawei.com,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	quic_vjakkam@quicinc.com,
	tegongkang@gmail.com
Subject: [PATCH v4 3/3] staging: rtl8723bs: Fix remaining blank line issue
Date: Sat,  1 Jul 2023 12:26:13 +0200
Message-Id: <20230701102613.5420-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230701102223.5308-1-franziska.naepelt@googlemail.com>
References: <20230701102223.5308-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch blank line issue:
- CHECK: Please don't use multiple blank lines

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
v4: Fix sign-off email address
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

