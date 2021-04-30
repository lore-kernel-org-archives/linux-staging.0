Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142C2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id i3so57283033edt.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mJJ61W3+Iu0fr3sRea0FAmFrj9yp9rKb5qGmB+mhT84=;
        b=jqbhyGlEplZP2BMKcNrr+U+vZCKqEx2sISPjS6uHVvsTF1irqNokECckUgPlPfIhYc
         O1g6zY3WhIOmp7gn7RG+UPQebY8+da2W6G/oUZ9sUEMYqXll/rzswToju9xOK3t9kzEu
         8apCglVqr+k7I5fxH7tSrN9e7mipi3eAcpilDrfZyKBnKCxK+sApgkYKJspVGNDT/WTj
         QRQAXcg4/mh8pheLO8wzm7yKP/NlZn15+e4/mkKXbXcc8Q5mWfUx5wLPTd/5VJphFCpj
         Q9RWhGjKTXUSSZJ89IHffWm9ucohu3u9gqVplEXR9/7cNitSVDjgnXnemh67vhMEaIOX
         349Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJJ61W3+Iu0fr3sRea0FAmFrj9yp9rKb5qGmB+mhT84=;
        b=iNK9HFvBNZ0Oq6S0wOuXj9Is3yDMijn2ALvVLlNtPlat491DUxwqFJx+bvzzbjPlwE
         LSR33XNoume3VAjoQWeQJqHDS6ANIWplRgAWxTBL5jxnlUZUE+JJoICrr1Pfk0Y38S/A
         rlG2myml+B1J+Wlwsyg0AtzPoSJKThpFCAT68WwV7fyzcG/Tzz5fZB23TtQSaDYNdyDd
         ivWsy9/aauwAHVQ4KGpacaa6JyhqF6B/vVB9Q8ndQm0254RAYBrcMblL/OmtId3OI8Dv
         jaR6hypapCt3VWF+zCVU9u9NIWrXpNS33XDSLr/6jCQmeikRe72u6JG4YDEZO35qZC1y
         3gLQ==
X-Gm-Message-State: AOAM532FHMT25iZJCoCk82t/fPdIWzFzUYdQLR+zCZXn2j4uW8YdpSnl
	qU7awF0eAWobLExZcVFvmuU=
X-Google-Smtp-Source: ABdhPJzey6mlFSVJ1otmpLoZRWKYm6CewmGTTps93wnKwfAAkT4EmZzEZETKFQZu0M2ajPk/sYfdIQ==
X-Received: by 2002:a05:6402:1c0b:: with SMTP id ck11mr6500268edb.264.1619794656532;
        Fri, 30 Apr 2021 07:57:36 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id 9sm2085515ejv.73.2021.04.30.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/43] staging: rtl8723bs: remove commented out RT_ASSERT occurrences
Date: Fri, 30 Apr 2021 16:56:40 +0200
Message-Id: <3ee98d7bf1685af627e625f413de355fce58d52d.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out obsoete RT_ASSERT macro occurences.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 2 --
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 5 -----
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3e671cba6b94..c0689a4b7cb1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1794,8 +1794,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			/* pTS->RxIndicateState = RXTS_INDICATE_PROCESSING; */
 
 			/*  Indicate packets */
-			/* RT_ASSERT((index<=REORDER_WIN_SIZE), ("RxReorderIndicatePacket(): Rx Reorder buffer full!!\n")); */
-
 
 			/* indicate this recv_frame */
 			/* DbgPrint("recv_indicatepkts_in_order, indicate_seq =%d, seq_num =%d\n", precvpriv->indicate_seq, pattrib->seq_num); */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 082448557b53..4e21d98f7414 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -122,7 +122,6 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 	u8 *bufferPtr = buffer;
 
 	pageNums = size / MAX_DLFW_PAGE_SIZE;
-	/* RT_ASSERT((pageNums <= 4), ("Page numbers should not greater then 4\n")); */
 	remainSize = size % MAX_DLFW_PAGE_SIZE;
 
 	for (page = 0; page < pageNums; page++) {
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index fa285003b427..fd060cf7bc57 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -226,7 +226,6 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 		value = QUEUE_NORMAL;
 		break;
 	default:
-		/* RT_ASSERT(false, ("Shall not reach here!\n")); */
 		break;
 	}
 
@@ -260,7 +259,6 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 		valueLow = QUEUE_NORMAL;
 		break;
 	default:
-		/* RT_ASSERT(false, ("Shall not reach here!\n")); */
 		break;
 	}
 
@@ -325,7 +323,6 @@ static void _InitQueuePriority(struct adapter *Adapter)
 		_InitNormalChipThreeOutEpPriority(Adapter);
 		break;
 	default:
-		/* RT_ASSERT(false, ("Shall not reach here!\n")); */
 		break;
 	}
 
@@ -516,7 +513,6 @@ static void _InitOperationMode(struct adapter *padapter)
 		regBwOpMode = BW_OPMODE_20MHZ;
 		break;
 	case WIRELESS_MODE_A:
-/* 			RT_ASSERT(false, ("Error wireless a mode\n")); */
 		break;
 	case WIRELESS_MODE_G:
 		regBwOpMode = BW_OPMODE_20MHZ;
@@ -530,7 +526,6 @@ static void _InitOperationMode(struct adapter *padapter)
 		regBwOpMode = BW_OPMODE_20MHZ;
 		break;
 	case WIRELESS_MODE_N_5G:
-/* 			RT_ASSERT(false, ("Error wireless mode")); */
 		regBwOpMode = BW_OPMODE_5G;
 		break;
 
-- 
2.20.1

