Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910170
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:23:46 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id u16so10639317ple.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X4chUMTcwJeUS2XAVjNjj8/Qn6QKA6HkZgiWU19u+xY=;
        b=W6YwIdwkmVKPQ1BOq/s6Bz3AHrrErWwKYBvGfTpmbrKTk+ZGVQ1saL0ZXVMMJFltu4
         3QBouqBMoJB+KL0TZ597OR8AeDbyqBL07vRFCBIR+4Nmv/lwVin40jI6HaCJ8L+s4oMC
         ZuX96eeRdo/Nx/fRsrgBxLGKoDq1HblbNTq7R0w/8txCloNhL05fJgf3YyWJcCkAW5F4
         NOtrgFbdfJHSCUOakQcDcWBfMnU5X6t0uGWdWKBFrzDT4RN7A5DkWsErL3s7Kowtu26g
         abE1MBtmctOCxnVSUAAo+Asc8iyFdRAaeDIHYUvUEcDs0hK2sPJnsU2QKSUkzKfRsSY9
         hgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X4chUMTcwJeUS2XAVjNjj8/Qn6QKA6HkZgiWU19u+xY=;
        b=R4aFeYzIkMMrc5Nkig2hoXHIiBvcFp9CWd+yXPxoCSi3KXnSve+qEG0zBYqggGY+oG
         AQE+myRs+dHyNj5/sNoczsyoAoRpb67rzIXWA/Tlxi50h8scgYha6fUx31tChpBOs05U
         stslMquVnUw7yx6U6KJ3yaChnrhy71CC5APdbkuFe4G1yeXP/Cy7HS2vSnelHMMl8w8b
         GD4Rb1GD3eqyf77Qma8YqFWHwjYmAq/H0clNLZTMY5SHszo0/qStS7D3oucqLh9zBiag
         DBe7d4TI4xRgilYguuB0277SvirsUy1jqIEUde4Exp6U9iY6IJL3sZ3EJNRl9EsJQJQ2
         BTIg==
X-Gm-Message-State: AOAM530w2S8fAvQrpBNgNtAiYUd3ePxROS4gc+BqTbmUyrdrX6G8ZNun
	mAtZF4o6W/YrENsDlYBHlb8=
X-Google-Smtp-Source: ABdhPJzugLLxupJ/QfUhT7pvb2Y8+ayjMxIEWOnLgvggKuhvh9NhVHvy0EizzCyy4rKNNWEszeVEQw==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id d18mr25884388pjw.102.1628331826200;
        Sat, 07 Aug 2021 03:23:46 -0700 (PDT)
Received: from user.. ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id d17sm13290717pfn.110.2021.08.07.03.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:23:45 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	saurav.girepunje@gmail.com,
	insafonov@gmail.com,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	will+git@drnd.me,
	dan.carpenter@oracle.com,
	apais@linux.microsoft.com,
	yashsri421@gmail.com,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8188eu: os_dep: Remove unused variable
Date: Sat,  7 Aug 2021 15:52:29 +0530
Message-Id: <20210807102232.6674-2-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210807102232.6674-1-saurav.girepunje@gmail.com>
References: <20210807102232.6674-1-saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable data and data_len from mon_recv_decrypted() in mon.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8188eu/os_dep/mon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/mon.c b/drivers/staging/rtl8188eu/os_dep/mon.c
index 73b9599fe0dc..7c7cb29ee005 100644
--- a/drivers/staging/rtl8188eu/os_dep/mon.c
+++ b/drivers/staging/rtl8188eu/os_dep/mon.c
@@ -58,8 +58,7 @@ static void mon_recv_decrypted(struct net_device *dev, const u8 *data,
 	netif_rx(skb);
 }
 
-static void mon_recv_encrypted(struct net_device *dev, const u8 *data,
-			       int data_len)
+static void mon_recv_encrypted(struct net_device *dev)
 {
 	if (net_ratelimit())
 		netdev_info(dev, "Encrypted packets are not supported");
@@ -93,7 +92,7 @@ void rtl88eu_mon_recv_hook(struct net_device *dev, struct recv_frame *frame)
 	if (attr->bdecrypted)
 		mon_recv_decrypted(dev, data, data_len, iv_len, icv_len);
 	else
-		mon_recv_encrypted(dev, data, data_len);
+		mon_recv_encrypted(dev);
 }
 
 /**
-- 
2.30.2

