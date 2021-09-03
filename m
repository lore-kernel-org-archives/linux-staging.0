Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2C3FC9
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 09:34:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g18so7294224wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ApEY98xhN5gp0CgU7AnzqI8rYPys3K5CiH3JVol8qbg=;
        b=m8CFzFwXJfCVwzVDB+xfrkNn/GMDk2eIkBoHtBqTRTAF/6bZNKwWiZtH8yNBwYMCgB
         yfH8MHlbLa8d6slDhCJ4rRBtVwrsTH8EGCRaTMt5DfNwnjylRYbpNZd7lcCsrfBM0BYy
         O42ztNv5w1yI7I4x5mzTjBwkdMhYOylZn4FdKp08eGqBZCZNTUurep7XBji5clQOP2G6
         Z60dfbBWYPIucq9k4lmMaOCk9LU6zw6nbGcpm+p283PkHK7euHzOZjfjs4BQWoUugJqk
         krPsSK301uMQDfcsgyc/Wo0SPsgCTmt4aGKfac65q7680bdeCJK781UXk4Lj3Q78NiwI
         U6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ApEY98xhN5gp0CgU7AnzqI8rYPys3K5CiH3JVol8qbg=;
        b=Cz8lAiGfvF2t3j8/LCxjW4xQa+hDo+aJoD/34+yYgCdIIO7JyfBF9+dxfJBctTmfcT
         ipLcW5toC7zAyFfRqsHDHDPY+Jtop91Ai5TNhM16EE23qMzXhb02g3rAltY1NHruyUpI
         DNvjBeVtNG0uQNd3Ho3cGrMgOAbs/umalEE4Wd26DWGH/rvLlW712QuvfjW1WLPVUi/5
         klicfTcrSnug6QJVOcpEurvdvd5BPns9BLmbYR8c8X8NLSCOiFYWJl7mgIHxJPJNcaLW
         wrCZrp1VgjEsfj8jfKPN1Rcu5F27wBmIkDIDV4cIbfGuzQta8X+q3/cdsgOCpsT9zi0M
         m3Eg==
X-Gm-Message-State: AOAM533zgDtFdA/TFtqSRdIA7dO5pjuXSAlNM7g+EDb1t2/pvyPVn5tr
	Tn1zGwAK2zgoiFeXY06HhhI=
X-Google-Smtp-Source: ABdhPJzr2o2iLy6DWjzEJ1GHl+jNwERg29P8wB9rNUrs98d4YhoxQr4Z1WXeyX0SpCEzJOCI9Sriyg==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr2891850wrv.117.1630661655937;
        Fri, 03 Sep 2021 02:34:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm3853060wmk.21.2021.09.03.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 02:34:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/6] staging: r8188eu: remove enum hardware_type
Date: Fri,  3 Sep 2021 11:33:54 +0200
Message-Id: <20210903093354.12645-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903093354.12645-1-straube.linux@gmail.com>
References: <20210903093354.12645-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From enum hardware_type only HARDWARE_TYPE_RTL8188EU is used in the
driver. Remove the enum and define HARDWARE_TYPE_RTL8188EU.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/hal_intf.h | 23 +---------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 117a98e5444e..5f6ef4d6333a 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -260,28 +260,7 @@ struct hal_ops {
 #define RF_CHANGE_BY_HW		BIT(30)
 #define RF_CHANGE_BY_SW		BIT(31)
 
-enum hardware_type {
-	HARDWARE_TYPE_RTL8180,
-	HARDWARE_TYPE_RTL8185,
-	HARDWARE_TYPE_RTL8187,
-	HARDWARE_TYPE_RTL8188,
-	HARDWARE_TYPE_RTL8190P,
-	HARDWARE_TYPE_RTL8192E,
-	HARDWARE_TYPE_RTL819xU,
-	HARDWARE_TYPE_RTL8192SE,
-	HARDWARE_TYPE_RTL8192SU,
-	HARDWARE_TYPE_RTL8192CE,
-	HARDWARE_TYPE_RTL8192CU,
-	HARDWARE_TYPE_RTL8192DE,
-	HARDWARE_TYPE_RTL8192DU,
-	HARDWARE_TYPE_RTL8723AE,
-	HARDWARE_TYPE_RTL8723AU,
-	HARDWARE_TYPE_RTL8723AS,
-	HARDWARE_TYPE_RTL8188EE,
-	HARDWARE_TYPE_RTL8188EU,
-	HARDWARE_TYPE_RTL8188ES,
-	HARDWARE_TYPE_MAX,
-};
+#define HARDWARE_TYPE_RTL8188EU 17
 
 #define GET_EEPROM_EFUSE_PRIV(adapter) (&adapter->eeprompriv)
 
-- 
2.33.0

