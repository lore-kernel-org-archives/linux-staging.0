Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFED2CAD
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:39 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r25so33220449edq.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Woq3HlHO11za/Z8dWOzGeHMcMYdN1R19HxtEMwFIAg=;
        b=ZZuvakSXZZ01pG4mSgAMWwjQu8MLUQi3a2MZpP73gTs1HYk2KwASM5WI0bLn8ItaCT
         42/kVAwPtdeKgNczVfUd3RgZifx9OpIGuabJB1ZiSf5AOvFD/L8qth0t2cezBF+2qPCv
         vRozTX4XdDdDD5mckNCZa8ZrqzbWkHAtRGL08Ik1hh1h+1+LVOvGN1yCy0aEn/h9pxSo
         ADJG+BSd9qhaxHIkfMJk9g3yXHOapA2cIyCDI+402T3GEhf00nP2qln9GHRNIIcR67jH
         p+CVON8FbWXEMuzEYPtcTXx5hG/QP5rRKp3XjSiBJzFH6KcPUhkcSyFii83jnID5GZfx
         A7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Woq3HlHO11za/Z8dWOzGeHMcMYdN1R19HxtEMwFIAg=;
        b=oXma0cqCcrXwJL8fhjBv/p/K2z3zUEFr1etR6MTgMJmGWrOEDh0Z1qvlAQkjyfxjx7
         HEfVbzN6lRO0PG+6v5NNlm+ggVg8Tbwrmp3VoWd36Ih8/f3RCylw6Na5hqh0CZN5KJfE
         shMlMeJPjCV1xcYdqnwQ7qyINhXUlppaFWSXgGkKqU8P4aThE811z8BcGD5xcU0OE9Qy
         oSHAp54yPoxflatMdfzUyFqBwl8yTrgoj9BihvJSdbjuV+HPF96gpSsgEuYVspN/TfFg
         LoYkMwtLf/yte9prP8+aUn6LzONP1OQitkigkgrdolFHwDKb+hYUo+1d7XAq0KRDlzgW
         Y8TQ==
X-Gm-Message-State: AOAM531pV/0wXJzvt/ORTSV6dx2WLtfwOrHRFs0V76UXRyJpcdevJSe8
	awTlDKzG/4l4ORaXGtsboLS/hVEZAwI=
X-Google-Smtp-Source: ABdhPJz8aFC18yk1YvQ47BDoZz+kT1vbI3rr82ngQ///0L5gOHTBcy+O5KYCLDGb+T5D0In6RW7eZA==
X-Received: by 2002:aa7:d5d6:: with SMTP id d22mr46674724eds.364.1638724478399;
        Sun, 05 Dec 2021 09:14:38 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:38 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 07/10] staging: r8188eu: remove duplicate defines
Date: Sun,  5 Dec 2021 18:13:39 +0100
Message-Id: <20211205171342.20551-8-straube.linux@gmail.com>
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

The following constants are defined in three different header files.

IQK_MAC_REG_NUM
IQK_ADDA_REG_NUM
IQK_BB_REG_NUM
HP_THERMAL_NUM

Keep them in odm.h and remove them from Hal8188EPhyCfg.h and
rtl8188e_dm.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_dm.h    | 7 +------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index f4cfd11b36c1..addc6a5354a6 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -11,11 +11,6 @@
 #define MAX_TXPWR_IDX_NMODE_92S		63
 #define Reset_Cnt_Limit			3
 
-#define IQK_MAC_REG_NUM			4
-#define IQK_ADDA_REG_NUM		16
-#define IQK_BB_REG_NUM			9
-#define HP_THERMAL_NUM			8
-
 #define MAX_AGGR_NUM			0x07
 
 /*--------------------------Define Parameters-------------------------------*/
diff --git a/drivers/staging/r8188eu/include/rtl8188e_dm.h b/drivers/staging/r8188eu/include/rtl8188e_dm.h
index 208bea050f6f..0b3a9a1a4e5c 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_dm.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_dm.h
@@ -8,12 +8,7 @@ enum{
 	UP_LINK,
 	DOWN_LINK,
 };
-/*  duplicate code,will move to ODM ######### */
-#define IQK_MAC_REG_NUM		4
-#define IQK_ADDA_REG_NUM		16
-#define IQK_BB_REG_NUM			9
-#define HP_THERMAL_NUM		8
-/*  duplicate code,will move to ODM ######### */
+
 struct	dm_priv {
 	u32	InitODMFlag;
 
-- 
2.34.1

