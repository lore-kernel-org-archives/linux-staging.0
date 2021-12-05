Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3152C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id w1so33387831edc.6
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPuzYR8QORZOgJOB4QKAyq9QStxUBqC+STv8VWMkX4c=;
        b=CG2HB7LopIBU5jwG6lIma8FW/NdPPlyEWwA1lE084PT+MLH1MB3il3YcfV2VQVNidF
         1HeNC7dwnEwsUc+BzyOls/7s6awQEUPoo6jQH/VfNmzM6kfqP1L4OOH1MJPasTTfrmar
         ZMV0IyB5+bGEUTS7+7Xl58k6QU8gMzZaC/9sJBHLVhdllTch+CKBMAWX2MpiOxbhcrMI
         gkxeIfVvYnGpIRlqSUORCVcqKKkKzbI3O0x08p6b799Cg0ded/c0UULvyNYrIAK3qbT0
         dh+Xc/m4uJUpkwaaW+nBRTD5EN6y9Qs78nc9rRv/88lWy9MzLfmuZz+1tQ+w2U5X7GnU
         EQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPuzYR8QORZOgJOB4QKAyq9QStxUBqC+STv8VWMkX4c=;
        b=H3x7rtfVpwiyMtwPFudhSonPVMYQyV7QpsOsipcwjfcC26/O7ZIwXEylyvWSJ8nZkK
         fa3kndmIM4VToKPRtcQtotI2G9S1mILnk0oGGDIYWGyn2OCYbOMkTyrDtkCpTlgZXoER
         Y4zOSV+cYdXBJeogNruUB08kfRW69wt7LzDDrt8c1i27eFWBKnSo+2tPZ6uYLyD5mIVS
         qMg1LHa25gk02OKAtj7SspDnexqqWSXVnpVZ6k+usfe1TQ54egqciO5P21yObAQPToVK
         LGIoVtPwYATJp3zkGIYDzu3rlLhXYd/gEsMyuR+rxkkWPzUEDgakSYFtr0mjMC+yjsVg
         OoFg==
X-Gm-Message-State: AOAM530EhxlbgrXqPNgK2JvtfX87t9K4uxf/Zies/lvfjlD+rj6z7KiS
	+WqTo6AgX7EoC4RADD2CLtE=
X-Google-Smtp-Source: ABdhPJwGbG9giBBeKm09u0oBeCOBmzzHQA266FTsJZ0fTqrJJBIREfPRX8Nm5fiF/1M/6sXSiXGaGw==
X-Received: by 2002:a05:6402:4312:: with SMTP id m18mr45812945edc.273.1638724474823;
        Sun, 05 Dec 2021 09:14:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:34 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 02/10] staging: r8188eu: struct odm_mac_status_info is not used
Date: Sun,  5 Dec 2021 18:13:34 +0100
Message-Id: <20211205171342.20551-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205171342.20551-1-straube.linux@gmail.com>
References: <20211205171342.20551-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure odm_mac_status_info is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index df232867eac8..f83b94a74b70 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -176,10 +176,6 @@ struct odm_per_pkt_info {
 	bool	bPacketBeacon;
 };
 
-struct odm_mac_status_info {
-	u8	test;
-};
-
 enum odm_ability {
 	/*  BB Team */
 	ODM_DIG			= 0x00000001,
-- 
2.34.1

